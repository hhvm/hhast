<?hh // strict
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
use namespace HH\Lib\{C, Str, Vec};
use namespace Facebook\TypeAssert;

final class ImplicitShapeSubtypesMigration extends StepBasedMigration {
  // Required for adding ellipsis
  private static function addTrailingCommaToFields(
    HHAST\ShapeTypeSpecifier $shape,
  ): HHAST\ShapeTypeSpecifier {
    $fields = $shape->getFields();
    if ($fields === null) {
      return $shape;
    }

    $last_field = C\lastx($fields->getChildren())
      |> TypeAssert\instance_of(HHAST\ListItem::class, $$);

    if ($last_field->hasSeparator()) {
      return $shape;
    }

    return $shape->rewriteDescendants(
      ($node, $_) ==> {
        if ($node !== $last_field) {
          return $node;
        }
        return $last_field->withSeparator(
          new HHAST\CommaToken(
            HHAST\Missing(),
            $last_field->getLastTokenx()->getTrailing(),
          ),
        )
          ->withItem(
            $last_field->getItem()->rewriteDescendants(
              ($inner, $_) ==> {
                if ($inner !== $last_field->getLastTokenx()) {
                  return $inner;
                }
                return $last_field
                  ->getLastTokenx()
                  ->withTrailing(HHAST\Missing());
              },
            ),
          );
      }
    );
  }

  private static function allowImplicitSubtypes(
    HHAST\ShapeTypeSpecifier $shape,
  ): HHAST\ShapeTypeSpecifier {
    if ($shape->hasEllipsis()) {
      return $shape;
    }
    $fields = $shape->getDescendantsOfType(HHAST\FieldSpecifier::class);
    $first_field = C\first($fields);
    if ($first_field === null) {
      return $shape->withEllipsis(
        new HHAST\DotDotDotToken(HHAST\Missing(), HHAST\Missing()),
      );
    }

    return $shape->withEllipsis(
      new HHAST\DotDotDotToken(
        Str\contains($shape->getCode(), "\n")
          ? $first_field->getFirstTokenx()->getLeading()
          : new HHAST\WhiteSpace(' '),
        C\lastx($shape->getFieldsx()->getChildren())
          ->getLastTokenx()
          ->getTrailing(),
      ),
    );

    return $shape;
  }

  <<__Override>>
  final public function getSteps(
  ): Traversable<IMigrationStep> {
    $make_step = ($name, $impl) ==> new TypedMigrationStep(
      $name,
      HHAST\ShapeTypeSpecifier::class,
      HHAST\ShapeTypeSpecifier::class,
      $impl,
    );

    return vec[
      $make_step(
        'add trailing commas to fields',
        $node ==> self::addTrailingCommaToFields($node),
      ),
      $make_step(
        'allow implicit subtypes',
        $node ==> self::allowImplicitSubtypes($node),
      ),
    ];
  }
}
