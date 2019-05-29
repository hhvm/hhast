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
    if ($trailing->isMissing()) {
      // just `<?hh` then EOF, no trailign newline
      return $node->replace(
        $node->getLastTokenx(),
        $node->getLastTokenx()->withTrailing(
          new HHAST\NodeList(vec[
            new HHAST\WhiteSpace(' '),
            new HHAST\SingleLineComment('// partial'),
          ]),
        ),
      );
    }

    if (Str\starts_with($trailing->getCode(), ' // ')) {
      return $node;
    }
    $children = vec($node->getChildren());
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
      Vec\slice($children, $idx),
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
