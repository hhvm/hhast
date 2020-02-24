/*
 *  Copyright (c) 2017-present, Facebook, Inc.
 *  All rights reserved.
 *
 *  This source code is licensed under the MIT license found in the
 *  LICENSE file in the root directory of this source tree.
 *
 */

namespace Facebook\HHAST;

use namespace HH\Lib\Str;

final class XHPClassModifierMigration extends StepBasedMigration {
  private static function replaceXHPClassWithModifier(
    ClassishDeclaration $in,
  ): ClassishDeclaration {
    if ($in->hasXhp()) {
      return $in;
    }

    $name = $in->getName();
    if (!$name is XHPClassNameToken) {
      return $in;
    }

    $kw = $in->getKeyword();

    $class = Str\strip_prefix($name->getText(), ':')
      |> Str\replace($$, '-', '_');

    return $in->withXhp(
      new XHPToken($kw->getLeading(), new NodeList(vec[new WhiteSpace(' ')])),
    )
      ->withKeyword($kw->withLeading(null))
      ->withName(
        Str\contains($class, ':')
          ? new XHPClassNameToken(
              $name->getLeading(),
              $name->getTrailing(),
              $class,
            )
          : $name->withText($class),
      );
  }

  <<__Override>>
  public function getSteps(): Traversable<IMigrationStep> {
    return vec[
      new TypedMigrationStep(
        'Replace `class :foo:bar` with `xhp class foo:bar`',
        ClassishDeclaration::class,
        ClassishDeclaration::class,
        $node ==> self::replaceXHPClassWithModifier($node),
      ),
    ];
  }
}
