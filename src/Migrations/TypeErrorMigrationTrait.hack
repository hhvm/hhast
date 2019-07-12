/*
 *  Copyright (c) 2017-present, Facebook, Inc.
 *  All rights reserved.
 *
 *  This source code is licensed under the MIT license found in the
 *  LICENSE file in the root directory of this source tree.
 *
 */

namespace Facebook\HHAST;

use function Facebook\HHAST\__Private\get_typechecker_errors;
use type Facebook\HHAST\__Private\TTypecheckerError;
use namespace HH\Lib\{C, Keyset, Vec};

trait TypeErrorMigrationTrait implements IMigrationWithFileList {
  private string $root;

  public function __construct(string $root) {
    $this->root = $root;
  }

  abstract protected static function filterTypecheckerError(
    TTypecheckerError $in,
  ): bool;

  <<__Memoize>>
  final private function getTypecheckerErrors(): vec<TTypecheckerError> {
    return Vec\filter(
      get_typechecker_errors($this->root),
      $error ==> static::filterTypecheckerError($error),
    );
  }

  final protected function getTypecheckerErrorsForFile(
    string $file,
  ): vec<TTypecheckerError> {
    return Vec\filter(
      $this->getTypecheckerErrors(),
      $error ==> C\firstx($error['message'])['path'] === $file,
    );
  }

  final public function getFilePathsToMigrate(): keyset<string> {
    return Keyset\map(
      $this->getTypecheckerErrors(),
      $error ==> C\firstx($error['message'])['path'],
    );
  }
}
