/*
 *  Copyright (c) 2017-present, Facebook, Inc.
 *  All rights reserved.
 *
 *  This source code is licensed under the MIT license found in the
 *  LICENSE file in the root directory of this source tree.
 *
 */

namespace Facebook\HHAST;

use namespace HH\Lib\{C, Keyset, Str, Vec};

final class UnusedUseClauseLinter extends AutoFixingASTLinter {
  const type TNode = INamespaceUseDeclaration;
  const type TContext = Script;

  <<__Override>>
  public function getLintErrorForNode(
    Script $_context,
    INamespaceUseDeclaration $node,
  ): ?ASTLintError {
    $clauses = $node->getClauses()->getChildrenOfItems();
    $unused = $this->getUnusedClauses($node->getKind(), $clauses);

    if (C\is_empty($unused)) {
      return null;
    }

    return new ASTLintError(
      $this,
      $unused
        |> Vec\map($$, $p ==> '`'.$p[0].'`')
        |> Str\join($$, ', ')
        |> $$.((C\count($unused) === 1) ? ' is' : ' are').' not used',
      $node,
      () ==> $this->getFixedNode($node),
    );
  }

  private function getUnusedClauses(
    ?Token $kind,
    vec<NamespaceUseClause> $clauses,
  ): vec<(string, NamespaceUseClause)> {
    $used = $this->getUnresolvedReferencedNames();
    $unused = vec[];
    foreach ($clauses as $clause) {
      $as = $clause->getAlias();
      if ($as !== null) {
        $as = $as->getText();
      } else {
        $name = $clause->getName();
        if ($name is NameToken) {
          $as = $name->getText();
        } else {
          invariant($name is QualifiedName, 'Unhandled name type');
          $as = $name->getParts()->getChildrenOfItemsOfType(NameToken::class)
            |> (C\lastx($$) as nonnull)->getText();
        }
      }
      if ($kind is NamespaceToken) {
        if (!C\contains($used['namespaces'], $as)) {
          $unused[] = tuple($as, $clause);
        }
        continue;
      }
      if ($kind is TypeToken) {
        if (!C\contains($used['types'], $as)) {
          $unused[] = tuple($as, $clause);
        }
        continue;
      }

      if ($kind is FunctionToken) {
        if (!C\contains($used['functions'], $as)) {
          $unused[] = tuple($as, $clause);
        }
        continue;
      }

      if ($kind is ConstToken) {
        // unsupported
        continue;
      }

      invariant($kind === null, 'Unhandled kind: %s', \get_class($kind));
      if (C\contains($used['namespaces'], $as)) {
        continue;
      }
      if (C\contains($used['types'], $as)) {
        continue;
      }
      $unused[] = tuple($as, $clause);
    }
    return $unused;
  }

  <<__Override>>
  protected function getTitleForFix(ASTLintError $error): string {
    $node = $error->getBlameNode() as this::TNode;
    $clauses = $node->getClauses()->getChildrenOfItems();
    $unused = $this->getUnusedClauses($node->getKind(), $clauses);
    if (C\count($clauses) === C\count($unused)) {
      return 'Remove `use` statement';
    }

    return $this->getUnusedClauses($node->getKind(), $clauses)
      |> Vec\map($$, $p ==> '`'.$p[1]->getCode().'`')
      |> Str\join($$, ', ')
      |> 'Remove '.$$;
  }

  public function getFixedNode(INamespaceUseDeclaration $node): Node {
    $clauses = $node->getClauses()->getChildrenOfItems();
    $clause_count = C\count($clauses);
    $unused = $this->getUnusedClauses($node->getKind(), $clauses)
      |> Keyset\map($$, $p ==> $p[1]->getUniqueID());
    $unused_count = C\count($unused);
    if ($clause_count === $unused_count) {
      return $node->getFirstTokenx()->getLeading();
    }

    // Don't create a single-element group use statement
    if (
      $node is NamespaceGroupUseDeclaration &&
      $clause_count === ($unused_count + 1)
    ) {
      $clause = Vec\filter(
        $clauses,
        $item ==> !C\contains_key($unused, $item->getUniqueID()),
      )
        |> C\onlyx($$);
      $name = $clause->getName();
      if ($name is NameToken) {
        $name = new QualifiedName(
          NodeList::createMaybeEmptyList(
            Vec\concat(
              $node->getPrefix()->getParts()->getChildren(),
              vec[new ListItem($name, null)],
            ),
          ),
        );
      } else {
        invariant(
          $name is QualifiedName,
          'name is not a name or qualified name',
        );
        $name = new QualifiedName(
          NodeList::createMaybeEmptyList(
            Vec\concat(
              $node->getPrefix()->getParts()->getChildren(),
              $name->getParts()->getChildren(),
            ),
          ),
        );
      }
      $t = $clause->getFirstTokenx();
      $clause = $clause
        ->withName($name)
        ->replace($t, $t->withLeading(null));

      $fixed = new NamespaceUseDeclaration(
        $node->getKeyword(),
        $node->getKind(),
        NodeList::createMaybeEmptyList(vec[new ListItem($clause, null)]),
        $node->getSemicolon(),
      );
    } else {
      $fixed = $node->getClausesx()->getChildren()
        |> Vec\filter(
          $$,
          $child ==> !C\contains_key($unused, $child->getItem()->getUniqueID()),
        )
        |> $node->withClauses(new NodeList($$));
    }
    $last = C\lastx($fixed->getClauses()->getChildrenOfType(ListItem::class));
    $sep = $last->getSeparator();

    if ($sep && !Str\contains($sep->getTrailing()->getCode(), "\n")) {
      return $fixed->replace($last, $last->withSeparator(null));
    }
    return $fixed;
  }

  <<__Memoize>>
  private function getUnresolvedReferencedNames(
  ): shape(
    'namespaces' => keyset<string>,
    'types' => keyset<string>,
    'functions' => keyset<string>,
  ) {
    return get_unresolved_referenced_names($this->getAST());
  }
}
