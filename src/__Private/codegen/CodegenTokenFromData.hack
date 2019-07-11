/*
 *  Copyright (c) 2017-present, Facebook, Inc.
 *  All rights reserved.
 *
 *  This source code is licensed under the MIT license found in the
 *  LICENSE file in the root directory of this source tree.
 *
 */

namespace Facebook\HHAST\__Private;

use namespace Facebook\TypeAssert;
use namespace HH\Lib\Str;
use type Facebook\HackCodegen\{
  CodegenFileType,
  HackBuilderKeys,
  HackBuilderValues,
};

final class CodegenTokenFromData extends CodegenBase {
  <<__Override>>
  public function generate(): void {
    $cg = $this->getCodegenFactory();

    $tokens = $this->getSchemaTokens();

    $class_map = dict[];
    $class_map_with_text = dict[];

    foreach ($tokens['noText'] as $token) {
      $kind = StrP\underscored($token['token_kind']);
      $class_map[$kind] = Str\format(
        'HHAST\\%sToken::class',
        $token['token_kind'],
      );
    }

    foreach ($tokens['fixedText'] as $token) {
      $text = TypeAssert\not_null($token['token_text']);
      $kind = $token['token_kind'];
      if (Str\lowercase($text) === Str\uppercase($text)) {
        $class_map[$text] = Str\format('HHAST\\%sToken::class', $kind);
      } else {
        $class_map_with_text[$text] = Str\format(
          'HHAST\\%sToken::class',
          $kind,
        );
      }
    }

    foreach ($tokens['variableText'] as $token) {
      $kind = StrP\underscored($token['token_kind']);
      $class_map_with_text[$kind] = Str\format(
        'HHAST\\%sToken::class',
        $token['token_kind'],
      );
    }

    $cg
      ->codegenFile($this->getOutputDirectory().'/token_from_data.hack')
      ->setFileType(CodegenFileType::DOT_HACK)
      ->setNamespace('Facebook\\HHAST\\__Private')
      ->useNamespace('Facebook\\HHAST')
      ->addClass(
        $cg
          ->codegenClass('TokenClassMap')
          ->addConstant(
            $cg
              ->codegenClassConstant('WITH_TEXT')
              ->setType('dict<string, classname<HHAST\TokenWithVariableText>>')
              ->setValue(
                $class_map_with_text,
                HackBuilderValues::dict(
                  HackBuilderKeys::export(),
                  HackBuilderValues::literal(),
                ),
              ),
          )
          ->addConstant(
            $cg
              ->codegenClassConstant('WITHOUT_TEXT')
              ->setType('dict<string, classname<HHAST\TokenWithFixedText>>')
              ->setValue(
                $class_map,
                HackBuilderValues::dict(
                  HackBuilderKeys::export(),
                  HackBuilderValues::literal(),
                ),
              ),
          ),
      )
      ->addFunction(
        $cg
          ->codegenFunction('token_from_data')
          ->setReturnType('HHAST\\Token')
          ->addParameter('SourceRef $source_ref')
          ->addParameter('string $token_kind')
          ->addParameter('HHAST\\NodeList<HHAST\\Trivia> $leading')
          ->addParameter('HHAST\\NodeList<HHAST\\Trivia> $trailing')
          ->addParameter('string $token_text')
          ->setBody(
            $cg
              ->codegenHackBuilder()
              ->add('$cls = TokenClassMap::WITHOUT_TEXT[$token_kind] ?? null;')
              ->add(
                'if ($cls !== null) { return new $cls($leading, $trailing, $source_ref ); }',
              )
              ->add('$cls = TokenClassMap::WITH_TEXT[$token_kind] ?? null;')
              ->add(
                'if ($cls !== null) { return new $cls($leading, $trailing, $token_text, $source_ref ); }',
              )
              ->addMultilineCall(
                'throw new HHAST\\UnsupportedTokenError',
                vec[
                  '$source_ref[\'file\']',
                  '$source_ref[\'offset\']',
                  '$token_kind',
                ],
              )
              ->getCode(),
          ),
      )
      ->save();
  }
}
