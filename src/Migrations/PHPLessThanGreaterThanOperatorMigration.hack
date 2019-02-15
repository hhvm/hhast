/*
 *  Copyright (c) 2017-present, Facebook, Inc.
 *  All rights reserved.
 *
 *  This source code is licensed under the MIT license found in the
 *  LICENSE file in the root directory of this source tree.
 *
 */

namespace Facebook\HHAST\Migrations;

use namespace Facebook\HHAST;

final class PHPLessThanGreaterThanOperatorMigration extends StepBasedMigration {
  final private function replaceOperator(
    HHAST\BinaryExpression $in,
  ): HHAST\BinaryExpression {
    $op = $in->getOperator();
    if (!$op is HHAST\LessThanGreaterThanToken) {
      return $in;
    }
    return $in->withOperator(
      new HHAST\ExclamationEqualToken($op->getLeading(), $op->getTrailing())
    );
  }

  <<__Override>>
  final public function getSteps(): Traversable<IMigrationStep> {
    return vec[
      new TypedMigrationStep(
        'replace the `<>` operator with `!=`',
        HHAST\BinaryExpression::class,
        HHAST\BinaryExpression::class,
        $node ==> $this->replaceOperator($node),
      ),
    ];
  }
}
