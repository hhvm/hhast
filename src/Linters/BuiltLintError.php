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

class BuiltLintError extends LintError implements FixableLintError {
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

  private ?(string, string) $fix;
  final public function isFixable(): bool {
    return $this->fix !== null;
  }

  final public function getReadableFix(): (string, string) {
    $fix = $this->fix;
    invariant($fix !== null, 'Trying to fix unfixable error');
    return $fix;
  }

  final public function shouldRenderBlameAndFixAsDiff(): bool {
    return true;
  }

  final public function withFix(string $original, string $fixed): this {
    $this->fix = tuple($original, $fixed);
    return $this;
  }
}
