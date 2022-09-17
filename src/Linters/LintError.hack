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
 * A problem detected by a lint rule
 *
 * LintError is more generic than SingleRuleLintError because LintError is
 * associated with any LintRule, not necessarily a SingleRuleLinter.
 */
<<__Sealed(
  SingleRuleLintError::class,
  HHClientLintError::class
)>>
interface LintError {
  public function getFile(): File;

  public function getRange(): ?((int, int), ?(int, int));

  public function getDescription(): string;

  public function getBlameCode(): ?string;

  public function getPrettyBlame(): ?string;

  public function getLintRule(): LintRule;

  public function prefixDescription(string $description): this;
}
