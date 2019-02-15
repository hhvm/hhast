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
  EditableNode,
  INamespaceUseDeclaration,
  NamespaceGroupUseDeclaration,
  NamespaceUseDeclaration,
  NamespaceUseClause,
};

final class UseStatementWithLeadingBackslashLinter
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
  ): ?ASTLintError<INamespaceUseDeclaration> {
    $matched = false;
    if ($node instanceof NamespaceGroupUseDeclaration) {
      $prefix = $node->getPrefix()->getFirstToken();
      if (!$prefix instanceof BackslashToken) {
        return null;
      }
      $matched = true;
    } else {
      foreach ($node->getClausesx()->getItems() as $clause) {
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
    );
  }

  <<__Override>>
  protected function getTitleForFix(LintError $_): string {
    return 'Remove leading backslash';
  }

  <<__Override>>
  public function getFixedNode(
    INamespaceUseDeclaration $node,
  ): INamespaceUseDeclaration {
    if ($node instanceof NamespaceUseDeclaration) {
      return $node->rewriteDescendants(($n, $_p) ==> {
        if (!$n instanceof NamespaceUseClause) {
          return $n;
        }
        $first = $n->getName()->getFirstToken();
        if (!$first instanceof BackslashToken) {
          return $n;
        }
        return $n->without($first);
      });
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
