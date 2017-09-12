<?hh // strict
/**
 * Copyright (c) 2016, Facebook, Inc.
 * All rights reserved.
 *
 * This source code is licensed under the BSD-style license found in the
 * LICENSE file in the root directory of this source tree. An additional
 * grant of patent rights can be found in the PATENTS file in the same
 * directory.
 *
 */

namespace Facebook\HHAST\Migrations;

use namespace Facebook\HHAST;
use namespace HH\Lib\{C, Str, Vec};
use type Facebook\TypeAssert\TypeAssert;

final class OptionalShapeFieldsMigration extends BaseMigration {
  private static function makeNullableFieldsOptional(
    HHAST\ListItem $node,
  ): HHAST\ListItem {
    $field = $node->getItem();

    if (!$field instanceof HHAST\FieldSpecifier) {
      return $node;
    }

    if ($field->hasQuestion()) {
      return $node;
    }

    $type = $field->getType();
    if (!$type instanceof HHAST\NullableTypeSpecifier) {
      return $node;
    }

    $name = $field->getName()->rightmost_tokenx();
    $field = $field->withQuestion(
      new HHAST\QuestionToken(
        $name->leading(),
        HHAST\Missing(),
      ),
    )->withName(
      $name->with_leading(HHAST\Missing()),
    );

    return $node->withItem($field);
  }

  // Required for adding ellipsis
  private static function addTrailingCommaToFields(
    HHAST\ShapeTypeSpecifier $shape,
  ): HHAST\ShapeTypeSpecifier {
    $fields = $shape->getFields();
    if ($fields === null) {
      return $shape;
    }

    $last_field = C\lastx($fields->children())
      |> TypeAssert::isInstanceOf(HHAST\ListItem::class, $$);

    if ($last_field->hasSeparator()) {
      return $shape;
    }

    return $shape->rewrite_children(
      ($node, $_) ==> {
        if ($node !== $last_field) {
          return $node;
        }
        return $last_field->withSeparator(
          new HHAST\CommaToken(
            HHAST\Missing(),
            $last_field->rightmost_tokenx()->trailing(),
          ),
        )
          ->withItem(
            $last_field->getItem()->rewrite_children(
              ($inner, $_) ==> {
                if ($inner !== $last_field->rightmost_tokenx()) {
                  return $inner;
                }
                return $last_field
                  ->rightmost_tokenx()
                  ->with_trailing(HHAST\Missing());
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
    $fields = $shape->of_class(HHAST\FieldSpecifier::class);
    $first_field = C\first($fields);
    if ($first_field === null) {
      return $shape->withEllipsis(
        new HHAST\DotDotDotToken(HHAST\Missing(), HHAST\Missing()),
      );
    }

    return $shape->withEllipsis(
      new HHAST\DotDotDotToken(
        Str\contains($shape->full_text(), "\n")
          ? $first_field->leftmost_tokenx()->leading()
          : new HHAST\WhiteSpace(' '),
        C\lastx($shape->getFieldsx()->children())
          ->rightmost_tokenx()
          ->trailing(),
      ),
    );

    return $shape;
  }

  final public function getSteps(
  ): Traversable<IMigrationStep> {
    $make_step = ($name, $impl) ==> new TypedMigrationStep(
      $name,
      HHAST\ShapeTypeSpecifier::class,
      HHAST\ShapeTypeSpecifier::class,
      $impl,
    );

    return vec[
      new TypedMigrationStep(
        'make nullable fields optional',
        HHAST\ListItem::class,
        HHAST\ListItem::class,
        $node ==> self::makeNullableFieldsOptional($node),
      ),
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
