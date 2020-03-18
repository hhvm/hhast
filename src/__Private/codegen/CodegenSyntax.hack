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
  CodegenFileType,
  CodegenMethod,
  HackBuilderKeys,
  HackBuilderValues,
};

use namespace HH\Lib\{C, Dict, Keyset, Str, Vec};
use namespace Facebook\HHAST;

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
          $this->getOutputDirectory().'/syntax/'.$syntax['kind_name'].'.hack',
        )
        ->setFileType(CodegenFileType::DOT_HACK)
        ->setNamespace('Facebook\\HHAST')
        ->useNamespace('Facebook\\TypeAssert')
        ->useNamespace('HH\\Lib\\Dict')
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
      ->setExtends('Node')
      ->setInterfaces(
        (
          $this
            ->getMarkerInterfacesByImplementingClass()[$syntax['kind_name']] ??
          vec[]
        )
          |> Vec\map($$, $if ==> $cg->codegenImplementsInterface($if)),
      )
      ->addConstant(
        $cg->codegenClassConstant('SYNTAX_KIND')
          ->setType('string')
          ->setValue($syntax['type_name'], HackBuilderValues::export()),
      )
      ->setConstructor($this->generateConstructor($syntax))
      ->addMethod($this->generateFromJSONMethod($syntax))
      ->addMethod($this->generateChildrenMethod($syntax))
      ->addMethod($this->generateRewriteChildrenMethod($syntax))
      ->addMethods(
        Vec\map(
          $syntax['fields'],
          $field ==>
            vec($this->generateFieldMethods($syntax, $field['field_name'])),
        )
          |> Vec\flatten($$),
      )
      ->addProperties(
        Vec\map(
          $syntax['fields'],
          $field ==> {
            $spec = $this->getTypeSpecForField($syntax, $field['field_name']);
            return $cg
              ->codegenProperty('_'.$field['field_name'])
              ->setType(($spec['nullable'] ? '?' : '').$spec['class']);
          },
        ),
      );
  }

  private function getUnifiedSyntaxClass(keyset<string> $types): string {
    unset($types['']);
    if (C\is_empty($types)) {
      return 'Node';
    }

    if (C\contains_key($types, 'missing')) {
      unset($types['missing']);
      return '?'.$this->getUnifiedSyntaxClass($types);
    }

    if (C\count($types) === 1) {
      $type = C\onlyx($types);
      if ($type === 'list<>') {
        return 'NodeList<Node>';
      }
      return $this->getSyntaxClass($type);
    }

    if (C\every($types, $t ==> Str\starts_with($t, 'token:'))) {
      return 'Token';
    }

    if (C\every($types, $t ==> Str\starts_with($t, 'list<'))) {
      $have_empty = C\contains_key($types, 'list<>');
      if ($have_empty) {
        if (C\count($types) === 1) {
          return 'NodeList<Node>';
        }
        unset($types['list<>']);
      }
      return Vec\map(
        $types,
        $t ==> $t
          |> Str\strip_prefix($$, 'list<')
          |> Str\strip_suffix($$, '>')
          |> Str\split($$, '|'),
      )
        |> Keyset\flatten($$)
        |> $this->getUnifiedSyntaxClass($$)
        |> 'NodeList<'.$$.'>';
    }

    if (C\every($types, $t ==> Str\starts_with($t, 'list_item<'))) {
      return Keyset\map(
        $types,
        $t ==> $t
          |> Str\strip_prefix($$, 'list_item<')
          |> Str\strip_suffix($$, '>'),
      )
        |> $this->getUnifiedSyntaxClass($$)
        |> 'ListItem<'.$$.'>';
    }

    $expanded = $types
      |> Vec\map($$, $t ==> $this->getSyntaxClass($t))
      |> Vec\map(
        $$,
        $type ==> Keyset\union(
          keyset[$type],
          $this->getMarkerInterfacesByImplementingClass()[$type] ?? keyset[],
          $this->getInterfaceWrappers()[$type] ?? keyset[],
        ),
      );
    $intersected = C\reduce(
      $expanded,
      ($acc, $i) ==> Keyset\intersect($acc, $i),
      C\firstx($expanded),
    );
    if ($intersected) {
      // Return the most-specific; for example, INameish can be converted to
      // IExpression, and we want INameish
      return Dict\map(
        $intersected,
        $if ==> C\count($this->getMarkerInterfacesByInterface()[$if]),
      )
        |> Dict\sort($$)
        |> C\first_keyx($$);
    }
    return 'Node';
  }

  private function generateFieldMethods(
    Schema\TAST $syntax,
    string $underscored,
  ): Traversable<CodegenMethod> {
    $spec = $this->getTypeSpecForField($syntax, $underscored);
    $upper_camel = StrP\upper_camel($underscored);
    $types = $spec['possibleTypes'];
    $type = $spec['nullable'] ? ('?'.$spec['class']) : $spec['class'];

    $cg = $this->getCodegenFactory();
    yield $cg
      ->codegenMethodf('get%sUNTYPED', $upper_camel)
      ->setReturnType('?Node')
      ->setBodyf('return $this->_%s;', $underscored);

    yield $cg
      ->codegenMethodf('with%s', $upper_camel)
      ->setReturnType('this')
      ->addParameterf('%s $value', $type)
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
      ->setBodyf('return $this->_%s !== null;', $underscored);

    if (!$spec['nullable']) {
      $get = $cg
        ->codegenMethodf('get%s', $upper_camel)
        ->setDocBlock('@return '.Str\join($types, ' | '))
        ->setReturnType($type);
      if ($spec['class'] === 'Node') {
        yield $get->setBodyf('return $this->_%s;', $underscored);
      } else {
        yield $get->setBodyf(
          'return TypeAssert\instance_of(%s::class, $this->_%s);',
          $type |> Str\split($$, '<') |> C\firstx($$),
          $underscored,
        );
      }
      // For backwards compatibility: always offer getFoox, in case it was
      // nullable in a previous version
      yield $cg
        ->codegenMethodf('get%sx', $upper_camel)
        ->setDocBlock('@return '.Str\join($types, ' | '))
        ->setReturnType($type)
        ->setBodyf('return $this->get%s();', $upper_camel);
      return;
    }

    yield $cg
      ->codegenMethodf('get%s', $upper_camel)
      ->setDocBlock(
        Vec\map($types, $type ==> $type === 'Missing' ? 'null' : $type)
          |> Str\join($$, ' | ')
          |> '@return '.$$,
      )
      ->setReturnType($type)
      ->setBodyf('return $this->_%s;', $underscored);

    yield $cg
      ->codegenMethodf('get%sx', $upper_camel)
      ->setDocBlock(
        Vec\filter($types, $type ==> $type !== 'Missing')
          |> Str\join($$, ' | ')
          |> '@return '.$$,
      )
      ->setReturnType($spec['class'])
      ->setBodyf('return TypeAssert\\not_null($this->get%s());', $upper_camel);
  }

  private function generateConstructor(
    Schema\TAST $syntax,
  ): CodegenConstructor {
    $cg = $this->getCodegenFactory();

    return $cg->codegenConstructor()
      ->addParameters(
        Vec\map(
          $syntax['fields'],
          $field ==> {
            $spec = $this->getTypeSpecForField($syntax, $field['field_name']);
            return Str\format(
              '%s%s $%s',
              $spec['nullable'] ? '?' : '',
              $spec['class'],
              $field['field_name'],
            );
          },
        ),
      )
      ->addParameter('?__Private\\SourceRef $source_ref = null')
      ->setBody(
        $cg
          ->codegenHackBuilder()
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
          ->addLine('parent::__construct($source_ref);')
          ->getCode(),
      );
  }

  private function generateFromJSONMethod(Schema\TAST $syntax): CodegenMethod {
    $cg = $this->getCodegenFactory();

    $body = $cg->codegenHackBuilder()
      ->addAssignment(
        '$offset',
        '$initial_offset',
        HackBuilderValues::literal(),
      );
    foreach ($syntax['fields'] as $field) {
      $spec = $this->getTypeSpecForField($syntax, $field['field_name']);
      $body
        ->addf('$%s = ', $field['field_name'])
        ->addMultilineCall(
          'Node::fromJSON',
          vec[
            Str\format(
              '/* HH_FIXME[4110] */ $json[\'%s_%s\']%s',
              $syntax['prefix'],
              $field['field_name'],
              // Normally the JSON field always exists, even for nullable
              // fields (it would just have "kind": "missing"), so we shouldn't
              // need the following fallback. However, there is a special case:
              // If the field is removed from the schema, then it will obviously
              // not be present here. But we want to be able to treat the new
              // schema as compatible with the previous version, which this
              // fallback takes care of.
              $spec['nullable'] ? " ?? dict['kind' => 'missing']" : '',
            ),
            '$file',
            '$offset',
            '$source',
            \var_export($spec['class'], true),
          ],
        );
      if ($spec['nullable']) {
        $body->addLinef(
          '$offset += $%s?->getWidth() ?? 0;',
          $field['field_name'],
        );
        continue;
      }
      $body
        ->addLinef(
          '$%s = $%s as nonnull;',
          $field['field_name'],
          $field['field_name'],
        )
        ->addLinef('$offset += $%s->getWidth();', $field['field_name']);
    }

    return $cg
      ->codegenMethod('fromJSON')
      ->setIsOverride()
      ->setIsStatic()
      ->addParameter('dict<string, mixed> $json')
      ->addParameter('string $file')
      ->addParameter('int $initial_offset')
      ->addParameter('string $source')
      ->addParameter('string $_type_hint')
      ->setReturnType('this')
      ->setBody(
        $body
          ->addAssignment(
            '$source_ref',
            shape(
              'file' => '$file',
              'source' => '$source',
              'offset' => '$initial_offset',
              'width' => '$offset - $initial_offset',
            ),
            HackBuilderValues::shapeWithUniformRendering(
              HackBuilderValues::literal(),
            ),
          )
          ->addMultilineCall(
            'return new static',
            Vec\concat(
              Vec\map(
                $syntax['fields'],
                $field ==> '/* HH_IGNORE_ERROR[4110] */ $'.$field['field_name'],
              ),
              vec['$source_ref'],
            ),
          )
          ->getCode(),
      );
  }

  private function generateChildrenMethod(Schema\TAST $syntax): CodegenMethod {
    $cg = $this->getCodegenFactory();

    return $cg
      ->codegenMethod('getChildren')
      ->setIsOverride()
      ->setReturnType('dict<string, Node>')
      ->setBody(
        $cg
          ->codegenHackBuilder()
          ->add('return ')
          ->addValue(
            $syntax['fields']
              |> Vec\map($$, $field ==> $field['field_name'])
              |> Dict\pull($$, $field ==> '$this->_'.$field, $field ==> $field),
            HackBuilderValues::dict(
              HackBuilderKeys::export(),
              HackBuilderValues::literal(),
            ),
          )
          ->add(' |> Dict\filter_nulls($$);')
          ->getCode(),
      );
  }

  private function generateRewriteDescendantsMethod(
    Schema\TAST $syntax,
  ): CodegenMethod {
    $cg = $this->getCodegenFactory();

    $fields = Vec\map($syntax['fields'], $field ==> $field['field_name']);

    return $cg
      ->codegenMethod('rewriteDescendants')
      ->setIsOverride()
      ->addParameter('self::TRewriter $rewriter')
      ->addParameter('vec<Node> $parents = vec[]')
      ->setReturnType('this')
      ->setBody(
        $cg
          ->codegenHackBuilder()
          ->addLine('$parents[] = $this;')
          ->addLines(
            Vec\map(
              $fields,
              $field ==> {
                return Str\format(
                  '$%s = $this->_%s->rewrite($rewriter, $parents);',
                  $field,
                  $field,
                );
              },
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
                (vec<string> $lines) ==> {
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
            Vec\map(
              $fields,
              $field ==> '/* HH_FIXME[4110] use `as` */ $'.$field,
            ),
          )
          ->getCode(),
      );
  }

  private function generateRewriteChildrenMethod(
    Schema\TAST $syntax,
  ): CodegenMethod {
    $cg = $this->getCodegenFactory();

    $fields = Vec\map($syntax['fields'], $field ==> $field['field_name']);

    return $cg
      ->codegenMethod('rewriteChildren<Tret as ?Node>')
      ->setIsOverride()
      ->addParameter('(function(Node, vec<Node>): Tret) $rewriter')
      ->addParameter('vec<Node> $parents = vec[]')
      ->setReturnType('this')
      ->setBody(
        $cg
          ->codegenHackBuilder()
          ->addLine('$parents[] = $this;')
          ->addLines(
            Vec\map(
              $fields,
              $field ==> {
                $spec = $this->getTypeSpecForField($syntax, $field);
                if (!$spec['nullable']) {
                  return Str\format(
                    '$%s = $rewriter($this->_%s, $parents);',
                    $field,
                    $field,
                  );
                }
                return Str\format(
                  '$%s = $this->_%s === null '.
                  '? null : $rewriter($this->_%s, $parents);',
                  $field,
                  $field,
                  $field,
                );
              },
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
                (vec<string> $lines) ==> {
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
            Vec\map(
              $fields,
              $field ==> '/* HH_FIXME[4110] use `as` */ $'.$field,
            ),
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
    $hardcoded = $this->getHardcodedTypes()[$syntax['kind_name']][$field] ??
      null;
    if ($hardcoded !== null) {
      return $hardcoded;
    }
    $key = Str\format(
      '%s.%s_%s',
      $syntax['description'],
      $syntax['prefix'],
      $field,
    );
    $specs = $this->getRelationships();
    if (!C\contains_key($specs, $key)) {
      return shape(
        'class' => 'Node',
        'nullable' => true,
        'possibleTypes' => keyset['unknown'],
      );
    }

    $children = $specs[$key] |> Keyset\filter($$, $c ==> $c !== 'error');
    $possible_types = Keyset\map(
      $children,
      $child ==> $this->getSyntaxClass($child),
    );

    $nullable = C\contains_key($children, 'missing');

    if ($nullable) {
      $children = Keyset\filter($children, $child ==> $child !== 'missing');
    }

    $unified = $this->getUnifiedSyntaxClass($children);
    return shape(
      'class' => $unified,
      'nullable' => $nullable,
      'possibleTypes' => $possible_types,
    );
  }

  <<__Memoize>>
  private function getSyntaxClass(string $child): string {
    if ($child === 'token') {
      return 'Token';
    }
    if ($child === 'list<>') {
      return 'NodeList<Node>';
    }
    if (Str\starts_with($child, 'list<')) {
      return $child
        |> Str\strip_prefix($$, 'list<')
        |> Str\strip_suffix($$, '>')
        |> Str\split($$, '|')
        |> keyset($$)
        |> 'NodeList<'.$this->getUnifiedSyntaxClass($$).'>';
    }
    if (Str\starts_with($child, 'list_item<')) {
      return $child
        |> Str\strip_prefix($$, 'list_item<')
        |> Str\strip_suffix($$, '>')
        |> 'ListItem<'.$this->getSyntaxClass($$).'>';
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

  <<__Memoize>>
  private function getInterfaceWrappers(): dict<string, keyset<string>> {
    $wrappable_to_marker = dict[
      HHAST\INameishNode::class => keyset['IExpression'],
      IWrappableWithSimpleTypeSpecifier::class => keyset['ITypeSpecifier'],
    ];
    $impls_to_interfaces = dict[];
    foreach ($wrappable_to_marker as $w => $m) {
      $impls = $this->getMarkerInterfacesByInterface()[Str\strip_prefix(
        $w,
        'Facebook\\HHAST\\',
      )];
      foreach ($impls as $impl) {
        $impls_to_interfaces[$impl] = Keyset\union(
          $impls_to_interfaces[$impl] ?? keyset[],
          $m,
        );
      }
    }
    return $impls_to_interfaces;
  }

  private static function getKindsWithManualSubclasses(): keyset<string> {
    return keyset[
      HHAST\AwaitableCreationExpression::class,
      HHAST\ClassishDeclaration::class,
      HHAST\MethodishDeclaration::class,
      HHAST\NamespaceDeclaration::class,
      HHAST\ParameterDeclaration::class,
      HHAST\Script::class,
    ]
      |> Keyset\map(
        $$,
        $class ==> Str\strip_prefix($class, 'Facebook\\HHAST\\'),
      );
  }

  private function getHardcodedTypes(
  ): dict<string, dict<string, self::TFieldSpec>> {
    $node = (bool $nullable, string $key) ==> shape(
      'class' => 'Node',
      'nullable' => $nullable,
      'possibleTypes' => $this->getRelationships()[$key] ?? keyset['unknown'],
    );
    return dict[
      'FunctionCallExpression' => dict[
        'receiver' =>
          $node(false, 'function_call_expression.function_call_receiver'),
      ],
      // Not an IExpression: IExpression | classname | xhp classname; name
      // tokens are referencing class names, not constants.
      'InstanceofExpression' => dict[
        'right_operand' =>
          $node(false, 'instanceof_expression.instanceof_right_operand'),
      ],
    ];
  }
}
