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

// HHAST_IGNORE_ERROR[FinalOrAbstractClass] This class is meant to be extended.
/**
 * A problem detected by a SingleRuleLinter
 */
class SingleRuleLintError implements LintError {
  public function __construct(
    private SingleRuleLinter $linter,
    private string $description,
  ) {
  }

  final public function getFile(): File {
    return $this->linter->getFile();
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

  final public function getLinter(): SingleRuleLinter {
    return $this->linter;
  }

  final public function getLintRule(): LintRule {
    return $this->getLinter();
  }

  final public function prefixDescription(string $description): this {
    $this->description = $description.$this->description;
    return $this;
  }
}
