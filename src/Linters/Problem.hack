/*
 *  Copyright (c) 2017-present, Facebook, Inc.
 *  All rights reserved.
 *
 *  This source code is licensed under the MIT license found in the
 *  LICENSE file in the root directory of this source tree.
 *
 */

namespace Facebook\HHAST;

/**
 * A problem detected by an HHAST linter or an OCaml lint rule.
 *
 * Problem is more generic than LintError because Problem is associated with a
 * LintRule, not a BaseLinter.
 */
<<__Sealed(
  LintError::class,
  // HHClientProblem::class
)>>
interface Problem {
  public function getPath(): string;

  public function getPosition(): ?(int, int);

  public function getRange(): ?((int, int), ?(int, int));

  public function getDescription(): string;

  public function getBlameCode(): ?string;

  public function getPrettyBlame(): ?string;

  public function getLintRule(): LintRule;
}
