/*
 *  Copyright (c) 2017-present, Facebook, Inc.
 *  All rights reserved.
 *
 *  This source code is licensed under the MIT license found in the
 *  LICENSE file in the root directory of this source tree.
 *
 */

namespace Facebook\HHAST;

use type Facebook\HHAST\{
  ASTLintError,
  ASTLinter,
  FunctionToken,
  INamespaceUseDeclaration,
  NameToken,
  NamespaceDeclaration,
  NamespaceGroupUseDeclaration,
  NamespaceToken,
  NamespaceUseClause,
  NamespaceUseDeclaration,
  Node,
  QualifiedName,
  Script,
  TypeToken,
};
use namespace HH\Lib\{C, Str, Vec};

type use_definition_parts_t = shape(
  'parts' => vec<string>,
  'alias' => ?string,
  'node' => Node,
);
type package_private_use_definitions_t = shape(
  'function' => vec<use_definition_parts_t>,
  'namespace' => dict<string, use_definition_parts_t>,
  'type' => vec<use_definition_parts_t>,
);

final class PackagePrivateLinter extends ASTLinter {
  const type TContext = Script;
  const type TNode = Script;

  <<__Override>>
  public function getLintErrorForNode(
    this::TContext $context,
    this::TNode $node,
  ): ?ASTLintError {
    // Get the current namespace for the file.
    $current_namespace_for_file = vec[];
    $top_level_namespace = $this->getTopLevelNamespace($node);
    if ($top_level_namespace is nonnull) {
      $current_namespace_for_file = Str\split($top_level_namespace, '\\');
    }

    // Process all use statements present in the file.
    $use_definition_context_shape = $this->getUseDefinitions($context);
    $use_definition_context = Shapes::toArray(
      $use_definition_context_shape,
    );

    // Go through use definition to check for potential violations of package private.
    foreach ($use_definition_context as $_key => $use_definition_context_value) {
      foreach ($use_definition_context_value as $_inner_key => $use_definition_context_inner_value) {
        if (!$this->isPrivateNamespacePathAllowed(
          $use_definition_context_inner_value['parts'],
          $current_namespace_for_file
        )) {
          return new ASTLintError(
            $this,
            'Package private artifacts are private to the parent package',
            $use_definition_context_inner_value['node'],
          );
        }
      }
    }

    foreach ($node->getDescendantsOfType(QualifiedName::class) as $qualified_name_token) {
      if ($qualified_name_token->hasParts()) {
        $qualified_name_parts = $this->getQualifiedNameFlatten(
          $qualified_name_token,
          $use_definition_context_shape['namespace'],
          $current_namespace_for_file,
        );
        /**
         * In some cases, the current namespace is also a qualified name, 
         * so it gets filtered into a qualified name token in our for each loop.
         * We do not want to check for private keyword in that case.
         */
        if (C\count($qualified_name_parts) === C\count($current_namespace_for_file) &&
          $qualified_name_parts === $current_namespace_for_file) {
          continue;
        }
      
        if (!$this->isPrivateNamespacePathAllowed(
          $qualified_name_parts,
          $current_namespace_for_file,
        )) {
          return new ASTLintError(
            $this,
            'Package private artifacts can only be used within the top level parent package',
            $qualified_name_token,
          );
        }
      }
    }
    return null;
  }

  /**
   * This method takes in a given qualified name and the current namespace for the file (could be empty).
   * It checks if the qualified name has "private" in it, then it should be within the top level namespace.
   * eg: \Test1\__Private could be used in either \Test1 or \Test1\Test2 namespaces.
   */
  private function isPrivateNamespacePathAllowed(
    vec<string> $namepath_parts,
    vec<string> $current_namespace_for_file,
  ): bool {
    $private_in_method_call = C\contains($namepath_parts, '_Private')
      || C\contains($namepath_parts, '__Private');
    if ($private_in_method_call) {
      /**
       * If current namespace is empty, do not allow to use private artifacts.
       * Additionally, if the top level namespace does not match, we do not care for rest of the qualified path.
       */
      if (C\is_empty($current_namespace_for_file) || $current_namespace_for_file[0] !== $namepath_parts[0])
        return false;
    }
    return true;
  }

  /**
   * This method returns the namespace for the file defined at the very top.
   * eg: namespace TestNamespace; returns TestNamespace.
   */
  private function getTopLevelNamespace(this::TNode $node): ?string {
    $namespace = null;
    foreach ($node->getDescendantsOfType(NamespaceDeclaration::class) as $namespace_token) {
      $namespace = $namespace_token->getName();
      if ($namespace is null) {
        continue;
      }
      break;
    }
    return $namespace?->getCode();
  }

  /**
   * In some cases we don't have a fully qualified name.
   * For example TestNamespace::testMethod() does not have a fully qualified name.
   *
   * To resolve these we extract the `use type`, `use function`, `use namespace` definitions from the file.
   */
  private function getUseDefinitions(Script $script): package_private_use_definitions_t {
    $uses = shape(
      'function' => vec[],
      'namespace' => dict[],
      'type' => vec[],
    );

    $use_kind = (INamespaceUseDeclaration $node): ?string ==> {
      foreach ($node->getChildren() as $child) {
        if ($child is FunctionToken) {
          return 'function';
        }

        if ($child is NamespaceToken) {
          return 'namespace';
        }

        if ($child is TypeToken) {
          return 'type';
        }
      }

      return null;
    };

    foreach ($script->getDescendantsOfType(INamespaceUseDeclaration::class) as $use_decl) {
      if ($use_decl is NamespaceUseDeclaration) {
        foreach ($use_decl->getDescendantsOfType(NamespaceUseClause::class) as $use_clause) {
          $parts = vec[];
          $name = $use_clause->getName();

          if ($name is NameToken) {
            $parts[] = $name->getText();
          } else if ($name is QualifiedName) {
            foreach ($name->getDescendantsOfType(NameToken::class) as $name_token) {
              $parts[] = $name_token->getText();
            }
          }

          if (C\count($parts) > 1) {
            $alias = $use_clause->getAlias();
            $kind = $use_kind($use_decl);
            if ($kind is nonnull) {
              $shape_obj = shape(
                'parts' => $parts,
                'alias' => $alias?->getText(),
                'node' => $use_clause,
              );
              if ($kind === 'namespace') {
                $key = $parts[C\count($parts) - 1];
                $uses['namespace'][$key] = $shape_obj;
              } else if ($kind === 'function') {
                $uses['function'][] = $shape_obj;
              } else {
                $uses['type'][] = $shape_obj;
              }
            }
          }
        }
      }

      if ($use_decl is NamespaceGroupUseDeclaration) {
        $parts = vec[];

        foreach ($use_decl->getChildrenOfType(QualifiedName::class) as $qualified_name) {
          foreach ($qualified_name->getDescendantsOfType(NameToken::class) as $name_token) {
            $parts[] = $name_token->getText();
          }
        }

        foreach ($use_decl->getDescendantsOfType(NamespaceUseClause::class) as $use_clause) {
          $parts_item = vec[];
          $name = $use_clause->getName();
          if ($name is NameToken) {
            $parts_item[] = $name->getText();
          } else if ($name is QualifiedName) {
            foreach ($name->getDescendantsOfType(NameToken::class) as $name_token) {
              $parts_item[] = $name_token->getText();
            }
          }

          $parts_item = Vec\concat($parts, $parts_item);
          if (C\count($parts_item) > 1) {
            $alias = $use_clause->getAlias();
            $kind = $use_kind($use_decl);
            if ($kind is nonnull) {
              $shape_obj = shape(
                'parts' => $parts_item,
                'alias' => $alias?->getText(),
                'node' => $use_clause,
              );
              if ($kind === 'namespace') {
                $key = $parts[C\count($parts) - 1];
                $uses['namespace'][$key] = $shape_obj;
              } else if ($kind === 'function') {
                $uses['function'][] = $shape_obj;
              } else {
                $uses['type'][] = $shape_obj;
              }
            }
          }
        }
      }
    }

    return $uses;
  }

  /**
   * This function takes a qualified name token and flattens it into a vec of string, ignoring all '\'.
   * eg: \Test1\Private would become a vec[Test1, Private];
   */
  private function getQualifiedNameFlatten(
    QualifiedName $qualified_name,
    dict<string, use_definition_parts_t>
    $use_namespace_definitions_for_file,
    vec<string> $current_namespace_for_file,
  ): vec<string> {
    $parts = vec[];
    if ($qualified_name->hasParts()) {
      $absolute_path = false;
      $qualified_name_node = $qualified_name->getPartsx()->getChildren();

      foreach ($qualified_name_node as $index => $qualified_name_parts) {
        if ($index === 0 && $qualified_name_parts->getItem() is null
          && $qualified_name_parts->getSeparator()?->getText() === '\\'
        ) {
          $absolute_path = true;
        }
        $item = $qualified_name_parts->getItem();
        if ($item is nonnull)
          $parts[] = $item->getText();
      }

      if (!$absolute_path && C\count($parts) > 0) {
        /**
         * get the absolute path by checking the following: 
         * 1. Is the path mentioned in qualified name relative to one of the namespace in use namespace statement(s).
         * 2. Is the path mentioned in qualified name relative to the namespace of the current file.
         */
        $path_found = false;
        foreach ($use_namespace_definitions_for_file as $key => $use_definition_parts_value) {
          if ($key === $parts[0]) {
            $path_found = true;
            // add use_definition_parts_value[parts] to The $parts.
            $parts = Vec\concat(
              Vec\take(
                $use_namespace_definitions_for_file[$key]['parts'],
                C\count($use_namespace_definitions_for_file[$key]['parts']) - 1
              ),
              $parts
            );
            break;
          }
        }
        if (!$path_found && C\count($current_namespace_for_file) > 0) {
          $parts = Vec\concat($current_namespace_for_file, $parts);
        }
      }
    }
    return $parts;
  }
}
