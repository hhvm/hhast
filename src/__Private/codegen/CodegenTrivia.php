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

final class CodegenTrivia extends CodegenBase {
  public function generate(): void {
    $cg = $this->getCodegenFactory();

    $file = $cg->codegenFile($this->getOutputDirectory().'/Trivia.php')
      ->setNamespace('Facebook\\HHAST');

    foreach ($this->getSchema()['trivia'] as $trivia) {
      $file->addClass(
        $cg->codegenClass($trivia['trivia_kind_name'])
          ->setIsFinal()
          ->setExtends('EditableTrivia')
          ->setConstructor(
            $cg->codegenConstructor()
              ->addParameter('string $text')
              ->setBodyf(
                'parent::__construct(%s, $text);',
                var_export($trivia['trivia_type_name'], true),
              )
          )
          ->addMethod(
            $cg->codegenMethod('with_text')
              ->addParameter('string $text')
              ->setReturnType('this')
              ->setBody('return new self($text);')
          )
      );
    }

    $file->save();
  }
}
