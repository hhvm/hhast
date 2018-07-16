<?hh // strict
/*
 *  Copyright (c) 2017-present, Facebook, Inc.
 *  All rights reserved.
 *
 *  This source code is licensed under the MIT license found in the
 *  LICENSE file in the root directory of this source tree.
 *
 */

namespace Facebook\HHAST\__Private;

use type Facebook\HackCodegen\{
  CodegenClass,
  CodegenConstructor,
  CodegenMethod,
  HackBuilderKeys,
  HackBuilderValues
};

use namespace HH\Lib\{C, Dict, Keyset, Str, Vec};

final class CodegenSyntax extends CodegenBase {
  <<__Override>>
  public function generate(): void {
    $cg = $this->getCodegenFactory();

    $blacklist = self::getHandWrittenSyntaxKinds();

    foreach ($this->getSchema()['AST'] as $syntax) {
      if (C\contains_key($blacklist, $syntax['kind_name'])) {
        continue;
      }
      $cg
        ->codegenFile(
          $this->getOutputDirectory().'/syntax/'.$syntax['kind_name'].'.php'
        )
        ->setNamespace('Facebook\\HHAST')
        ->useNamespace('Facebook\\TypeAssert')
        ->addClass($this->generateClass($syntax))
        ->save();
    }
  }

  private static function isAbstract(Schema\TAST $syntax): bool {
    return C\contains_key(
      self::getKindsWithManualSubclasses(),
      $syntax['kind_name'],
    );
  }

  private function generateClass(Schema\TAST $syntax): CodegenClass {
    $cg = $this->getCodegenFactory();
    $is_abstract = self::isAbstract($syntax);
    $class_name = $syntax['kind_name'];
    if ($is_abstract) {
      $class_name .= 'GeneratedBase';
    }

    return $cg
      ->codegenClass($class_name)
      ->addEmptyUserAttribute('__ConsistentConstruct')
      ->setIsFinal(!$is_abstract)
      ->setIsAbstract($is_abstract)
      ->setExtends('EditableNode')
      ->setInterfaces(
        (self::getMarkerInterfaces()[$syntax['kind_name']] ?? vec[])
        |> Vec\map($$, $if ==> $cg->codegenImplementsInterface($if)),
      )
      ->setConstructor($this->generateConstructor($syntax))
      ->addMethod($this->generateFromJSONMethod($syntax))
      ->addMethod($this->generateChildrenMethod($syntax))
      ->addMethod($this->generateRewriteChildrenMethod($syntax))
      ->addMethods(
        Vec\map(
          $syntax['fields'],
          $field ==> $this->generateFieldMethods($syntax, $field['field_name']),
        )
        |> Vec\flatten($$),
      )
      ->addProperties(
        Vec\map(
          $syntax['fields'],
          $field ==> $cg
            ->codegenProperty('_'.$field['field_name'])
            ->setType('EditableNode')
        )
      );
  }

  private function generateFieldMethods(
    Schema\TAST $syntax,
    string $underscored,
  ): Traversable<CodegenMethod> {
    $spec = $this->getTypeSpecForField($syntax, $underscored);
    $upper_camel = StrP\upper_camel($underscored);
    $types = $spec['possibleTypes'];

    $cg = $this->getCodegenFactory();
    yield $cg
      ->codegenMethodf('get%sUNTYPED', $upper_camel)
      ->setReturnType('EditableNode')
      ->setBodyf('return $this->_%s;', $underscored);

    yield $cg
      ->codegenMethodf('with%s', $upper_camel)
      ->setReturnType('this')
      ->addParameter('EditableNode $value')
      ->setBody(
        $cg
          ->codegenHackBuilder()
          ->startIfBlockf('$value === $this->_%s', $underscored)
          ->addReturnf('$this')
          ->endIfBlock()
          ->add('return new ')
          ->addMultilineCall(
            'static',
            Vec\map(
              $syntax['fields'],
              $inner ==> $inner['field_name'] === $underscored
                ? '$value'
                : '$this->_'.$inner['field_name'],
            ),
          )
          ->getCode(),
      );

    yield $cg
      ->codegenMethodf('has%s', $upper_camel)
      ->setReturnType('bool')
      ->setBodyf('return !$this->_%s->isMissing();', $underscored);

    $type = $spec['nullable'] ? ('?'.$spec['class']) : $spec['class'];

    if (!$spec['nullable']) {
      yield $cg
        ->codegenMethodf('get%s', $upper_camel)
        ->setDocBlock('@returns '.\implode(' | ', $types))
        ->setReturnType($type)
        ->setBodyf(
          'return TypeAssert\instance_of(%s::class, $this->_%s);',
          $type,
          $underscored,
        );
      // For backwards compatibility: always offer getFoox, in case it was
      // nullable in a previous version
      yield $cg
        ->codegenMethodf('get%sx', $upper_camel)
        ->setDocBlock('@returns '.\implode(' | ', $types))
        ->setReturnType($type)
        ->setBodyf('return $this->get%s();', $upper_camel);
     return;
    }

    yield $cg
      ->codegenMethodf('get%s', $upper_camel)
      ->setDocBlock('@returns '.\implode(' | ', $types))
      ->setReturnType($type)
      ->setBody(
        $cg
          ->codegenHackBuilder()
          ->startIfBlockf('$this->_%s->isMissing()', $underscored)
          ->addReturnf('null')
          ->endIfBlock()
          ->addReturnf(
            'TypeAssert\instance_of(%s::class, $this->_%s)',
            $spec['class'],
            $underscored,
          )
          ->getCode(),
      );

    yield $cg
      ->codegenMethodf('get%sx', $upper_camel)
      ->setDocBlock(Vec\filter($types, $type ==> $type !== 'Missing')
        |> \implode(' | ', $$)
        |> '@returns '.$$)
      ->setReturnType($spec['class'])
      ->setBodyf(
        'return TypeAssert\instance_of(%s::class, $this->_%s);',
        $spec['class'],
        $underscored,
      );
  }

  private function generateConstructor(
    Schema\TAST $syntax,
  ): CodegenConstructor {
    $cg = $this->getCodegenFactory();

    return $cg->codegenConstructor()
      ->addParameters(
        Vec\map(
          $syntax['fields'],
          $field ==> 'EditableNode $'.$field['field_name'],
        ),
      )
      ->setBody(
        $cg
          ->codegenHackBuilder()
          ->addLinef(
            'parent::__construct(%s);',
            \var_export($syntax['type_name'], true),
          )
          ->addLines(
            Vec\map(
              $syntax['fields'],
              $field ==> Str\format(
                '$this->_%s = $%s;',
                $field['field_name'],
                $field['field_name'],
              ),
            ),
          )
          ->getCode()
      );
  }

  private function generateFromJSONMethod(Schema\TAST $syntax): CodegenMethod {
    $cg = $this->getCodegenFactory();

    $body = $cg->codegenHackBuilder();
    foreach ($syntax['fields'] as $field) {
      $body
        ->addf('$%s = ', $field['field_name'])
        ->addMultilineCall(
          'EditableNode::fromJSON',
          vec[
            Str\format(
              '/* UNSAFE_EXPR */ $json[\'%s_%s\']',
              $syntax['prefix'],
              $field['field_name'],
            ),
            '$file',
            '$offset',
            '$source',
          ],
        )
        ->addLinef('$offset += $%s->getWidth();', $field['field_name']);
    }

    return $cg
      ->codegenMethod('fromJSON')
      ->setIsOverride()
      ->setIsStatic()
      ->addParameter('dict<string, mixed> $json')
      ->addParameter('string $file')
      ->addParameter('int $offset')
      ->addParameter('string $source')
      ->setReturnType('this')
      ->setBody(
        $body
          ->addMultilineCall(
            'return new static',
            Vec\map($syntax['fields'], $field ==> '$'.$field['field_name']),
          )
          ->getCode(),
      );
  }

  private function generateChildrenMethod(Schema\TAST $syntax): CodegenMethod {
    $cg = $this->getCodegenFactory();

    return $cg
      ->codegenMethod('getChildren')
      ->setIsOverride()
      ->setReturnType('dict<string, EditableNode>')
      ->setBody(
        $cg
          ->codegenHackBuilder()
          ->add('return ')
          ->addValue(
            $syntax['fields']
            |> Vec\map($$, $field ==> $field['field_name'])
            |> Dict\pull(
              $$,
              $field ==> '$this->_'.$field,
              $field ==> $field,
            ),
            HackBuilderValues::dict(
              HackBuilderKeys::export(),
              HackBuilderValues::literal(),
            ),
          )
          ->add(';')
          ->getCode()
      );
  }

  private function generateRewriteChildrenMethod(
    Schema\TAST $syntax,
  ): CodegenMethod {
    $cg = $this->getCodegenFactory();

    $fields = Vec\map($syntax['fields'], $field ==> $field['field_name']);

    return $cg
      ->codegenMethod('rewriteDescendants')
      ->setIsOverride()
      ->addParameter('self::TRewriter $rewriter')
      ->addParameter('?vec<EditableNode> $parents = null')
      ->setReturnType('this')
      ->setBody(
        $cg
          ->codegenHackBuilder()
          ->addLine('$parents = $parents === null ? vec[] : vec($parents);')
          ->addLine('$parents[] = $this;')
          ->addLines(
            Vec\map(
              $fields,
              $field ==> Str\format(
                '$%s = $this->_%s->rewrite($rewriter, $parents);',
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
              $field ==> Str\format('$%s === $this->_%s &&', $field, $field),
            )
            |> (
              $lines ==> {
                $idx = C\last_keyx($lines);
                $lines[$idx] = Str\strip_suffix($lines[$idx], ' &&');
                return $lines;
              }
            )($$),
          )
          ->unindent()
          ->addLine(') {')
          ->indent()
          ->addLine('return $this;')
          ->unindent()
          ->addLine('}')
          ->add('return ')
          ->addMultilineCall(
            'new static',
            Vec\map($fields, $field ==> '$'.$field),
          )
          ->getCode(),
      );
  }

  const type TFieldSpec = shape(
    'class' => string,
    'nullable' => bool,
    'possibleTypes' => keyset<string>,
  );

  private function getTypeSpecForField(
    Schema\TAST $syntax,
    string $field,
  ): self::TFieldSpec {
    $key =
      Str\format('%s.%s_%s', $syntax['description'], $syntax['prefix'], $field);
    $specs = $this->getRelationships();
    if (!C\contains_key($specs, $key)) {
      return shape(
        'class' => 'EditableNode',
        'nullable' => false,
        'possibleTypes' => keyset['unknown'],
      );
    }

    $children = $specs[$key] |> Keyset\filter($$, $c ==> $c !== 'error');
    $possible_types = Keyset\map(
      $children,
      $child ==> $this->getSyntaxClassForChild($child),
    );

    $nullable = C\contains_key($children, 'missing');
    if ($nullable) {
      $children = Keyset\filter(
        $children,
        $child ==> $child !== 'missing',
      );
    }

    $count = C\count($children);
    if ($count !== 1) {
      if ($count > 1 && C\every($children, $child ==> Str\starts_with($child, 'token:'))) {
        return shape(
          'class' => 'EditableToken',
          'nullable' => $nullable,
          'possibleTypes' => $possible_types,
        );
      }
      return shape(
        'class' => 'EditableNode',
        'nullable' => false,
        'possibleTypes' => $possible_types,
      );
    }

    return shape(
      'class' => C\firstx($children)
        |> $this->getSyntaxClassForChild($$),
      'nullable' => $nullable,
      'possibleTypes' => $possible_types,
    );
  }

  <<__Memoize>>
  private function getSyntaxClassForChild(string $child): string {
    if ($child === 'token') {
      return 'EditableToken';
    }
    if ($child === 'list') {
      return 'EditableList';
    }

    if (Str\starts_with($child, 'token')) {
      return $this->getTokenClassForChild($child);
    }

    $ast = C\find(
      $this->getSchema()['AST'],
      $syntax ==> $syntax['description'] === $child,
    );
    invariant($ast !== null, 'Could not look up syntax "%s"', $child);
    return $ast['kind_name'];
  }

  private function getTokenClassForChild(string $child): string {
    $child = Str\strip_prefix($child, 'token:');

    $tokens = $this->getSchema()['tokens'];
    $token = C\find($tokens, $token ==> $token['token_text'] === $child);
    if ($token !== null) {
      return $token['token_kind'].'Token';
    }

    $token = C\find(
      $tokens,
      $token ==> StrP\underscored($token['token_kind']) === $child,
    );

    invariant($token !== null, 'Failed to find token for "%s"', $child);

    return $token['token_kind'].'Token';
  }

  private static function getMarkerInterfaces(): dict<string, keyset<string>> {
    return dict[
      'AlternateElseClause' => keyset['IControlFlowStatement'],
      'AlternateElseifClause' => keyset['IControlFlowStatement'],
      'AlternateElseifStatement' => keyset['IControlFlowStatement'],
      'AlternateLoopStatement' => keyset['IControlFlowStatement', 'ILoopStatement'],
      'AlternateSwitchStatement' => keyset['IControlFlowStatement'],
      'DoStatement' => keyset['IControlFlowStatement', 'ILoopStatement'],
      'ElseClause' => keyset['IControlFlowStatement'],
      'ElseifClause' => keyset['IControlFlowStatement'],
      'ForStatement' => keyset['IControlFlowStatement', 'ILoopStatement'],
      'ForeachStatement' => keyset['IControlFlowStatement', 'ILoopStatement'],
      'FunctionDeclaration' => keyset['IFunctionishDeclaration'],
      'IfStatement' => keyset['IControlFlowStatement'],
      'MethodishDeclaration' => keyset['IFunctionishDeclaration'],
      'NamespaceUseDeclaration' => keyset['INamespaceUseDeclaration'],
      'NamespaceGroupUseDeclaration' => keyset['INamespaceUseDeclaration'],
      'SwitchStatement' => keyset['IControlFlowStatement'],
      'WhileStatement' => keyset['IControlFlowStatement', 'ILoopStatement'],
    ];
  }

  private static function getKindsWithManualSubclasses(): keyset<string> {
    return keyset[
      'AlternateLoopStatement',
      'NamespaceDeclaration',
    ];
  }
}
