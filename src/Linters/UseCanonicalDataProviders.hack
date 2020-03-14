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

final class UseCanonicalDataProvidersLinter extends AutoFixingASTLinter {
  const type TContext = ClassishDeclaration;
  const type TNode = FunctionDeclarationHeader;
  // dict<provider, vec<(test, provider again)>>
  const type TProviders = dict<string, vec<(string, string)>>;

  const string T_DATAPROVIDER = 'Facebook\\HackTest\\DataProvider';

  <<__Override>>
  public function getLintErrorForNode(
    this::TContext $context,
    this::TNode $node,
  ): ?ASTLintError {
    $info = $this->getInfoAboutTestFile($context);
    if ($info is null) {
      return null;
    }

    list($data_providers, $hhast_methods) = tuple(
      $info['data_providers'],
      $info['hhast_methods'],
    );

    $method_name = $node->getName()->getText();

    if (!C\contains_key($data_providers, $method_name)) {
      return null;
    }

    $hhast_method = $hhast_methods[$method_name];

    list($err, $_tuple_type) = $this->jugdeReturnTypes($hhast_method, $node);

    if ($err is nonnull) {
      return $err;
    }

    // TODO: Write validation for assignability from dataprovider to test method here.

    return null;
  }

  private function jugdeReturnTypes(
    FunctionDeclarationHeader $hhast_method,
    this::TNode $node,
  ): (?ASTLintError, ?TupleTypeSpecifier) {
    $return_type = $hhast_method->getType();

    // Only in partial files
    if ($return_type is null) {
      return tuple(
        new ASTLintError(
          $this,
          'Add a typehint to your dataprovider',
          $node,
          () ==> null,
        ),
        null,
      );
    }

    if ($return_type is VectorTypeSpecifier) {
      $inner_type = $return_type->getTypex();
    } else if ($return_type is DictionaryTypeSpecifier) {
      $inner_type = $return_type->getMembersx()->toVec()[1]->getItem();
    } else {
      return tuple(
        new ASTLintError(
          $this,
          'Use vec<_> or dict<_, _> return types',
          $node,
          () ==> null,
        ),
        null,
      );
    }

    if (!$inner_type is TupleTypeSpecifier) {
      return tuple(
        new ASTLintError(
          $this,
          'Use a tuple as the value type of your return type',
          $node,
          () ==> null,
        ),
        null,
      );
    }

    return tuple(null, $inner_type);
  }

  <<__Memoize>>
  private function getInfoAboutTestFile(
    this::TContext $context,
  ): ?shape(
    'data_providers' => this::TProviders,
    'hhast_methods' => dict<string, FunctionDeclarationHeader>,
  ) {
    $methods = $context->getDescendantsOfType(MethodishDeclaration::class);

    $data_providers = $methods
      |> Vec\map(
        $$,
        $method ==> tuple(
          $method->getFunctionDeclHeader()->getName()->getText(),
          $this->getDataProviderName($method, $this->getAST()) ??
            '<no provider>',
        ),
      )
      |> Dict\group_by($$, $row ==> $row[1]);

    unset($data_providers['<no provider>']);

    if (C\is_empty($data_providers)) {
      return null;
    }

    $hhast_methods = Dict\pull(
      $methods,
      $meth ==> $meth->getFunctionDeclHeader(),
      $meth ==> $meth->getFunctionDeclHeader()->getNamex()->getText(),
    );


    return shape(
      'data_providers' => $data_providers,
      'hhast_methods' => $hhast_methods,
    );
  }

  private function getDataProviderName(
    MethodishDeclaration $method,
    Script $script,
  ): ?string {
    $attributes = $method->getAttributeSpec()?->getAttributes()?->toVec();
    if ($attributes is null) {
      return null;
    }

    $data_provider_attr = C\find(
      $attributes,
      $li ==> {
        // For attributes without arguments like `__Memoize`.
        $name = $li->getItem()->getType()->getChildren()['specifier'] ?? null;
        if ($name is null) {
          return false;
        }

        if ($name is NameToken) {
          $string_name = $name->getText();
        } else if ($name is QualifiedName) {
          $string_name = $name->getDescendantsOfType(NameToken::class)
            |> Vec\map($$, $name ==> $name->getText())
            |> Str\join($$, '\\');
          if (qualified_name_is_fully_qualified($name)) {
            $string_name = '\\'.$string_name;
          }
        } else {
          invariant_violation('Unexpected type %s for name', \get_class($name));
        }
        return resolve_type($string_name, $script, $name)['name'] ===
          static::T_DATAPROVIDER;
      },
    );

    if ($data_provider_attr is null) {
      return null;
    }

    return $data_provider_attr->getItem()
      ->getArgumentListx()
      ->toVec()[0]->getItem()
      ->getFirstTokenx()
      ->getText()
      |> Str\trim($$, '"\'');
  }
}
