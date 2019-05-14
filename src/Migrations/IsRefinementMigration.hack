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

final class IsRefinementMigration extends BaseMigration {
  <<__Override>>
  public function migrateFile(
    string $_path,
    HHAST\Script $ast,
  ): HHAST\Script {
    $m = HHAST\Missing();
    $map = dict[
      'is_string' => () ==> new HHAST\StringToken($m, $m),
      'is_int' => () ==> new HHAST\IntToken($m, $m),
      'is_float' => () ==> new HHAST\FloatToken($m, $m),
      'is_bool' => () ==> new HHAST\BoolToken($m, $m),
      'is_resource' => () ==> new HHAST\ResourceToken($m, $m),
      'is_vec' => () ==> new HHAST\VectorTypeSpecifier(
        new HHAST\VecToken($m, $m),
        new HHAST\LessThanToken($m, $m),
        new HHAST\NameToken($m, $m, '_'),
        /* trailing comma */ $m,
        new HHAST\GreaterThanToken($m, $m)
      ),
      'is_keyset' => () ==> new HHAST\KeysetTypeSpecifier(
        new HHAST\KeysetToken($m, $m),
        new HHAST\LessThanToken($m, $m),
        new HHAST\NameToken($m, $m, '_'),
        /* trailing comma */ $m,
        new HHAST\GreaterThanToken($m, $m)
      ),
      'is_dict' => () ==> new HHAST\DictionaryTypeSpecifier(
        new HHAST\DictToken($m, $m),
        new HHAST\LessThanToken($m, $m),
        HHAST\EditableList::createMaybeEmptyList(vec[
          new HHAST\ListItem(
            new HHAST\NameToken($m, $m, '_'),
            new HHAST\CommaToken($m, new HHAST\WhiteSpace(' ')),
          ),
          new HHAST\ListItem(new HHAST\NameToken($m, $m, '_'), $m),
        ]),
        new HHAST\GreaterThanToken($m, $m),
      ),
    ];

    return $ast->rewriteDescendants(($node, $parents) ==> {
      if (!$node is HHAST\FunctionCallExpression) {
        return $node;
      }
      $name = $node->getReceiver();
      if ($name is HHAST\NameToken) {
        $key = $name->getText();
      } else if ($name is HHAST\QualifiedName) {
        $key = $name->getParts()->getItems()
          |> Vec\map($$, $item ==> $item?->getText() ?? '')
          |> Str\join($$, '\\')
          |> Str\strip_prefix($$, '\\');
      } else {
        return $node;
      }

      $make_replacement = $map[$key] ?? null;
      if ($make_replacement === null) {
        return $node;
      }
      $replacement = new HHAST\IsExpression(
        $node->getArgumentListx()->getItems()[0] as nonnull,
        new HHAST\IsToken(new HHAST\WhiteSpace(' '), new HHAST\WhiteSpace(' ')),
        $make_replacement(),
      );

      $parent = C\lastx($parents as nonnull);
      // Whitelist of cases where parenthese are not needed
      if (
        ($parent is HHAST\ListItem) ||
        ($parent is HHAST\IfStatement) ||
        ($parent is HHAST\ParenthesizedExpression)
      ) {
        $first = $replacement->getFirstTokenx();
        $last = $replacement->getLastTokenx();
        return $replacement->replace(
          $first,
          $first->withLeading($node->getFirstTokenx()->getLeading()),
        )
          ->replace(
            $last,
            $last->withTrailing($node->getLastTokenx()->getTrailing()),
          );
      }

      return new HHAST\ParenthesizedExpression(
        new HHAST\LeftParenToken($node->getFirstTokenx()->getLeading(), $m),
        $replacement,
        new HHAST\RightParenToken($m, $node->getLastTokenx()->getTrailing()),
      );
    });
  }
}
