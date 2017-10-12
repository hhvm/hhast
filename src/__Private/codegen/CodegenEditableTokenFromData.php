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

use type Facebook\HackCodegen\HackBuilderValues;
use namespace Facebook\TypeAssert;
use namespace HH\Lib\Str;

final class CodegenEditableTokenFromData extends CodegenBase {
  <<__Override>>
  public function generate(): void {
    $cg = $this->getCodegenFactory();

    $tokens = $this->getSchemaTokens();

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
              ->startSwitch('$token_kind')
              ->addCaseBlocks(
                $tokens['noText'],
                ($token, $body) ==> {
                  $body
                    ->addCase(
                      self::underscored($token['token_kind']),
                      HackBuilderValues::export(),
                    )
                    ->returnCasef(
                      'new HHAST\\%sToken($leading, $trailing)',
                      $token['token_kind'],
                    );
                },
              )
              ->addCaseBlocks(
                new Vector($tokens['fixedText']),
                ($token, $body) ==> {
                  $text = TypeAssert\not_null($token['token_text']);
                  $body->addCase(
                    $text,
                    HackBuilderValues::export(),
                  );
                  if (Str\lowercase($text) === Str\uppercase($text)) {
                    $body->returnCasef(
                      'new HHAST\\%sToken($leading, $trailing)',
                      $token['token_kind'],
                    );
                  } else {
                    $body->returnCasef(
                      'new HHAST\\%sToken($leading, $trailing, $token_text)',
                      $token['token_kind'],
                    );
                  }
                },
              )
              ->addCaseBlocks(
                new Vector($tokens['variableText']),
                ($token, $body) ==> {
                  $body
                    ->addCase(
                      self::underscored($token['token_kind']),
                      HackBuilderValues::export(),
                    )
                    ->returnCasef(
                      'new HHAST\\%sToken($leading, $trailing, $token_text)',
                      $token['token_kind'],
                    );
                },
              )
              ->addDefault()
              ->addMultilineCall(
                'throw new HHAST\\UnsupportedTokenError',
                vec[
                  '$file',
                  '$offset',
                  '$token_kind',
                ],
              )
              ->endDefault()
              ->endSwitch()
              ->getCode(),
          ),
      )
      ->save();
  }
}
