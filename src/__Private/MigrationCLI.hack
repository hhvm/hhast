/*
 *  Copyright (c) 2017-present, Facebook, Inc.
 *  All rights reserved.
 *
 *  This source code is licensed under the MIT license found in the
 *  LICENSE file in the root directory of this source tree.
 *
 */

namespace Facebook\HHAST\__Private;

use namespace Facebook\{HHAST, TypeAssert};
use namespace HH\Lib\{C, Dict, Str, Vec};
use type Facebook\HHAST\{
  AddFixmesMigration,
  AddXHPChildrenDeclarationMethodMigration,
  BaseMigration,
  DemangleXHPMigration,
  DollarBraceEmbeddedVariableMigration,
  ExplicitPartialModeMigration,
  Fixme4110Migration,
  HSLMigration,
  IMigrationWithFileList,
  ImplicitShapeSubtypesMigration,
  IsRefinementMigration,
  OptionalShapeFieldsMigration,
  RemoveXHPChildDeclarationsMigration,
  TopLevelRequiresMigration,
  XHPClassModifierMigration,
};

use type Facebook\CLILib\{CLIWithRequiredArguments, ExitException};
use namespace Facebook\CLILib\CLIOptions;

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
    $options = vec[
      CLIOptions\with_required_string(
        ($class) ==> {
          try {
            $this->migrations[] = TypeAssert\classname_of(
              BaseMigration::class,
              $class,
            );
          } catch (TypeAssert\IncorrectTypeException $_) {
            throw new ExitException(1, Str\format(
              "'%s' is not a subclass of %s",
              $class,
              BaseMigration::class,
            ));
          }
        },
        'Run the migration with the specified fully-qualified classname',
        '--migration-classname',
      ),
      CLIOptions\flag(
        () ==> {
          $this->migrations[] = HSLMigration::class;
        },
        'Convert PHP standard library calls to HSL',
        '--hsl',
      ),
      self::removed('--assert-to-expect', '4.11.* or below'),
      CLIOptions\flag(
        () ==> {
          $this->migrations[] = ImplicitShapeSubtypesMigration::class;
        },
        'Allow implicit structural subtyping of all shapes',
        '--implicit-shape-subtypes',
      ),
      CLIOptions\flag(
        () ==> {
          $this->migrations[] = OptionalShapeFieldsMigration::class;
        },
        'Migrate nullable shape fields to be both nullable and optional',
        '--optional-shape-fields',
      ),
      CLIOptions\flag(
        () ==> {
          $this->migrations[] = DollarBraceEmbeddedVariableMigration::class;
        },
        'Migrate instances of "${foo}" to "{$foo}"',
        '--dollar-brace-variable-interpolation',
      ),
      CLIOptions\flag(
        () ==> {
          $this->migrations[] = OptionalShapeFieldsMigration::class;
          $this->migrations[] = ImplicitShapeSubtypesMigration::class;
        },
        'Apply all migrations for moving from 3.22 to 3.23',
        '--hhvm-3.22-to-3.23',
      ),
      self::removed('--ctpbr', '4.8.* or below'),
      self::removed('--hhvm-3.23-to-3.24', '4.8.* or below'),
      self::removed('--hhvm-4.2-to-4.3', '4.2.* or below'),
      self::removed('--ltgt-to-ne', '4.2.* or below'),
      self::removed('--hhvm-3.28-to-3.29', '4.2.* or below'),
      CLIOptions\flag(
        () ==> {
          $this->migrations[] = IsRefinementMigration::class;
        },
        'Replace is_foo() with is expressions',
        '--is-refinement',
      ),
      CLIOptions\flag(
        () ==> {
          $this->migrations[] = IsRefinementMigration::class;
        },
        'Apply all migrations for moving from 3.29 to 3.30',
        '--hhvm-3.29-to-3.30',
      ),
      self::removed('--no-namespace-fallback', '4.11.* or below'),
      self::removed('--phpunit-to-hacktest', '4.11.* or below'),
      CLIOptions\flag(
        () ==> {
          $this->migrations[] = ExplicitPartialModeMigration::class;
        },
        "Add `// partial` to files that don't specify a mode",
        '--explicit-partial-mode',
      ),
      self::removed('--hhvm-4.0-to-4.1', '4.11.* or below'),
      self::removed('--hhast-4.5-linter-to-4.6', '4.11'),
      self::removed('--await-precedence', '4.5.2'),
      self::removed('--hhvm-4.5-to-4.6', '4.5.2'),
      self::removed('--empty-expression', '4.6.1'),
      self::removed('--hhvm-4.6-to-4.7', '4.6.1'),
      self::removed('--instanceof-is', '4.14.*'),
      CLIOptions\flag(
        () ==> {
          $this->migrations[] = TopLevelRequiresMigration::class;
        },
        'Migrate top-level require()s to <<__EntryPoint>> functions',
        '--top-level-requires',
      ),
      CLIOptions\flag(
        () ==> {
          $this->migrations[] = AddFixmesMigration::class;
        },
        'Add /* HH_FIXME[] */ comments where needed',
        '--add-fixmes',
      ),
      self::removed('--php-arrays', '4.33.6 to 4.41.2'),
      self::removed('--php-array-typehints-soft', '4.64.4 to 4.64.6'),
      self::removed('--php-array-typehints-hard', '4.64.4 to 4.64.6'),
      CLIOptions\flag(
        () ==> {
          $this->migrations[] =
            HHAST\HardenVarrayOrDarrayTypehintsMigration::class;
        },
        'Remove <<__Soft>> from varray_or_darray typehints (recommended after '.
        'migrating to HHVM 4.68+)',
        '--harden-varray-or-darray-typehints',
      ),
      self::removed('--php-array-typehints-best-guess', '4.64.4 to 4.64.6'),
      CLIOptions\flag(
        () ==> {
          $this->migrations[] = AddXHPChildrenDeclarationMethodMigration::class;
        },
        'Add getChildrenDeclaration() method to XHP classes with a children declaration',
        '--add-xhp-children-declaration-method',
      ),
      CLIOptions\flag(
        () ==> {
          $this->migrations[] = DemangleXHPMigration::class;
        },
        'Replace "-" in XHP class names with "_"',
        '--demangle-xhp-class-names',
      ),
      CLIOptions\flag(
        () ==> {
          $this->migrations[] = RemoveXHPChildDeclarationsMigration::class;
        },
        'Remove `children` declarations from XHP classes, and update validation traits',
        '--remove-xhp-child-declarations',
      ),
      CLIOptions\flag(
        () ==> {
          $this->migrations[] = XHPClassModifierMigration::class;
        },
        'Migrate `class :foo:bar` to `xhp class foo:bar`',
        '--xhp-class-modifier',
      ),
      CLIOptions\flag(
        () ==> {
          $this->migrations[] = HHAST\XHPLibV3ToV4Migration::class;
        },
        'Migrate class/function names changed in xhp-lib v4, add necessary '.
        '`use` clauses (incl. HTML tags)',
        '--xhp-lib-v3-to-v4',
      ),
      CLIOptions\flag(
        () ==> {
          $this->migrations[] = Fixme4110Migration::class;
        },
        'Migrate /* HH_FIXME[4110] */ to the equivalent new error codes',
        '--migrate-fixme-4110',
      ),
      self::removed('--ref-to-inout', '>=4.21.7 <4.29'),
      CLIOptions\flag(
        () ==> {
          $this->includeVendor = true;
        },
        'Also migrate files in vendor/ subdirectories',
        '--include-vendor',
      ),
      CLIOptions\flag(
        () ==> {
          $this->xhprof = true;
        },
        'Enable XHProf profiling',
        '--xhprof',
      ),
    ];

    $options[] = $this->getVerbosityOption();
    return $options;
  }

  /**
   * All previously supported migrations should use this template.
   */
  private static function removed(
    string $flag,
    string $supported_versions,
  ): CLIOptions\CLIOption {
    return CLIOptions\flag(
      () ==> {
        throw new ExitException(
          1,
          'Use HHAST '.$supported_versions.' for this migration',
        );
      },
      'no longer supported (use HHAST '.$supported_versions.')',
      $flag,
    );
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
    try {
      /*HHAST_FIXME[DontUseAsioJoin]*/
      $ast = \HH\Asio\join(HHAST\from_file_async(HHAST\File::fromPath($file)));
    } catch (\Facebook\HHAST\ASTError $e) {
      /*HHAST_FIXME[DontUseAsioJoin]*/
      \HH\Asio\join($this->getStderr()->writeAllAsync($e->getMessage()));
      return;
    }
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
      if ($migration is IMigrationWithFileList) {
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
        if (Str\contains($file, '/vendor/')) {
          $this->verbosePrintf(
            self::VERBOSE_SKIP_BECAUSE_VENDOR,
            "Skipping file '%s' because it is in vendor/\n",
            $file,
          );
          continue;
        }
      }

      if (Str\contains($file, '/.git/')) {
        $this->verbosePrintf(
          self::VERBOSE_SKIP_BECAUSE_GIT,
          "Skipping file '%s' because it is in .git/\n",
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
    $err = $this->getStderr();
    if (C\is_empty($this->migrations)) {
      await $err->writeAllAsync("You must specify at least one migration!\n\n");
      $this->displayHelp($err);
      return 1;
    }

    $args = $this->getArguments();
    if (C\is_empty($args)) {
      await $err->writeAllAsync("You must specify at least one path!\n\n");
      $this->displayHelp($err);
      return 1;
    }

    $all_config_options = dict[];
    foreach ($this->migrations as $migration) {
      $min_version = $migration::getMinimumHHVMVersion();
      if (
        $min_version is nonnull &&
        \version_compare(\HHVM_VERSION, $min_version, '<')
      ) {
        /* HHAST_IGNORE_ERROR[DontAwaitInALoop] we quit after doing this once */
        await $err->writeAllAsync(Str\format(
          "Migration %s requires HHVM version %s or newer.\n",
          $migration,
          $min_version,
        ));
        return 1;
      }

      $config_options = $migration::getRequiredHHConfigOptions();
      $all_config_options = Dict\merge($config_options, $all_config_options);
      foreach ($config_options as $option => $value) {
        if ($all_config_options[$option] !== $value) {
          /* HHAST_IGNORE_ERROR[DontAwaitInALoop] same as above */
          await $err->writeAllAsync(Str\format(
            'Migration %s requires .hhconfig option %s=%s which conflicts '.
            "with another migration.\n",
            $migration,
            $option,
            $value,
          ));
          return 1;
        }
      }
    }

    try {
      // Restart hh_server for each path (some or all of these may be the same
      // hh_server instance) with the correct .hhconfig options.
      if (!C\is_empty($all_config_options)) {
        foreach ($args as $path) {
          /* HHAST_IGNORE_ERROR[DontAwaitInALoop]
             these shouldn't run concurrently */
          await execute_async(
            'hh_client',
            'restart',
            '--config',
            $all_config_options
              |> Vec\map_with_key($$, ($option, $value) ==> $option.'='.$value)
              |> Str\join($$, ','),
            $path,
          );
        }
      }

      foreach ($args as $path) {
        $migrations = Vec\map($this->migrations, $class ==> new $class($path));
        if (\is_file($path)) {
          $this->migrateFile($migrations, $path);
          continue;
        }
        if (\is_dir($path)) {
          $this->migrateDirectory($migrations, $path);
          continue;
        }

        /* HHAST_IGNORE_ERROR[DontAwaitInALoop] */
        await $err->writeAllAsync(
          Str\format("Don't know how to process path: %s\n", $path),
        );
        return 1;
      }
      return 0;
    } finally {
      // Restart hh_server to get rid of the overridden .hhconfig options.
      if (!C\is_empty($all_config_options)) {
        foreach ($args as $path) {
          /* HHAST_IGNORE_ERROR[DontAwaitInALoop]
             these shouldn't run concurrently */
          await execute_async('hh_client', 'restart', $path);
        }
      }
    }
  }

  private static ?(string, bool) $lastFileIsHack = null;

  private static function isHackFile(string $file): bool {
    if (self::$lastFileIsHack is nonnull) {
      list($cache_file, $cache_result) = self::$lastFileIsHack;
      if ($cache_file === $file) {
        return $cache_result;
      }
    }

    if (Str\ends_with($file, '.hack')) {
      self::$lastFileIsHack = tuple($file, true);
      return true;
    }

    $f = \fopen($file, 'r');
    $prefix = \fread($f, 4);
    if ($prefix === '<?hh') {
      self::$lastFileIsHack = tuple($file, true);
      return true;
    }

    if (!Str\starts_with($prefix, '#!')) {
      self::$lastFileIsHack = tuple($file, false);
      return false;
    }
    \rewind($f);
    $_shebang = \fgets($f);
    $prefix = \fread($f, 4);

    $is_hh = $prefix === '<?hh';

    self::$lastFileIsHack = tuple($file, $is_hh);
    return $is_hh;
  }
}
