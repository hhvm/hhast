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
use namespace HH\Lib\{C, Dict, Keyset, Str, Vec};
use type Facebook\HHAST\Linter;

final class LintRunConfig {

  const type TOverride = shape(
    // Which files this override applies to (uses `fnmatch()`)
    'patterns' => vec<string>,
    ?'builtinLinters' => NamedLinterGroup,
    ?'extraLinters' => vec<string>,
    ?'disabledLinters' => vec<string>,
    ?'disabledAutoFixes' => vec<string>,
    ?'disableAllAutoFixes' => bool,
    ?'disableAllLinters' => bool,
    ?'linterConfigs' => dict<string, dynamic>,
  );
  const type TConfigFile = shape(
    // Where to lint, eg '[ "src/", "codegen/", "tests/" ]
    'roots' => vec<string>,
    // HHAST includes several linters - which do you want?
    //   'all' | 'default' | 'none'
    // 'default' is currently the same as 'all', but may be more conservative
    // in the future
    ?'builtinLinters' => NamedLinterGroup,
    // Equivalent to 'use namespace' for the config options that take
    // linter classnames - e.g:
    //   "namespaceAliases": { "HHAST": "Facebook\\HHAST\\Linters" },
    //   "extraLinters": [ "HHAST\\SomeContentiousLinter" ],
    ?'namespaceAliases' => dict<string, string>,
    // Class names for additional linters that should be used for this project
    ?'extraLinters' => vec<string>,
    // Class names for specific linters you'd like to disable; useful if you'd
    // like `"builtinLinters": "all"` or `"default"` except for one or two.
    ?'disabledLinters' => vec<string>,
    // Class names for linters where the autofixes should never be applied
    ?'disabledAutoFixes' => vec<string>,
    // Disable all autofixes; probably more useful as an override - for example,
    // hhast disables all autofixes in the codegen/ directory.
    // Defaults to false.
    ?'disableAllAutoFixes' => bool,
    // Override any of the above for a subset of files in the project
    ?'overrides' => vec<self::TOverride>,
    // Each linter may specify a type for itself.
    // The type of this key is effectively `dict<classname<TLinter>, TLinter::TConfig>`
    // for example:
    // "linterConfigs": { "Facebook\\HHAST\\HHClientLinter": { "ignore": [5624, 5639] }}
    ?'linterConfigs' => dict<string, dynamic>,
  );

  const type TFileConfig = shape(
    'linters' => keyset<classname<Linter>>,
    'autoFixBlacklist' => keyset<classname<Linter>>,
  );

  const vec<classname<Linter>> DEFAULT_LINTERS = vec[
    HHAST\AsyncFunctionAndMethodLinter::class,
    HHAST\CamelCasedMethodsUnderscoredFunctionsLinter::class,
    HHAST\DontAwaitInALoopLinter::class,
    HHAST\LicenseHeaderLinter::class,
    HHAST\NewlineAtEndOfFileLinter::class,
    HHAST\MustUseBracesForControlFlowLinter::class,
    HHAST\NoNewlineAtStartOfControlFlowBlockLinter::class,
    HHAST\MustUseOverrideAttributeLinter::class,
    HHAST\NoElseifLinter::class,
    HHAST\NoPHPEqualityLinter::class,
    HHAST\UnusedParameterLinter::class,
    HHAST\UnusedVariableLinter::class,
    HHAST\UnusedUseClauseLinter::class,
    HHAST\UseStatementWithLeadingBackslashLinter::class,
    HHAST\UseStatementWithoutKindLinter::class,
    HHAST\GroupUseStatementsLinter::class,
    HHAST\GroupUseStatementAlphabetizationLinter::class,
    HHAST\NoWhitespaceAtEndOfLineLinter::class,
    HHAST\PreferRequireOnceLinter::class,
    HHAST\ConsistentLineEndingsLinter::class,
  ];

  const vec<classname<Linter>> NON_DEFAULT_LINTERS = vec[
    HHAST\DontUseAsioJoinLinter::class,
    HHAST\PreferSingleQuotedStringLiteralLinter::class,
    HHAST\NoStringInterpolationLinter::class,
    HHAST\ShoutCaseEnumMembersLinter::class,
    HHAST\StrictModeOnlyLinter::class,
    HHAST\UseStatementWithAsLinter::class,
    HHAST\NoFinalMethodInFinalClassLinter::class,
    HHAST\NamespacePrivateLinter::class,
    HHAST\DontHaveTwoEmptyLinesInARowLinter::class,
    HHAST\DontCreateForwardingLambdasLinter::class,
  ];

  private static function getNamedLinterGroup(
    NamedLinterGroup $group,
  ): vec<classname<Linter>> {
    switch ($group) {
      case NamedLinterGroup::NO_BUILTINS:
        return vec[];
      case NamedLinterGroup::DEFAULT_BUILTINS:
        return self::DEFAULT_LINTERS;
      case NamedLinterGroup::ALL_BUILTINS:
        return Vec\concat(self::DEFAULT_LINTERS, self::NON_DEFAULT_LINTERS);
    }
  }

  private function __construct(
    private string $projectRoot,
    private self::TConfigFile $configFile,
  ) {
  }

  <<__Memoize>>
  public static function getFromConfigFile(string $path): this {
    return new self(\dirname($path), self::getConfigFromFile($path));
  }

  <<__Memoize>>
  private static function getDefault(): this {
    return new self(\getcwd(), shape('roots' => vec[]));
  }

  public static function getForPath(string $path): this {
    $path = \realpath($path);
    if (\is_dir($path)) {
      return self::getForPathImpl($path);
    }
    return self::getForPathImpl(\dirname($path));
  }

  <<__Memoize>>
  private static function getForPathImpl(string $path): this {
    if ($path === '') {
      return self::getDefault();
    }
    $config_file = $path.'/hhast-lint.json';
    if (\file_exists($config_file)) {
      return self::getFromConfigFile($config_file);
    }
    return Str\split($path, '/')
      |> Vec\take($$, C\count($$) - 1)
      |> Str\join($$, '/')
      |> self::getForPathImpl($$);
  }

  public function getRoots(): vec<string> {
    return
      Vec\map($this->configFile['roots'], $dir ==> $this->projectRoot.'/'.$dir);
  }

  private function findOverride(string $file_path): ?self::TOverride {
    return C\find(
      $this->configFile['overrides'] ?? vec[],
      $override ==> C\find(
        $override['patterns'],
        $pattern ==> \fnmatch($pattern, $file_path),
      ) is nonnull,
    );
  }

  private function relativeFilePath(string $file_path): ?string {
    $roots = Vec\map(
      $this->configFile['roots'],
      $s ==> Str\strip_suffix($s, '/').'/' |> Str\strip_prefix($$, './'),
    );
    $file_path = Str\strip_prefix($file_path, $this->projectRoot.'/')
      |> Str\strip_prefix($$, './');
    if (
      $roots !== vec[] &&
      !C\any($roots, $root ==> Str\starts_with($file_path, $root))
    ) {
      return null;
    }
    return $file_path;
  }

  public function getConfigForFile(string $file_path): self::TFileConfig {
    $file_path = $this->relativeFilePath($file_path);
    if ($file_path is null) {
      return shape(
        'linters' => keyset[],
        'autoFixBlacklist' => keyset[],
      );
    }
    $builtin_linters =
      $this->configFile['builtinLinters'] ?? NamedLinterGroup::DEFAULT_BUILTINS;
    $linters = $this->configFile['extraLinters'] ?? vec[];
    $blacklist = $this->configFile['disabledLinters'] ?? vec[];
    $autofix_blacklist = $this->configFile['disabledAutoFixes'] ?? vec[];
    $no_autofixes = $this->configFile['disableAllAutoFixes'] ?? false;
    $override = $this->findOverride($file_path);
    if ($override is nonnull) {
      if ($override['disableAllLinters'] ?? false) {
        return shape(
          'linters' => keyset[],
          'autoFixBlacklist' => keyset[],
        );
      }
      if (Shapes::keyExists($override, 'builtinLinters')) {
        $builtin_linters = $override['builtinLinters'];
      }
      $linters = Vec\concat($linters, $override['extraLinters'] ?? vec[]);
      $blacklist =
        Vec\concat($blacklist, $override['disabledLinters'] ?? vec[]);
      $autofix_blacklist =
        Vec\concat($autofix_blacklist, $override['disabledAutoFixes'] ?? vec[]);
      $no_autofixes =
        $no_autofixes || ($override['disableAllAutoFixes'] ?? false);
    }

    $normalize = (vec<string> $list) ==> Keyset\map(
      $list,
      $linter ==> $this->getFullyQualifiedLinterName($linter),
    );

    $linters = $normalize($linters);
    $blacklist = $normalize($blacklist);
    $autofix_blacklist = $normalize($autofix_blacklist);

    $linters =
      Keyset\union($linters, self::getNamedLinterGroup($builtin_linters));

    $linters = Keyset\diff($linters, $blacklist);
    if ($no_autofixes) {
      $autofix_blacklist = $linters;
    }

    $assert_types = (keyset<string> $list) ==>
      Keyset\map($list, $str ==> TypeAssert\classname_of(Linter::class, $str));
    $linters = $assert_types($linters);
    $autofix_blacklist = $assert_types($autofix_blacklist);

    return shape(
      'linters' => $linters,
      'autoFixBlacklist' => $autofix_blacklist,
    );
  }

  public function getLinterConfigForLinter<TLinter as Linter, TConfig>(
    classname<TLinter> $classname,
    ?string $file_path = null,
  ): ?TConfig where TConfig = TLinter::TConfig {
    $global_linter_config =
      $this->configFile['linterConfigs'][$classname] ?? null;
    $file_linter_config =
      $file_path is null ? null : $this->relativeFilePath($file_path)
      |> $$ is null
        ? null
        : $this->findOverride($$)['linterConfigs'][$classname] ?? null;
    if ($global_linter_config is null) {
      if ($file_linter_config is null) {
        return null;
      } else {
        $config = $file_linter_config;
      }
    } else {
      if ($file_linter_config is null) {
        $config = $global_linter_config;
      } else {
        $config = Dict\merge(
          $global_linter_config as dict<_, _>,
          $file_linter_config as dict<_, _>,
        );
      }
    }

    try {
      return TypeAssert\matches_type_structure(
        type_structure($classname, 'TConfig'),
        $config,
      );
    } catch (TypeAssert\UnsupportedTypeException $e) {
      throw new \InvalidOperationException(
        Str\format(
          '%s specified an unsupported config type. See previous exception:',
          $classname,
        ),
        $e->getCode(),
        $e,
      );
    } catch (TypeAssert\IncorrectTypeException $e) {
      throw new \Exception(
        Str\format(
          'Configuration for %s is not of the correct type. See previous exception:',
          $classname,
        ),
        $e->getCode(),
        $e,
      );
    }
  }

  private function getFullyQualifiedLinterName(string $name): string {
    if (Str\starts_with($name, 'Facebook\\HHAST\\Linters')) {
      $name =
        'Facebook\\HHAST'.Str\strip_prefix($name, 'Facebook\\HHAST\\Linters');
    }
    $aliases = $this->configFile['namespaceAliases'] ?? dict[];
    if (C\is_empty($aliases)) {
      return $name;
    }

    foreach ($aliases as $alias => $ns) {
      $alias = $alias.'\\';
      if (Str\starts_with($name, $alias)) {
        return $ns.'\\'.Str\strip_prefix($name, $alias);
      }
    }

    return $name;
  }

  private static function getConfigFromFile(string $file): self::TConfigFile {
    $json = \file_get_contents($file);
    $data = \json_decode(
      $json,
      /* as array = */ true,
      /* depth = [default] */ 512,
      \JSON_FB_LOOSE | \JSON_FB_HACK_ARRAYS,
    );
    if ($data === null) {
      throw new \Exception('Failed to parse JSON in configuration file '.$file);
    }
    try {
      return TypeAssert\matches_type_structure(
        type_structure(self::class, 'TConfigFile'),
        $data,
      );
    } catch (TypeAssert\IncorrectTypeException $e) {
      throw new \Exception(
        Str\format(
          "Invalid configuration file: %s\n  %s",
          $file,
          $e->getMessage(),
        ),
      );
    }
  }
}
