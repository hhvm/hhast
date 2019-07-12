/*
 *  Copyright (c) 2017-present, Facebook, Inc.
 *  All rights reserved.
 *
 *  This source code is licensed under the MIT license found in the
 *  LICENSE file in the root directory of this source tree.
 *
 */

namespace Facebook\HHAST\Linters;

use type Facebook\HHAST\Linters\{ASTLintError, AutoFixingASTLinter};
use type Facebook\HHAST\{
  AmpersandToken,
  AnonymousFunction,
  EqualEqualGreaterThanToken,
  LambdaExpression,
  LambdaSignature,
  LeftParenToken,
  Node,
  PrefixUnaryExpression,
  Script,
  WhiteSpace,
};
use function Facebook\HHAST\Missing;
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
    $coroutine = $node->getCoroutineKeyword();
    $parameters = $node->getParameters();
    $left_paren = new LeftParenToken(
      $node->getFunctionKeyword()->getLeading(),
      Missing(),
    );
    $right_paren = $node->getRightParen();
    $colon = $node->getColon();
    $type = $node->getType();

    $signature = new LambdaSignature(
      $left_paren,
      $parameters ?? Missing(),
      $right_paren ?? Missing(),
      $colon ?? Missing(),
      $type ?? Missing(),
    );

    $arrow = new EqualEqualGreaterThanToken(Missing(), new WhiteSpace(' '));
    $body = $node->getBody();

    return new LambdaExpression(
      $attribute_spec ?? Missing(),
      $async ?? Missing(),
      $coroutine ?? Missing(),
      $signature,
      $arrow,
      $body,
    );
  }
}
