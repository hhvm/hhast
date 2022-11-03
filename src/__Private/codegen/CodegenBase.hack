/*
 *  Copyright (c) 2017-present, Facebook, Inc.
 *  All rights reserved.
 *
 *  This source code is licensed under the MIT license found in the
 *  LICENSE file in the root directory of this source tree.
 *
 */

namespace Facebook\HHAST\__Private;

use type Facebook\HackCodegen\{
  HackCodegenConfig,
  HackCodegenFactory,
  HackfmtFormatter,
};
use namespace Facebook\HHAST;
use namespace HH\Lib\{C, Dict, Keyset, Str, Vec};

abstract class CodegenBase {
  // Note to future maintainers:
  // This object is cloned using `clone` in `->withoutHackfmt()`.
  // If you add a reference (object) typed property, you must ensure
  // proper cloning semantics manually.
  private Schema\TSchema $schema;
  private bool $useHackfmt = true;

  public function __construct(
    Schema\TSchema $schema,
    private dict<string, keyset<string>> $relationships,
  ) {
    $this->schema = shape(
      'trivia' => Vec\sort_by($schema['trivia'], $t ==> $t['trivia_kind_name']),
      'tokens' => Vec\sort_by($schema['tokens'], $t ==> $t['token_kind']),
      'AST' => Vec\sort_by($schema['AST'], $t ==> $t['kind_name']),
      'version' => $schema['version'],
    );
  }

  abstract public function generate(): void;

  protected function getOutputDirectory(): string {
    return __DIR__.'/../../../codegen';
  }

  final public function withoutHackfmt(): this {
    invariant($this->useHackfmt, "can't disable hackfmt twice");
    /* Use of the native `clone` operator.
       This will become problematic when reference (object) typed properties are added.
       All properties are primitive, structural, or value arrays as of November 2021.
       Calling the constructor explcitly would cost a lot of needless re-`Vec\sort_by()` work.
       HHAST_FIXME[5562] */
    $new = clone $this;
    $new->useHackfmt = false;
    return $new;
  }

  final protected function getCodegenFactory(): HackCodegenFactory {
    $config = new HackCodegenConfig();
    if ($this->useHackfmt) {
      $config = $config->withFormatter(new HackfmtFormatter($config));
    }
    return new HackCodegenFactory($config);
  }

  final protected function getSchema(): Schema\TSchema {
    return $this->schema;
  }

  final protected function getRelationships(): dict<string, keyset<string>> {
    return $this->relationships;
  }

  final protected function getSchemaTokens(
  ): shape(
    'noText' => vec<Schema\TToken>,
    'fixedText' => vec<Schema\TToken>,
    'variableText' => vec<Schema\TToken>,
  ) {
    $ret = shape(
      'noText' => vec[],
      'fixedText' => vec[],
      'variableText' => vec[],
    );

    $asts = $this->getSchemaASTByKindName();

    foreach ($this->schema['tokens'] as $token) {
      if ($token['token_text'] !== null) {
        $ret['fixedText'][] = $token;
        continue;
      }
      if (C\contains_key($asts, $token['token_kind'])) {
        $ret['noText'][] = $token;
        continue;
      }
      $ret['variableText'][] = $token;
    }

    return $ret;
  }

  <<__Memoize>>
  final protected function getSchemaASTByKindName(): dict<string, Schema\TAST> {
    return Dict\pull($this->schema['AST'], $v ==> $v, $v ==> $v['kind_name']);
  }

  final protected static function getHandWrittenSyntaxKinds(): keyset<string> {
    return keyset['Missing', 'SyntaxList', 'Token', 'ListItem'];
  }

  private static function flipDictOfKeysets<Tk as arraykey, Tv as arraykey>(
    KeyedTraversable<Tk, keyset<Tv>> $in,
  ): dict<Tv, keyset<Tk>> {
    $flipped = dict[];
    foreach ($in as $k => $vs) {
      foreach ($vs as $v) {
        $flipped[$v] ??= keyset[];
        $flipped[$v][] = $k;
      }
    }
    return $flipped;
  }

  <<__Memoize>>
  final protected function getTraitsByImplementingClass(
  ): dict<string, keyset<string>> {
    return self::flipDictOfKeysets($this->getTraits());
  }

  <<__Memoize>>
  final protected function getTraits(
  ): dict<string, keyset<string>> {
    return dict[
      HHAST\AttributeAsAttributeSpecTrait::class => keyset[
        HHAST\ClassishDeclaration::class,
        HHAST\ParameterDeclaration::class,
      ],
    ]
      |> Dict\map_keys($$, $k ==> Str\strip_prefix($k, 'Facebook\\HHAST\\'))
      |> Dict\map($$,
        $vs ==> Keyset\map($vs, $v ==> Str\strip_prefix($v, 'Facebook\\HHAST\\'))
      );
  }

  <<__Memoize>>
  final protected function getMarkerInterfacesByImplementingClass(
  ): dict<string, keyset<string>> {
    return self::flipDictOfKeysets($this->getMarkerInterfacesByInterface());
  }

  <<__Memoize>>
  final protected function getMarkerInterfacesByInterface(
  ): dict<string, keyset<string>> {
    $ifs = dict[
      HHAST\IControlFlowStatement::class => keyset[
        HHAST\ILoopStatement::class,
        HHAST\ElseClause::class,
        HHAST\IfStatement::class,
        HHAST\SwitchStatement::class,
      ],
      HHAST\IClassBodyDeclaration::class => keyset[
        HHAST\MethodishDeclaration::class,
        HHAST\MethodishTraitResolution::class,
        HHAST\ContextConstDeclaration::class,
        HHAST\ConstDeclaration::class,
        HHAST\PropertyDeclaration::class,
        HHAST\RequireClause::class,
        HHAST\TraitUse::class,
        HHAST\TypeConstDeclaration::class,
        HHAST\XHPCategoryDeclaration::class,
        HHAST\XHPClassAttributeDeclaration::class,
        HHAST\XHPChildrenDeclaration::class,
      ],
      HHAST\IComment::class => keyset[
        HHAST\SingleLineComment::class,
        HHAST\DelimitedComment::class,
      ],
      HHAST\IDeclaration::class => keyset[
        HHAST\ClassishDeclaration::class,
        // IFunctionishDeclaration
      ],
      HHAST\IFunctionishDeclaration::class => keyset[
        HHAST\FunctionDeclaration::class,
        HHAST\MethodishDeclaration::class,
      ],
      HHAST\IFunctionCallishExpression::class => keyset[
        HHAST\FunctionCallExpression::class,
        HHAST\ObjectCreationExpression::class,
      ],
      HHAST\IHasFunctionBody::class => keyset[
        HHAST\IFunctionishDeclaration::class,
        HHAST\AnonymousFunction::class,
        HHAST\AwaitableCreationExpression::class,
        HHAST\LambdaExpression::class,
      ],
      HHAST\IHasTypeHint::class => keyset[
        HHAST\IParameter::class,
        HHAST\PropertyDeclaration::class,
      ],
      HHAST\IHackArray::class => keyset[
        HHAST\DictionaryIntrinsicExpression::class,
        HHAST\KeysetIntrinsicExpression::class,
        HHAST\VectorIntrinsicExpression::class,
      ],
      HHAST\IContainer::class => keyset[
        HHAST\IHackArray::class,
        HHAST\DarrayIntrinsicExpression::class,
        HHAST\VarrayIntrinsicExpression::class,
        HHAST\CollectionLiteralExpression::class,
      ],
      HHAST\IHasOperator::class => keyset[
        HHAST\BinaryExpression::class,
        HHAST\PrefixUnaryExpression::class,
        HHAST\PostfixUnaryExpression::class,
      ],
      HHAST\ILambdaBody::class => keyset[
        HHAST\IExpression::class,
        HHAST\CompoundStatement::class,
      ],
      HHAST\ILambdaSignature::class => keyset[
        HHAST\VariableExpression::class,
        HHAST\LambdaSignature::class,
      ],
      HHAST\ILoopStatement::class => keyset[
        HHAST\DoStatement::class,
        HHAST\ForStatement::class,
        HHAST\ForeachStatement::class,
        HHAST\WhileStatement::class,
      ],
      HHAST\IHasAttributeSpec::class => keyset[
        HHAST\AliasDeclaration::class,
        HHAST\AwaitableCreationExpression::class,
        HHAST\AnonymousFunction::class,
        HHAST\ClassishDeclaration::class,
        HHAST\MethodishDeclaration::class,
        HHAST\EnumDeclaration::class,
        HHAST\FunctionDeclaration::class,
        HHAST\ParameterDeclaration::class,
        HHAST\PropertyDeclaration::class,
        HHAST\LambdaExpression::class,
        // HHAST\Php7AnonymousFunction::class : not valid in hack. No attributes
        // if not hack
      ],
      HHAST\INameishNode::class => keyset[
        HHAST\NameToken::class,
        HHAST\QualifiedName::class,
        HHAST\XHPCategoryNameToken::class,
        HHAST\XHPClassNameToken::class,
      ],
      HHAST\INamespaceBody::class => keyset[
        HHAST\NamespaceBody::class,
        HHAST\NamespaceEmptyBody::class,
      ],
      HHAST\INamespaceUseDeclaration::class => keyset[
        HHAST\NamespaceUseDeclaration::class,
        HHAST\NamespaceGroupUseDeclaration::class,
      ],
      HHAST\IParameter::class => keyset[
        HHAST\ParameterDeclaration::class,
        HHAST\VariadicParameter::class,
      ],
      HHAST\IExpression::class => Keyset\union(
        keyset[
          // Constants aren't here as they need to be wrapped in NameExpressions
          HHAST\AnonymousFunction::class,
          HHAST\IHasOperator::class,
          HHAST\VariableToken::class,
          HHAST\XHPChildrenDeclaration::class,
          HHAST\XHPChildrenParenthesizedList::class,
        ],
        Vec\filter(
          $this->getSchema()['AST'],
          $node ==> Str\ends_with($node['kind_name'], 'Expression'),
        )
          |> Keyset\map($$, $node ==> $node['kind_name']),
      ),
      HHAST\ISimpleCreationSpecifier::class => keyset[
        HHAST\SimpleTypeSpecifier::class,
        HHAST\GenericTypeSpecifier::class,
      ],
      HHAST\IStatement::class => Keyset\union(
        keyset[
          HHAST\InclusionDirective::class,
          HHAST\SwitchFallthrough::class,
          HHAST\UsingStatementBlockScoped::class,
          HHAST\UsingStatementFunctionScoped::class,
        ],
        Vec\filter(
          $this->getSchema()['AST'],
          $node ==> Str\ends_with($node['kind_name'], 'Statement'),
        )
          |> Keyset\map($$, $node ==> $node['kind_name']),
      ),
      HHAST\IStringLiteral::class => keyset[
        HHAST\SingleQuotedStringLiteralToken::class,
        HHAST\DoubleQuotedStringLiteralToken::class,
        HHAST\HeredocStringLiteralToken::class,
        HHAST\NowdocStringLiteralToken::class,
      ],
      HHAST\ISwitchLabel::class => keyset[
        HHAST\CaseLabel::class,
        HHAST\DefaultLabel::class,
      ],
      HHAST\ITraitUseItem::class => keyset[
      ],
      HHAST\ITypeSpecifier::class => Keyset\union(
        keyset[
          HHAST\ReifiedTypeArgument::class,
          // Dubious:
          HHAST\TypeConstant::class,
          HHAST\VariadicParameter::class,
          HHAST\XHPEnumType::class,
          HHAST\TypeRefinement::class,
        ],
        Vec\filter(
          $this->getSchema()['AST'],
          $node ==> Str\ends_with($node['kind_name'], 'Specifier'),
        )
          |> Keyset\map($$, $node ==> $node['kind_name']),
      ),
      HHAST\IXHPAttribute::class => keyset[
        HHAST\XHPClassAttribute::class,
        HHAST\XHPSimpleAttribute::class,
      ],
      IWrappableWithSimpleTypeSpecifier::class => keyset[
        HHAST\NameToken::class,
        HHAST\NoreturnToken::class,
        HHAST\ParentToken::class,
        HHAST\QualifiedName::class,
        HHAST\SelfToken::class,
        HHAST\StaticToken::class,
        HHAST\ThisToken::class,
        HHAST\VariableToken::class,
        HHAST\XHPClassNameToken::class,
      ],
    ]
      |> Dict\map_keys($$, $key ==> Str\strip_prefix($key, 'Facebook\\HHAST\\'))
      |> Dict\map(
        $$,
        $impls ==> Keyset\map(
          $impls,
          $impl ==> Str\strip_prefix($impl, 'Facebook\\HHAST\\'),
        ),
      );

    foreach ($ifs as $if => $impls) {
      foreach ($impls as $impl) {
        if (Str\starts_with($impl, 'I') && C\contains_key($ifs, $impl)) {
          unset($impls[$impl]);
          $impls = Keyset\union($impls, $ifs[$impl]);
        }
      }
      $ifs[$if] = $impls;
    }
    return $ifs;
  }
}
