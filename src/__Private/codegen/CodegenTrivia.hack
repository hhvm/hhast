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
use type Facebook\HackCodegen\{CodegenFileType, HackBuilderValues};

final class CodegenTrivia extends CodegenBase {
  <<__Override>>
  public function generate(): void {
    $cg = $this->getCodegenFactory();

    $file = $cg
      ->codegenFile($this->getOutputDirectory().'/Trivia.hack')
      ->setFileType(CodegenFileType::DOT_HACK)
      ->setNamespace('Facebook\\HHAST');

    $interfaces = $this->getMarkerInterfacesByImplementingClass();
    foreach ($this->getSchema()['trivia'] as $trivia) {
      $file->addClass(
        $cg
          ->codegenClass($trivia['trivia_kind_name'])
          ->setIsFinal()
          ->setExtends('Trivia')
          ->setInterfaces(
            Vec\map(
              $interfaces[$trivia['trivia_kind_name']] ?? vec[],
              $if ==> $cg->codegenImplementsInterface($if),
            ),
          )
          ->addConstant(
            $cg->codegenClassConstant('SYNTAX_KIND')
              ->setType('string')
              ->setValue(
                $trivia['trivia_type_name'],
                HackBuilderValues::export(),
              ),
          )
          ->setConstructor(
            $cg
              ->codegenConstructor()
              ->addParameter('string $text')
              ->addParameter('?__Private\\SourceRef $source_ref = null')
              ->setBody('parent::__construct($text, $source_ref);'),
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
                  ->getCode(),
              ),
          ),
      );
    }

    $file->save();
  }
}
