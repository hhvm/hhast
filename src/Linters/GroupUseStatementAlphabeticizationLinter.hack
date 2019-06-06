/*
 *  Copyright (c) 2017-present, Facebook, Inc.
 *  All rights reserved.
 *
 *  This source code is licensed under the MIT license found in the
 *  LICENSE file in the root directory of this source tree.
 *
 */

namespace Facebook\HHAST\Linters;

use type Facebook\HHAST\{
  CommaToken,
  ListItem,
  NameToken,
  NamespaceGroupUseDeclaration,
  NamespaceUseClause,
  Node,
  NodeList,
  Script,
};
use function Facebook\HHAST\Missing;
use namespace HH\Lib\{C, Str, Vec};

final class GroupUseStatementAlphabeticizationLinter
  extends AutoFixingASTLinter {
  const type TNode = NamespaceGroupUseDeclaration;
  const type TContext = Script;

  <<__Override>>
  public function getLintErrorForNode(
    Script $_context,
    NamespaceGroupUseDeclaration $node,
  ): ?ASTLintError {
    // NamespaceGroupUseDeclaration has the following structure:
    //
    // NodeList
    //  ListItem
    //    NamespaceUseClause
    //      NameToken
    //    CommaToken
    //
    // Save the NodeList containing the NamespaceUseClauses and the whole
    // ListItems (including CommaToken) as we want to preserve trivia as we
    // reorder, especially for comments such as:
    //
    // use type Foo\{
    //   Baz,
    //   Bar, // we want this comment to always belong to "Bar"
    // }
    $items = dict[];
    $items_list = null;
    foreach ($node->getDescendantsOfType(NodeList::class) as $list) {
      foreach ($list->getDescendantsOfType(ListItem::class) as $item) {
        $namespace_use_clauses = $item->getDescendantsOfType(
          NamespaceUseClause::class,
        );
        if (C\count($namespace_use_clauses) === 1) {
          $name_tokens = $namespace_use_clauses[0]->getDescendantsOfType(
            NameToken::class,
          );
          if (C\count($name_tokens) === 1) {
            // NamespaceUseClauses should all belong to the same NodeList
            if ($items_list is nonnull && $items_list !== $list) {
              return null;
            }

            $items_list = $list;
            $items[$name_tokens[0]->getText()] = $item;
          }
        }
      }
    }

    if ($items_list is nonnull) {
      $count = C\count($items);
      $names = Vec\map_with_key($items, ($key, $_) ==> $key);
      $names_sorted = Vec\sort($names);

      for ($i = 0; $i < $count; $i++) {
        if ($names[$i] !== $names_sorted[$i]) {
          return new ASTLintError(
            $this,
            'Group use statements should be sorted alphabetically',
            $node,
            () ==> $this->getFixedNode(
              $node,
              $items_list,
              $items,
              $names,
              $names_sorted,
              $count,
            ),
          );
        }
      }
    }

    return null;
  }

  public function getFixedNode(
    NamespaceGroupUseDeclaration $node,
    NodeList<Node> $items_list,
    dict<string, ListItem<Node>> $items,
    vec<string> $names,
    vec<string> $names_sorted,
    int $count,
  ): NamespaceGroupUseDeclaration {
    return $node->rewriteDescendants(
      ($node, $parents) ==> {
        if ($node === $items_list) {
          $items_sorted = vec[];
          for ($i = 0; $i < $count; $i++) {
            // ListItem with NamespaceUseClause in alphabetical order
            $item = $items[$names_sorted[$i]];

            $comma_tokens = $item->getDescendantsOfType(CommaToken::class);

            // Add a comma if not having one already, because the latest item
            // from a single-line NamespaceGroupUseDeclaration may be moved
            // forward and thus preceding an other NamespaceUseClause
            if (C\count($comma_tokens) === 0) {
              // Skip if this is the latest item on the ordered list
              if ($i !== $count - 1) {
                $leading = Missing();
                $trailing = Missing();

                // Retrieve trivia from NamespaceUseClause originally at this
                // position if available
                $comma_tokens = $items[$names[$i]]->getDescendantsOfType(
                  CommaToken::class,
                );
                if (C\count($comma_tokens) > 0) {
                  $leading = $comma_tokens[0]->getLeading();
                  $trailing = $comma_tokens[0]->getTrailing();
                }

                $item = $item->insertAfter(
                  $item->getDescendantsOfType(NamespaceUseClause::class)[0],
                  new CommaToken($leading, $trailing),
                );
              }
            } else {
              // Avoid trailing comma when single-line, such as
              //
              // use type Foo\{Bar, Baz, }
              //                       ^ trailing comma
              //
              // we however want to keep it for multi-lines:
              //
              // use type Foo\{
              //   Bar,
              //   Baz, // keep comma
              // }
              if ($i === $count - 1) {
                if (
                  !Str\contains(
                    $comma_tokens[0]->getTrailing()->getCode(),
                    "\n",
                  )
                ) {
                  $item = $item->replace($comma_tokens[0], Missing());
                }
              }
            }

            $items_sorted[] = $item;
          }

          return new NodeList($items_sorted);
        }

        return $node;
      },
      vec[],
    );
  }
}
