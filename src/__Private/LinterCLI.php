<?hh // strict
/**
 * Copyright (c) 2017, Facebook, Inc.
 * All rights reserved.
 *
 * This source code is licensed under the BSD-style license found in the
 * LICENSE file in the "hack" directory of this source tree. An additional
 * grant of patent rights can be found in the PATENTS file in the same
 * directory.
 */

namespace Facebook\HHAST\__Private;

use type Facebook\TypeAssert\TypeAssert;
use namespace Facebook\HHAST\Linters;
use namespace HH\Lib\{C, Dict, Str, Vec};

final class LinterCLI extends CLIWithArguments {
  private dict<string, float> $perfCounters = dict[];
  private bool $profile = false;
  private int $verbosity = 0;

  private function bumpCounter(string $name, float $start, float $end): void {
    $count = $this->perfCounters[$name] ?? 0.0;
    $this->perfCounters[$name] = $count + ($end - $start);
  }

  private function isVerbose(int $level): bool {
    return $this->verbosity >= $level;
  }

  <<__Override>>
  public static function getHelpTextForOptionalArguments(): string {
    return 'PATH';
  }

  <<__Override>>
  protected function getSupportedOptions(): vec<CLIOptions\CLIOption> {
    return vec[
      CLIOptions\flag(
        () ==> { $this->profile = true; },
        'Output performance counters when finished',
        'profile',
      ),
      CLIOptions\flag(
        () ==> { $this->verbosity = 1; },
        'Print some more output',
        'verbose',
        'v',
      ),
      CLIOptions\flag(
        () ==> {
          $this->verbosity = 2;
          $this->profile = true;
        },
        'Print a lot more output',
        'extra-verbose',
        'vv',
      ),
    ];
  }

  private function lintFile(
    LinterCLIConfig $config,
    string $path,
  ): Traversable<Linters\LintError> {
    if ($this->isVerbose(1)) {
      printf("Linting %s...\n", $path);
    }
    $all_errors = vec[];
    $config = $config->getConfigForFile($path);

    foreach ($config['linters'] as $class) {
      if ($this->isVerbose(2)) {
        printf(" - %s\n", $class);
      }
      $start = microtime(true);
      $linter = new $class($path);
      $errors = $linter->getLintErrors();
      $end = microtime(true);
      $this->bumpCounter($class.'#getLintErrors', $start, $end);

      $start = microtime(true);
      $all_errors = Vec\concat(
        $all_errors,
        $this->processErrors($linter, $config, $errors),
      );
      $end = microtime(true);
      $this->bumpCounter($class.'#processErrors', $start, $end);
    }
    return $all_errors;
  }

  private function lintDirectory(
    LinterCLIConfig $config,
    string $path,
  ): Traversable<Linters\LintError> {
    $it = new \RecursiveIteratorIterator(
      new \RecursiveDirectoryIterator($path),
    );
    foreach ($it as $info) {
      if (!$info->isFile()) {
        continue;
      }
      $ext = Str\lowercase($info->getExtension());
      if ($ext === 'hh' || $ext === 'php') {
        $file = $info->getPathname();
        foreach($this->lintFile($config, $file) as $error) {
          yield $error;
        }
      }
    }
  }

  private function lintPath(
    LinterCLIConfig $config,
    string $path,
  ): Traversable<Linters\LintError> {
    if (is_file($path)) {
      return $this->lintFile($config, $path);
    } else if (is_dir($path)) {
      return $this->lintDirectory($config, $path);
    } else {
      printf(
        "'%s' doesn't appear to be a file or directory, bailing\n",
        $path,
      );
      exit(1);
    }
  }

  <<__Override>>
  public async function mainAsync(): Awaitable<int> {
    $roots = $this->getArguments();
    if (C\is_empty($roots)) {
      $config = LinterCLIConfig::getForPath(getcwd());
      $roots = $config->getRoots();
      if (C\is_empty($roots)) {
        fwrite(
          STDERR,
          "You must either specify PATH arguments, or provide a configuration".
          "file.\n",
        );
        return 1;
      }
    } else {
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
    if ($this->profile) {
      $counters = Dict\sort_by_key($this->perfCounters);
      foreach ($counters as $name => $value) {
        printf("PERF %2.2fs %s\n", $value, $name);
      }
    }
    return $had_errors ? 2 : 0;
  }

  private function processErrors(
    Linters\BaseLinter $linter,
    LinterCLIConfig::TFileConfig $config,
    Traversable<Linters\LintError> $errors,
  ): Traversable<Linters\LintError> {
    $class = get_class($linter);
    $to_fix = vec[];
    $error_start = microtime(true);
    foreach ($errors as $error) {
      $error_end = microtime(true);
      $this->bumpCounter($class.'#yieldError', $error_start, $error_end);

      $position = $error->getPosition();
      printf(
        "%s%s%s\n".
        "  Location: %s\n",
        posix_isatty(STDOUT) ? "\e[1;31m" : '',
        $error->getDescription(),
        posix_isatty(STDOUT) ? "\e[0m" : '',
        $position === null
          ? $error->getFile()
          : sprintf('%s:%s:%s', $error->getFile(), $position[0], $position[1]),
      );

      $start = microtime(true);
      $fixable = $error instanceof Linters\FixableLintError
        && (!C\contains_key($config['autoFixBlacklist'], $class))
        && $error->isFixable();
      $end = microtime(true);
      $this->bumpCounter($class.'#isFixable', $start, $end);

      if ($error instanceof Linters\FixableLintError && $fixable) {
        if (self::shouldFixLint($error)) {
          $to_fix[] = $error;
        } else {
          yield $error;
        }
      } else {
        self::renderLintBlame($error);
        yield $error;
      }
      $error_start = microtime(true);
    }
    $error_end = microtime(true);
    $this->bumpCounter($class.'#yieldError', $error_start, $error_end);

    if (!C\is_empty($to_fix)) {
      $start = microtime(true);
      self::fixErrors($linter, $to_fix);
      $end = microtime(true);
      $this->bumpCounter($class.'#fix', $start, $end);
    }
  }

  private static function fixErrors(
    Linters\BaseLinter $linter,
    vec<Linters\FixableLintError> $errors,
  ): void {
    invariant(
      $linter instanceof Linters\AutoFixingLinter,
      '%s is not an auto-fixing-linter',
      get_class($linter),
    );

    file_put_contents(
      $linter->getFile(),
      $linter->getCodeWithFixedLintErrors($errors),
    );
  }

  private static function shouldFixLint(
    Linters\FixableLintError $error,
  ): bool {
    list($old, $new) = $error->getReadableFix();
    if ($old === $new) {
      self::renderLintBlame($error);
      return false;
    }

    $prefix_lines = ($code, $prefix) ==>
      explode("\n", $code)
      |> Vec\map(
        $$,
        $line ==> $prefix.$line,
      )
      |> implode("\n", $$);


    $colors = posix_isatty(STDOUT);

    printf(
      "  Code:\n".
      "%s%s%s\n".
      "  Suggested fix:\n".
      "%s%s%s\n",
      $colors ? "\e[31m" : '',
      $prefix_lines($old, '  -'),
      $colors ? "\e[0m" : '',
      $colors ? "\e[32m" : '',
      $prefix_lines($new, '  +'),
      $colors ? "\e[0m" : '',
    );

    if (!(posix_isatty(STDIN) && posix_isatty(STDOUT))) {
      return false;
    }

    static $cache = dict[];
    $cache_key = get_class($error->getLinter());
    if (C\contains_key($cache, $cache_key)) {
      $should_fix = $cache[$cache_key];
      printf(
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
      $response = fgets(STDIN);
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
          fprintf(
            STDERR,
            "'%s' is not a valid response.\n",
            $response,
          );
          $response = null;
      }
    } while ($response === null);
    return false;
  }

  private static function renderLintBlame(
    Linters\LintError $error,
  ): void {
    $blame = $error->getPrettyBlame();
    if ($blame === null) {
      return;
    }

    $colors = posix_isatty(STDOUT);
    printf(
      "  Code:\n%s%s%s\n",
      $colors ? "\e[33m" : '',
      explode("\n", $blame)
      |> Vec\map(
        $$,
        $line ==> '  >'.$line,
      )
      |> implode("\n", $$),
      $colors ? "\e[0m" : '',
    );
  }
}
