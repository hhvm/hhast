/*
 *  Copyright (c) 2017-present, Facebook, Inc.
 *  All rights reserved.
 *
 *  This source code is licensed under the MIT license found in the
 *  LICENSE file in the root directory of this source tree.
 *
 */

namespace Facebook\HHAST\__Private;

use namespace HH\Lib\Vec;
use type Facebook\HackCodegen\CodegenFileType;

final class CodegenTrivia extends CodegenBase {
  <<__Override>>
  public function generate(): void {
    $cg = $this->getCodegenFactory();

    $file = $cg
      ->codegenFile($this->getOutputDirectory().'/Trivia.hack')
      ->setFileType(CodegenFileType::DOT_HACK)
      ->setNamespace('Facebook\\HHAST');

    foreach ($this->getSchema()['trivia'] as $trivia) {
      $file->addClass(
        $cg
          ->codegenClass($trivia['trivia_kind_name'])
          ->setIsFinal()
          ->setExtends('EditableTrivia')
          ->setInterfaces(
            (self::getMarkerInterfaces()[$trivia['trivia_kind_name']] ?? vec[])
            |> Vec\map($$, $if ==> $cg->codegenImplementsInterface($if)),
          )
          ->setConstructor(
            $cg
              ->codegenConstructor()
              ->addParameter('string $text')
              ->setBodyf(
                'parent::__construct(%s, $text);',
                \var_export($trivia['trivia_type_name'], true),
              ),
          )
          ->addMethod(
            $cg
              ->codegenMethod('withText')
              ->addParameter('string $text')
              ->setReturnType('this')
              ->setBody(
                $cg
                  ->codegenHackBuilder()
                  ->startIfBlock('$text === $this->getText()')
                  ->addReturnf('$this')
                  ->endIfBlock()
                  ->addReturnf('new self($text)')
                  ->getCode()
              )
          )
      );
    }

    $file->save();
  }

  private static function getMarkerInterfaces(): dict<string, keyset<string>> {
    return dict[
      'SingleLineComment' => keyset['IComment'],
      'DelimitedComment' => keyset['IComment'],
    ];
  }
}
