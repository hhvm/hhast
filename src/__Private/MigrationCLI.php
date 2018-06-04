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

use namespace Facebook\HHAST;
use namespace HH\Lib\{C, Str, Vec};
use type Facebook\HHAST\Migrations\{
  AddFixMesMigration,
  BaseMigration,
  CallTimePassByReferenceMigration,
  IMigrationWithFileList,
  ImplicitShapeSubtypesMigration,
  OptionalShapeFieldsMigration,
  NamespaceFallbackMigration,
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
  private bool $xhprof = false;

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
        () ==> {
          $this->migrations[] = CallTimePassByReferenceMigration::class;
        },
        'Add required ampersands at call sites for byref arguments',
        '--ctpbr',
      ),
      CLIOptions\flag(
        () ==> {
          $this->migrations[] = CallTimePassByReferenceMigration::class;
        },
        'Apply all migrations for moving from 3.23 to 3.24',
        '--hhvm-3.23-to-3.24',
      ),
      CLIOptions\flag(
        () ==> {
          $this->migrations[] = NamespaceFallbackMigration::class;
        },
        'Add leading \\ to calls to unqualified references to global '.
        'functions or constants',
        '--no-namespace-fallback',
      ),
      CLIOptions\flag(
        () ==> { $this->migrations[] = AddFixMesMigration::class; },
        'Add /* HH_FIXME[] */ comments where needed',
        '--add-fixmes',
      ),
      CLIOptions\flag(
        () ==> { $this->includeVendor = true; },
        'Also migrate files in vendor/ subdirectories',
        '--include-vendor',
      ),
      CLIOptions\flag(
        () ==> { $this->xhprof = true; },
        'Enable XHProf profiling',
        '--xhprof',
      ),
      $this->getVerbosityOption(),
    ];
  }

  final private function migrateFile(
    vec<BaseMigration> $migrations,
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
    foreach ($migrations as $migration) {
      $new_ast = $migration->migrateFile($file, $ast);
      if ($ast !== $new_ast) {
        $ast = $new_ast;
        // Some migrations need to run the typechecker, so it needs to be up to
        // date on disk
        \file_put_contents($file, $ast->getCode());
      }
    }
  }

  final private function migrateDirectory(
    vec<BaseMigration> $migrations,
    string $directory,
  ): void {
    $need_recursion = false;
    $has_file_list = vec[];
    foreach ($migrations as $migration) {
      if ($migration instanceof IMigrationWithFileList) {
        $has_file_list[] = $migration;
      } else {
        $need_recursion = true;
        break;
      }
    }

    if ($need_recursion) {
      $this->migrateDirectoryByRecursing($migrations, $directory);
      return;
    }

    foreach ($has_file_list as $migration) {
      $files = $migration->getFilePathsToMigrate();
      foreach ($files as $file) {
        $this->migrateFile(vec[$migration], $file);
      }
    }
  }

  final private function migrateDirectoryByRecursing(
    vec<BaseMigration> $migrations,
    string $directory,
  ): void {
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
      $this->migrateFile($migrations, $file);
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
    if (C\is_empty($this->migrations)) {
      \fprintf(\STDERR, "You must specify at least one migration!\n\n");
      $this->displayHelp(\STDERR);
      return 1;
    }

    $args = $this->getArguments();
    if (C\is_empty($args)) {
      \fprintf(\STDERR, "You must specify at least one path!\n\n");
      $this->displayHelp(\STDERR);
      return 1;
    }
    foreach ($args as $path) {
      $migrations = Vec\map(
        $this->migrations,
        $class ==> new $class($path),
      );
      if (\is_file($path)) {
        $this->migrateFile($migrations, $path);
        continue;
      }
      if (\is_dir($path)) {
        $this->migrateDirectory($migrations, $path);
        continue;
      }

      \fprintf(\STDERR, "Don't know how to process path: %s\n", $path);
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

    $f = \fopen($file, 'r');
    $prefix = \fread($f, 4);
    if ($prefix === '<?hh') {
      $cache = tuple($file, true);
      return true;
    }

    if (!Str\starts_with($prefix, '#!')) {
      $cache = tuple($file, false);
      return false;
    }
    \rewind($f);
    $_shebang = \fgets($f);
    $prefix = \fread($f, 4);

    $is_hh = $prefix === '<?hh';

    $cache = tuple($file, $is_hh);
    return $is_hh;
  }
}
