<?hh // strict
/**
 * Copyright (c) 2016, Facebook, Inc.
 * All rights reserved.
 *
 * This source code is licensed under the BSD-style license found in the
 * LICENSE file in the root directory of this source tree. An additional
 * grant of patent rights can be found in the PATENTS file in the same
 * directory.
 *
 */

namespace Facebook\HHAST\Linters;

<<__ConsistentConstruct>>
abstract class BaseLinter {
  abstract public function getLintErrors(
  ): Traversable<LintError>;

  public static function shouldLintFile(string $_): bool {
    return true;
  }
  public function __construct(
    private string $file,
  ) {
  }

  final public function getFile(): string {
    return $this->file;
  }

  // A simple name for the linter, based on the class name
  <<__Memoize>>
  public function getLinterName(): string {
    $r = new \ReflectionClass($this);
    return $r->getShortName();
  }

  /**
   * A user can choose to ignore all errors reported by this linter for a whole file using this string as a marker
   */
  protected function markerIgnoreAll(): string {
    return 'HHAST_IGNORE_ALL['.$this->getLinterName().']';
  }

  /**
   * A user can choose to ignore a specific error reported by this linter using this string as a marker
   */
  protected function markerFixMe(): string {
    return 'HHAST_FIXME['.$this->getLinterName().']';
  }

}
