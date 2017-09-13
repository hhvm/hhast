#!/usr/bin/env hhvm
<?hh
/**
 * Copyright (c) 2017, Facebook, Inc.
 * All rights reserved.
 *
 * This source code is licensed under the BSD-style license found in the
 * LICENSE file in the "hack" directory of this source tree. An additional
 * grant of patent rights can be found in the PATENTS file in the same
 * directory.
 *
 */

namespace Facebook\HHAST\__Private;

use type Facebook\TypeAssert\TypeAssert;
use namespace Facebook\HHAST\Linters;
use namespace HH\Lib\{C, Dict, Str, Vec};

require_once(__DIR__.'/../vendor/hh_autoload.php');

final class LinterCLI {
  private static function getLinterClasses(
  ): Traversable<classname<Linters\BaseLinter>> {
    return vec[
      Linters\MustUseBracesForControlFlowLinter::class,
      Linters\MustUseOverrideAttributeLinter::class,
    ];
  }

  private static function lintFile(
    string $path,
  ): Traversable<Linters\LintError> {
    return self::getLinterClasses()
      |> Vec\map(
        $$,
        $class ==> (new $class($path))->getLintErrors(),
      )
      |> Vec\flatten($$);
  }

  private static function lintDirectory(
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
        foreach(self::lintFile($file) as $error) {
          yield $error;
        }
      }
    }
  }

  private static function lintPath(
    string $path,
  ): Traversable<Linters\LintError> {
    if (is_file($path)) {
      return self::lintFile($path);
    } else if (is_dir($path)) {
      return self::lintDirectory($path);
    } else {
      printf(
        "'%s' doesn't appear to be a file or directory, bailing\n",
        $path,
      );
      exit(1);
    }
  }

  public static function main(vec<string> $argv): void {
    $is_help = ($argv[1] ?? null) === '--help';
    $is_bad = C\count($argv) !== 2
      || (Str\starts_with($argv[1], '--') && !$is_help);

    if ($is_bad || $is_help) {
      printf(
        "Usage: %s (--help|FILE_OR_DIRECTORY)\n",
        $argv[0],
      );
      exit($is_help ? 0 : 1);
    }

    $errors = self::lintPath($argv[1]);

    $had_errors = false;
    $to_fix = vec[];

    foreach ($errors as $error) {
      $had_errors = true;
      printf(
        "%s%s%s\n".
        "  File: %s\n",
        posix_isatty(STDOUT) ? "\e[1;31m" : '',
        $error->getDescription(),
        posix_isatty(STDOUT) ? "\e[0m" : '',
        $error->getFile(),
      );
      if ($error instanceof Linters\FixableLintError && $error->isFixable()) {
        if (self::shouldFixLint($error)) {
          $to_fix[] = $error;
        }
      } else {
        self::renderLintBlame($error);
      }
    }

    if (!$had_errors) {
      print("No errors.\n");
      exit(0);
    }

    self::fixErrors($to_fix);

    exit(2);
  }

  private static function fixErrors(
    vec<Linters\FixableLintError> $errors,
  ): void {
    $by_file = Dict\group_by(
      $errors,
      $error ==> $error->getFile(),
    );
    foreach ($by_file as $file => $errors) {
      $linters = $errors
        |> Vec\map(
          $$,
          $error ==> $error->getLinter(),
        )
        |> Vec\unique_by(
          $$,
          $linter ==> get_class($linter),
        );
      foreach ($linters as $linter) {
        invariant(
          $linter instanceof Linters\AutoFixingLinter,
          '%s is not an auto-fixing-linter',
          get_class($linter),
        );

        // TODO: if multiple linters modify the same file, we currently
        // have a problem
        file_put_contents(
          $file,
          $linter->getCodeWithFixedLintErrors($errors),
        );
      }
    }
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
    $blame = $error->getPrettyBlameCode();
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

LinterCLI::main(vec($argv));
