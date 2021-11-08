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
 * An abstract lint rule that provides a single error reason, which could be
 * either a HHAST linter or a lint rule written in OCaml.
 */
<<__Sealed(SingleRuleLinter::class, HHClientLintRule::class)>>
interface LintRule {
  /**
   * The human readable name of the lint rule, which can be used to report
   * the lint error.
   */
  public function getName(): string;

  /**
   * The error code of the lint rule, which can be used to determine markers to
   * suppress lint errors.
   */
  public function getErrorCode(): string;
}
