<?hh // strict
/**
 * Copyright (c) 2016, Facebook, Inc.
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

interface AutoFixingLinter<Terror as FixableLintError> {
  require extends BaseLinter;

  public function getLintErrors(): Traversable<Terror>;

  public function getCodeWithFixedLintErrors(
    Traversable<Terror> $errors,
  ): string;
}
