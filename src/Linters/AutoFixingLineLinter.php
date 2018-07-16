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
