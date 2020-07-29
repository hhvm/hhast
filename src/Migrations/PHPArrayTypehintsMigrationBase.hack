/*
 *  Copyright (c) 2017-present, Facebook, Inc.
 *  All rights reserved.
 *
 *  This source code is licensed under the MIT license found in the
 *  LICENSE file in the root directory of this source tree.
 *
 */

namespace Facebook\HHAST;

abstract class PHPArrayTypehintsMigrationBase extends StepBasedMigration {

  <<__Override>>
  public function getSteps(): Traversable<IMigrationStep> {
    return vec[
      new TypedMigrationStep(
        'Migrate array parameters',
        ParameterDeclaration::class,
        ParameterDeclaration::class,
        $node ==> static::migrateParameter($node),
      ),
      new TypedMigrationStep(
        'Migrate array return types',
        FunctionDeclarationHeader::class,
        FunctionDeclarationHeader::class,
        $node ==> $node->withType(static::migrateReturnType($node->getType())),
      ),
    ];
  }

  final protected static function migrateParameter(
    ParameterDeclaration $param,
  ): ParameterDeclaration {
    if (!$param->hasType()) {
      return $param;
    }
    list($attr, $type) =
      static::migrate($param->getAttribute(), $param->getTypex());
    return $param->withAttribute($attr)->withType($type);
  }

  final protected static function migrateReturnType(
    ?ITypeSpecifier $type,
  ): ?ITypeSpecifier {
    if ($type is null) {
      return null;
    }
    $wrapper = null;
    if ($type is AttributizedSpecifier) {
      $wrapper = $type;
      $type = $type->getType();
    }
    list($attr, $type) = static::migrate($wrapper?->getAttributeSpec(), $type);
    if ($attr is nonnull && $wrapper is null) {
      return new AttributizedSpecifier($attr, $type);
    }
    return $wrapper is nonnull
      ? $wrapper->withAttributeSpec($attr as nonnull)->withType($type)
      : $type;
  }

  /**
   * Shared part of migrateParameter() and migrateReturnType().
   */
  final protected static function migrate(
    ?OldAttributeSpecification $attr_spec,
    ITypeSpecifier $type,
  ): (?OldAttributeSpecification, ITypeSpecifier) {
    if ($type is null) {
      return tuple($attr_spec, $type);
    }

    if (
      ($type is VectorArrayTypeSpecifier || $type is MapArrayTypeSpecifier) &&
      static::shouldAddSoft()
    ) {
      if ($attr_spec is null) {
        // move trivia from the old first token to the new first token
        $ft = $type->getFirstTokenx();
        $type = $type->replaceDescendant($ft, $ft->withLeading(null));
        $attr_spec = new OldAttributeSpecification(
          new LessThanLessThanToken($ft->getLeading(), null),
          NodeList::createMaybeEmptyList(vec[]),
          new GreaterThanGreaterThanToken(
            null,
            NodeList::createMaybeEmptyList(vec[new WhiteSpace(' ')]),
          ),
        );
      }
      $attr_spec = static::addSoft($attr_spec);
    }

    $type = $type->rewrite(
      ($node, $_) ==> {
        if ($node is VectorArrayTypeSpecifier) {
          return static::migrateVectorArray($node);
        } else if ($node is MapArrayTypeSpecifier) {
          return static::migrateMapArray($node);
        } else {
          return $node;
        }
      },
      vec[],
    ) as ITypeSpecifier;

    return tuple($attr_spec, $type);
  }

  final protected static function addSoft(
    OldAttributeSpecification $attr_spec,
  ): OldAttributeSpecification {
    foreach ($attr_spec->getAttributes()->getChildrenOfItems() as $attr) {
      $name = $attr->getType();
      if ($name is NameToken && $name->getText() === '__Soft') {
        return $attr_spec; // already has __Soft, nothing to do here
      }
    }
    return $attr_spec->withAttributes(
      $attr_spec->getAttributes()
        |> append_to_nodelist(
          $$,
          vec[
            new ConstructorCall(
              new NameToken(null, null, '__Soft'),
              null,
              null,
              null,
            ),
          ],
          CommaToken::class,
        ),
    );
  }

  /**
   * Not final, some subclasses override these.
   */
  protected static function migrateVectorArray(
    VectorArrayTypeSpecifier $node,
  ): ITypeSpecifier {
    return new GenericTypeSpecifier(
      new NameToken(
        $node->getKeyword()->getFirstTokenx()->getLeading(),
        $node->getKeyword()->getLastTokenx()->getTrailing(),
        'varray_or_darray',
      ),
      new TypeArguments(
        $node->getLeftAngle(),
        NodeList::createMaybeEmptyList(vec[
          new ListItem($node->getType(), null),
        ]),
        $node->getRightAngle(),
      ),
    );
  }

  protected static function migrateMapArray(
    MapArrayTypeSpecifier $node,
  ): ITypeSpecifier {
    return new GenericTypeSpecifier(
      new NameToken(
        $node->getKeyword()->getFirstTokenx()->getLeading(),
        $node->getKeyword()->getLastTokenx()->getTrailing(),
        'varray_or_darray',
      ),
      new TypeArguments(
        $node->getLeftAngle(),
        NodeList::createMaybeEmptyList(vec[
          new ListItem($node->getKey(), $node->getComma()),
          new ListItem($node->getValue(), null),
        ]),
        $node->getRightAngle(),
      ),
    );
  }

  abstract protected static function shouldAddSoft(): bool;
}
