/*
 *  Copyright (c) 2017-present, Facebook, Inc.
 *  All rights reserved.
 *
 *  This source code is licensed under the MIT license found in the
 *  LICENSE file in the root directory of this source tree.
 *
 */

namespace Facebook\HHAST;


use namespace HH\Lib\C;

final class UseStatementWithLeadingBackslashLinter extends AutoFixingASTLinter {
  const type TNode = INamespaceUseDeclaration;
  const type TContext = Script;

  <<__Override>>
  public function getLintErrorForNode(
    Script $_context,
    INamespaceUseDeclaration $node,
  ): ?ASTLintError {
    $matched = false;
    if ($node is NamespaceGroupUseDeclaration) {
      $prefix = $node->getPrefix()->getFirstToken();
      if (!$prefix is BackslashToken) {
        return null;
      }
      $matched = true;
    } else {
      foreach ($node->getClausesx()->getChildrenOfItems() as $clause) {
        $name = $clause->getName()->getFirstToken();
        if ($name is BackslashToken) {
          $matched = true;
          break;
        }
      }
    }
    if (!$matched) {
      return null;
    }
    return new ASTLintError(
      $this,
      'Leading backslashes on `use` statements do nothing',
      $node,
      () ==> $this->getFixedNode($node),
    );
  }

  <<__Override>>
  protected function getTitleForFix(LintError $_): string {
    return 'Remove leading backslash';
  }

  public function getFixedNode(
    INamespaceUseDeclaration $node,
  ): INamespaceUseDeclaration {
    if ($node is NamespaceUseDeclaration) {
      $clauses = $node->getClauses();
      foreach ($clauses->getChildrenOfItems() as $clause) {
        $name = $clause->getName();
        if (!$name is QualifiedName) {
          continue;
        }
        $first = C\firstx($name->getParts()->toVec());
        if ($first->getItem() !== null) {
          // null item means we just have a separator - a leading backslash
          continue;
        }
        $clauses = $name->getParts()->withoutChild($first)
          |> $name->withParts($$)
          |> $clause->withName($$)
          |> $clauses->replace($clause, $$);
      }
      return $node->withClauses($clauses);
    }

    invariant(
      $node is NamespaceGroupUseDeclaration,
      'Got an unexpected INamespaceUseDeclaration subclass',
    );

    $first = C\firstx($node->getPrefix()->getParts()->toVec());
    if ($first->getItem() !== null) {
      return $node;
    }
    return $node->getPrefix()->getParts()->withoutChild($first)
      |> $node->getPrefix()->withParts($$)
      |> $node->withPrefix($$);
  }
}
