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

use type Facebook\HHAST\EditableNode;

/** Convenience slass to simplify generics in the common case. */
abstract class ASTLinter<Tnode as EditableNode>
extends BaseASTLinter<Tnode, ASTLintError<Tnode>> {
}
