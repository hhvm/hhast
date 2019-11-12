/*
 *  Copyright (c) 2017-present, Facebook, Inc.
 *  All rights reserved.
 *
 *  This source code is licensed under the MIT license found in the
 *  LICENSE file in the root directory of this source tree.
 *
 */

namespace Facebook\HHAST;

use namespace HH\Lib\{C, Str, Vec};

final class ExplicitPartialModeMigration extends BaseMigration {
  protected static function addPartialModeIfNoneSpecified(
    MarkupSuffix $node,
  ): MarkupSuffix {
    $name = $node->getName()->getText();
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
          new NodeList(vec[
            new WhiteSpace(' '),
            new SingleLineComment('// partial'),
          ]),
        ),
      );
    }
    $children = $trailing->toVec();
    $idx = C\find_key($children, $c ==> $c is EndOfLine);

    if ($idx === null) {
      return $node->replace($trailing, new NodeList(vec[
        new WhiteSpace(' '),
        new SingleLineComment('// partial'),
        new EndOfLine("\n"),
      ]));
    }

    return $node->replace($trailing, new NodeList(Vec\concat(
      vec[
        new WhiteSpace(' '),
        new SingleLineComment('// partial'),
      ],
      Vec\drop($children, $idx),
    )));
  }

  <<__Override>>
  public function migrateFile(string $_path, Script $ast): Script {
    $markup = C\first($ast->getDeclarationsx()->getChildren());
    if (!$markup is MarkupSection) {
      return $ast;
    }
    $suffix = $markup->getSuffix();
    return $ast->replace($suffix, self::addPartialModeIfNoneSpecified($suffix));
  }
}
