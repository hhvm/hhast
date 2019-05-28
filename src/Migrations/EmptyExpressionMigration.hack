/*
 *  Copyright (c) 2017-present, Facebook, Inc.
 *  All rights reserved.
 *
 *  This source code is licensed under the MIT license found in the
 *  LICENSE file in the root directory of this source tree.
 *
 */

namespace Facebook\HHAST\Migrations;

use namespace HH\Lib\C;
use type Facebook\HHAST\{
  BinaryExpression,
  BooleanLiteralToken,
  EmptyExpression,
  ExclamationToken,
  LeftParenToken,
  ParenthesizedExpression,
  PrefixUnaryExpression,
  QuestionQuestionToken,
  RightParenToken,
  Script,
  WhiteSpace,
};

final class EmptyExpressionMigration extends BaseMigration {
  <<__Override>>
  final public function migrateFile(string $_path, Script $ast): Script {
    $to_fix = $ast->getDescendantsOfType(EmptyExpression::class);
    if (C\is_empty($to_fix)) {
      return $ast;
    }

    $m = \Facebook\HHAST\Missing();

    foreach ($to_fix as $expr) {
      $ast = $ast->replace(
        $expr,
        new ParenthesizedExpression(
          new LeftParenToken($expr->getFirstTokenx()->getLeading(), $m),
          new BinaryExpression(
            new PrefixUnaryExpression(
              new ExclamationToken($m, $m),
              $expr->getArgument(),
            ),
            new QuestionQuestionToken(
              new WhiteSpace(' '),
              new WhiteSpace(' '),
            ),
            new BooleanLiteralToken($m, $m, 'false'),
          ),
          new RightParenToken($m, $expr->getLastTokenx()->getTrailing()),
        ),
      );
    }
    return $ast;
  }
}
