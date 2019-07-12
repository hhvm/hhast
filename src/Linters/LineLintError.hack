/*
 *  Copyright (c) 2017-present, Facebook, Inc.
 *  All rights reserved.
 *
 *  This source code is licensed under the MIT license found in the
 *  LICENSE file in the root directory of this source tree.
 *
 */

namespace Facebook\HHAST;

class LineLintError extends LintError {

  public function __construct(
    private LineLinter<LineLintError> $linter,
    private string $description,
    private (int, int) $position,
  ) {
    parent::__construct($linter, $description);
  }

  <<__Override>>
  public function getPosition(): (int, int) {
    return $this->position;
  }

  <<__Override>>
  public function getBlameCode(): ?string {
    $line = $this->position[0] - 1;
    invariant($line >= 0, 'line number should never be negative');
    return $this->linter->getLine($line);
  }
}
