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

use namespace Facebook\TypeAssert;
use namespace HH\Lib\Str;
use type Facebook\HackCodegen\{
  HackBuilderKeys,
  HackBuilderValues
};

final class CodegenEditableTokenFromData extends CodegenBase {
  <<__Override>>
  public function generate(): void {
    $cg = $this->getCodegenFactory();

    $tokens = $this->getSchemaTokens();

    $class_map = dict[];
    $class_map_with_text = dict[];

    foreach ($tokens['noText'] as $token) {
      $kind = self::underscored($token['token_kind']);
      $class_map[$kind] = sprintf('HHAST\\%sToken::class', $token['token_kind']);
    }

    foreach ($tokens['fixedText'] as $token) {
      $text = TypeAssert\not_null($token['token_text']);
      $kind = $token['token_kind'];
      if (Str\lowercase($text) === Str\uppercase($text)) {
        $class_map[$text] = sprintf('HHAST\\%sToken::class', $kind);
      } else {
        $class_map_with_text[$text] = sprintf('HHAST\\%sToken::class', $kind);
      }
    }

    foreach ($tokens['variableText'] as $token) {
      $kind = self::underscored($token['token_kind']);
      $class_map_with_text[$kind] = sprintf('HHAST\\%sToken::class', $token['token_kind']);
    }

    $cg
      ->codegenFile($this->getOutputDirectory().'/editable_token_from_data.php')
      ->setNamespace('Facebook\\HHAST\\__Private')
      ->useNamespace('Facebook\\HHAST')
      ->addFunction(
        $cg
          ->codegenFunction('editable_token_from_data')
          ->setReturnType('HHAST\\EditableToken')
          ->addParameter('string $file')
          ->addParameter('int $offset')
          ->addParameter('string $token_kind')
          ->addParameter('HHAST\\EditableNode $leading')
          ->addParameter('HHAST\\EditableNode $trailing')
          ->addParameter('string $token_text')
          ->setBody(
            $cg
              ->codegenHackBuilder()
              ->add('static $class_map_with_text =')
              ->addValue(
                $class_map_with_text,
                HackBuilderValues::dict(
                  HackBuilderKeys::export(),
                  HackBuilderValues::literal(),
                ),
              )
              ->addLine(';')
              ->add('static $class_map =')
              ->addValue(
                $class_map,
                HackBuilderValues::dict(
                  HackBuilderKeys::export(),
                  HackBuilderValues::literal(),
                ),
              )
              ->addLine(';')
              ->add('$cls = idx($class_map, $token_kind);')
              ->add('if ($cls !== null) { return new $cls($leading, $trailing); }')
              ->add('$cls = idx($class_map_with_text, $token_kind);')
              ->add('if ($cls !== null) { return new $cls($leading, $trailing, $token_text); }')
              ->addMultilineCall(
                'throw new HHAST\\UnsupportedTokenError',
                vec[
                  '$file',
                  '$offset',
                  '$token_kind',
                ],
              )
              ->getCode(),
          ),
      )
      ->save();
  }
}
