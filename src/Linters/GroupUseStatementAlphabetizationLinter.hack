/*
 *  Copyright (c) 2017-present, Facebook, Inc.
 *  All rights reserved.
 *
 *  This source code is licensed under the MIT license found in the
 *  LICENSE file in the root directory of this source tree.
 *
 */

namespace Facebook\HHAST;

use namespace HH\Lib\{C, Dict, Str, Vec};

final class GroupUseStatementAlphabetizationLinter extends AutoFixingASTLinter {
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
    $list = $node->getClauses();
    foreach ($list->toVec() as $item) {
      $name = $item->getItem()->getName();
      $str = $name->getDescendantsOfType(NameToken::class)
        |> Vec\map($$, $t ==> $t->getText())
        |> Str\join($$, '\\');
      $items[$str] = $item;
    }
    $sorted = Dict\sort_by_key($items);
    if ($sorted === $items) {
      return null;
    }

    return new ASTLintError(
      $this,
      'Group use statements should be sorted alphabetically',
      $node,
      () ==> $this->getFixedNode($node, $sorted),
    );
  }

  public function getFixedNode(
    NamespaceGroupUseDeclaration $node,
    dict<string, ListItem<NamespaceUseClause>> $sorted_clauses,
  ): NamespaceGroupUseDeclaration {
    if (!C\any($sorted_clauses, $c ==> Str\contains($c->getCode(), "\n"))) {
      // we want `use {foo, bar, baz}`; no trailng comma
      $last = C\lastx($sorted_clauses);
      $clauses = Vec\map(
        $sorted_clauses,
        $clause ==> {
          if ($clause === $last) {
            return $clause->withSeparator(null);
          }
          return $clause->hasSeparator()
            ? $clause
            : $clause->withSeparator(
              new CommaToken(null, new NodeList(vec[new WhiteSpace(' ')])),
            );
        },
      );
    } else {
      // we want use `{\n  foo,\n  bar,\n}` etc
      $clauses = Vec\map(
        $sorted_clauses,
        $clause ==> {
          if ($clause->hasSeparator()) {
            return $clause;
          }
          $t = $clause->getLastTokenx();
          $trailing = $t->getTrailing();
          return $clause->replace($t, $t->withTrailing(null))
            ->withSeparator(new CommaToken(null, $trailing));
        },
      );
    }
    return $node->withClauses(new NodeList($clauses));
  }
}
