<?hh // strict
/**
 * Copyright (c) 2017, Facebook, Inc.
 * All rights reserved.
 *
 * This source code is licensed under the BSD-style license found in the
 * LICENSE file in the root directory of this source tree. An additional
 * grant of patent rights can be found in the PATENTS file in the same
 * directory.
 *
 */

namespace Facebook\HHAST\Linters;

use type Facebook\HHAST\EditableNode;
use namespace Facebook\HHAST;
use namespace HH\Lib\Str;

abstract class AutoFixingLineLinter<Terr as FixableLineLintError>
  extends LineLinter<Terr> implements AutoFixingLinter<Terr> {

  abstract public function getFixedLine(string $line): string;

  final public function fixLintErrors(Traversable<Terr> $errors): void {
    $lines = $this->getLinesFromFile();
    foreach ($errors as $err) {
      $i = $err->getPosition()[0] - 1;
      invariant($i >= 0, 'line number should never be negative');
      $original = $lines[$i];
      $lines[$i] = $this->getFixedLine($original);
    }
    \file_put_contents($this->getFile(), Str\join($lines, "\n"));
  }
}
