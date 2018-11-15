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

use type Facebook\HHAST\Linters\{ASTLintError, AutoFixingASTLinter};
use type Facebook\HHAST\{
  AmpersandToken,
  AnonymousFunction,
  EditableNode,
  EqualEqualGreaterThanToken,
  LambdaExpression,
  LambdaSignature,
  LeftParenToken,
  PrefixUnaryExpression,
  WhiteSpace,
};
use function Facebook\HHAST\Missing;
use namespace HH\Lib\C;

final class PreferLambdasLinter extends AutoFixingASTLinter<AnonymousFunction> {
  <<__Override>>
  protected static function getTargetType(): classname<AnonymousFunction> {
    return AnonymousFunction::class;
  }

  <<__Override>>
  protected function getTitleForFix(LintError $_): string {
    return 'Convert to lambda';
  }

  <<__Override>>
  public function getLintErrorForNode(
    AnonymousFunction $node,
    vec<EditableNode> $parents,
  ): ?ASTLintError<AnonymousFunction> {

    $use_expr = $node->getUse();

    $uses_references = $use_expr is nonnull &&
      !C\is_empty(
        $use_expr->getDescendantsWhere(
          ($node, $_) ==> $node is PrefixUnaryExpression &&
            $node->getOperator() is AmpersandToken,
        ),
      );

    if ($uses_references) {
      return null;
    } else {
      return new ASTLintError(
        $this,
        'Use lambdas instead of PHP anonymous functions',
        $node,
      );
    }
  }

  <<__Override>>
  public function getFixedNode(AnonymousFunction $node): ?EditableNode {
    $attribute_spec = $node->getAttributeSpec();
    $async = $node->getAsyncKeyword();
    $coroutine = $node->getCoroutineKeyword();
    $parameters = $node->getParameters();
    $left_paren =
      new LeftParenToken($node->getFunctionKeyword()->getLeading(), Missing());
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
