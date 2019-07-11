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

final class ExplicitPartialModeMigration extends BaseMigration {
  protected static function addPartialModeIfNoneSpecified(
    HHAST\MarkupSuffix $node,
  ): HHAST\MarkupSuffix {
    $name = $node->getName()?->getText();
    if ($name !== 'hh') {
      return $node;
    }

    $trailing = $node->getLastTokenx()->getTrailing();

    if (Str\starts_with($trailing->getCode(), ' // ')) {
      return $node;
    }
    if ($trailing->isEmpty()) {
      // just `<?hh` then EOF, no trailing newline
      $t = $node->getLastTokenx();
      return $node->replace(
        $t,
        $t->withTrailing(
          new HHAST\NodeList(vec[
            new HHAST\WhiteSpace(' '),
            new HHAST\SingleLineComment('// partial'),
          ]),
        ),
      );
    }
    $children = $trailing->toVec();
    $idx = C\find_key($children, $c ==> $c is HHAST\EndOfLine);

    if ($idx === null) {
      return $node->replace($trailing, new HHAST\NodeList(vec[
        new HHAST\WhiteSpace(' '),
        new HHAST\SingleLineComment('// partial'),
        new HHAST\EndOfLine("\n"),
      ]));
    }

    return $node->replace($trailing, new HHAST\NodeList(Vec\concat(
      vec[
        new HHAST\WhiteSpace(' '),
        new HHAST\SingleLineComment('// partial'),
      ],
      Vec\drop($children, $idx),
    )));
  }

  <<__Override>>
  final public function migrateFile(
    string $_path,
    HHAST\Script $ast,
  ): HHAST\Script {
    $markup = C\first($ast->getDeclarationsx()->getChildren());
    if (!$markup is HHAST\MarkupSection) {
      return $ast;
    }
    $suffix = $markup->getSuffix();
    return $ast->replace($suffix, self::addPartialModeIfNoneSpecified($suffix));
  }
}
