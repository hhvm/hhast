/*
 *  Copyright (c) 2017-present, Facebook, Inc.
 *  All rights reserved.
 *
 *  This source code is licensed under the MIT license found in the
 *  LICENSE file in the root directory of this source tree.
 *
 */

namespace Facebook\HHAST;

use namespace Facebook\HHAST;
use namespace HH\Lib\{C, Str, Vec};

final class IsRefinementMigration extends BaseMigration {
  <<__Override>>
  public function migrateFile(string $_path, HHAST\Script $ast): HHAST\Script {
    $map = dict[
      'is_string' => () ==> new HHAST\StringToken(null, null),
      'is_int' => () ==> new HHAST\IntToken(null, null),
      'is_float' => () ==> new HHAST\FloatToken(null, null),
      'is_bool' => () ==> new HHAST\BoolToken(null, null),
      'is_resource' => () ==> new HHAST\ResourceToken(null, null),
      'is_vec' => () ==> new HHAST\VectorTypeSpecifier(
        new HHAST\VecToken(null, null),
        new HHAST\LessThanToken(null, null),
        new HHAST\SimpleTypeSpecifier(new HHAST\NameToken(null, null, '_')),
        /* trailing comma */ null,
        new HHAST\GreaterThanToken(null, null),
      ),
      'is_keyset' => () ==> new HHAST\KeysetTypeSpecifier(
        new HHAST\KeysetToken(null, null),
        new HHAST\LessThanToken(null, null),
        new HHAST\SimpleTypeSpecifier(new HHAST\NameToken(null, null, '_')),
        /* trailing comma */ null,
        new HHAST\GreaterThanToken(null, null),
      ),
      'is_dict' => () ==> new HHAST\DictionaryTypeSpecifier(
        new HHAST\DictToken(null, null),
        new HHAST\LessThanToken(null, null),
        HHAST\NodeList::createMaybeEmptyList(vec[
          new HHAST\ListItem(
            new HHAST\SimpleTypeSpecifier(new HHAST\NameToken(null, null, '_')),
            new HHAST\CommaToken(
              null,
              new HHAST\NodeList(vec[new HHAST\WhiteSpace(' ')]),
            ),
          ),
          new HHAST\ListItem(
            new HHAST\SimpleTypeSpecifier(new HHAST\NameToken(null, null, '_')),
            null,
          ),
        ]),
        new HHAST\GreaterThanToken(null, null),
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
        $key = $name->getParts()->getChildrenOfItems()
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
      $replacement = $make_replacement();
      if (!$replacement is HHAST\ITypeSpecifier) {
        $replacement = new HHAST\SimpleTypeSpecifier($replacement);
      }
      $replacement = new HHAST\IsExpression(
        $node->getArgumentListx()->getChildrenOfItems()[0] as nonnull,
        new HHAST\IsToken(
          new HHAST\NodeList(vec[new HHAST\WhiteSpace(' ')]),
          new HHAST\NodeList(vec[new HHAST\WhiteSpace(' ')]),
        ),
        $replacement,
      );

      $parent = C\lastx($parents as nonnull);
      // Whitelist of cases where parenthese are not needed
      if (
        ($parent is HHAST\ListItem<_>) ||
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
        new HHAST\LeftParenToken($node->getFirstTokenx()->getLeading(), null),
        $replacement,
        new HHAST\RightParenToken(null, $node->getLastTokenx()->getTrailing()),
      );
    });
  }
}
