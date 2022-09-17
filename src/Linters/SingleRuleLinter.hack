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
 * A linter that applies a single lint rule.
 */
abstract class SingleRuleLinter extends BaseLinter implements LintRule {
  use SuppressibleTrait;

  final public function getName(): string {
    return $this->getLinterName();
  }

  <<__Override>>
  abstract public function getLintErrorsAsync(): Awaitable<vec<SingleRuleLintError>>;

}
