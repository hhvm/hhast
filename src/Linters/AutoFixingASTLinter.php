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

use type Facebook\HHAST\EditableSyntax;
use namespace Facebook\HHAST;

interface AutoFixingASTLinter<Tnode as EditableSyntax> {
  require extends ASTLinter<Tnode>;

  public function getFixedNode(Tnode $node): Tnode;
}
