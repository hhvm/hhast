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

final class DollarBraceEmbeddedVariableMigration extends StepBasedMigration {
  private static function migrateLiteralExpression(
    LiteralExpression $node,
  ): LiteralExpression {
    $children = $node->getChildren();
    $child = C\first($children);
    if (!($child is NodeList<_>)) {
      return $node;
    }
    $literal_parts = $child->getChildren();
    $first_part = C\first($literal_parts);
    if (
      !(
        $first_part is DoubleQuotedStringLiteralHeadToken ||
        $first_part is HeredocStringLiteralHeadToken
      )
    ) {
      return $node;
    }
    $new_literal_parts = vec[];
    $made_change = false;
    for ($i = 0; $i < C\count($literal_parts); $i++) {
      $current_part = $literal_parts[$i];
      if ($current_part is DollarToken) {
        $next_part = idx($literal_parts, $i + 1);
        if ($next_part is EmbeddedBracedExpression) {
          $braced_expression_inner = $next_part->getExpression();
          if ($braced_expression_inner is NameToken) {
            $new_literal_parts[] = $next_part->replace(
              $braced_expression_inner,
              new VariableExpression(
                new VariableToken(
                  $braced_expression_inner->getLeading(),
                  $braced_expression_inner->getTrailing(),
                  '$'.$braced_expression_inner->getCode(),
                ),
              ),
            );
            $i++;
            $made_change = true;
            continue;
          }
        }
      }
      $new_literal_parts[] = $current_part;
    }
    if ($made_change) {
      return $node->replace($child, new NodeList($new_literal_parts));
    } else {
      return $node;
    }
  }

  <<__Override>>
  public function getSteps(): Traversable<IMigrationStep> {
    return vec[
      new TypedMigrationStep(
        'convert "${foo}" to "{$foo}"',
        LiteralExpression::class,
        LiteralExpression::class,
        $node ==> self::migrateLiteralExpression($node),
      ),
    ];
  }
}
