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
 * An utility class to build lint markers, where the marker format will be
 * shared between linters and lint rules.
 */
abstract final class LintMarker {

  /**
   * A user can choose to ignore all errors reported by this linter for a
   * whole file using this string as a marker
   */
  public static function getIgnoreAllMarker(
    string $linter_or_lint_rule,
  ): string {
    return 'HHAST_IGNORE_ALL['.$linter_or_lint_rule.']';
  }

  /**
   * A user can choose to ignore a specific error reported by this linter
   * using this string as a marker
   */
  public static function getIgnoreSingleErrorMarker(
    string $linter_or_lint_rule,
  ): string {
    return 'HHAST_IGNORE_ERROR['.$linter_or_lint_rule.']';
  }

  /**
   * A user can choose to ignore a specific error reported by this linter
   * using this string as a marker.
   *
   * The difference to HHAST_IGNORE_ERROR is that we expect this one to be
   * fixed.
   */
  public static function getFixmeMarker(string $linter_or_lint_rule): string {
    return 'HHAST_FIXME['.$linter_or_lint_rule.']';
  }

}
