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
  DollarToken,
  DotToken,
  DoubleQuotedStringLiteralHeadToken,
  DoubleQuotedStringLiteralTailToken,
  DoubleQuotedStringLiteralToken,
  EmbeddedBracedExpression,
  HeredocStringLiteralHeadToken,
  LiteralExpression,
  NameToken,
  Node,
  NodeList,
  Script,
  StringLiteralBodyToken,
  VariableToken,
};
use function Facebook\HHAST\Missing;
use namespace HH\Lib\{C, Vec};

final class NoStringInterpolationLinter extends AutoFixingASTLinter {
  const type TNode = LiteralExpression;
  const type TContext = Script;

  <<__Override>>
  public function getLintErrorForNode(
    Script $_context,
    LiteralExpression $root_expr,
  ): ?ASTLintError {
    $expr = $root_expr->getExpression();
    if (!$expr is NodeList<_>) {
      return null;
    }

    return new ASTLintError(
      $this,
      'Do not use string interpolation - consider concatenation or '.
      'Str\format() instead ',
      $root_expr,
      () ==> $this->getFixedNode($root_expr),
    );
  }

  <<__Override>>
  protected function getTitleForFix(LintError $_): string {
    return 'Replace interpolation with concatenation';
  }

  public function getFixedNode(LiteralExpression $root_expr): ?Node {
    $expr = $root_expr->getExpression();
    invariant(
      $expr is NodeList<_>,
      "Expected list, got %s",
      \get_class($expr),
    );

    $leading = null;
    $trailing = null;
    $children = vec($expr->getChildren());
    $child_count = C\count($children);
    $new_children = vec[];

    for ($i = 0; $i < $child_count; ++$i) {
      $child = $children[$i];
      if ($child is HeredocStringLiteralHeadToken) {
        return null;
      }
      if ($child is DoubleQuotedStringLiteralHeadToken) {
        if ($child->getText() === '"') {
          $leading = $child->getLeading();
          continue;
        }
        $new_children[] = new DoubleQuotedStringLiteralToken(
          $child->getLeading(),
          $child->getTrailing(),
          $child->getText().'"',
        );
        continue;
      }

      if ($child is DoubleQuotedStringLiteralTailToken) {
        if ($child->getText() === '"') {
          $trailing = $child->getTrailing();
          break;
        }
        $new_children[] = new DoubleQuotedStringLiteralToken(
          $child->getLeading(),
          $child->getTrailing(),
          '"'.$child->getText(),
        );
        continue;
      }

      if ($child is StringLiteralBodyToken) {
        $new_children[] = new DoubleQuotedStringLiteralToken(
          Missing(),
          Missing(),
          '"'.$child->getText().'"',
        );
        continue;
      }

      if ($child is DollarToken) {
        /* "${foo}"
         *
         * (dollar)
         * (embedded_braced_expression
         *   left_brace: Token
         *   expression: NameToken
         *   right_brace: Token
         * )
         */
        invariant(
          $i + 1 < $child_count,
          "Shouldn't have a dollar token unless there's more tokens after it",
        );
        $next = $children[$i + 1];
        ++$i;
        invariant(
          $next is EmbeddedBracedExpression,
          'Dollar token in string should be followed by embedded brace '.
          'expression.',
        );
        $inner = $next->getExpression();
        invariant(
          $inner is NameToken,
          '"${}" should contain a variable name',
        );
        $new_children[] = new VariableToken(
          Missing(),
          Missing(),
          '$'.$inner->getText(),
        );
        continue;
      }

      if ($child is EmbeddedBracedExpression) {
        $new_children[] = $child->getExpression();
        continue;
      }

      $new_children[] = $child;
    }

    $children = $new_children;
    for ($i = 0; $i < C\count($children) - 1; ++$i) {
      $children = Vec\concat(
        Vec\slice($children, 0, $i + 1),
        vec[new DotToken(Missing(), Missing())],
        Vec\slice($children, $i + 1),
      );
      ++$i;
    }

    return NodeList::createNonEmptyListOrMissing($children);
  }
}
