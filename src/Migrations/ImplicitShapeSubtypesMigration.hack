/*
 *  Copyright (c) 2017-present, Facebook, Inc.
 *  All rights reserved.
 *
 *  This source code is licensed under the MIT license found in the
 *  LICENSE file in the root directory of this source tree.
 *
 */

namespace Facebook\HHAST;

use namespace Facebook\TypeAssert;
use namespace HH\Lib\{C, Str};

final class ImplicitShapeSubtypesMigration extends StepBasedMigration {
  // Required for adding ellipsis
  private static function addTrailingCommaToFields(
    ShapeTypeSpecifier $shape,
  ): ShapeTypeSpecifier {
    $fields = $shape->getFields();
    if ($fields === null) {
      return $shape;
    }

    $last_field = C\lastx($fields->getChildren())
      |> TypeAssert\instance_of(ListItem::class, $$);

    if ($last_field->hasSeparator()) {
      return $shape;
    }

    return $shape->rewriteDescendants(
      ($node, $_) ==> {
        if ($node !== $last_field) {
          return $node;
        }
        return $last_field->withSeparator(
          new CommaToken(null, $last_field->getLastTokenx()->getTrailing()),
        )
          ->withItem(
            $last_field->getItemx()->rewriteDescendants(
              ($inner, $_) ==> {
                if ($inner !== $last_field->getLastTokenx()) {
                  return $inner;
                }
                return $last_field
                  ->getLastTokenx()
                  ->withTrailing(null);
              },
            ),
          );
      },
    );
  }

  private static function allowImplicitSubtypes(
    ShapeTypeSpecifier $shape,
  ): ShapeTypeSpecifier {
    if ($shape->hasEllipsis()) {
      return $shape;
    }
    $fields = $shape->getDescendantsOfType(FieldSpecifier::class);
    $first_field = C\first($fields);
    if ($first_field === null) {
      return $shape->withEllipsis(new DotDotDotToken(null, null));
    }

    return $shape->withEllipsis(
      new DotDotDotToken(
        Str\contains($shape->getCode(), "\n")
          ? $first_field->getFirstTokenx()->getLeading()
          : new NodeList(vec[new WhiteSpace(' ')]),
        C\lastx($shape->getFieldsx()->getChildren())
          ->getLastTokenx()
          ->getTrailing(),
      ),
    );

    return $shape;
  }

  <<__Override>>
  public function getSteps(): Traversable<IMigrationStep> {
    $make_step = (
      string $name,
      (function(ShapeTypeSpecifier): ShapeTypeSpecifier) $impl,
    ) ==> new TypedMigrationStep(
      $name,
      ShapeTypeSpecifier::class,
      ShapeTypeSpecifier::class,
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
