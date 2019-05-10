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

use namespace HH\Lib\{C, Dict, Keyset, Str, Vec};

abstract class CodegenBase {
  private Schema\TSchema $schema;

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

  private bool $useHackfmt = true;

  final public function withoutHackfmt(): this {
    invariant($this->useHackfmt, "can't disable hackfmt twice");
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
    $ret =
      shape('noText' => vec[], 'fixedText' => vec[], 'variableText' => vec[]);

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
    return keyset['Missing', 'SyntaxList', 'Token'];
  }

  <<__Memoize>>
  final protected function getMarkerInterfacesByImplementingClass(
  ): dict<string, keyset<string>> {
    $by_implementation = dict[];
    foreach ($this->getMarkerInterfacesByInterface() as $if => $classes) {
      foreach ($classes as $class) {
        $by_implementation[$class] ??= keyset[];
        $by_implementation[$class][] = $if;
      }
    }
    return $by_implementation;
  }

  <<__Memoize>>
  final protected function getMarkerInterfacesByInterface(): dict<string, keyset<string>> {
    return dict[
      'IControlFlowStatement' => keyset[
        'AlternateElseClause',
        'AlternateElseifClause',
        'AlternateElseifStatement',
        'AlternateLoopStatement',
        'AlternateSwitchStatement',
        'ElseClause',
        'ElseifClause',
        'IfStatement',
        'DoStatement',
        'ForStatement',
        'ForeachStatement',
        'SwitchStatement',
        'WhileStatement',
      ],
      'IComment' => keyset[
        'SingleLineComment',
        'DelimitedComment',
      ],
      'IFunctionishDeclaration' => keyset[
        'FunctionDeclaration',
        'MethodishDeclaration',
      ],
      'ILoopStatement' => keyset[
        'AlternateLoopStatement',
        'DoStatement',
        'ForStatement',
        'ForeachStatement',
        'WhileStatement',
      ],
      'INameishNode' => keyset[
        'NameToken',
        'QualifiedName',
      ],
      'INamespaceUseDeclaration' => keyset[
        'NamespaceUseDeclaration',
        'NamespaceGroupUseDeclaration',
      ],
      'IExpression' => Keyset\union(
        keyset[
          'AnonymousFunction',
          'Php7AnonymousFunction',
          'Variable',
        ],
        Vec\filter(
          $this->getSchema()['AST'],
          $node ==> Str\ends_with($node['kind_name'], 'Expression'),
        )
          |> Keyset\map($$, $node ==> $node['kind_name']),
      ),
      'IStringLiteral' => keyset[
        'SingleQuotedStringLiteralToken',
        'DoubleQuotedStringLiteralToken',
        'HeredocStringLiteralToken',
        'NowdocStringLiteralToken',
      ],
    ];
  }
}
