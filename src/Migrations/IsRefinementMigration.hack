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

final class IsRefinementMigration extends BaseMigration {
  <<__Override>>
  public function migrateFile(string $_path, Script $ast): Script {
    $map = dict[
      'is_string' => () ==> new StringToken(null, null),
      'is_int' => () ==> new IntToken(null, null),
      'is_float' => () ==> new FloatToken(null, null),
      'is_bool' => () ==> new BoolToken(null, null),
      'is_resource' => () ==> new ResourceToken(null, null),
      'is_vec' => () ==> new VectorTypeSpecifier(
        new VecToken(null, null),
        new LessThanToken(null, null),
        new SimpleTypeSpecifier(new NameToken(null, null, '_')),
        /* trailing comma */ null,
        new GreaterThanToken(null, null),
      ),
      'is_keyset' => () ==> new KeysetTypeSpecifier(
        new KeysetToken(null, null),
        new LessThanToken(null, null),
        new SimpleTypeSpecifier(new NameToken(null, null, '_')),
        /* trailing comma */ null,
        new GreaterThanToken(null, null),
      ),
      'is_dict' => () ==> new DictionaryTypeSpecifier(
        new DictToken(null, null),
        new LessThanToken(null, null),
        NodeList::createMaybeEmptyList(vec[
          new ListItem(
            new SimpleTypeSpecifier(new NameToken(null, null, '_')),
            new CommaToken(null, new NodeList(vec[new WhiteSpace(' ')])),
          ),
          new ListItem(
            new SimpleTypeSpecifier(new NameToken(null, null, '_')),
            null,
          ),
        ]),
        new GreaterThanToken(null, null),
      ),
    ];

    return $ast->rewriteDescendants(($node, $parents) ==> {
      if (!$node is FunctionCallExpression) {
        return $node;
      }
      $name = $node->getReceiver();
      if ($name is NameToken) {
        $key = $name->getText();
      } else if ($name is QualifiedName) {
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
      if (!$replacement is ITypeSpecifier) {
        $replacement = new SimpleTypeSpecifier($replacement);
      }
      $replacement = new IsExpression(
        $node->getArgumentListx()->getChildrenOfItems()[0] as nonnull,
        new IsToken(
          new NodeList(vec[new WhiteSpace(' ')]),
          new NodeList(vec[new WhiteSpace(' ')]),
        ),
        $replacement,
      );

      $parent = C\lastx($parents as nonnull);
      // Whitelist of cases where parenthese are not needed
      if (
        ($parent is ListItem<_>) ||
        ($parent is IfStatement) ||
        ($parent is ParenthesizedExpression)
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

      return new ParenthesizedExpression(
        new LeftParenToken($node->getFirstTokenx()->getLeading(), null),
        $replacement,
        new RightParenToken(null, $node->getLastTokenx()->getTrailing()),
      );
    });
  }
}
