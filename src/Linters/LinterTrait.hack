/*
 *  Copyright (c) 2017-present, Facebook, Inc.
 *  All rights reserved.
 *
 *  This source code is licensed under the MIT license found in the
 *  LICENSE file in the root directory of this source tree.
 *
 */

namespace Facebook\HHAST;

use type Facebook\HHAST\File;
use namespace HH\Lib\{C, Str};

<<__ConsistentConstruct>>
trait LinterTrait {
  require implements Linter;

  public static function shouldLintFile(File $_): bool {
    return true;
  }

  private File $file;
  private ?this::TConfig $config;

  private function __construct(File $file, ?this::TConfig $config) {
    $this->file = $file;
    $this->config = $config;
  }

  public static function newInstance(File $file, ?this::TConfig $config): this {
    return new static($file, $config);
  }

  protected function getConfig(): ?this::TConfig {
    return $this->config;
  }

  final public static function fromPath(string $path): this {
    return static::fromPathWithConfig($path, null);
  }

  final public static function fromPathWithConfig(
    string $path,
    ?this::TConfig $config,
  ): this {
    return new static(File::fromPath($path), $config);
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
    return LintMarkerName::HHAST_IGNORE_ALL.'['.$this->getLinterName().']';
  }

  /**
   * A user can choose to ignore a specific error reported by this linter
   * using this string as a marker
   */
  public function getIgnoreSingleErrorMarker(): string {
    return LintMarkerName::HHAST_IGNORE_ERROR.'['.$this->getLinterName().']';
  }

  /**
   * A user can choose to ignore a specific error reported by this linter
   * using this string as a marker.
   *
   * The difference to HHAST_IGNORE_ERROR is that we expect this one to be
   * fixed.
   */
  public function getFixmeMarker(): string {
    return LintMarkerName::HHAST_FIXME.'['.$this->getLinterName().']';
  }

  /**
   * Is this linter error disabled for the entire file?
   * Memoized since this should not change per run.
   */
  public function isLinterSuppressedForFile(): bool {
    return C\contains_key(
      $this->getFile()->lintMarkersForLineBasedSuppression(),
      $this->getIgnoreAllMarker(),
    );
  }
}
