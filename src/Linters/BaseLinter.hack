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
abstract class BaseLinter {
  abstract public function getLintErrorsAsync(): Awaitable<vec<LintError>>;

  public static function shouldLintFile(File $_): bool {
    return true;
  }

  public function __construct(private File $file) {
  }

  final public static function fromPath(string $path): this {
    return new static(File::fromPath($path));
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
   * A user can choose to ignore a specific error reported by this linter
   * using this string as a marker
   */
  public function getIgnoreSingleErrorMarker(): string {
    return 'HHAST_IGNORE_ERROR['.$this->getLinterName().']';
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
   * Is this linter error disabled for the entire file?
   * Memoized since this should not change per run.
   */
  <<__Memoize>>
  public function isLinterSuppressedForFile(): bool {
    return Str\contains(
      $this->getFile()->getContents(),
      $this->getIgnoreAllMarker(),
    );
  }

}
