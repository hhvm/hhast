/*
 *  Copyright (c) 2017-present, Facebook, Inc.
 *  All rights reserved.
 *
 *  This source code is licensed under the MIT license found in the
 *  LICENSE file in the root directory of this source tree.
 *
 */

namespace Facebook\HHAST\__Private;

use namespace HH\Lib\{Str, Vec};
use type Facebook\HackCodegen\{
  CodegenClass,
  CodegenConstructor,
  CodegenFileType,
  HackBuilderValues,
};

final class CodegenTokens extends CodegenBase {
  const type TTokenSpec = shape(
    'kind' => string,
    'description' => string,
    'text' => ?string,
    'fields' => vec<shape(
      'name' => string,
      'type' => string,
      'override' => bool,
    )>,
  );

  private function getTokenSpecs(): vec<self::TTokenSpec> {
    $tokens = $this->getSchemaTokens();

    $leading_trailing = vec[
      shape(
        'name' => 'leading',
        'type' => '?NodeList<Trivia>',
        'override' => true,
      ),
      shape(
        'name' => 'trailing',
        'type' => '?NodeList<Trivia>',
        'override' => true,
      ),
    ];

    $no_text = Vec\map(
      $tokens['noText'],
      $token ==> shape(
        'kind' => $token['token_kind'],
        'description' => $token['token_kind'],
        'text' => '',
        'fields' => $leading_trailing,
      ),
    );

    $fixed_text = Vec\map(
      $tokens['fixedText'],
      $token ==> shape(
        'kind' => $token['token_kind'],
        'description' => (string)$token['token_text'],
        'text' => $token['token_text'],
        'fields' => $leading_trailing,
      ),
    );

    $variable_text = Vec\map(
      $tokens['variableText'],
      $token ==> shape(
        'kind' => $token['token_kind'],
        'description' => StrP\underscored($token['token_kind']),
        'text' => null,
        'fields' => Vec\concat(
          $leading_trailing,
          vec[shape(
            'name' => 'text',
            'type' => 'string',
            'override' => false,
          )],
        ),
      ),
    );

    return Vec\concat($no_text, $fixed_text, $variable_text);
  }

  <<__Override>>
  public function generate(): void {
    $cg = $this->getCodegenFactory();

    $tokens = $this->getTokenSpecs();
    foreach ($tokens as $token) {
      $cg
        ->codegenFile(
          $this->getOutputDirectory().'/tokens/'.$token['kind'].'Token.hack',
        )
        ->setFileType(CodegenFileType::DOT_HACK)
        ->setNamespace('Facebook\\HHAST')
        ->addClass($this->generateClassForToken($token))
        ->save();
    }
  }

  public function generateClassForToken(self::TTokenSpec $token): CodegenClass {
    $cg = $this->getCodegenFactory();
    $cc = $cg
      ->codegenClass($token['kind'].'Token')
      ->setIsFinal()
      ->setExtends($this->generateExtends($token))
      ->addConstant(
        $cg->codegenClassConstant('KIND')
          ->setType('string')
          ->setValue($token['description'], HackBuilderValues::export()),
      )
      ->setConstructor($this->generateConstructor($token));

    $cc->addInterfaces(
      Vec\map(
        $this->getMarkerInterfacesByImplementingClass()[
          $token['kind'].'Token'
        ] ??
          vec[],
        $interface ==> $cg->codegenImplementsInterface($interface),
      ),
    );

    $text = $token['text'];
    if ($text !== null) {
      if (Str\uppercase($text) === Str\lowercase($text)) {
        $cc->addConstant(
          $cg->codegenClassConstant('TEXT')
            ->setType('string')
            ->setValue($text, HackBuilderValues::export()),
        );
      }
    }

    return $cc;
  }

  public function generateExtends(self::TTokenSpec $token): string {

    $cls = 'TokenWithFixedText';
    $text = $token['text'];
    if ($text !== null && (Str\uppercase($text) !== Str\lowercase($text))) {
      $cls = 'TokenWithVariableText';
    } else {
      foreach ($token['fields'] as $field) {
        if ($field['name'] === 'text') {
          $cls = 'TokenWithVariableText';
        }
      }
    }

    return $cls;
  }

  public function generateConstructor(
    self::TTokenSpec $token,
  ): CodegenConstructor {
    $cg = $this->getCodegenFactory();
    $it = $cg->codegenConstructor()
      ->addParameters(
        Vec\map(
          $token['fields'],
          $field ==> Str\format('%s $%s', $field['type'], $field['name']),
        ),
      );

    $parent_args = Vec\map($token['fields'], $field ==> '$'.$field['name']);
    $text = $token['text'];
    if ($text !== null) {
      if (Str\uppercase($text) !== Str\lowercase($text)) {
        $it->addParameterf('string $token_text = %s', \var_export($text, true));
        $parent_args[] = '$token_text';
      }
    }

    $it->addParameter('?__Private\\SourceRef $source_ref = null');
    $parent_args[] = '$source_ref';

    $it->setBody(
      $cg->codegenHackBuilder()
        ->addMultilineCall('parent::__construct', $parent_args)
        ->getCode(),
    );

    return $it;
  }
}
