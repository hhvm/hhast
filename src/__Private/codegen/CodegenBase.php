<?hh // strict
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

use namespace HH\Lib\{C, Dict, Vec};

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
    );
  }

  abstract public function generate(): void;

  protected function getOutputDirectory(): string {
    return __DIR__.'/../../../codegen';
  }

  final protected function getCodegenFactory(): HackCodegenFactory {
    return new HackCodegenFactory(
      (new HackCodegenConfig())->withFormatter(new HackfmtFormatter()),
    );
  }

  final protected function getSchema(): Schema\TSchema {
    return $this->schema;
  }

  final protected function getRelationships(): dict<string, keyset<string>> {
    return $this->relationships;
  }

  protected function getSchemaTokens(
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
  protected function getSchemaASTByKindName(): dict<string, Schema\TAST> {
    return Dict\pull($this->schema['AST'], $v ==> $v, $v ==> $v['kind_name']);
  }

  protected static function getHandWrittenSyntaxKinds(): keyset<string> {
    return keyset['Missing', 'SyntaxList', 'Token'];
  }
}
