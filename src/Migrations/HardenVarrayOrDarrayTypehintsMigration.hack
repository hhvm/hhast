/*
 *  Copyright (c) 2017-present, Facebook, Inc.
 *  All rights reserved.
 *
 *  This source code is licensed under the MIT license found in the
 *  LICENSE file in the root directory of this source tree.
 *
 */

namespace Facebook\HHAST;

use namespace HH\Lib\C;

final class HardenVarrayOrDarrayTypehintsMigration extends StepBasedMigration {

  <<__Override>>
  public function getSteps(): Traversable<IMigrationStep> {
    return vec[
      new TypedMigrationStep(
        'Migrate varray_or_darray parameters',
        ParameterDeclaration::class,
        ParameterDeclaration::class,
        $node ==> self::migrateParameter($node),
      ),
      new TypedMigrationStep(
        'Migrate varray_or_darray return types',
        FunctionDeclarationHeader::class,
        FunctionDeclarationHeader::class,
        $node ==> $node->withType(self::migrateReturnType($node->getType())),
      ),
      new TypedMigrationStep(
        'Migrate varray_or_darray return types in lambda functions',
        LambdaSignature::class,
        LambdaSignature::class,
        $node ==> $node->withType(static::migrateReturnType($node->getType())),
      ),
    ];
  }

  private static function migrateParameter(
    ParameterDeclaration $param,
  ): ParameterDeclaration {
    list($attr, $type) = static::migrate(
      $param->getAttribute(),
      $param->getType(),
    );
    return $param->withAttribute($attr)->withType($type);
  }

  private static function migrateReturnType(
    ?ITypeSpecifier $type,
  ): ?ITypeSpecifier {
    $wrapper = null;
    if ($type is AttributizedSpecifier) {
      $wrapper = $type;
      $type = $type->getType();
    }
    list($attr, $type) = static::migrate($wrapper?->getAttributeSpec(), $type);
    return $wrapper is null || $attr is null || $type is null
      ? $type
      : $wrapper->withAttributeSpec($attr)->withType($type);
  }

  /**
   * Shared part of migrateParameter() and migrateReturnType().
   */
  private static function migrate(
    ?OldAttributeSpecification $old_attr_spec,
    ?ITypeSpecifier $type,
  ): (?OldAttributeSpecification, ?ITypeSpecifier) {
    if ($type is GenericTypeSpecifier) {
      $name = $type->getClassType();
      if ($name is NameToken && $name->getText() === 'varray_or_darray') {
        $new_attr_spec = self::removeSoft($old_attr_spec);
        if ($old_attr_spec is nonnull && $new_attr_spec is null) {
          // The whole attribute spec is being removed. Preserve whitespace and
          // comments by concatenating trivia from before $old_attr_spec, after
          // $old_attr_spec, and before $type.
          $between = NodeList::concat(
            $old_attr_spec->getLastTokenx()->getTrailing(),
            $type->getFirstTokenx()->getLeading(),
          );
          // Common edge case: Single space between <<__Soft>> varray_or_darray
          // should be removed.
          if (
            $between->getCount() === 1 &&
            C\onlyx($between->getChildren())->getText() === ' '
          ) {
            $between = NodeList::createMaybeEmptyList(vec[]);
          }
          $type = $type->replaceDescendant(
            $type->getFirstTokenx(),
            $type->getFirstTokenx()->withLeading(
              NodeList::concat(
                $old_attr_spec->getFirstTokenx()->getLeading(),
                $between,
              ),
            ),
          );
        }
        return tuple($new_attr_spec, $type);
      }
    }
    return tuple($old_attr_spec, $type);
  }

  private static function removeSoft(
    ?OldAttributeSpecification $attr_spec,
  ): ?OldAttributeSpecification {
    if ($attr_spec is null) {
      return null;
    }
    $attrs = $attr_spec->getAttributes()->filterChildren(
      $item ==> {
        $name = $item->getItem()->getType();
        if ($name is NameToken && $name->getText() === '__Soft') {
          return false;
        }
        return true;
      },
    );
    if ($attrs->isEmpty()) {
      return null;
    }
    return $attr_spec->withAttributes($attrs);
  }
}
