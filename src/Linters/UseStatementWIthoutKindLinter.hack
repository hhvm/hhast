/*
 *  Copyright (c) 2017-present, Facebook, Inc.
 *  All rights reserved.
 *
 *  This source code is licensed under the MIT license found in the
 *  LICENSE file in the root directory of this source tree.
 *
 */

namespace Facebook\HHAST;

use namespace HH\Lib\{C, Keyset};

final class UseStatementWithoutKindLinter extends AutoFixingASTLinter {
  const type TNode = INamespaceUseDeclaration;
  const type TContext = Script;

  <<__Override>>
  public function getLintErrorForNode(
    Script $_context,
    INamespaceUseDeclaration $node,
  ): ?ASTLintError {
    if ($node->hasKind()) {
      return null;
    }

    return new ASTLintError(
      $this,
      'Use `use type` or `use namespace`',
      $node,
      () ==> $this->getFixedNode($node),
    );
  }

  <<__Override>>
  protected function getTitleForFix(ASTLintError $e): string {
    $fixed = $this->getFixedNode($e->getBlameNode() as this::TNode);
    invariant(
      $fixed !== null,
      "Shouldn't be asked to provide a fix title when there is no fix",
    );
    return 'Switch to `use '.$fixed->getKindx()->getText().'`';
  }

  public function getFixedNode(
    INamespaceUseDeclaration $node,
  ): ?INamespaceUseDeclaration {
    // Figure out what names are imported
    $names = Keyset\map(
      $node->getClauses()->getChildrenOfItems(),
      $clause ==> {
        if ($clause->hasAs()) {
          return $clause->getAsx()->getText();
        }
        $name = $clause->getName();
        if ($name is QualifiedName) {
          return (
            C\lastx(
              $name->getParts()->getChildrenOfItemsOfType(NameToken::class),
            ) as nonnull
          )->getText();
        }
        invariant(
          $name is NameToken,
          'Expected a Qualified or NameToken, got %s',
          \get_class($name),
        );
        return $name->getText();
      },
    );

    // We need to look at the full file to figure out if this should be a
    // `use type`, or `use namespace`
    $used = $this->getUnresolvedReferencedNames();
    $used_as_ns = C\any(
      $names,
      $name ==> C\contains($used['namespaces'], $name),
    );
    $used_as_type = C\any($names, $name ==> C\contains($used['types'], $name));

    $leading = $node->getClauses()->getFirstTokenx()->getLeadingWhitespace();
    $trailing = $node->getKeywordx()->getTrailingWhitespace();
    $leading = $leading === null ? new NodeList() : new NodeList(vec[$leading]);
    if ($used_as_type && !$used_as_ns) {
      return $node->withKind(new TypeToken($leading, $trailing));
    }
    if ($used_as_ns && !$used_as_type) {
      return $node->withKind(new NamespaceToken($leading, $trailing));
    }

    // Unused, or ambiguous
    return null;
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
