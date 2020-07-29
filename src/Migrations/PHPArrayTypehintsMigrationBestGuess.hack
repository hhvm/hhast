/*
 *  Copyright (c) 2017-present, Facebook, Inc.
 *  All rights reserved.
 *
 *  This source code is licensed under the MIT license found in the
 *  LICENSE file in the root directory of this source tree.
 *
 */

namespace Facebook\HHAST;

final class PHPArrayTypehintsMigrationBestGuess
  extends PHPArrayTypehintsMigrationBase {

  <<__Override>>
  protected static function migrateVectorArray(
    VectorArrayTypeSpecifier $node,
  ): ITypeSpecifier {
    return new VarrayTypeSpecifier(
      new VarrayToken(
        $node->getKeyword()->getFirstTokenx()->getLeading(),
        $node->getKeyword()->getLastTokenx()->getTrailing(),
      ),
      $node->getLeftAngle(),
      $node->getType(),
      null,
      $node->getRightAngle(),
    );
  }

  <<__Override>>
  protected static function migrateMapArray(
    MapArrayTypeSpecifier $node,
  ): ITypeSpecifier {
    return new DarrayTypeSpecifier(
      new DarrayToken(
        $node->getKeyword()->getFirstTokenx()->getLeading(),
        $node->getKeyword()->getLastTokenx()->getTrailing(),
      ),
      $node->getLeftAngle(),
      $node->getKey(),
      $node->getComma(),
      $node->getValue(),
      null,
      $node->getRightAngle(),
    );
  }

  <<__Override>>
  protected static function shouldAddSoft(): bool {
    return true;
  }
}
