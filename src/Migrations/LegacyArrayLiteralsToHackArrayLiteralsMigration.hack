/*
 *  Copyright (c) 2017-present, Facebook, Inc.
 *  All rights reserved.
 *
 *  This source code is licensed under the MIT license found in the
 *  LICENSE file in the root directory of this source tree.
 *
 */

namespace Facebook\HHAST;

final class LegacyArrayLiteralsToHackArrayLiteralsMigration
  extends StepBasedMigration {

  <<__Override>>
  public function getSteps(): Traversable<IMigrationStep> {
    return vec[
      new NodeTypeMigrationStep<VarrayIntrinsicExpression, _>(
        'Migrate varray[1, 2] to vec[1, 2]',
        $node ==> self::migrateVarray($node),
      ),
      new NodeTypeMigrationStep<DarrayIntrinsicExpression, _>(
        'Migrate darray[1 => 2, 3 => 4] to dict[1 => 2, 3 => 4]',
        $node ==> self::migrateDarray($node),
      ),
    ];
  }

  private static function migrateVarray(
    VarrayIntrinsicExpression $varray,
  ): VectorIntrinsicExpression {
    $keyword = $varray->getKeyword();

    return new VectorIntrinsicExpression(
      new VecToken($keyword->getLeading(), $keyword->getTrailing()),
      $varray->getExplicitType(),
      $varray->getLeftBracket(),
      $varray->getMembers(),
      $varray->getRightBracket(),
    );
  }

  private static function migrateDarray(
    DarrayIntrinsicExpression $darray,
  ): DictionaryIntrinsicExpression {
    $keyword = $darray->getKeyword();
    return new DictionaryIntrinsicExpression(
      new DictToken($keyword->getLeading(), $keyword->getTrailing()),
      $darray->getExplicitType(),
      $darray->getLeftBracket(),
      $darray->getMembers(),
      $darray->getRightBracket(),
    );
  }
}
