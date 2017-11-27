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

use namespace HH\Lib\Str;
use function Facebook\HHAST\{find_line};

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

  /**
   * Allow users to disable specific cases where a linter is used.
   *
   * For example if migrating from a banned function the existing usages can be marked to pass the linter:
   *
   * banned_function_call(); # DisableBannedFunctionsLinter
   **/
  public function isLinterDisabled(LintError $error): bool {
    $code = find_line($error);

    if ($code === null) {
      return false;
    } else {
      // Check to see if the code contains the DisableLinterName keyword
      $r = new \ReflectionClass($this);
      $linter_name = $r->getShortName();
      return Str\search($code, "Disable".$linter_name) !== null;
    }
  }
}
