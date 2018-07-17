<?hh // strict
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
  ConstToken,
  EditableList,
  EditableNode,
  EditableToken,
  FunctionToken,
  INamespaceUseDeclaration,
  NamespaceGroupUseDeclaration,
  NamespaceUseDeclaration,
  NamespaceUseClause,
  NamespaceToken,
  NameToken,
  TypeToken,
  QualifiedName,
};
use namespace Facebook\HHAST;
use namespace HH\Lib\{C, Str, Vec};

final class UnusedUseClauseLinter
  extends AutoFixingASTLinter<INamespaceUseDeclaration> {
  <<__Override>>
  protected static function getTargetType(
  ): classname<INamespaceUseDeclaration> {
    return INamespaceUseDeclaration::class;
  }

  <<__Override>>
  public function getLintErrorForNode(
    INamespaceUseDeclaration $node,
    vec<EditableNode> $_context,
  ): ?FixableASTLintError<INamespaceUseDeclaration> {
    $clauses = $node->getClauses()->getItemsOfType(NamespaceUseClause::class);
    $unused = $this->getUnusedClauses($node->getKind(), $clauses);

    if (C\is_empty($unused)) {
      return null;
    }

    return new FixableASTLintError(
      $this,
      $unused
        |> Vec\map($$, $p ==> '`'.$p[0].'`')
        |> Str\join($$, ', ')
        |> $$.((C\count($unused) === 1) ? ' is' : ' are').' not used',
      $node,
    );
  }

  private function getUnusedClauses(
    ?EditableToken $kind,
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
        if ($name instanceof NameToken) {
          $as = $name->getText();
        } else {
          invariant($name instanceof QualifiedName, "Unhandled name type");
          $as = $name->getParts()->getItemsOfType(NameToken::class)
            |> C\lastx($$)->getText();
        }
      }
      if ($kind instanceof NamespaceToken) {
        if (!C\contains($used['namespaces'], $as)) {
          $unused[] = tuple($as, $clause);
        }
        continue;
      }
      if ($kind instanceof TypeToken) {
        if (!C\contains($used['types'], $as)) {
          $unused[] = tuple($as, $clause);
        }
        continue;
      }

      if ($kind instanceof FunctionToken) {
        if (!C\contains($used['functions'], $as)) {
          $unused[] = tuple($as, $clause);
        }
        continue;
      }

      if ($kind instanceof ConstToken) {
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
  protected function getTitleForFix(
    FixableASTLintError<INamespaceUseDeclaration> $error,
  ): string {
    $node = $error->getBlameNode();
    $clauses = $node->getClauses()->getItemsOfType(NamespaceUseClause::class);
    $unused = $this->getUnusedClauses($node->getKind(), $clauses);
    if (C\count($clauses) === C\count($unused)) {
      return 'Remove `use` statement';
    }

    return $this->getUnusedClauses($node->getKind(), $clauses)
      |> Vec\map($$, $p ==> '`'.$p[1]->getCode().'`')
      |> Str\join($$, ', ')
      |> 'Remove '.$$;
  }

  <<__Override>>
  public function getFixedNode(INamespaceUseDeclaration $node): EditableNode {
    $clauses = $node->getClauses()->getItemsOfType(NamespaceUseClause::class);
    $clause_count = C\count($clauses);
    $unused = $this->getUnusedClauses($node->getKind(), $clauses)
      |> Vec\map($$, $p ==> $p[1]);
    $unused_count = C\count($unused);
    if ($clause_count === $unused_count) {
      return $node->getFirstTokenx()->getLeading();
    }

    // Don't create a single-element group use statement
    if (
      $node instanceof NamespaceGroupUseDeclaration &&
      $clause_count === ($unused_count + 1)
    ) {
      $clause = Vec\filter($clauses, $item ==> !C\contains($unused, $item))
        |> C\onlyx($$);
      $name = $clause->getName();
      if ($name instanceof NameToken) {
        $name = new QualifiedName(
          EditableList::fromItems(
            Vec\concat(
              $node->getPrefix()->getParts()->getChildren(),
              vec[$name],
            ),
          ),
        );
      } else {
        invariant(
          $name instanceof QualifiedName,
          'name is not a name or qualified name',
        );
        $name = new QualifiedName(
          EditableList::fromItems(
            Vec\concat(
              $node->getPrefix()->getParts()->getChildren(),
              $name->getParts()->getChildren(),
            ),
          ),
        );
      }
      $clause = $clause
        ->withName($name)
        ->without($clause->getFirstTokenx()->getLeading());

      $fixed = new NamespaceUseDeclaration(
        $node->getKeyword(),
        $node->getKind() ?? HHAST\Missing(),
        EditableList::fromItems(
          vec[new HHAST\ListItem($clause, HHAST\Missing())],
        ),
        $node->getSemicolon() ?? HHAST\Missing(),
      );
    } else {
      $fixed = $node->rewriteDescendants(
        ($c, $_) ==> {
          if (
            $c instanceof HHAST\ListItem && C\contains($unused, $c->getItem())
          ) {
            return HHAST\Missing();
          }
          return $c;
        },
      );
    }
    $last =
      C\lastx($fixed->getClauses()->getChildrenOfType(HHAST\ListItem::class));
    $sep = $last->getSeparator();

    if ($sep && !Str\contains($sep->getTrailing()->getCode(), "\n")) {
      return $fixed->without($sep);
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
    return HHAST\get_unresolved_referenced_names($this->getAST());
  }
}
