/*
 *  Copyright (c) 2017-present, Facebook, Inc.
 *  All rights reserved.
 *
 *  This source code is licensed under the MIT license found in the
 *  LICENSE file in the root directory of this source tree.
 *
 */

namespace Facebook\HHAST;

use namespace Facebook\TypeAssert;
use type Facebook\HHAST\File;
use namespace HH\Lib\{C, Keyset, Str};

<<__ConsistentConstruct>>
abstract class BaseLinter {
  <<__Reifiable>>
  const type TConfig as shape(...) = shape(...);

  abstract public function getLintErrorsAsync(): Awaitable<vec<LintError>>;

  public static function shouldLintFile(File $_): bool {
    return true;
  }

  public function __construct(
    private File $file,
    private ?this::TConfig $config,
    private keyset<string> $extraSuppressors,
  ) {
  }

  protected function getConfig(): ?this::TConfig {
    return $this->config;
  }

  final static public function typeAssertConfig(mixed $config): this::TConfig {
    try {
      return TypeAssert\matches<this::TConfig>($config);
    } catch (TypeAssert\UnsupportedTypeException $e) {
      throw new \InvalidOperationException(
        Str\format(
          '%s specified an unsupported config type. See previous exception:',
          static::class,
        ),
        $e->getCode(),
        $e,
      );
    }
  }

  final public static function fromPath(string $path): this {
    return static::fromPathWithConfig($path, null);
  }

  final public static function fromPathWithConfig(
    string $path,
    ?this::TConfig $config,
  ): this {
    return new static(File::fromPath($path), $config, keyset[]);
  }

  final public static function fromPathWithConfigAndSuppressionAliasses(
    string $path,
    ?this::TConfig $config,
    keyset<string> $suppression_aliases,
  ): this {
    return new static(File::fromPath($path), $config, $suppression_aliases);
  }

  final public function getFile(): File {
    return $this->file;
  }

  // A simple name for the linter, based on the class name
  <<__Memoize>>
  public function getLinterName(): string {
    return static::class
      |> Str\split($$, '\\')
      |> C\lastx($$)
      |> Str\strip_suffix($$, 'Linter');
  }

  /**
   * A user can choose to ignore all errors reported by this linter for a
   * whole file using this string as a marker
   */
  public function getIgnoreAllMarker(): string {
    return 'HHAST_IGNORE_ALL['.$this->getLinterName().']';
  }

  /**
   * Provided for consistency with other (internal) linting frameworks.
   */
  final public function getFrameworkAgnosticIgnoreAllMarker(): string {
    return '@lint-ignore-all '.$this->getLinterName();
  }

  final public function getAllSuppressors(): keyset<string> {
    return Keyset\union($this->defaultSuppressors(), $this->extraSuppressors);
  }

  final public function defaultSuppressors(): keyset<string> {
    return keyset[
      $this->getIgnoreSingleErrorMarker(),
      $this->getFixmeMarker(),
      $this->getFrameworkAgnosticFixmeMarker(),
      $this->getShortIgnoreSingleMarker(),
      $this->getFrameworkAgnosticIgnoreSingleMarker(),
    ];
  }

  /**
   * A user can choose to ignore a specific error reported by this linter
   * using this string as a marker. HHAST_IGNORE or @lint-ignore are recommended instead.
   */
  public function getIgnoreSingleErrorMarker(): string {
    return 'HHAST_IGNORE_ERROR['.$this->getLinterName().']';
  }

  /**
   * Identical to HHAST_IGNORE_ERROR, but doesn't suggest that
   * the suppressed code is erroneous. Prefer this over HHAST_IGNORE_ERROR.
   */
  final public function getShortIgnoreSingleMarker(): string {
    return 'HHAST_IGNORE['.$this->getLinterName().']';
  }

  /**
   * Provided for consistency with other (internal) linting frameworks.
   * Identical to HHAST_IGNORE.
   */
  final public function getFrameworkAgnosticIgnoreSingleMarker(): string {
    return '@lint-ignore '.$this->getLinterName();
  }

  /**
   * A user can choose to ignore a specific error reported by this linter
   * using this string as a marker.
   *
   * The difference to HHAST_IGNORE_ERROR is that we expect this one to be
   * fixed.
   */
  public function getFixmeMarker(): string {
    return 'HHAST_FIXME['.$this->getLinterName().']';
  }

  /**
   * Provided for consistency with other (internal) linting frameworks.
   * Identical to HHAST_FIXME.
   */
  final public function getFrameworkAgnosticFixmeMarker(): string {
    return '@lint-fixme '.$this->getLinterName();
  }

  /**
   * Is this linter error disabled for the entire file?
   * Memoized since this should not change per run.
   */
  <<__Memoize>>
  public function isLinterSuppressedForFile(): bool {
    $contents = $this->getFile()->getContents();
    return Str\contains($contents, $this->getIgnoreAllMarker()) ||
      Str\contains($contents, $this->getFrameworkAgnosticIgnoreAllMarker());
  }

}
