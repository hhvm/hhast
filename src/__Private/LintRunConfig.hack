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
use namespace HH\Lib\{C, Keyset, Str, Vec};
use type Facebook\HHAST\BaseLinter;

final class LintRunConfig {
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
    ?'overrides' => vec<
      shape(
        // Which files this override applies to (uses `fnmatch()`)
        'patterns' => vec<string>,
        ?'builtinLinters' => NamedLinterGroup,
        ?'extraLinters' => vec<string>,
        ?'disabledLinters' => vec<string>,
        ?'disabledAutoFixes' => vec<string>,
        ?'disableAllAutoFixes' => bool,
        ?'disableAllLinters' => bool,
      )
    >,
  );

  const type TFileConfig = shape(
    'linters' => keyset<classname<BaseLinter>>,
    'autoFixBlacklist' => keyset<classname<BaseLinter>>,
  );

  const vec<classname<BaseLinter>> DEFAULT_LINTERS = vec[
    HHAST\AsyncFunctionAndMethodLinter::class,
    HHAST\CamelCasedMethodsUnderscoredFunctionsLinter::class,
    HHAST\DontAwaitInALoopLinter::class,
    HHAST\LicenseHeaderLinter::class,
    HHAST\NewlineAtEndOfFileLinter::class,
    HHAST\NoBasicAssignmentFunctionParameterLinter::class,
    HHAST\MustUseBracesForControlFlowLinter::class,
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
    HHAST\PocketAtomExpressionLinter::class,
    HHAST\PocketIdentifierExpressionLinter::class,
    HHAST\PocketEnumDeclarationLinter::class,
    HHAST\PreferRequireOnceLinter::class,
    HHAST\ConsistentLineEndingsLinter::class,
  ];

  const vec<classname<BaseLinter>> NON_DEFAULT_LINTERS = vec[
    HHAST\DontUseAsioJoinLinter::class,
    HHAST\PreferSingleQuotedStringLiteralLinter::class,
    HHAST\NoStringInterpolationLinter::class,
    HHAST\ShoutCaseEnumMembersLinter::class,
    HHAST\StrictModeOnlyLinter::class,
    HHAST\UseStatementWithAsLinter::class,
    HHAST\NoFinalMethodInFinalClassLinter::class,
  ];

  private static function getNamedLinterGroup(
    NamedLinterGroup $group,
  ): vec<classname<BaseLinter>> {
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
  private static function getFromConfigFile(string $path): this {
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
    return Vec\map(
      $this->configFile['roots'],
      $dir ==> $this->projectRoot.'/'.$dir,
    );
  }

  public function getConfigForFile(string $file_path): self::TFileConfig {
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
      return shape(
        'linters' => keyset[],
        'autoFixBlacklist' => keyset[],
      );
    }
    $builtin_linters = $this->configFile['builtinLinters'] ??
      NamedLinterGroup::DEFAULT_BUILTINS;
    $linters = $this->configFile['extraLinters'] ?? vec[];
    $blacklist = $this->configFile['disabledLinters'] ?? vec[];
    $autofix_blacklist = $this->configFile['disabledAutoFixes'] ?? vec[];
    $no_autofixes = $this->configFile['disableAllAutoFixes'] ?? false;
    foreach ($this->configFile['overrides'] ?? vec[] as $override) {
      $matches = false;
      foreach ($override['patterns'] as $pattern) {
        if (\fnmatch($pattern, $file_path)) {
          $matches = true;
          break;
        }
      }
      if (!$matches) {
        continue;
      }
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
      $blacklist = Vec\concat(
        $blacklist,
        $override['disabledLinters'] ?? vec[],
      );
      $autofix_blacklist = Vec\concat(
        $autofix_blacklist,
        $override['disabledAutoFixes'] ?? vec[],
      );
      $no_autofixes = $no_autofixes ||
        ($override['disableAllAutoFixes'] ?? false);
    }

    $normalize = (vec<string> $list) ==> Keyset\map(
      $list,
      $linter ==> $this->getFullyQualifiedLinterName($linter),
    );

    $linters = $normalize($linters);
    $blacklist = $normalize($blacklist);
    $autofix_blacklist = $normalize($autofix_blacklist);

    $linters = Keyset\union(
      $linters,
      self::getNamedLinterGroup($builtin_linters),
    );

    $linters = Keyset\diff($linters, $blacklist);
    if ($no_autofixes) {
      $autofix_blacklist = $linters;
    }

    $assert_types = (keyset<string> $list) ==> Keyset\map(
      $list,
      $str ==> TypeAssert\classname_of(BaseLinter::class, $str),
    );
    $linters = $assert_types($linters);
    $autofix_blacklist = $assert_types($autofix_blacklist);

    return shape(
      'linters' => $linters,
      'autoFixBlacklist' => $autofix_blacklist,
    );
  }

  private function getFullyQualifiedLinterName(string $name): string {
    if (Str\starts_with($name, 'Facebook\\HHAST\\Linters')) {
      $name = 'Facebook\\HHAST'.
        Str\strip_prefix($name, 'Facebook\\HHAST\\Linters');
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
