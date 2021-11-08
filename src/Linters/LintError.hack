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

/**
 * A problem detected by an HHAST linter
 */
class LintError implements Problem {
  public function __construct(
    private BaseLinter $linter,
    private string $description,
  ) {
  }

  final public function getFile(): File {
    return $this->linter->getFile();
  }

  final public function getPath(): string {
    return $this->getFile()->getPath();
  }

  public function getPosition(): ?(int, int) {
    return null;
  }

  public function getRange(): ?((int, int), ?(int, int)) {
    $pos = $this->getPosition();
    if ($pos === null) {
      return null;
    }
    return tuple($pos, null);
  }

  public function getDescription(): string {
    return $this->description;
  }

  /** Retrieve a snippet of the source code that is responsible for the error.
   */
  public function getBlameCode(): ?string {
    return null;
  }

  /** Retrieve a human-friendly version of "what's responsible".
   *
   * For example, for "await in a loop", `getBlameCode()` may point at the
   * await statement, but this function may return the entire loop, annotated
   * with pointers.
   */
  public function getPrettyBlame(): ?string {
    return $this->getBlameCode();
  }

  final public function getLinter(): BaseLinter {
    return $this->linter;
  }

  final public function getLintRule(): LintRule {
    return $this->getLinter();
  }

}
