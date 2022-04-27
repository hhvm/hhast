/*
 *  Copyright (c) 2017-present, Facebook, Inc.
 *  All rights reserved.
 *
 *  This source code is licensed under the MIT license found in the
 *  LICENSE file in the root directory of this source tree.
 *
 */

namespace Facebook\HHAST;

final class LegacyArrayTypesToHackArrayTypesMigration
  extends StepBasedMigration {

  <<__Override>>
  public function getSteps(): Traversable<IMigrationStep> {
    return vec[
      new NodeTypeMigrationStep<VarrayTypeSpecifier, _>(
        'Migrate varray<string> to vec<string>',
        $node ==> self::migrateVarray($node),
      ),
      new NodeTypeMigrationStep<DarrayTypeSpecifier, _>(
        'Migrate darray<string, string> to dict<string, string>',
        $node ==> self::migrateDarray($node),
      ),
    ];
  }

  private static function migrateVarray(
    VarrayTypeSpecifier $varray,
  ): VectorTypeSpecifier {
    $keyword = $varray->getKeyword();
    return new VectorTypeSpecifier(
      new VecToken($keyword->getLeading(), $keyword->getTrailing()),
      $varray->getLeftAngle(),
      $varray->getType(),
      $varray->getTrailingComma(),
      $varray->getRightAngle(),
    );
  }

  private static function migrateDarray(
    DarrayTypeSpecifier $darray,
  ): DictionaryTypeSpecifier {
    $keyword = $darray->getKeyword();
    $trailing_comma = $darray->getTrailingComma();
    invariant(
      $trailing_comma is ?Token,
      'No syntax example for darray<Tk, Tv,>, Node was inferred. '.
      'Assuming CommaToken, but at least Token.',
    );

    return new DictionaryTypeSpecifier(
      new DictToken($keyword->getLeading(), $keyword->getTrailing()),
      $darray->getLeftAngle(),
      new NodeList(vec[
        new ListItem($darray->getKey(), $darray->getComma()),
        new ListItem($darray->getValue(), $trailing_comma),
      ]),
      $darray->getRightAngle(),
    );
  }
}
