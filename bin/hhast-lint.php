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
      $blame = $error->getPrettyBlameCode();
      if ($blame === null) {
        continue;
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

    if ($had_errors) {
      exit(2);
    }
    print("No errors.\n");
  }
}

LinterCLI::main(vec($argv));
