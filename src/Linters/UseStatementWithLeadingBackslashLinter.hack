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
  BackslashToken,
  INamespaceUseDeclaration,
  NamespaceGroupUseDeclaration,
  NamespaceUseDeclaration,
  Script,
};

final class UseStatementWithLeadingBackslashLinter extends AutoFixingASTLinter {
  const type TNode = INamespaceUseDeclaration;
  const type TContext = Script;

  <<__Override>>
  public function getLintErrorForNode(
    Script $_context,
    INamespaceUseDeclaration $node,
  ): ?ASTLintError {
    $matched = false;
    if ($node instanceof NamespaceGroupUseDeclaration) {
      $prefix = $node->getPrefix()->getFirstToken();
      if (!$prefix instanceof BackslashToken) {
        return null;
      }
      $matched = true;
    } else {
      foreach ($node->getClausesx()->getChildrenOfItems() as $clause) {
        $name = $clause->getName()->getFirstToken();
        if ($name instanceof BackslashToken) {
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
      "Leading backslashes on `use` statements do nothing",
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
    if ($node instanceof NamespaceUseDeclaration) {
      $clauses = $node->getClauses();
      foreach ($clauses->getChildrenOfItems() as $clause) {
        $t = $clause->getName()->getFirstTokenx();
        if (!$t instanceof BackslashToken) {
          continue;
        }
        $clauses = $clauses->without($t);
      }
      return $node->withClauses($clauses);
    }

    invariant(
      $node instanceof NamespaceGroupUseDeclaration,
      "Got an unexpected INamespaceUseDeclaration subclass",
    );

    $first = $node->getPrefix()->getFirstToken();
    if ($first === null || !$first instanceof BackslashToken) {
      return $node;
    }

    $new = $node->without($first);
    invariant(
      $new instanceof NamespaceGroupUseDeclaration,
      'unexpected type change',
    );
    return $new;
  }
}
