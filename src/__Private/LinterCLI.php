<?hh // strict
/*
 *  Copyright (c) 2017-present, Facebook, Inc.
 *  All rights reserved.
 *
 *  This source code is licensed under the MIT license found in the
 *  LICENSE file in the root directory of this source tree.
 *
 */

namespace Facebook\HHAST\__Private;

use type Facebook\TypeAssert\TypeAssert;
use namespace Facebook\HHAST\Linters;
use namespace HH\Lib\{C, Dict, Str, Vec};

use type Facebook\CLILib\{
  CLIWithArguments,
  ExitException,
};
use namespace Facebook\CLILib\CLIOptions;

final class LinterCLI extends CLIWithArguments {
  private bool $xhprof = false;

  use CLIWithVerbosityTrait;

  <<__Override>>
  public static function getHelpTextForOptionalArguments(): string {
    return 'PATH';
  }

  <<__Override>>
  protected function getSupportedOptions(): vec<CLIOptions\CLIOption> {
    return vec[
      CLIOptions\flag(
        () ==> {
          throw new ExitException(1, "--perf is no longer supported; consider --xhprof");
        },
        '[unsupported]',
        '--perf',
      ),
      CLIOptions\flag(
        () ==> {
          $this->xhprof = true;
        },
        'Enable XHProf profiling',
        '--xhprof',
      ),
      $this->getVerbosityOption(),
    ];
  }

  private function lintFile(
    LinterCLIConfig $config,
    string $path,
  ): Traversable<Linters\LintError> {
    $this->verbosePrintf(1, "Linting %s...\n", $path);

    $all_errors = vec[];
    $config = $config->getConfigForFile($path);

    foreach ($config['linters'] as $class) {
      $this->verbosePrintf(2, " - %s\n", $class);

      if (!$class::shouldLintFile($path)) {
        continue;
      }

      $linter = new $class($path);

      if ($linter->isLinterSuppressedForFile()) {
        continue;
      }

      $errors = $linter->getLintErrors();

      $all_errors = Vec\concat(
        $all_errors,
        $this->processErrors($linter, $config, $errors),
      );
    }
    return $all_errors;
  }

  private function lintDirectory(
    LinterCLIConfig $config,
    string $path,
  ): Traversable<Linters\LintError> {
    $it =
      new \RecursiveIteratorIterator(new \RecursiveDirectoryIterator($path));
    foreach ($it as $info) {
      if (!$info->isFile()) {
        continue;
      }
      $ext = Str\lowercase($info->getExtension());
      if ($ext === 'hh' || $ext === 'php') {
        $file = $info->getPathname();
        foreach ($this->lintFile($config, $file) as $error) {
          yield $error;
        }
      }
    }
  }

  private function lintPath(
    LinterCLIConfig $config,
    string $path,
  ): Traversable<Linters\LintError> {
    if (\is_file($path)) {
      return $this->lintFile($config, $path);
    } else if (\is_dir($path)) {
      return $this->lintDirectory($config, $path);
    } else {
      throw new ExitException(
        1,
        Str\format("'%s' doesn't appear to be a file or directory, bailing", $path),
      );
    }
  }

  <<__Override>>
  public async function mainAsync(): Awaitable<int> {
    if ($this->xhprof) {
      XHProf::enable();
    }

    $result = await $this->mainImplAsync();

    if ($this->xhprof) {
      XHProf::disableAndDump(\STDERR);
    }

    return $result;
  }

  private async function mainImplAsync(): Awaitable<int> {
    $err = $this->getStderr();
    $roots = $this->getArguments();
    if (C\is_empty($roots)) {
      $config = LinterCLIConfig::getForPath(\getcwd());
      $roots = $config->getRoots();
      if (C\is_empty($roots)) {
        $err->write(
          "You must either specify PATH arguments, or provide a configuration".
          "file.\n",
        );
        return 1;
      }
    } else {
      foreach ($roots as $root) {
        $path = \realpath($root);
        if (\is_dir($path)) {
          $config_file = $path.'/hhast-lint.json';
          if (\file_exists($config_file)) {
            $this->getStdout()->write(
              "Warning: PATH arguments contain a hhast-lint.json, ".
              "which modifies the linters used and customizes behavior. ".
              "Consider 'cd ".
              $root.
              "; vendor/bin/hhast-lint'\n\n",
            );
          }
        }
      }
      $config = null;
    }

    $had_errors = false;
    foreach ($roots as $root) {
      $root_config = $config ?? LinterCLIConfig::getForPath($root);
      foreach ($this->lintPath($root_config, $root) as $_error) {
        $had_errors = true;
      }
    }
    if (!$had_errors) {
      print("No errors.\n");
    }

    return $had_errors ? 2 : 0;
  }

  private function processErrors(
    Linters\BaseLinter $linter,
    LinterCLIConfig::TFileConfig $config,
    Traversable<Linters\LintError> $errors,
  ): Traversable<Linters\LintError> {
    $class = \get_class($linter);
    $to_fix = vec[];
    $colors = $this->supportsColors();

    foreach ($errors as $error) {
      $position = $error->getPosition();
      \printf(
        "%s%s%s\n"."  %sLinter: %s%s\n"."  Location: %s\n",
        $colors ? "\e[1;31m" : '',
        $error->getDescription(),
        $colors ? "\e[0m" : '',
        $colors ? "\e[90m" : '',
        \get_class($error->getLinter()),
        $colors ? "\e[0m" : '',
        $position === null
          ? $error->getFile()
          : Str\format(
              '%s:%d:%d',
              $error->getFile(),
              $position[0],
              $position[1],
            ),
      );

      $fixable = $error instanceof Linters\FixableLintError &&
        (!C\contains_key($config['autoFixBlacklist'], $class)) &&
        $error->isFixable();

      if ($error instanceof Linters\FixableLintError && $fixable) {
        if ($this->shouldFixLint($error)) {
          $to_fix[] = $error;
        } else {
          yield $error;
        }
      } else {
        $this->renderLintBlame($error);
        yield $error;
      }
    }

    if (!C\is_empty($to_fix)) {
      self::fixErrors($linter, $to_fix);
    }
  }

  private static function fixErrors(
    Linters\BaseLinter $linter,
    vec<Linters\FixableLintError> $errors,
  ): void {
    invariant(
      $linter instanceof Linters\AutoFixingLinter,
      '%s is not an auto-fixing-linter',
      \get_class($linter),
    );

    $linter->fixLintErrors($errors);
  }

  private function shouldFixLint(
    Linters\FixableLintError $error,
  ): bool {
    list($old, $new) = $error->getReadableFix();
    if ($old === $new) {
      $this->renderLintBlame($error);
      return false;
    }

    $prefix_lines = ($code, $prefix) ==>
      Str\split($code, "\n")
      |> Vec\map(
        $$,
        $line ==> $prefix.$line,
      )
      |> Str\join($$, "\n");


    $colors = $this->supportsColors();

    if ($error->shouldRenderBlameAndFixAsDiff()) {
      $blame_color = "\e[31m"; // red
      $blame_marker = '-';
      $fix_marker = '+';
      $fix_color = "\e[32m"; // green
    } else {
      $blame_color = "\e[33m"; // yellow
      $blame_marker = '  >';
      $fix_marker = '  ';
      $fix_color = "\e[33m"; // yellow
    }

    \printf(
      "  Code:\n"."%s%s%s\n"."  Suggested fix:\n"."%s%s%s\n",
      $colors ? $blame_color : '',
      $prefix_lines($old, '  '.$blame_marker),
      $colors ? "\e[0m" : '',
      $colors ? $fix_color : '',
      $prefix_lines($new, '  '.$fix_marker),
      $colors ? "\e[0m" : '',
    );

    if (!$this->isInteractive()) {
      return false;
    }

    static $cache = dict[];
    $cache_key = \get_class($error->getLinter());
    if (C\contains_key($cache, $cache_key)) {
      $should_fix = $cache[$cache_key];
      \printf(
        "Would you like to apply this fix?\n  <%s to all>\n",
        $should_fix ? 'yes' : 'no',
      );
      return $should_fix;
    }

    $response = null;
    do {
      print(
        "\e[94mWould you like to apply this fix?\e[0m\n".
        "  \e[37m[y]es/[N]o/yes to [a]ll/n[o] to all:\e[0m "
      );
      $response = \fgets(\STDIN);
      if ($response === false) {
        return false;
      }
      $response = Str\trim($response);
      switch ($response) {
        case 'a':
          $cache[$cache_key] = true;
          // FALLTHROUGH
        case 'y':
          return true;
        case 'o':
          $cache[$cache_key] = false;
          // FALLTHROUGH
        case 'n':
        case '':
          return false;
        default:
          $this->getStderr()->write(
            Str\format(
              "'%s' is not a valid response.\n",
              $response,
            ),
          );
          $response = null;
      }
    } while ($response === null);
    return false;
  }

  private function renderLintBlame(
    Linters\LintError $error,
  ): void {
    $blame = $error->getPrettyBlame();
    if ($blame === null) {
      return;
    }

    $colors = $this->supportsColors();
    \printf(
      "  Code:\n%s%s%s\n",
      $colors ? "\e[33m" : '',
      Str\split($blame, "\n")
      |> Vec\map(
        $$,
        $line ==> '  >'.$line,
      )
      |> Str\join($$, "\n"),
      $colors ? "\e[0m" : '',
    );
  }
}
