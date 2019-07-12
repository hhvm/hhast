/*
 *  Copyright (c) 2017-present, Facebook, Inc.
 *  All rights reserved.
 *
 *  This source code is licensed under the MIT license found in the
 *  LICENSE file in the root directory of this source tree.
 *
 */

namespace Facebook\HHAST;

use namespace Facebook\HHAST;
use namespace HH\Lib\C;

final class DollarBraceEmbeddedVariableMigration extends StepBasedMigration {
  private static function migrateLiteralExpression(
    HHAST\LiteralExpression $node,
  ): HHAST\LiteralExpression {
    $children = $node->getChildren();
    $child = C\first($children);
    if (!($child instanceof HHAST\NodeList)) {
      return $node;
    }
    $literal_parts = $child->getChildren();
    $first_part = C\first($literal_parts);
    if (
      !(
        $first_part instanceof HHAST\DoubleQuotedStringLiteralHeadToken ||
        $first_part instanceof HHAST\HeredocStringLiteralHeadToken
      )
    ) {
      return $node;
    }
    $new_literal_parts = vec[];
    $made_change = false;
    for ($i = 0; $i < C\count($literal_parts); $i++) {
      $current_part = $literal_parts[$i];
      if ($current_part instanceof HHAST\DollarToken) {
        $next_part = idx($literal_parts, $i + 1);
        if ($next_part instanceof HHAST\EmbeddedBracedExpression) {
          $braced_expression_inner = $next_part->getExpression();
          if ($braced_expression_inner instanceof HHAST\NameToken) {
            $new_literal_parts[] = $next_part->replace(
              $braced_expression_inner,
              new HHAST\VariableExpression(
                new HHAST\VariableToken(
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
      return $node->replace($child, new HHAST\NodeList($new_literal_parts));
    } else {
      return $node;
    }
  }

  <<__Override>>
  final public function getSteps(): Traversable<IMigrationStep> {
    return vec[
      new TypedMigrationStep(
        'convert "${foo}" to "{$foo}"',
        HHAST\LiteralExpression::class,
        HHAST\LiteralExpression::class,
        $node ==> self::migrateLiteralExpression($node),
      ),
    ];
  }
}
