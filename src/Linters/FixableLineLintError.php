<?hh // strict
/*
 *  Copyright (c) 2017-present, Facebook, Inc.
 *  All rights reserved.
 *
 *  This source code is licensed under the MIT license found in the
 *  LICENSE file in the root directory of this source tree.
 *
 */

namespace Facebook\HHAST\Linters;

class FixableLineLintError extends LineLintError implements FixableLintError {

  public function __construct(
    private AutoFixingLineLinter<FixableLineLintError> $linter,
    private string $description,
    private (int, int) $position,
  ) {
    parent::__construct($linter, $description, $position);
  }

  public function isFixable(): bool {
    return true;
  }

  public function getReadableFix(): (string, string) {
    $original = $this->getBlameCode();
    invariant($original !== null, 'blame line should never be null');
    $fixed = $this->linter->getFixedLine($original);
    return tuple($original, $fixed);
  }

  public function shouldRenderBlameAndFixAsDiff(): bool {
    return true;
  }
}
