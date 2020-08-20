/*
 *  Copyright (c) 2017-present, Facebook, Inc.
 *  All rights reserved.
 *
 *  This source code is licensed under the MIT license found in the
 *  LICENSE file in the root directory of this source tree.
 *
 */

namespace Facebook\HHAST;

use namespace HH\Lib\C;

final class PreferLambdasLinter extends AutoFixingASTLinter {
  const type TContext = Script;
  const type TNode = AnonymousFunction;

  <<__Override>>
  protected function getTitleForFix(LintError $_): string {
    return 'Convert to lambda';
  }

  <<__Override>>
  public function getLintErrorForNode(
    Script $_context,
    AnonymousFunction $node,
  ): ?ASTLintError {

    $use_expr = $node->getUse();

    $uses_references = $use_expr is nonnull &&
      C\any(
        $use_expr->getDescendantsOfType(PrefixUnaryExpression::class),
        $expr ==> $expr->getOperator() is AmpersandToken,
      );

    if ($uses_references) {
      return null;
    }

    return new ASTLintError(
      $this,
      'Use lambdas instead of PHP anonymous functions',
      $node,
      () ==> $this->getFixedNode($node),
    );
  }

  public function getFixedNode(AnonymousFunction $node): ?Node {
    $attribute_spec = $node->getAttributeSpec();
    $async = $node->getAsyncKeyword();
    $parameters = $node->getParameters();
    $left_paren = new LeftParenToken(
      $node->getFunctionKeyword()->getLeading(),
      null,
    );
    $right_paren = $node->getRightParen();
    $colon = $node->getColon();
    $type = $node->getType();

    $signature = new LambdaSignature(
      $left_paren,
      $parameters,
      $right_paren,
      $colon,
      $type,
    );

    $arrow = new EqualEqualGreaterThanToken(
      null,
      new NodeList(vec[new WhiteSpace(' ')]),
    );
    $body = $this->simplifyBody($node->getBody());

    return new LambdaExpression(
      $attribute_spec,
      $async,
      $signature,
      $arrow,
      $body,
    );
  }

  private function simplifyBody(CompoundStatement $body): ILambdaBody {
    $statements = $body->getStatements()?->getChildren();
    if (!$statements || C\count($statements) !== 1) {
      // Body has no statements, cannot be simplied.
      return $body;
    }
    $statement = C\onlyx($statements);
    if (!$statement is ReturnStatement) {
      // Only a return statement can be simplified.
      return $body;
    }
    return $statement->getExpressionx();
  }
}
