/*
 *  Copyright (c) 2017-present, Facebook, Inc.
 *  All rights reserved.
 *
 *  This source code is licensed under the MIT license found in the
 *  LICENSE file in the root directory of this source tree.
 *
 */

namespace Facebook\HHAST;

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

  public function getFixedNode(LiteralExpression $root_expr): ?IExpression {
    $expr = $root_expr->getExpression();
    invariant($expr is NodeList<_>, 'Expected list, got %s', \get_class($expr));

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
          null,
          null,
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
        invariant($inner is NameToken, '"${}" should contain a variable name');
        $new_children[] = new VariableToken(null, null, '$'.$inner->getText());
        continue;
      }

      if ($child is EmbeddedBracedExpression) {
        $new_children[] = $child->getExpression();
        continue;
      }

      $new_children[] = $child;
    }

    $children = Vec\map(
      $new_children,
      $child ==> {
        if ($child is IExpression) {
          return $child;
        }
        if ($child is DoubleQuotedStringLiteralToken) {
          return new LiteralExpression($child);
        }
        invariant(
          $child is VariableToken,
          'expected double quoted string or variable, got %s',
          \get_class($child),
        );
        return new VariableExpression($child);
      },
    );
    $expr = C\firstx($children);
    for ($i = 1; $i < C\count($children); ++$i) {
      $expr = new BinaryExpression(
        $expr,
        new DotToken(null, null),
        $children[$i],
      );
    }

    return $expr;
  }
}
