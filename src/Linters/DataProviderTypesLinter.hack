/*
 *  Copyright (c) 2017-present, Facebook, Inc.
 *  All rights reserved.
 *
 *  This source code is licensed under the MIT license found in the
 *  LICENSE file in the root directory of this source tree.
 *
 */

namespace Facebook\HHAST;

use namespace HH\Lib\{C, Dict, Math, Str, Vec};

final class DataProviderTypesLinter extends AutoFixingASTLinter {
  const type TContext = ClassishDeclaration;
  const type TNode = FunctionDeclarationHeader;
  //dict<provider, vec<(test, provider again)>>
  const type TProviders = dict<string, vec<(string, string)>>;

  /**
   * We don't want to use DataProvider::class here,
   * since this would require that you have HackTest installed when you wish to lint.
   */
  const string T_DATAPROVIDER = 'Facebook\\HackTest\\DataProvider';
  const string T_NOTHING = 'nothing';

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

    list($err, $tuple_type) = $this->jugdeReturnTypes($hhast_method, $node);

    if ($err is nonnull) {
      return $err;
    }

    foreach ($data_providers[$method_name] as list($test, $_)) {
      $err = $this->judgeTestTypes(
        $node,
        $tuple_type as nonnull,
        $hhast_methods[$test],
      );
      if ($err is nonnull) {
        return $err;
      }
    }

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
          'Add a return type to your dataprovider',
          $node,
          null,
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
          null,
        ),
        null,
      );
    }

    if (!$inner_type is TupleTypeSpecifier) {
      return tuple(
        new ASTLintError(
          $this,
          'Use a tuple as the contained-value type of your return type',
          $node,
          null,
        ),
        null,
      );
    }

    return tuple(null, $inner_type);
  }

  private function judgeTestTypes(
    this::TNode $node,
    TupleTypeSpecifier $data_provider_types,
    FunctionDeclarationHeader $test,
  ): ?ASTLintError {
    $test_types_with_nulls = ($test->getParameterList()?->toVec() ?? vec[])
      |> Vec\map($$, $li ==> $li->getItem()->getType());

    $test_types = Vec\filter_nulls($test_types_with_nulls);

    if (C\count($test_types_with_nulls) !== C\count($test_types)) {
      return new ASTLintError(
        $this,
        Str\format('Add parameter types to %s', $test->getName()->getText()),
        $node,
        null,
      );
    }

    $tuple_types = $data_provider_types->getTypes()->toVec()
      |> Vec\map($$, $li ==> $li->getItem());

    $tuple_arity = C\count($tuple_types);
    $test_arity = C\count($test_types);

    if ($tuple_arity !== $test_arity) {
      return new ASTLintError(
        $this,
        Str\format(
          'Type error: Test %s requires %d parameter(s), but this dataprovider provides %d',
          $test->getName()->getText(),
          $test_arity,
          $tuple_arity,
        ),
        $node,
        null,
      );
    }

    // Vec\zip() ;)
    for ($i = 0; $i < $tuple_arity; ++$i) {
      $tuple_type = $tuple_types[$i];
      $test_type = $test_types[$i];
      if (!static::typesAreCompatible($tuple_type, $test_type)) {
        return new ASTLintError(
          $this,
          Str\format(
            'Potential type error: Parameter %d on method %s is of type %s, but the DataProvider provides %s',
            $i + 1,
            $test->getName()->getText(),
            static::typeToString($test_type),
            static::typeToString($tuple_type),
          ),
          $node,
          null,
        );
      }
    }

    return null;
  }

  <<__Memoize>>
  private function getInfoAboutTestFile(
    this::TContext $context,
  ): ?shape(
    'data_providers' => this::TProviders,
    'hhast_methods' => dict<string, FunctionDeclarationHeader>,
  ) {
    if (!Str\ends_with_ci($context->getNamex()->getText(), 'Test')) {
      return null;
    }

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

  /**
   * This function is extremely pedantic about what it means for types to be equal.
   * It works well for simple types (scalars, interfaces, classes and Traversables of the afore mentioned).
   * It does however fail hard on shapes (since their key order is not part of the type).
   * This is mostly a best effort and tradeoff with performance.
   * This function may need to be improved if there are too many false negatives.
   */
  private static function typesAreCompatible(
    ITypeSpecifier $from,
    ITypeSpecifier $to,
  ): bool {
    $from = static::shrinkType($from);
    $to = static::shrinkType($to);

    $count = Math\minva(C\count($from), C\count($to));

    for ($i = 0; $i < $count; ++$i) {
      $from_text = $from[$i];
      $to_text = $to[$i];
      if (
        !static::isSafeAssignment($from_text, $to_text) &&
        !static::isSafeMixedAssignment($from, $to, $i)
      ) {
        return false;
      }
    }

    return true;
  }

  private static function isSafeAssignment(
    string $from_text,
    string $to_text,
  ): bool {
    return $from_text === $to_text ||
      $from_text === self::T_NOTHING ||
      static::isGeneric($from_text) ||
      static::isGeneric($to_text);
  }

  /**
   * The following situation is super common in hsl code.
   * `mixed` assign to `?T`, which fails under the current rules.
   * However, we could make this pass, since `mixed` assign to `T` is already safe.
   * This exception will only work at the top-level type.
   * Embedded types like KeyedTraversable<mixed, mixed> assign to `KeyedTraversable<?T, mixed>`
   * still fail, because `mixed` is one syllable shorter than `?T`, which desyncs the node streams.
   */
  private static function isSafeMixedAssignment(
    vec<string> $from,
    vec<string> $to,
    int $i,
  ): bool {
    $to_text = $to[$i];
    $from_text = $from[$i];
    return $to_text === '?' &&
      static::isSafeAssignment($from_text, $to[$i + 1] ?? $from_text);
  }

  private static function shrinkType(ITypeSpecifier $type): vec<string> {
    return Vec\filter($type->traverse(), $inner ==> $inner is Token)
      |> Vec\map($$, $token ==> $token as Token->getText());
  }

  private static function typeToString(ITypeSpecifier $type): string {
    return Str\join(static::shrinkType($type), '');
  }

  private static function isGeneric(string $string): bool {
    return (Str\starts_with($string, 'T')) && \ctype_alnum($string);
  }
}
