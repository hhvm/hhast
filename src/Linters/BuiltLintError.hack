/*
 *  Copyright (c) 2017-present, Facebook, Inc.
 *  All rights reserved.
 *
 *  This source code is licensed under the MIT license found in the
 *  LICENSE file in the root directory of this source tree.
 *
 */

namespace Facebook\HHAST;

class BuiltLintError extends LintError {
  private ?(int, int) $position = null;

  <<__Override>>
  final public function getPosition(): ?(int, int) {
    return $this->position;
  }

  final public function withPosition(int $line, int $character): this {
    $this->position = tuple($line, $character);
    return $this;
  }

  private ?string $blameCode = null;
  <<__Override>>
  final public function getBlameCode(): ?string {
    return $this->blameCode;
  }

  final public function withBlameCode(?string $c): this {
    $this->blameCode = $c;
    return $this;
  }

  private ?string $prettyBlame = null;
  <<__Override>>
  final public function getPrettyBlame(): ?string {
    return $this->prettyBlame ?? $this->getBlameCode();
  }

  final public function withPrettyBlame(string $b): this {
    $this->prettyBlame = $b;
    return $this;
  }
}
