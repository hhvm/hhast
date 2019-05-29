/*
 *  Copyright (c) 2017-present, Facebook, Inc.
 *  All rights reserved.
 *
 *  This source code is licensed under the MIT license found in the
 *  LICENSE file in the root directory of this source tree.
 *
 */

namespace Facebook\HHAST\Linters;

use type Facebook\HHAST\{
  ElseifToken,
  ElseToken,
  IfToken,
  NodeList,
  Node,
  Script,
  WhiteSpace,
};
use function Facebook\HHAST\Missing;

final class NoElseifLinter
  extends AutoFixingASTLinter {
  const type TNode = ElseifToken;
  const type TContext = Script;

  <<__Override>>
  public function getLintErrorForNode(
    Script $_context,
    ElseifToken $expr,
  ): ?ASTLintError {
    return new ASTLintError(
      $this,
      'Do not use "elseif", use "else if" instead.',
      $expr,
      () ==> $this->getFixedNode($expr),
    );
  }

  public function getFixedNode(ElseifToken $expr): Node {
    return new NodeList(vec[
      new ElseToken($expr->getLeading(), new WhiteSpace(' ')),
      new IfToken(Missing(), $expr->getTrailing()),
    ]);
  }
}
