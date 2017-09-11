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

final class OptionalShapeFieldsMigration extends BaseMigration {
  private static function makeNullableFieldsOptional(
    HHAST\ShapeTypeSpecifier $shape,
  ): HHAST\ShapeTypeSpecifier {
    $fields = $shape->fields();
    if (!$fields) {
      return $shape;
    }
    foreach ($fields->children() as $field) {
      if ($field instanceof HHAST\ListItem) {
        $field = $field->item();
      }
      
      if (!$field instanceof HHAST\FieldSpecifier) {
        continue;
      }

      $type = $field->type();
      if (!$type instanceof HHAST\NullableTypeSpecifier) {
        continue;
      }

      $name = $field->name()->rightmost_tokenx();

      $shape = $field->insert_before(
        new HHAST\QuestionToken(
          $name->leading(),
          HHAST\Missing(),
        ),
        $name,
      )->replace(
        $name->with_leading(HHAST\Missing()),
        $name,
      ) |> $shape->replace($$, $field);
    }
    return $shape;
  }

  // Required for adding ellipsis
  private static function addTrailingCommaToFields(
    HHAST\ShapeTypeSpecifier $shape,
  ): HHAST\ShapeTypeSpecifier {
    $fields = $shape->fields();
    if ($fields === null) {
      return $shape;
    }

    $last_field = $fields
      ->of_class(HHAST\ListItem::class)
      |> Vec\filter(
        $$,
        (HHAST\ListItem $item) ==> !$item->item()->is_missing(),
      )
      |> C\last($$);
    if ($last_field === null) {
      return $shape;
    }
    if (!$last_field->separator()->is_missing()) {
      return $shape;
    }

    $last_field = $last_field->of_class(
      HHAST\FieldSpecifier::class,
    ) |> C\onlyx($$);

    $rightmost = $last_field->rightmost_tokenx();

    $shape = $shape->insert_after(
      new HHAST\CommaToken(
        HHAST\Missing(),
        $rightmost->trailing(),
      ),
      $last_field->type(),
    )->replace(
      $rightmost->with_trailing(HHAST\Missing()),
      $rightmost,
    );

    return $shape;
  }

  private static function allowImplicitSubtypes(
    HHAST\ShapeTypeSpecifier $shape,
  ): HHAST\ShapeTypeSpecifier {
    $fields = $shape->of_class(HHAST\FieldSpecifier::class);
    $first_field = C\first($fields);
    if ($first_field === null) {
      return $shape->with_ellipsis(
        new HHAST\DotDotDotToken(HHAST\Missing(), HHAST\Missing()),
      );
    }

    return $shape->with_ellipsis(
      new HHAST\DotDotDotToken(
        Str\contains($shape->full_text(), "\n")
          ? $first_field->leftmost_tokenx()->leading()
          : new HHAST\WhiteSpace(' '),
        C\lastx($shape->fieldsx()->children())
          ->rightmost_tokenx()
          ->trailing(),
      ),
    );

    return $shape;
  }

  public function migrateAst(
    HHAST\EditableSyntax $ast,
  ): HHAST\EditableSyntax {
    $shape_declarations = $ast->of_class(
      HHAST\ShapeTypeSpecifier::class,
    );
    return $ast->rewrite(
      ($shape, $_) ==> {
        if (!$shape instanceof HHAST\ShapeTypeSpecifier) {
          return $shape;
        }
        return $shape
          |> self::makeNullableFieldsOptional($$)
          |> self::addTrailingCommaToFields($$)
          |> self::allowImplicitSubtypes($$)
          |> $$;
      }
    );
  }
}
