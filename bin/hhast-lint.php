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
use namespace HH\Lib\{C, Str, Vec};

require_once(__DIR__.'/../vendor/hh_autoload.php');

final class LinterCLI {
  private static function getLinterClasses(
  ): Traversable<classname<Linters\BaseLinter>> {
    return vec[
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
    foreach ($errors as $error) {
      $had_errors = true;
      printf(
        "%s\n".
        "  File: %s\n",
        $error->getDescription(),
        $error->getFile(),
      );
      if ($error instanceof Linters\FixableLintError && $error->isFixable()) {
        var_dump('proposing fix');
        self::proposeLintFix($error);
      } else {
        var_dump('not fixable');
        self::renderLintBlame($error);
      }
    }

    if ($had_errors) {
      exit(2);
    }
    print("No errors.\n");
  }

  private static function proposeLintFix(
    Linters\FixableLintError $error,
  ): void {
    list($old, $new) = $error->getReadableFix();
    if ($old === $new) {
      var_dump('no change!');
      self::renderLintBlame($error);
      return;
    }

    $prefix_lines = ($code, $prefix) ==>
      explode("\n", $code)
      |> Vec\map(
        $$,
        $line ==> $prefix.$line,
      )
      |> implode("\n", $$);

    printf(
      "  Code:\n".
      "%s\n".
      "  Suggestion:\n".
      "%s\n",
      $prefix_lines($old, '  - '),
      $prefix_lines($new, '  + '),
    );
  }

  private static function renderLintBlame(
    Linters\LintError $error,
  ): void {
    $blame = $error->getPrettyBlameCode();
    if ($blame === null) {
      return;
    }
    printf(
      "  Code:\n%s\n",
      explode("\n", $blame)
      |> Vec\map(
        $$,
        $line ==> '  > '.$line,
      )
      |> implode("\n", $$),
    );
  }
}

LinterCLI::main(vec($argv));
