<?hh // strict
/**
 * Copyright (c) 2016, Facebook, Inc.
 * All rights reserved.
 *
 * This source code is licensed under the BSD-style license found in the
 * LICENSE file in the root directory of this source tree. An additional
 * grant of patent rights can be found in the PATENTS file in the same
 * directory.
 */

namespace Facebook\HHAST\__Private;

use namespace Facebook\HHAST;
use namespace HH\Lib\{C, Str};
use type Facebook\HHAST\Migrations\{
  BaseMigration,
  ImplicitShapeSubtypesMigration,
  OptionalShapeFieldsMigration
};

class MigrationCLI extends CLIWithRequiredArguments {
  use CLIWithVerbosityTrait;

  const VERBOSE_SKIP_BECAUSE_GIT = 2;
  const VERBOSE_SKIP_BECAUSE_NOT_HACK = 1;
  const VERBOSE_SKIP_BECAUSE_VENDOR = 1;
  const VERBOSE_MIGRATE = 2;
  const VERBOSE_MIGRATE_NOT_HACK = 1;

  protected keyset<classname<BaseMigration>> $migrations = keyset[];
  private bool $includeVendor = false;

  <<__Override>>
  final public static function getHelpTextForRequiredArguments(): vec<string> {
    return vec['PATH'];
  }

  <<__Override>>
  protected function getSupportedOptions(): vec<CLIOptions\CLIOption> {
    return vec[
      CLIOptions\flag(
        () ==> { $this->migrations[] = ImplicitShapeSubtypesMigration::class; },
        'Allow implicit structural subtyping of all shapes',
        '--implicit-shape-subtypes',
      ),
      CLIOptions\flag(
        () ==> { $this->migrations[] = OptionalShapeFieldsMigration::class; },
        'Migrate nullable shape fields to be both nullable and optional',
        '--optional-shape-fields',
      ),
      CLIOptions\flag(
        () ==> {
          $this->migrations[] = OptionalShapeFieldsMigration::class;
          $this->migrations[] = ImplicitShapeSubtypesMigration::class;
        },
        'Apply all migrations for moving from 3.22 to 3.23',
        '--hhvm-3.22-to-3.23',
      ),
      CLIOptions\flag(
        () ==> { $this->includeVendor = true; },
        'Also migrate files in vendor/ subdirectories',
        '--include-vendor',
      ),
      $this->getVerbosityOption(),
    ];
  }

  final private function migrateFile(
    string $file,
  ): void {
    $this->verbosePrintf(
      self::VERBOSE_MIGRATE,
      "Migrating file %s...\n",
      $file,
    );
    if (!self::isHackFile($file)) {
      $this->verbosePrintf(
        self::VERBOSE_MIGRATE_NOT_HACK,
        "Migrating file %s despite it not looking like a Hack file\n",
        $file,
      );
    }
    $ast = HHAST\from_file($file);
    foreach ($this->migrations as $migration) {
      $ast = (new $migration())->migrateAst($ast);
    }
    file_put_contents($file, $ast->getCode());
  }

  final private function migrateDirectory(string $directory): void {
    $it = new \RecursiveIteratorIterator(
      new \RecursiveDirectoryIterator($directory),
    );
    foreach ($it as $info) {
      if (!$info->isFile()) {
        continue;
      }
      $file = $info->getPathname();
      if (!$this->includeVendor) {
        if (Str\contains($file, '/.git/')) {
          $this->verbosePrintf(
            self::VERBOSE_SKIP_BECAUSE_GIT,
            "Skipping file '%s' because it is in .git/\n",
            $file,
          );
          continue;
        }
        if (Str\contains($file, '/vendor/')) {
          $this->verbosePrintf(
            self::VERBOSE_SKIP_BECAUSE_VENDOR,
            "Skipping file '%s' because it is in vendor/\n",
            $file,
          );
          continue;
        }
        if (!self::isHackFile($file)) {
          $this->verbosePrintf(
            self::VERBOSE_SKIP_BECAUSE_NOT_HACK,
            "Skipping file '%s' because it is not a Hack file\n",
            $file,
          );
          continue;
        }
      }
      $this->migrateFile($file);
    }
  }

  <<__Override>>
  public async function mainAsync(): Awaitable<int> {
    if (C\is_empty($this->migrations)) {
      fprintf(STDERR, "You must specify at least one migration!\n\n");
      $this->displayHelp(STDERR);
      return 1;
    }

    $args = $this->getArguments();
    if (C\is_empty($args)) {
      fprintf(STDERR, "You must specify at least one path!\n\n");
      $this->displayHelp(STDERR);
      return 1;
    }
    foreach ($args as $path) {
      if (is_file($path)) {
        $this->migrateFile($path);
        continue;
      }
      if (is_dir($path)) {
        $this->migrateDirectory($path);
        continue;
      }

      fprintf(STDERR, "Don't know how to process path: %s\n", $path);
      return 1;
    }
    return 0;
  }

  private static function isHackFile(string $file): bool {
    static $cache = null;
    if ($cache !== null) {
      list($cache_file, $cache_result) = $cache;
      if ($cache_file === $file) {
        return $cache_result;
      }
    }

    $f = fopen($file, 'r');
    $prefix = fread($f, 4);
    if ($prefix === '<?hh') {
      $cache = tuple($file, true);
      return true;
    }

    if (!Str\starts_with($prefix, '#!')) {
      $cache = tuple($file, false);
      return false;
    }
    rewind($f);
    $_shebang = fgets($f);
    $prefix = fread($f, 4);

    $is_hh = $prefix === '<?hh';

    $cache = tuple($file, $is_hh);
    return $is_hh;
  }
}
