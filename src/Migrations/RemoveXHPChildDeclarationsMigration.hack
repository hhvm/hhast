/*
 *  Copyright (c) 2017-present, Facebook, Inc.
 *  All rights reserved.
 *
 *  This source code is licensed under the MIT license found in the
 *  LICENSE file in the root directory of this source tree.
 *
 */

namespace Facebook\HHAST;

use namespace HH\Lib\{C, Vec};

final class RemoveXHPChildDeclarationsMigration extends StepBasedMigration {
  private static function replaceTrait(ClassishBody $in): ClassishBody {
    $uses = $in->getElements()?->getChildrenOfType(TraitUse::class) ?? vec[]
      |> Vec\map($$, $use ==> $use->getNames()->getChildrenOfItems())
      |> Vec\flatten($$);
    foreach ($uses as $use) {
      $name = $use ?as SimpleTypeSpecifier
        |> $$?->getSpecifier() ?as NameToken
        |> $$?->getText();
      if ($name === 'XHPChildDeclarationConsistencyValidation') {
        return $in->replace(
          $use,
          ($use as SimpleTypeSpecifier)->withSpecifier(
            new NameToken(null, null, 'XHPChildValidation'),
          ),
        );
      }
    }
    return $in;
  }

  private static function removeChildrenDeclaration(
    ClassishBody $in,
  ): ClassishBody {
    $decls = $in->getElements()
      ?->getChildrenOfType(XHPChildrenDeclaration::class) ??
      vec[];
    if (C\is_empty($decls)) {
      return $in;
    }

    $decls = vec($decls);
    $elems = $in->getElementsx()->toVec();
    foreach ($decls as $decl) {
      $idx = C\find_key($elems, $elem ==> $elem === $decl) as nonnull;
      $next = $elems[$idx + 1] ?? null;
      if ($next !== null) {
        $trivia = $decl->getFirstTokenx()->getLeading()->toVec();
        $to_trim = C\find_key(
          Vec\reverse($trivia),
          $node ==> !($node is WhiteSpace || $node is EndOfLine),
        );
        $keep = $to_trim === null
          ? vec[]
          : Vec\slice($trivia, 0, C\count($trivia) - $to_trim);
        $t = $next->getFirstTokenx();
        $elems[$idx + 1] = $next->replace(
          $t,
          $t->withLeading(
            new NodeList(Vec\concat($keep, $t->getLeading()->toVec())),
          ),
        );
      }
      $elems = Vec\concat(Vec\take($elems, $idx), Vec\drop($elems, $idx + 1));
    }

    return $in->withElements(new NodeList($elems));
  }

  <<__Override>>
  public function getSteps(): Traversable<IMigrationStep> {
    return vec[
      new TypedMigrationStep(
        'Replace consistency trait with validation trait',
        ClassishBody::class,
        ClassishBody::class,
        $node ==> self::replaceTrait($node),
      ),
      new TypedMigrationStep(
        'Remove `children` declarations',
        ClassishBody::class,
        ClassishBody::class,
        $node ==> self::removeChildrenDeclaration($node),
      ),
    ];
  }
}
