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

final class CodegenTokens extends CodegenBase {
  public function generate(): void {
    $cg = $this->getCodegenFactory();

    $tokens = $this->getSchemaTokens();

    $classes = vec[];

    foreach ($tokens['noText'] as $token) {
      $classes[] = $cg
        ->codegenClass($token['token_kind'].'Token')
        ->setIsFinal()
        ->setExtends('EditableToken')
        ->setConstructor(
          $cg
            ->codegenConstructor()
            ->addParameter('EditableSyntax $leading')
            ->addParameter('EditableSyntax $trailing')
            ->setBody(
              sprintf(
                'parent::__construct(%s, $leading, $trailing, \'\');',
                var_export($token['token_kind'], true),
              ),
            ),
        )
        ->addMethod(
          $cg
            ->codegenMethod('with_leading')
            ->addParameter('EditableSyntax $leading')
            ->setReturnType('this')
            ->setBody('return new self($leading, $this->trailing());'),
        )
        ->addMethod(
          $cg
            ->codegenMethod('with_trailing')
            ->addParameter('EditableSyntax $trailing')
            ->setReturnType('this')
            ->setBody('return new self($this->leading(), $trailing);'),
        );
    }

    foreach ($tokens['fixedText'] as $token) {
      $classes[] = $cg
        ->codegenClass($token['token_kind'].'Token')
        ->setIsFinal()
        ->setExtends('EditableToken')
        ->setConstructor(
          $cg
            ->codegenConstructor()
            ->addParameter('EditableSyntax $leading')
            ->addParameter('EditableSyntax $trailing')
            ->setBody(
              sprintf(
                'parent::__construct(%s, $leading, $trailing, %s);',
                var_export($token['token_text'], true),
                var_export($token['token_text'], true),
              ),
            ),
        )
        ->addMethod(
          $cg
            ->codegenMethod('with_leading')
            ->addParameter('EditableSyntax $leading')
            ->setReturnType('this')
            ->setBody('return new self($leading, $this->trailing());'),
        )
        ->addMethod(
          $cg
            ->codegenMethod('with_trailing')
            ->addParameter('EditableSyntax $trailing')
            ->setReturnType('this')
            ->setBody('return new self($this->leading(), $trailing);'),
        );
    }

    foreach ($tokens['variableText'] as $token) {
      $classes[] = $cg
        ->codegenClass($token['token_kind'].'Token')
        ->setIsFinal()
        ->setExtends('EditableToken')
        ->setConstructor(
          $cg
            ->codegenConstructor()
            ->addParameter('EditableSyntax $leading')
            ->addParameter('EditableSyntax $trailing')
            ->addParameter('string $text')
            ->setBody(
              sprintf(
                'parent::__construct(%s, $leading, $trailing, $text);',
                var_export(self::underscored($token['token_kind']), true),
              ),
            ),
        )
        ->addMethod(
          $cg
            ->codegenMethod('with_text')
            ->addParameter('string $text')
            ->setReturnType('this')
            ->setBody(
              'return new self($this->leading(), $this->trailing(), $text);',
            ),
        )
        ->addMethod(
          $cg
            ->codegenMethod('with_leading')
            ->addParameter('EditableSyntax $leading')
            ->setReturnType('this')
            ->setBody(
              'return new self($leading, $this->trailing(), $this->text());',
            ),
        )
        ->addMethod(
          $cg
            ->codegenMethod('with_trailing')
            ->addParameter('EditableSyntax $trailing')
            ->setReturnType('this')
            ->setBody(
              'return new self($this->leading(), $trailing, $this->text());',
            ),
        );
    }

    $file = $cg
      ->codegenFile($this->getOutputDirectory().'/Tokens.php')
      ->setNamespace('Facebook\\HHAST');
    foreach ($classes as $class) {
      $file->addClass($class);
    }
    $file->save();
  }
}
