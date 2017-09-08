<?hh // strict
/**
 * Copyright (c) 2017, Facebook, Inc.
 * All rights reserved.
 *
 * This source code is licensed under the BSD-style license found in the
 * LICENSE file in the "hack" directory of this source tree. An additional
 * grant of patent rights can be found in the PATENTS file in the same
 * directory.
 *
 */

namespace Facebook\HHAST\__Private;

use type Facebook\HackCodegen\{
  HackCodegenConfig,
  HackCodegenFactory
};

use namespace HH\Lib\{C, Dict};

abstract class CodegenBase {
  final public function __construct(private Schema\TSchema $schema) {
  }

  abstract public function generate(): void;

  protected function getOutputDirectory(): string {
    return __DIR__.'/../../../codegen';
  }

  final protected function getCodegenFactory(): HackCodegenFactory {
    return new HackCodegenFactory(new HackCodegenConfig());
  }

  final protected function getSchema(): Schema\TSchema {
    return $this->schema;
  }

  protected function getSchemaTokens(): shape(
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

  private function getSchemaASTByKindName(): dict<string, Schema\TAST> {
    return Dict\pull(
      $this->schema['AST'],
      $v ==> $v,
      $v ==> $v['kind_name'],
    );
  }

  protected static function getHandWrittenSyntaxKinds(): keyset<string> {
    return keyset[
      'Missing',
      'SyntaxList',
      'Token',
    ];
  }
}
