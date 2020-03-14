/*
 *  Copyright (c) 2017-present, Facebook, Inc.
 *  All rights reserved.
 *
 *  This source code is licensed under the MIT license found in the
 *  LICENSE file in the root directory of this source tree.
 *
 */

namespace Facebook\HHAST;

use type Facebook\HackTest\DataProvider;
use namespace HH\Lib\{C, Dict, Str, Vec};

final class UseCanonicalDataProvidersLinter extends AutoFixingASTLinter {
  const type TContext = ClassishDeclaration;
  const type TNode = FunctionDeclarationHeader;
  // dict<provider, vec<(test, provider again)>>
  const type TProviders = dict<string, vec<(string, string)>>;

  <<__Override>>
  public function getLintErrorForNode(
    this::TContext $context,
    this::TNode $node,
  ): ?ASTLintError {
    $info = $this->getInfoAboutTestFile($context);
    if ($info is null) {
      return null;
    }

    list($data_providers, $reflection_class, $reflection_methods) = tuple(
      $info['data_providers'],
      $info['reflection_class'],
      $info['reflection_methods'],
    );

    $method_name = $node->getName()->getText();

    if (!C\contains_key($data_providers, $method_name)) {
      return null;
    }

    $reflection_method = $reflection_methods[$method_name];
    $return_type = $reflection_method->getReturnType();

    // Only in partial files
    if ($return_type is null) {
      return new ASTLintError(
        $this,
        'Add a typehint to your dataprovider',
        $node,
        () ==> null,
      );
    }

    echo Str\format(
      "Method %s::%s is a dataprovider for [%s] and has a return type of %s\n",
      $reflection_class->getName(),
      $method_name,
      Vec\map($data_providers[$method_name], $tuple ==> $tuple[0])
        |> Str\join($$, ', '),
      $return_type->__toString(),
    );

    return null;
  }

  <<__Memoize>>
  private function getInfoAboutTestFile(
    this::TContext $context,
  ): ?shape(
    'data_providers' => this::TProviders,
    'reflection_class' => \ReflectionClass,
    'reflection_methods' => dict<string, \ReflectionMethod>,
  ) {
    $script = $this->getAST();
    $namespaces = $script->getNamespaces()
      |> Vec\map($$, $ns ==> $ns['name'])
      |> Vec\filter_nulls($$);

    if (C\count($namespaces) > 1) {
      \trigger_error(Str\format(
        'Could not process "%s". I do not support multiple namespaces yet, got %d.',
        $this->getFile()->getPath(),
        C\count($namespaces),
      ));
    }

    if (C\is_empty($namespaces)) {
      $reflection_class = new \ReflectionClass($context->getName()->getText());
    } else {
      $reflection_class = new \ReflectionClass(
        $namespaces[0].'\\'.$context->getName()->getText(),
      );
    }

    $reflection_methods = $reflection_class->getMethods();

    $data_providers = $reflection_methods
      |> Vec\map(
        $$,
        $method ==> tuple(
          $method->getName(),
          $method->getAttributeClass(DataProvider::class)?->provider ??
            '<no provider>',
        ),
      )
      |> Dict\group_by($$, $row ==> $row[1]);

    unset($data_providers['<no provider>']);

    if (C\is_empty($data_providers)) {
      return null;
    }

    $reflection_methods = Dict\from_values(
      $reflection_methods,
      $meth ==> $meth->getName(),
    );

    return shape(
      'data_providers' => $data_providers,
      'reflection_class' => $reflection_class,
      'reflection_methods' => $reflection_methods,
    );
  }
}
