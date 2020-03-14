/*
 *  Copyright (c) 2017-present, Facebook, Inc.
 *  All rights reserved.
 *
 *  This source code is licensed under the MIT license found in the
 *  LICENSE file in the root directory of this source tree.
 *
 */

namespace Facebook\HHAST;

final class DontUseAsioJoinLinter extends AutoFixingASTLinter {
  const type TContext = Script;
  const type TNode = InclusionExpression;

  <<__Override>>
  public function getLintErrorForNode(
    Script $_context,
    InclusionExpression $_node,
  ): ?ASTLintError {
    return null;
  }
}
