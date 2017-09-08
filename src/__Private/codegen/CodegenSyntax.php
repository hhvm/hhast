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
  CodegenClass,
  CodegenConstructor,
  CodegenMethod,
  HackBuilderValues
};

use namespace HH\Lib\{C, Str, Vec};

final class CodegenSyntax extends CodegenBase {
  public function generate(): void {
    $cg = $this->getCodegenFactory();

    $file = $cg->codegenFile($this->getOutputDirectory().'/Syntax.php');
    $file->setNamespace('Facebook\\HHAST');

    $blacklist = self::getHandWrittenSyntaxKinds();

    foreach ($this->getSchema()['AST'] as $syntax) {
      if (C\contains_key($blacklist, $syntax['kind_name'])) {
        continue;
      }
      $file->addClass($this->generateClass($syntax));
    }

    $file->save();
  }

  private function generateClass(Schema\TAST $syntax): CodegenClass {
    $cg = $this->getCodegenFactory();

    $class = $cg->codegenClass($syntax['kind_name'])
      ->setIsFinal()
      ->setExtends('EditableSyntax')
      ->setConstructor($this->generateConstructor($syntax))
      ->addMethod($this->generateFromJSONMethod($syntax))
      ->addMethod($this->generateChildrenMethod($syntax))
      ->addMethod($this->generateRewriteMethod($syntax));

    foreach ($syntax['fields'] as $field) {
      $class
        ->addVar($cg->codegenMemberVar('_'.$field['field_name'])->setType('EditableSyntax'))
        ->addMethod(
          $cg->codegenMethod($field['field_name'])
            ->setReturnType('EditableSyntax')
            ->setBodyf('return $this->_%s;', $field['field_name'])
        )
        ->addMethod(
          $cg->codegenMethod('with_'.$field['field_name'])
            ->setReturnType('this')
            ->addParameter('EditableSyntax $value')
            ->setBody(
              $cg->codegenHackBuilder()
                ->add('return new ')
                ->addMultilineCall(
                  'self',
                  Vec\map(
                    $syntax['fields'],
                    $inner ==> $inner['field_name'] == $field['field_name']
                      ? '$value'
                      : '$this->_'.$inner['field_name']
                  )
                )
                ->getCode()
            )
        );
    }

    return $class;
  }

  private function generateConstructor(Schema\TAST $syntax): CodegenConstructor {
    $cg = $this->getCodegenFactory();

    $c = $cg->codegenConstructor();

    $body = $cg->codegenHackBuilder()
      ->addLinef('parent::__construct(%s);', var_export($syntax['type_name'], true));

    foreach ($syntax['fields'] as $field) {
      $c->addParameterf('EditableSyntax $%s', $field['field_name']);
      $body->addLinef(
        '$this->_%s = $%s;',
        $field['field_name'],
        $field['field_name'],
      );
    }
    $c->setBody($body->getCode());

    return $c;
  }

  private function generateFromJSONMethod(Schema\TAST $syntax): CodegenMethod {
    $cg = $this->getCodegenFactory();

    $body = $cg->codegenHackBuilder();
    foreach ($syntax['fields'] as $field) {
      $body
        ->addf('$%s = ', $field['field_name'])
        ->addMultilineCall(
          'EditableSyntax::from_json',
          vec[
            sprintf(
              '/* UNSAFE_EXPR */ $json[\'%s_%s\']',
              $syntax['type_name'],
              $field['field_name'],
            ),
            '$position',
            '$source',
          ]
      )
      ->addLinef(
        '$position += $%s->width();',
        $field['field_name'],
      );
    }

    return $cg->codegenMethod('from_json')
      ->setIsStatic()
      ->addParameter('array<string, mixed> $json')
      ->addParameter('int $position')
      ->addParameter('string $source')
      ->setReturnType('this')
      ->setBody(
        $body
          ->addMultilineCall(
            'return new self',
            Vec\map(
              $syntax['fields'],
              $field ==> '$'.$field['field_name'],
            ),
          )
          ->getCode()
      );
  }

  private function generateChildrenMethod(Schema\TAST $syntax): CodegenMethod {
    $cg = $this->getCodegenFactory();

    return $cg->codegenMethod('children')
      ->setReturnType('Traversable<EditableSyntax>')
      ->setBody(
        $cg->codegenHackBuilder()->addLines(
          Vec\map(
            $syntax['fields'],
            $field ==> 'yield $this->_'.$field['field_name'].';',
          ),
        )->getCode(),
      );
  }

  private function generateRewriteMethod(Schema\TAST $syntax): CodegenMethod {
    $cg = $this->getCodegenFactory();

    $fields = Vec\map(
      $syntax['fields'],
      $field ==> $field['field_name'],
    );

    return $cg->codegenMethod('rewrite')
      ->setReturnType('EditableSyntax')
      ->addParameter('self::TRewriter $rewriter')
      ->addParameter('?Traversable<EditableSyntax> $parents = null')
      ->setBody($cg->codegenHackBuilder()
        ->addLine('$parents = $parents === null ? vec[] : vec($parents);')
        ->addLine('$child_parents = $parents;')
        ->addLine('$child_parents[] = $this;')
        ->addLines(
          Vec\map(
            $fields,
            $field ==> sprintf(
              '$%s = $this->%s()->rewrite($rewriter, $child_parents);',
              $field,
              $field,
            ),
          ),
        )
        ->addLine('if (')
        ->indent()
        ->addLines(
          Vec\map(
            $fields,
            $field ==> sprintf(
              '$%s === $this->%s() &&',
              $field,
              $field
            ),
          )
          |> ($lines ==> {
            $idx = C\last_keyx($lines);
            $lines[$idx] = Str\strip_suffix($lines[$idx], ' &&');
            return $lines;
          })($$)
        )
        ->unindent()
        ->addLine(') {')
        ->indent()
        ->addLine('$node = $this;')
        ->unindent()
        ->addLine('} else {')
        ->indent()
        ->add('$node = ')
        ->addMultilineCall(
          'new self',
          Vec\map(
            $fields,
            $field ==> '$'.$field,
          ),
        )
        ->unindent()
        ->addLine('}')
        ->addLine('return $rewriter($node, $parents);')
        ->getCode()
      );
  }
}
