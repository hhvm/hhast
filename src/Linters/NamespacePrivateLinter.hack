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
final class NamespacePrivateLinter extends ASTLinter {
  const type TConfig = shape();
  const type TContext = Script;
  const type TNode = Script;

  <<__Override>>
  public function getLintErrorForNode(
    this::TContext $context,
    this::TNode $node,
  ): ?ASTLintError {
    // Process all namespaces, use statements present in the file.
    $namespaces_details = $node->getNamespaces();

    // Go through namespace details and its uses to check for potential violations of private namespace boundaries.
    foreach ($namespaces_details as $namespace_detail_shape) {
      $current_namespace = $namespace_detail_shape['name'] ?? '';
      $namespace_uses = Shapes::toArray($namespace_detail_shape['uses']);

      foreach ($namespace_uses as $namespace_use_dict) {
        foreach ($namespace_use_dict as $aliased_ns) {
          if (
            !$this->isPrivateNamespacePathAllowed(
              $aliased_ns['name'],
              $current_namespace,
            )
          ) {
            return new ASTLintError(
              $this,
              'Artifacts belonging to a namespace are private to the parent namespace',
              $aliased_ns['use_clause'],
            );
          }
        }
      }
    }

    $traversed_qualified_names = varray[];
    foreach (
      $node->getDescendantsByType<QualifiedName>() as $qualified_name_token
    ) {
      $name_token_key = '';
      if ($qualified_name_token->hasParts()) {
        $name_token_key = $qualified_name_token->getDescendantsByType<
          NameToken,
        >()
          |> Vec\map(
            $$,
            $qualified_name_token ==> $qualified_name_token->getText(),
          )
          |> Str\join($$, '\\');
        if (qualified_name_is_fully_qualified($qualified_name_token)) {
          $name_token_key = '\\'.$name_token_key;
        }
      }

      // If a qualified token has already been traversed or has no parts, then skip it.
      if (
        Str\is_empty($name_token_key) ||
        C\contains($traversed_qualified_names, $name_token_key)
      ) {
        continue;
      }
      // Add the current qualified name token to the traversed list.
      $traversed_qualified_names[] = $name_token_key;

      // get the namespace for each qualified name token that we encounter.
      foreach ($namespaces_details as $ns) {
        if ($ns['children']->isAncestorOf($qualified_name_token)) {
          $current_namespace = $ns['name'] ?? '';
          $fully_qualified_name_for_current_token = '';

          $parent_node = $context->getParentOfDescendant($qualified_name_token);
          if (
            $parent_node is ScopeResolutionExpression ||
            $parent_node is NameExpression
          ) {
            $fully_qualified_name_for_current_token = $this->resolveScope(
              $name_token_key,
              $ns['uses']['namespaces'],
              $current_namespace,
            );
          } else if ($parent_node is FunctionCallExpression) {
            $fully_qualified_name_for_current_token = resolve_function(
              $name_token_key,
              $context,
              $qualified_name_token,
            )['name'];
          } else if ($parent_node is SimpleTypeSpecifier) {
            $fully_qualified_name_for_current_token = resolve_type(
              $name_token_key,
              $context,
              $qualified_name_token,
            )['name'];
          }
          /**
           * In some cases, the current namespace is also a qualified name, so it gets filtered into a qualified name token.
           * We do not want to check for private keyword in that case.
           */
          if ($fully_qualified_name_for_current_token === $current_namespace) {
            continue;
          }

          if (
            !$this->isPrivateNamespacePathAllowed(
              $fully_qualified_name_for_current_token,
              $current_namespace,
            )
          ) {
            return new ASTLintError(
              $this,
              'Artifacts belonging to a namespace are private to the parent namespace',
              $qualified_name_token,
            );
          }
        }
      }
    }
    return null;
  }

  /**
   * A function to resolve scope resolution expression and hhast expression. It uses the dictionary of
       * namespace statements in file to resolve the full path. If the path is not found in the dictionary,
       * then add the current namespace to the name token.
   */
  private function resolveScope(
    string $name_token_key,
    dict<string, Script::TAliasedNamespace> $namespaces,
    string $current_namespace,
  ): string {
    if (Str\search($name_token_key, '\\') === 0) {
      return Str\slice($name_token_key, 1);
    }
    $name_token_key_parts = Str\split($name_token_key, '\\');
    foreach ($namespaces as $namespace_key => $aliased_ns) {
      if (
        $namespace_key ===
          $name_token_key_parts[C\count($name_token_key_parts) - 1]
      ) {
        return $aliased_ns['name'];
      }
    }
    return $current_namespace.'\\'.$name_token_key;
  }

  /**
   * This method takes in a given qualified name and the current namespace for the file. It checks if
   * the qualified name has "private" in it, then it should be used in a similar first level parent namespace.
   * eg: \TeamJoins\__Private could be used in \TeamJoins or \TeamJoins\Invite namespaces.
   */
  private function isPrivateNamespacePathAllowed(
    string $namespace_path,
    string $current_file_namespace,
  ): bool {
    $namespace_path_parts = Str\split($namespace_path, '\\');
    $current_file_namespace_parts = Str\split($current_file_namespace, '\\');

    $private_in_method_call = C\contains($namespace_path_parts, '_Private') ||
      C\contains($namespace_path_parts, '__Private');
    if ($private_in_method_call) {
      /**
       * If current is empty, then it implies that the private namespace artifacts are used in unrestructured world.
       * We do not want that. Additionally, if the top level namespace does not match, we do not care for rest of the qualified path.
       */
      if (
        C\is_empty($current_file_namespace_parts) ||
        $current_file_namespace_parts[0] !== $namespace_path_parts[0]
      ) {
        return false;
      }
    }
    return true;
  }
}
