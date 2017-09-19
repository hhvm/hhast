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

use namespace HH\Lib\{C, Str, Vec};
use type Facebook\HackCodegen\{
  CodegenClass,
  CodegenConstructor,
  CodegenMethod
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
    )>
  );

  private function getTokenSpecs(): vec<self::TTokenSpec> {
    $tokens = $this->getSchemaTokens();

    $leading_trailing = vec[
      shape(
        'name' => 'leading',
        'type' => 'EditableSyntax',
        'override' => true,
      ),
      shape(
        'name' => 'trailing',
        'type' => 'EditableSyntax',
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
        'description' => (string) $token['token_text'],
        'text' => $token['token_text'],
        'fields' => $leading_trailing,
      ),
    );

    $variable_text = Vec\map(
      $tokens['variableText'],
      $token ==> shape(
        'kind' => $token['token_kind'],
        'description' => self::underscored($token['token_kind']),
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

    return Vec\concat(
      $no_text,
      $fixed_text,
      $variable_text,
    );
  }

  <<__Override>>
  public function generate(): void {
    $cg = $this->getCodegenFactory();

    $tokens = $this->getTokenSpecs();
    foreach ($tokens as $token) {
      $cg
        ->codegenFile(
          $this->getOutputDirectory().
          '/tokens/'.$token['kind'].'Token.php',
        )
        ->setNamespace('Facebook\\HHAST')
        ->addClass($this->generateClassForToken($token))
        ->save();
      }
  }

  public function generateClassForToken(
    self::TTokenSpec $token,
  ): CodegenClass {
    $cg = $this->getCodegenFactory();
    return $cg
      ->codegenClass($token['kind'].'Token')
      ->setIsFinal()
      ->setExtends('EditableToken')
      ->setConstructor($this->generateConstructor($token))
      ->addMethods($this->generateFieldMethods($token))
      ->addMethod($this->generateRewriteChildrenMethod($token));
  }

  public function generateConstructor(
    self::TTokenSpec $token,
  ): CodegenConstructor {
    $cg = $this->getCodegenFactory();
    $it = $cg->codegenConstructor()
      ->addParameters(
        Vec\map(
          $token['fields'],
          $field ==> sprintf(
            '%s $%s',
            $field['type'],
            $field['name'],
          ),
        )
      );

    $parent_args = Vec\concat(
      vec[var_export($token['description'], true)],
      Vec\map(
        $token['fields'],
        $field ==> '$'.$field['name'],
      ),
    );
    if ($token['text'] !== null) {
      $parent_args[] = var_export($token['text'], true);
    }

    $it->setBody(
      $cg->codegenHackBuilder()
        ->addMultilineCall(
          'parent::__construct',
          $parent_args,
        )
        ->getCode(),
    );

    return $it;
  }

  private function generateFieldMethods(
    self::TTokenSpec $token,
  ): Traversable<CodegenMethod> {
    $cg = $this->getCodegenFactory();
    foreach ($token['fields'] as $field) {
      $underscored = $field['name'];
      $upper_camel = StrP\upper_camel($underscored);

      if ($field['type'] !== 'string') {
        yield $cg
          ->codegenMethodf('has%s', $upper_camel)
          ->setReturnType('bool')
          ->setBodyf(
            'return !$this->get%s()->isMissing();',
            $upper_camel,
          );
      }

      yield $cg
        ->codegenMethodf('with%s', $upper_camel)
        ->setIsOverride($field['override'])
        ->addParameterf(
          '%s $value',
          $field['type'],
        )
        ->setReturnType('this')
        ->setBody(
          $cg->codegenHackBuilder()
            ->startIfBlockf('$value === $this->get%s()', $upper_camel)
            ->addReturnf('$this')
            ->endIfBlock()
            ->add('return ')
            ->addMultilineCall(
              'new self',
              Vec\map(
                $token['fields'],
                $inner ==> $inner === $field
                  ? '$value'
                  : '$this->get'.StrP\upper_camel($inner['name']).'()'
              ),
            )
            ->getCode()
        );
    }
  }

  private function generateRewriteChildrenMethod(
    self::TTokenSpec $token,
  ): CodegenMethod {
    $cg = $this->getCodegenFactory();
    return $cg->codegenMethod('rewriteDescendants')
      ->setIsOverride()
      ->addParameter('self::TRewriter $rewriter')
      ->addParameter('?Traversable<EditableSyntax> $parents = null')
      ->setReturnType('this')
      ->setBody(
        $cg->codegenHackBuilder()
          ->addLine('$parents = $parents === null ? vec[] : vec($parents);')
          ->addLine('$parents[] = $this;')
          ->addLines(
            Vec\map(
              $token['fields'],
              $field ==> $field['type'] === 'string'
                ? sprintf(
                  '$%s = $this->get%s();',
                  $field['name'],
                  StrP\upper_camel($field['name']),
                )
                : sprintf(
                  '$%s = $this->get%s()->rewrite($rewriter, $parents);',
                  $field['name'],
                  StrP\upper_camel($field['name']),
                )
            ),
          )
          ->addLine('if (')
          ->indent()
          ->addLines(
            Vec\map(
              $token['fields'],
              $field ==> sprintf(
                '$%s === $this->get%s() &&',
                $field['name'],
                StrP\upper_camel($field['name']),
              ),
            )
            |> (
              $lines ==> {
                $idx = C\last_keyx($lines);
                $lines[$idx] = Str\strip_suffix($lines[$idx], ' &&');
                return $lines;
              }
            )($$)
          )
          ->unindent()
          ->addLine(') {')
          ->indent()
          ->addLine('return $this;')
          ->unindent()
          ->addLine('}')
          ->add('return ')
          ->addMultilineCall(
            'new self',
            Vec\map(
              $token['fields'],
              $field ==> '$'.$field['name'],
            ),
          )
          ->getCode(),
      );
  }
}
