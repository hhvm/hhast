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
 * The lint rule of an error code reported by the hh_client
 */
final class HHClientLintRule implements LintRule {
  public function getName(): string {
    return 'Linter: '.$this->code;
  }

  public function getErrorCode(): string {
    return (string)$this->code;
  }

  public function __construct(private int $code) {}

}
