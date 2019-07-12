/*
 *  Copyright (c) 2017-present, Facebook, Inc.
 *  All rights reserved.
 *
 *  This source code is licensed under the MIT license found in the
 *  LICENSE file in the root directory of this source tree.
 *
 */

namespace Facebook\HHAST;


final class NoElseifLinter extends AutoFixingASTLinter {
  const type TNode = ElseifClause;
  const type TContext = Script;

  <<__Override>>
  public function getLintErrorForNode(
    Script $_context,
    ElseifClause $expr,
  ): ?ASTLintError {
    return new ASTLintError(
      $this,
      'Do not use "elseif", use "else if" instead.',
      $expr,
      () ==> $this->getFixedNode($expr),
    );
  }

  public function getFixedNode(ElseifClause $expr): Node {
    $t = $expr->getKeyword();
    return new ElseClause(
      new ElseToken($t->getLeading(), new NodeList(vec[new WhiteSpace(' ')])),
      new IfStatement(
        new IfToken(null, $t->getTrailing()),
        $expr->getLeftParen(),
        $expr->getCondition(),
        $expr->getRightParen(),
        $expr->getStatement(),
        null,
        null,
      ),
    );
  }
}
