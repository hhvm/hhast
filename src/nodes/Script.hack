/*
 *  Copyright (c) 2017-present, Facebook, Inc.
 *  All rights reserved.
 *
 *  This source code is licensed under the MIT license found in the
 *  LICENSE file in the root directory of this source tree.
 *
 */

namespace Facebook\HHAST;

use namespace HH\Lib\{C, Dict, Vec};

final class Script extends ScriptGeneratedBase {
  <<__Memoize>>
  public function getTokens(): vec<Token> {
    return $this->getDescendantsOfType(Token::class);
  }

  <<__Memoize>>
  private function getTokenIndices(): dict<int, int> {
    return Dict\pull_with_key(
      $this->getTokens(),
      ($k, $_v) ==> $k,
      ($_k, $v) ==> $v->getUniqueID(),
    );
  }

  public function getPreviousToken(Token $token): ?Token {
    $idx = $this->getTokenIndices()[$token->getUniqueID()];
    if ($idx === 0) {
      return null;
    }
    return $this->getTokens()[$idx - 1];
  }

  public function getNextToken(Token $token): ?Token {
    $idx = $this->getTokenIndices()[$token->getUniqueID()];
    return $this->getTokens()[$idx + 1] ?? null;
  }

  const type TNamespace = shape(
    'name' => ?string,
    'children' => NodeList<Node>,
    'uses' => shape(
      'namespaces' => dict<string, string>,
      'types' => dict<string, string>,
      'functions' => dict<string, string>,
    ),
  );

  /**
   * Returns all namespaces along with a list of `use`s applicable inside each
   * namespace. Also returns a NodeList of declarations belonging to each
   * namespace, which are correctly resolved for namespace declarations both
   * with and without a body.
   */
  <<__Memoize>>
  public function getNamespaces(): vec<this::TNamespace> {
    $all_declarations = $this->getDeclarationsx()->getChildren();
    $global_declarations = vec[];
    $namespaces = vec[];

    $idx = 0;
    while ($idx < C\count($all_declarations)) {
      $namespace = $all_declarations[$idx];
      $idx++;
      if (!$namespace is NamespaceDeclaration) {
        if (!$namespace is EndOfFile) {
          $global_declarations[] = $namespace;
        }
        continue;
      }

      $body = $namespace->getBody();
      if ($body is NamespaceBody) {
        $namespaces[] = shape(
          'name' => $namespace->getQualifiedNameAsString(),
          'children' =>
            $body->getDeclarations() ?? NodeList::createMaybeEmptyList(vec[]),
        );
        continue;
      }

      // Everything until the next namespace declaration belongs to this
      // namespace.
      $children = vec[];
      while (
        $idx < C\count($all_declarations) &&
        !$all_declarations[$idx] is NamespaceDeclaration
      ) {
        $children[] = $all_declarations[$idx];
        $idx++;
      }

      $namespaces[] = shape(
        'name' => $namespace->getQualifiedNameAsString(),
        'children' => NodeList::createMaybeEmptyList($children),
      );
    }

    $global_nodelist = NodeList::createMaybeEmptyList($global_declarations);

    // Add-in the global namespace.
    if (!$global_nodelist->isEmpty()) {
      $namespaces[] = shape(
        'name' => null,
        'children' => $global_nodelist,
      );
    }

    // Normalize name and calculate `use`s for each namespace.

    // Global `use` declarations apply to each namespace.
    $outer = __Private\Resolution\get_uses_directly_in_scope($global_nodelist);

    return Vec\map(
      $namespaces,
      $ns ==> {
        if ($ns['name'] === '') {
          $ns['name'] = null;
        }
        $inner =
          __Private\Resolution\get_uses_directly_in_scope($ns['children']);
        $ns['uses'] = shape(
          'namespaces' =>
            Dict\merge($outer['namespaces'], $inner['namespaces']),
          'types' => Dict\merge($outer['types'], $inner['types']),
          'functions' => Dict\merge($outer['functions'], $inner['functions']),
        );
        return $ns;
      },
    );
  }

  /**
   * Find all nodes that have generics and return both the nodes and their
   * generics.
   */
  <<__Memoize>>
  public function getNodesWithGenerics(): vec<(Node, TypeParameters)> {
    $root = $this->getDeclarationsx();

    // Sadly these don't have a consistent API so we need a separate Vec\map
    // for each node type.
    $nodes_with_maybe_generics = Vec\concat(
      // classes/interfaces/traits
      Vec\map(
        $root->getDescendantsOfType(ClassishDeclaration::class),
        $n ==> tuple($n, $n->getTypeParameters()),
      ),
      // type declarations
      Vec\map(
        $root->getDescendantsOfType(AliasDeclaration::class),
        $n ==> tuple($n, $n->getGenericParameter()),
      ),
      Vec\map(
        $root->getDescendantsOfType(TypeConstDeclaration::class),
        $n ==> tuple($n, $n->getTypeParameters() as ?TypeParameters),
      ),
      // functions/methods
      Vec\map(
        $root->getDescendantsOfType(FunctionDeclaration::class),
        $n ==> tuple($n, $n->getDeclarationHeader()->getTypeParameterList()),
      ),
      Vec\map(
        $root->getDescendantsOfType(MethodishDeclaration::class),
        $n ==> tuple($n, $n->getFunctionDeclHeader()->getTypeParameterList()),
      ),
      // whatever this is
      Vec\map(
        $root->getDescendantsOfType(MethodishTraitResolution::class),
        $n ==> tuple(
          $n,
          $n->getFunctionDeclHeader() as FunctionDeclarationHeader
            ->getTypeParameterList(),
        ),
      ),
    );

    $nodes_with_generics = vec[];
    foreach ($nodes_with_maybe_generics as list($node, $maybe_generics)) {
      if ($maybe_generics is nonnull) {
        $nodes_with_generics[] = tuple($node, $maybe_generics);
      }
    }
    return $nodes_with_generics;
  }
}
