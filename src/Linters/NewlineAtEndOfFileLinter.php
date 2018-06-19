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

use namespace HH\Lib\{C, Math, Str, Vec};

final class NewlineAtEndOfFileLinter extends BaseLinter {
  <<__Override>>
  public function getLintErrors(): Traversable<LintError> {
    $contents = \file_get_contents($this->getFile());
    $expected = Str\trim_right($contents)."\n";
    if ($contents === $expected) {
      return vec[];
    }
    $lines = Str\split($contents, "\n");

    return new BuiltLintError(
      $this,
      "Files should end with a single trailing newline",
    )
      ->withPosition(tuple(C\count($lines), 0))
      ->withBlameCode(
        Vec\slice($lines, Math\maxva(0, C\count($lines) - 3))
        |> Str\join($$, "\n")
      )
      |> vec[$$];
  }
}
