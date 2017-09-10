<?hh
/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<b5bc35da0fbf118299a8b4f8eef3fbc5>>
 */
namespace Facebook\HHAST;

final class EndOfFile extends EditableSyntax {

  private EditableSyntax $_token;

  public function __construct(EditableSyntax $token) {
    parent::__construct('end_of_file');
    $this->_token = $token;
  }

  public static function from_json(
    array<string, mixed> $json,
    int $position,
    string $source,
  ): this {
    $token = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['end_of_file_token'],
      $position,
      $source,
    );
    $position += $token->width();
    return new self($token);
  }

  public function children(): KeyedTraversable<string, EditableSyntax> {
    yield 'token' => $this->_token;
  }

  public function rewrite(
    self::TRewriter $rewriter,
    ?Traversable<EditableSyntax> $parents = null,
  ): EditableSyntax {
    $parents = $parents === null ? vec[] : vec($parents);
    $child_parents = $parents;
    $child_parents[] = $this;
    $token = $this->_token->rewrite($rewriter, $child_parents);
    if ($token === $this->token()) {
      $node = $this;
    } else {
      $node = new self($token);
    }
    return $rewriter($node, $parents);
  }

  public function token(): EditableSyntax {
    return $this->_token;
  }

  public function with_token(EditableSyntax $value): this {
    return new self($value);
  }
}

final class Script extends EditableSyntax {

  private EditableSyntax $_declarations;

  public function __construct(EditableSyntax $declarations) {
    parent::__construct('script');
    $this->_declarations = $declarations;
  }

  public static function from_json(
    array<string, mixed> $json,
    int $position,
    string $source,
  ): this {
    $declarations = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['script_declarations'],
      $position,
      $source,
    );
    $position += $declarations->width();
    return new self($declarations);
  }

  public function children(): KeyedTraversable<string, EditableSyntax> {
    yield 'declarations' => $this->_declarations;
  }

  public function rewrite(
    self::TRewriter $rewriter,
    ?Traversable<EditableSyntax> $parents = null,
  ): EditableSyntax {
    $parents = $parents === null ? vec[] : vec($parents);
    $child_parents = $parents;
    $child_parents[] = $this;
    $declarations = $this->_declarations->rewrite($rewriter, $child_parents);
    if ($declarations === $this->declarations()) {
      $node = $this;
    } else {
      $node = new self($declarations);
    }
    return $rewriter($node, $parents);
  }

  public function declarations(): EditableSyntax {
    return $this->_declarations;
  }

  public function with_declarations(EditableSyntax $value): this {
    return new self($value);
  }
}

final class SimpleTypeSpecifier extends EditableSyntax {

  private EditableSyntax $_specifier;

  public function __construct(EditableSyntax $specifier) {
    parent::__construct('simple_type_specifier');
    $this->_specifier = $specifier;
  }

  public static function from_json(
    array<string, mixed> $json,
    int $position,
    string $source,
  ): this {
    $specifier = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['simple_type_specifier'],
      $position,
      $source,
    );
    $position += $specifier->width();
    return new self($specifier);
  }

  public function children(): KeyedTraversable<string, EditableSyntax> {
    yield 'specifier' => $this->_specifier;
  }

  public function rewrite(
    self::TRewriter $rewriter,
    ?Traversable<EditableSyntax> $parents = null,
  ): EditableSyntax {
    $parents = $parents === null ? vec[] : vec($parents);
    $child_parents = $parents;
    $child_parents[] = $this;
    $specifier = $this->_specifier->rewrite($rewriter, $child_parents);
    if ($specifier === $this->specifier()) {
      $node = $this;
    } else {
      $node = new self($specifier);
    }
    return $rewriter($node, $parents);
  }

  public function specifier(): EditableSyntax {
    return $this->_specifier;
  }

  public function with_specifier(EditableSyntax $value): this {
    return new self($value);
  }
}

final class LiteralExpression extends EditableSyntax {

  private EditableSyntax $_expression;

  public function __construct(EditableSyntax $expression) {
    parent::__construct('literal_expression');
    $this->_expression = $expression;
  }

  public static function from_json(
    array<string, mixed> $json,
    int $position,
    string $source,
  ): this {
    $expression = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['literal_expression'],
      $position,
      $source,
    );
    $position += $expression->width();
    return new self($expression);
  }

  public function children(): KeyedTraversable<string, EditableSyntax> {
    yield 'expression' => $this->_expression;
  }

  public function rewrite(
    self::TRewriter $rewriter,
    ?Traversable<EditableSyntax> $parents = null,
  ): EditableSyntax {
    $parents = $parents === null ? vec[] : vec($parents);
    $child_parents = $parents;
    $child_parents[] = $this;
    $expression = $this->_expression->rewrite($rewriter, $child_parents);
    if ($expression === $this->expression()) {
      $node = $this;
    } else {
      $node = new self($expression);
    }
    return $rewriter($node, $parents);
  }

  public function expression(): EditableSyntax {
    return $this->_expression;
  }

  public function with_expression(EditableSyntax $value): this {
    return new self($value);
  }
}

final class VariableExpression extends EditableSyntax {

  private EditableSyntax $_expression;

  public function __construct(EditableSyntax $expression) {
    parent::__construct('variable_expression');
    $this->_expression = $expression;
  }

  public static function from_json(
    array<string, mixed> $json,
    int $position,
    string $source,
  ): this {
    $expression = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['variable_expression'],
      $position,
      $source,
    );
    $position += $expression->width();
    return new self($expression);
  }

  public function children(): KeyedTraversable<string, EditableSyntax> {
    yield 'expression' => $this->_expression;
  }

  public function rewrite(
    self::TRewriter $rewriter,
    ?Traversable<EditableSyntax> $parents = null,
  ): EditableSyntax {
    $parents = $parents === null ? vec[] : vec($parents);
    $child_parents = $parents;
    $child_parents[] = $this;
    $expression = $this->_expression->rewrite($rewriter, $child_parents);
    if ($expression === $this->expression()) {
      $node = $this;
    } else {
      $node = new self($expression);
    }
    return $rewriter($node, $parents);
  }

  public function expression(): EditableSyntax {
    return $this->_expression;
  }

  public function with_expression(EditableSyntax $value): this {
    return new self($value);
  }
}

final class QualifiedNameExpression extends EditableSyntax {

  private EditableSyntax $_expression;

  public function __construct(EditableSyntax $expression) {
    parent::__construct('qualified_name_expression');
    $this->_expression = $expression;
  }

  public static function from_json(
    array<string, mixed> $json,
    int $position,
    string $source,
  ): this {
    $expression = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['qualified_name_expression'],
      $position,
      $source,
    );
    $position += $expression->width();
    return new self($expression);
  }

  public function children(): KeyedTraversable<string, EditableSyntax> {
    yield 'expression' => $this->_expression;
  }

  public function rewrite(
    self::TRewriter $rewriter,
    ?Traversable<EditableSyntax> $parents = null,
  ): EditableSyntax {
    $parents = $parents === null ? vec[] : vec($parents);
    $child_parents = $parents;
    $child_parents[] = $this;
    $expression = $this->_expression->rewrite($rewriter, $child_parents);
    if ($expression === $this->expression()) {
      $node = $this;
    } else {
      $node = new self($expression);
    }
    return $rewriter($node, $parents);
  }

  public function expression(): EditableSyntax {
    return $this->_expression;
  }

  public function with_expression(EditableSyntax $value): this {
    return new self($value);
  }
}

final class PipeVariableExpression extends EditableSyntax {

  private EditableSyntax $_expression;

  public function __construct(EditableSyntax $expression) {
    parent::__construct('pipe_variable_expression');
    $this->_expression = $expression;
  }

  public static function from_json(
    array<string, mixed> $json,
    int $position,
    string $source,
  ): this {
    $expression = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['pipe_variable_expression'],
      $position,
      $source,
    );
    $position += $expression->width();
    return new self($expression);
  }

  public function children(): KeyedTraversable<string, EditableSyntax> {
    yield 'expression' => $this->_expression;
  }

  public function rewrite(
    self::TRewriter $rewriter,
    ?Traversable<EditableSyntax> $parents = null,
  ): EditableSyntax {
    $parents = $parents === null ? vec[] : vec($parents);
    $child_parents = $parents;
    $child_parents[] = $this;
    $expression = $this->_expression->rewrite($rewriter, $child_parents);
    if ($expression === $this->expression()) {
      $node = $this;
    } else {
      $node = new self($expression);
    }
    return $rewriter($node, $parents);
  }

  public function expression(): EditableSyntax {
    return $this->_expression;
  }

  public function with_expression(EditableSyntax $value): this {
    return new self($value);
  }
}

final class EnumDeclaration extends EditableSyntax {

  private EditableSyntax $_attribute_spec;
  private EditableSyntax $_keyword;
  private EditableSyntax $_name;
  private EditableSyntax $_colon;
  private EditableSyntax $_base;
  private EditableSyntax $_type;
  private EditableSyntax $_left_brace;
  private EditableSyntax $_enumerators;
  private EditableSyntax $_right_brace;

  public function __construct(
    EditableSyntax $attribute_spec,
    EditableSyntax $keyword,
    EditableSyntax $name,
    EditableSyntax $colon,
    EditableSyntax $base,
    EditableSyntax $type,
    EditableSyntax $left_brace,
    EditableSyntax $enumerators,
    EditableSyntax $right_brace,
  ) {
    parent::__construct('enum_declaration');
    $this->_attribute_spec = $attribute_spec;
    $this->_keyword = $keyword;
    $this->_name = $name;
    $this->_colon = $colon;
    $this->_base = $base;
    $this->_type = $type;
    $this->_left_brace = $left_brace;
    $this->_enumerators = $enumerators;
    $this->_right_brace = $right_brace;
  }

  public static function from_json(
    array<string, mixed> $json,
    int $position,
    string $source,
  ): this {
    $attribute_spec = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['enum_attribute_spec'],
      $position,
      $source,
    );
    $position += $attribute_spec->width();
    $keyword = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['enum_keyword'],
      $position,
      $source,
    );
    $position += $keyword->width();
    $name = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['enum_name'],
      $position,
      $source,
    );
    $position += $name->width();
    $colon = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['enum_colon'],
      $position,
      $source,
    );
    $position += $colon->width();
    $base = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['enum_base'],
      $position,
      $source,
    );
    $position += $base->width();
    $type = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['enum_type'],
      $position,
      $source,
    );
    $position += $type->width();
    $left_brace = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['enum_left_brace'],
      $position,
      $source,
    );
    $position += $left_brace->width();
    $enumerators = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['enum_enumerators'],
      $position,
      $source,
    );
    $position += $enumerators->width();
    $right_brace = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['enum_right_brace'],
      $position,
      $source,
    );
    $position += $right_brace->width();
    return new self(
      $attribute_spec,
      $keyword,
      $name,
      $colon,
      $base,
      $type,
      $left_brace,
      $enumerators,
      $right_brace,
    );
  }

  public function children(): KeyedTraversable<string, EditableSyntax> {
    yield 'attribute_spec' => $this->_attribute_spec;
    yield 'keyword' => $this->_keyword;
    yield 'name' => $this->_name;
    yield 'colon' => $this->_colon;
    yield 'base' => $this->_base;
    yield 'type' => $this->_type;
    yield 'left_brace' => $this->_left_brace;
    yield 'enumerators' => $this->_enumerators;
    yield 'right_brace' => $this->_right_brace;
  }

  public function rewrite(
    self::TRewriter $rewriter,
    ?Traversable<EditableSyntax> $parents = null,
  ): EditableSyntax {
    $parents = $parents === null ? vec[] : vec($parents);
    $child_parents = $parents;
    $child_parents[] = $this;
    $attribute_spec =
      $this->_attribute_spec->rewrite($rewriter, $child_parents);
    $keyword = $this->_keyword->rewrite($rewriter, $child_parents);
    $name = $this->_name->rewrite($rewriter, $child_parents);
    $colon = $this->_colon->rewrite($rewriter, $child_parents);
    $base = $this->_base->rewrite($rewriter, $child_parents);
    $type = $this->_type->rewrite($rewriter, $child_parents);
    $left_brace = $this->_left_brace->rewrite($rewriter, $child_parents);
    $enumerators = $this->_enumerators->rewrite($rewriter, $child_parents);
    $right_brace = $this->_right_brace->rewrite($rewriter, $child_parents);
    if (
      $attribute_spec === $this->attribute_spec() &&
      $keyword === $this->keyword() &&
      $name === $this->name() &&
      $colon === $this->colon() &&
      $base === $this->base() &&
      $type === $this->type() &&
      $left_brace === $this->left_brace() &&
      $enumerators === $this->enumerators() &&
      $right_brace === $this->right_brace()
    ) {
      $node = $this;
    } else {
      $node = new self(
        $attribute_spec,
        $keyword,
        $name,
        $colon,
        $base,
        $type,
        $left_brace,
        $enumerators,
        $right_brace,
      );
    }
    return $rewriter($node, $parents);
  }

  public function attribute_spec(): EditableSyntax {
    return $this->_attribute_spec;
  }

  public function with_attribute_spec(EditableSyntax $value): this {
    return new self(
      $value,
      $this->_keyword,
      $this->_name,
      $this->_colon,
      $this->_base,
      $this->_type,
      $this->_left_brace,
      $this->_enumerators,
      $this->_right_brace,
    );
  }

  public function keyword(): EditableSyntax {
    return $this->_keyword;
  }

  public function with_keyword(EditableSyntax $value): this {
    return new self(
      $this->_attribute_spec,
      $value,
      $this->_name,
      $this->_colon,
      $this->_base,
      $this->_type,
      $this->_left_brace,
      $this->_enumerators,
      $this->_right_brace,
    );
  }

  public function name(): EditableSyntax {
    return $this->_name;
  }

  public function with_name(EditableSyntax $value): this {
    return new self(
      $this->_attribute_spec,
      $this->_keyword,
      $value,
      $this->_colon,
      $this->_base,
      $this->_type,
      $this->_left_brace,
      $this->_enumerators,
      $this->_right_brace,
    );
  }

  public function colon(): EditableSyntax {
    return $this->_colon;
  }

  public function with_colon(EditableSyntax $value): this {
    return new self(
      $this->_attribute_spec,
      $this->_keyword,
      $this->_name,
      $value,
      $this->_base,
      $this->_type,
      $this->_left_brace,
      $this->_enumerators,
      $this->_right_brace,
    );
  }

  public function base(): EditableSyntax {
    return $this->_base;
  }

  public function with_base(EditableSyntax $value): this {
    return new self(
      $this->_attribute_spec,
      $this->_keyword,
      $this->_name,
      $this->_colon,
      $value,
      $this->_type,
      $this->_left_brace,
      $this->_enumerators,
      $this->_right_brace,
    );
  }

  public function type(): EditableSyntax {
    return $this->_type;
  }

  public function with_type(EditableSyntax $value): this {
    return new self(
      $this->_attribute_spec,
      $this->_keyword,
      $this->_name,
      $this->_colon,
      $this->_base,
      $value,
      $this->_left_brace,
      $this->_enumerators,
      $this->_right_brace,
    );
  }

  public function left_brace(): EditableSyntax {
    return $this->_left_brace;
  }

  public function with_left_brace(EditableSyntax $value): this {
    return new self(
      $this->_attribute_spec,
      $this->_keyword,
      $this->_name,
      $this->_colon,
      $this->_base,
      $this->_type,
      $value,
      $this->_enumerators,
      $this->_right_brace,
    );
  }

  public function enumerators(): EditableSyntax {
    return $this->_enumerators;
  }

  public function with_enumerators(EditableSyntax $value): this {
    return new self(
      $this->_attribute_spec,
      $this->_keyword,
      $this->_name,
      $this->_colon,
      $this->_base,
      $this->_type,
      $this->_left_brace,
      $value,
      $this->_right_brace,
    );
  }

  public function right_brace(): EditableSyntax {
    return $this->_right_brace;
  }

  public function with_right_brace(EditableSyntax $value): this {
    return new self(
      $this->_attribute_spec,
      $this->_keyword,
      $this->_name,
      $this->_colon,
      $this->_base,
      $this->_type,
      $this->_left_brace,
      $this->_enumerators,
      $value,
    );
  }
}

final class Enumerator extends EditableSyntax {

  private EditableSyntax $_name;
  private EditableSyntax $_equal;
  private EditableSyntax $_value;
  private EditableSyntax $_semicolon;

  public function __construct(
    EditableSyntax $name,
    EditableSyntax $equal,
    EditableSyntax $value,
    EditableSyntax $semicolon,
  ) {
    parent::__construct('enumerator');
    $this->_name = $name;
    $this->_equal = $equal;
    $this->_value = $value;
    $this->_semicolon = $semicolon;
  }

  public static function from_json(
    array<string, mixed> $json,
    int $position,
    string $source,
  ): this {
    $name = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['enumerator_name'],
      $position,
      $source,
    );
    $position += $name->width();
    $equal = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['enumerator_equal'],
      $position,
      $source,
    );
    $position += $equal->width();
    $value = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['enumerator_value'],
      $position,
      $source,
    );
    $position += $value->width();
    $semicolon = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['enumerator_semicolon'],
      $position,
      $source,
    );
    $position += $semicolon->width();
    return new self($name, $equal, $value, $semicolon);
  }

  public function children(): KeyedTraversable<string, EditableSyntax> {
    yield 'name' => $this->_name;
    yield 'equal' => $this->_equal;
    yield 'value' => $this->_value;
    yield 'semicolon' => $this->_semicolon;
  }

  public function rewrite(
    self::TRewriter $rewriter,
    ?Traversable<EditableSyntax> $parents = null,
  ): EditableSyntax {
    $parents = $parents === null ? vec[] : vec($parents);
    $child_parents = $parents;
    $child_parents[] = $this;
    $name = $this->_name->rewrite($rewriter, $child_parents);
    $equal = $this->_equal->rewrite($rewriter, $child_parents);
    $value = $this->_value->rewrite($rewriter, $child_parents);
    $semicolon = $this->_semicolon->rewrite($rewriter, $child_parents);
    if (
      $name === $this->name() &&
      $equal === $this->equal() &&
      $value === $this->value() &&
      $semicolon === $this->semicolon()
    ) {
      $node = $this;
    } else {
      $node = new self($name, $equal, $value, $semicolon);
    }
    return $rewriter($node, $parents);
  }

  public function name(): EditableSyntax {
    return $this->_name;
  }

  public function with_name(EditableSyntax $value): this {
    return new self($value, $this->_equal, $this->_value, $this->_semicolon);
  }

  public function equal(): EditableSyntax {
    return $this->_equal;
  }

  public function with_equal(EditableSyntax $value): this {
    return new self($this->_name, $value, $this->_value, $this->_semicolon);
  }

  public function value(): EditableSyntax {
    return $this->_value;
  }

  public function with_value(EditableSyntax $value): this {
    return new self($this->_name, $this->_equal, $value, $this->_semicolon);
  }

  public function semicolon(): EditableSyntax {
    return $this->_semicolon;
  }

  public function with_semicolon(EditableSyntax $value): this {
    return new self($this->_name, $this->_equal, $this->_value, $value);
  }
}

final class AliasDeclaration extends EditableSyntax {

  private EditableSyntax $_attribute_spec;
  private EditableSyntax $_keyword;
  private EditableSyntax $_name;
  private EditableSyntax $_generic_parameter;
  private EditableSyntax $_constraint;
  private EditableSyntax $_equal;
  private EditableSyntax $_type;
  private EditableSyntax $_semicolon;

  public function __construct(
    EditableSyntax $attribute_spec,
    EditableSyntax $keyword,
    EditableSyntax $name,
    EditableSyntax $generic_parameter,
    EditableSyntax $constraint,
    EditableSyntax $equal,
    EditableSyntax $type,
    EditableSyntax $semicolon,
  ) {
    parent::__construct('alias_declaration');
    $this->_attribute_spec = $attribute_spec;
    $this->_keyword = $keyword;
    $this->_name = $name;
    $this->_generic_parameter = $generic_parameter;
    $this->_constraint = $constraint;
    $this->_equal = $equal;
    $this->_type = $type;
    $this->_semicolon = $semicolon;
  }

  public static function from_json(
    array<string, mixed> $json,
    int $position,
    string $source,
  ): this {
    $attribute_spec = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['alias_attribute_spec'],
      $position,
      $source,
    );
    $position += $attribute_spec->width();
    $keyword = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['alias_keyword'],
      $position,
      $source,
    );
    $position += $keyword->width();
    $name = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['alias_name'],
      $position,
      $source,
    );
    $position += $name->width();
    $generic_parameter = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['alias_generic_parameter'],
      $position,
      $source,
    );
    $position += $generic_parameter->width();
    $constraint = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['alias_constraint'],
      $position,
      $source,
    );
    $position += $constraint->width();
    $equal = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['alias_equal'],
      $position,
      $source,
    );
    $position += $equal->width();
    $type = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['alias_type'],
      $position,
      $source,
    );
    $position += $type->width();
    $semicolon = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['alias_semicolon'],
      $position,
      $source,
    );
    $position += $semicolon->width();
    return new self(
      $attribute_spec,
      $keyword,
      $name,
      $generic_parameter,
      $constraint,
      $equal,
      $type,
      $semicolon,
    );
  }

  public function children(): KeyedTraversable<string, EditableSyntax> {
    yield 'attribute_spec' => $this->_attribute_spec;
    yield 'keyword' => $this->_keyword;
    yield 'name' => $this->_name;
    yield 'generic_parameter' => $this->_generic_parameter;
    yield 'constraint' => $this->_constraint;
    yield 'equal' => $this->_equal;
    yield 'type' => $this->_type;
    yield 'semicolon' => $this->_semicolon;
  }

  public function rewrite(
    self::TRewriter $rewriter,
    ?Traversable<EditableSyntax> $parents = null,
  ): EditableSyntax {
    $parents = $parents === null ? vec[] : vec($parents);
    $child_parents = $parents;
    $child_parents[] = $this;
    $attribute_spec =
      $this->_attribute_spec->rewrite($rewriter, $child_parents);
    $keyword = $this->_keyword->rewrite($rewriter, $child_parents);
    $name = $this->_name->rewrite($rewriter, $child_parents);
    $generic_parameter =
      $this->_generic_parameter->rewrite($rewriter, $child_parents);
    $constraint = $this->_constraint->rewrite($rewriter, $child_parents);
    $equal = $this->_equal->rewrite($rewriter, $child_parents);
    $type = $this->_type->rewrite($rewriter, $child_parents);
    $semicolon = $this->_semicolon->rewrite($rewriter, $child_parents);
    if (
      $attribute_spec === $this->attribute_spec() &&
      $keyword === $this->keyword() &&
      $name === $this->name() &&
      $generic_parameter === $this->generic_parameter() &&
      $constraint === $this->constraint() &&
      $equal === $this->equal() &&
      $type === $this->type() &&
      $semicolon === $this->semicolon()
    ) {
      $node = $this;
    } else {
      $node = new self(
        $attribute_spec,
        $keyword,
        $name,
        $generic_parameter,
        $constraint,
        $equal,
        $type,
        $semicolon,
      );
    }
    return $rewriter($node, $parents);
  }

  public function attribute_spec(): EditableSyntax {
    return $this->_attribute_spec;
  }

  public function with_attribute_spec(EditableSyntax $value): this {
    return new self(
      $value,
      $this->_keyword,
      $this->_name,
      $this->_generic_parameter,
      $this->_constraint,
      $this->_equal,
      $this->_type,
      $this->_semicolon,
    );
  }

  public function keyword(): EditableSyntax {
    return $this->_keyword;
  }

  public function with_keyword(EditableSyntax $value): this {
    return new self(
      $this->_attribute_spec,
      $value,
      $this->_name,
      $this->_generic_parameter,
      $this->_constraint,
      $this->_equal,
      $this->_type,
      $this->_semicolon,
    );
  }

  public function name(): EditableSyntax {
    return $this->_name;
  }

  public function with_name(EditableSyntax $value): this {
    return new self(
      $this->_attribute_spec,
      $this->_keyword,
      $value,
      $this->_generic_parameter,
      $this->_constraint,
      $this->_equal,
      $this->_type,
      $this->_semicolon,
    );
  }

  public function generic_parameter(): EditableSyntax {
    return $this->_generic_parameter;
  }

  public function with_generic_parameter(EditableSyntax $value): this {
    return new self(
      $this->_attribute_spec,
      $this->_keyword,
      $this->_name,
      $value,
      $this->_constraint,
      $this->_equal,
      $this->_type,
      $this->_semicolon,
    );
  }

  public function constraint(): EditableSyntax {
    return $this->_constraint;
  }

  public function with_constraint(EditableSyntax $value): this {
    return new self(
      $this->_attribute_spec,
      $this->_keyword,
      $this->_name,
      $this->_generic_parameter,
      $value,
      $this->_equal,
      $this->_type,
      $this->_semicolon,
    );
  }

  public function equal(): EditableSyntax {
    return $this->_equal;
  }

  public function with_equal(EditableSyntax $value): this {
    return new self(
      $this->_attribute_spec,
      $this->_keyword,
      $this->_name,
      $this->_generic_parameter,
      $this->_constraint,
      $value,
      $this->_type,
      $this->_semicolon,
    );
  }

  public function type(): EditableSyntax {
    return $this->_type;
  }

  public function with_type(EditableSyntax $value): this {
    return new self(
      $this->_attribute_spec,
      $this->_keyword,
      $this->_name,
      $this->_generic_parameter,
      $this->_constraint,
      $this->_equal,
      $value,
      $this->_semicolon,
    );
  }

  public function semicolon(): EditableSyntax {
    return $this->_semicolon;
  }

  public function with_semicolon(EditableSyntax $value): this {
    return new self(
      $this->_attribute_spec,
      $this->_keyword,
      $this->_name,
      $this->_generic_parameter,
      $this->_constraint,
      $this->_equal,
      $this->_type,
      $value,
    );
  }
}

final class PropertyDeclaration extends EditableSyntax {

  private EditableSyntax $_modifiers;
  private EditableSyntax $_type;
  private EditableSyntax $_declarators;
  private EditableSyntax $_semicolon;

  public function __construct(
    EditableSyntax $modifiers,
    EditableSyntax $type,
    EditableSyntax $declarators,
    EditableSyntax $semicolon,
  ) {
    parent::__construct('property_declaration');
    $this->_modifiers = $modifiers;
    $this->_type = $type;
    $this->_declarators = $declarators;
    $this->_semicolon = $semicolon;
  }

  public static function from_json(
    array<string, mixed> $json,
    int $position,
    string $source,
  ): this {
    $modifiers = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['property_modifiers'],
      $position,
      $source,
    );
    $position += $modifiers->width();
    $type = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['property_type'],
      $position,
      $source,
    );
    $position += $type->width();
    $declarators = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['property_declarators'],
      $position,
      $source,
    );
    $position += $declarators->width();
    $semicolon = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['property_semicolon'],
      $position,
      $source,
    );
    $position += $semicolon->width();
    return new self($modifiers, $type, $declarators, $semicolon);
  }

  public function children(): KeyedTraversable<string, EditableSyntax> {
    yield 'modifiers' => $this->_modifiers;
    yield 'type' => $this->_type;
    yield 'declarators' => $this->_declarators;
    yield 'semicolon' => $this->_semicolon;
  }

  public function rewrite(
    self::TRewriter $rewriter,
    ?Traversable<EditableSyntax> $parents = null,
  ): EditableSyntax {
    $parents = $parents === null ? vec[] : vec($parents);
    $child_parents = $parents;
    $child_parents[] = $this;
    $modifiers = $this->_modifiers->rewrite($rewriter, $child_parents);
    $type = $this->_type->rewrite($rewriter, $child_parents);
    $declarators = $this->_declarators->rewrite($rewriter, $child_parents);
    $semicolon = $this->_semicolon->rewrite($rewriter, $child_parents);
    if (
      $modifiers === $this->modifiers() &&
      $type === $this->type() &&
      $declarators === $this->declarators() &&
      $semicolon === $this->semicolon()
    ) {
      $node = $this;
    } else {
      $node = new self($modifiers, $type, $declarators, $semicolon);
    }
    return $rewriter($node, $parents);
  }

  public function modifiers(): EditableSyntax {
    return $this->_modifiers;
  }

  public function with_modifiers(EditableSyntax $value): this {
    return
      new self($value, $this->_type, $this->_declarators, $this->_semicolon);
  }

  public function type(): EditableSyntax {
    return $this->_type;
  }

  public function with_type(EditableSyntax $value): this {
    return new self(
      $this->_modifiers,
      $value,
      $this->_declarators,
      $this->_semicolon,
    );
  }

  public function declarators(): EditableSyntax {
    return $this->_declarators;
  }

  public function with_declarators(EditableSyntax $value): this {
    return new self($this->_modifiers, $this->_type, $value, $this->_semicolon);
  }

  public function semicolon(): EditableSyntax {
    return $this->_semicolon;
  }

  public function with_semicolon(EditableSyntax $value): this {
    return
      new self($this->_modifiers, $this->_type, $this->_declarators, $value);
  }
}

final class PropertyDeclarator extends EditableSyntax {

  private EditableSyntax $_name;
  private EditableSyntax $_initializer;

  public function __construct(
    EditableSyntax $name,
    EditableSyntax $initializer,
  ) {
    parent::__construct('property_declarator');
    $this->_name = $name;
    $this->_initializer = $initializer;
  }

  public static function from_json(
    array<string, mixed> $json,
    int $position,
    string $source,
  ): this {
    $name = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['property_name'],
      $position,
      $source,
    );
    $position += $name->width();
    $initializer = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['property_initializer'],
      $position,
      $source,
    );
    $position += $initializer->width();
    return new self($name, $initializer);
  }

  public function children(): KeyedTraversable<string, EditableSyntax> {
    yield 'name' => $this->_name;
    yield 'initializer' => $this->_initializer;
  }

  public function rewrite(
    self::TRewriter $rewriter,
    ?Traversable<EditableSyntax> $parents = null,
  ): EditableSyntax {
    $parents = $parents === null ? vec[] : vec($parents);
    $child_parents = $parents;
    $child_parents[] = $this;
    $name = $this->_name->rewrite($rewriter, $child_parents);
    $initializer = $this->_initializer->rewrite($rewriter, $child_parents);
    if ($name === $this->name() && $initializer === $this->initializer()) {
      $node = $this;
    } else {
      $node = new self($name, $initializer);
    }
    return $rewriter($node, $parents);
  }

  public function name(): EditableSyntax {
    return $this->_name;
  }

  public function with_name(EditableSyntax $value): this {
    return new self($value, $this->_initializer);
  }

  public function initializer(): EditableSyntax {
    return $this->_initializer;
  }

  public function with_initializer(EditableSyntax $value): this {
    return new self($this->_name, $value);
  }
}

final class NamespaceDeclaration extends EditableSyntax {

  private EditableSyntax $_keyword;
  private EditableSyntax $_name;
  private EditableSyntax $_body;

  public function __construct(
    EditableSyntax $keyword,
    EditableSyntax $name,
    EditableSyntax $body,
  ) {
    parent::__construct('namespace_declaration');
    $this->_keyword = $keyword;
    $this->_name = $name;
    $this->_body = $body;
  }

  public static function from_json(
    array<string, mixed> $json,
    int $position,
    string $source,
  ): this {
    $keyword = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['namespace_keyword'],
      $position,
      $source,
    );
    $position += $keyword->width();
    $name = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['namespace_name'],
      $position,
      $source,
    );
    $position += $name->width();
    $body = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['namespace_body'],
      $position,
      $source,
    );
    $position += $body->width();
    return new self($keyword, $name, $body);
  }

  public function children(): KeyedTraversable<string, EditableSyntax> {
    yield 'keyword' => $this->_keyword;
    yield 'name' => $this->_name;
    yield 'body' => $this->_body;
  }

  public function rewrite(
    self::TRewriter $rewriter,
    ?Traversable<EditableSyntax> $parents = null,
  ): EditableSyntax {
    $parents = $parents === null ? vec[] : vec($parents);
    $child_parents = $parents;
    $child_parents[] = $this;
    $keyword = $this->_keyword->rewrite($rewriter, $child_parents);
    $name = $this->_name->rewrite($rewriter, $child_parents);
    $body = $this->_body->rewrite($rewriter, $child_parents);
    if (
      $keyword === $this->keyword() &&
      $name === $this->name() &&
      $body === $this->body()
    ) {
      $node = $this;
    } else {
      $node = new self($keyword, $name, $body);
    }
    return $rewriter($node, $parents);
  }

  public function keyword(): EditableSyntax {
    return $this->_keyword;
  }

  public function with_keyword(EditableSyntax $value): this {
    return new self($value, $this->_name, $this->_body);
  }

  public function name(): EditableSyntax {
    return $this->_name;
  }

  public function with_name(EditableSyntax $value): this {
    return new self($this->_keyword, $value, $this->_body);
  }

  public function body(): EditableSyntax {
    return $this->_body;
  }

  public function with_body(EditableSyntax $value): this {
    return new self($this->_keyword, $this->_name, $value);
  }
}

final class NamespaceBody extends EditableSyntax {

  private EditableSyntax $_left_brace;
  private EditableSyntax $_declarations;
  private EditableSyntax $_right_brace;

  public function __construct(
    EditableSyntax $left_brace,
    EditableSyntax $declarations,
    EditableSyntax $right_brace,
  ) {
    parent::__construct('namespace_body');
    $this->_left_brace = $left_brace;
    $this->_declarations = $declarations;
    $this->_right_brace = $right_brace;
  }

  public static function from_json(
    array<string, mixed> $json,
    int $position,
    string $source,
  ): this {
    $left_brace = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['namespace_left_brace'],
      $position,
      $source,
    );
    $position += $left_brace->width();
    $declarations = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['namespace_declarations'],
      $position,
      $source,
    );
    $position += $declarations->width();
    $right_brace = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['namespace_right_brace'],
      $position,
      $source,
    );
    $position += $right_brace->width();
    return new self($left_brace, $declarations, $right_brace);
  }

  public function children(): KeyedTraversable<string, EditableSyntax> {
    yield 'left_brace' => $this->_left_brace;
    yield 'declarations' => $this->_declarations;
    yield 'right_brace' => $this->_right_brace;
  }

  public function rewrite(
    self::TRewriter $rewriter,
    ?Traversable<EditableSyntax> $parents = null,
  ): EditableSyntax {
    $parents = $parents === null ? vec[] : vec($parents);
    $child_parents = $parents;
    $child_parents[] = $this;
    $left_brace = $this->_left_brace->rewrite($rewriter, $child_parents);
    $declarations = $this->_declarations->rewrite($rewriter, $child_parents);
    $right_brace = $this->_right_brace->rewrite($rewriter, $child_parents);
    if (
      $left_brace === $this->left_brace() &&
      $declarations === $this->declarations() &&
      $right_brace === $this->right_brace()
    ) {
      $node = $this;
    } else {
      $node = new self($left_brace, $declarations, $right_brace);
    }
    return $rewriter($node, $parents);
  }

  public function left_brace(): EditableSyntax {
    return $this->_left_brace;
  }

  public function with_left_brace(EditableSyntax $value): this {
    return new self($value, $this->_declarations, $this->_right_brace);
  }

  public function declarations(): EditableSyntax {
    return $this->_declarations;
  }

  public function with_declarations(EditableSyntax $value): this {
    return new self($this->_left_brace, $value, $this->_right_brace);
  }

  public function right_brace(): EditableSyntax {
    return $this->_right_brace;
  }

  public function with_right_brace(EditableSyntax $value): this {
    return new self($this->_left_brace, $this->_declarations, $value);
  }
}

final class NamespaceEmptyBody extends EditableSyntax {

  private EditableSyntax $_semicolon;

  public function __construct(EditableSyntax $semicolon) {
    parent::__construct('namespace_empty_body');
    $this->_semicolon = $semicolon;
  }

  public static function from_json(
    array<string, mixed> $json,
    int $position,
    string $source,
  ): this {
    $semicolon = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['namespace_semicolon'],
      $position,
      $source,
    );
    $position += $semicolon->width();
    return new self($semicolon);
  }

  public function children(): KeyedTraversable<string, EditableSyntax> {
    yield 'semicolon' => $this->_semicolon;
  }

  public function rewrite(
    self::TRewriter $rewriter,
    ?Traversable<EditableSyntax> $parents = null,
  ): EditableSyntax {
    $parents = $parents === null ? vec[] : vec($parents);
    $child_parents = $parents;
    $child_parents[] = $this;
    $semicolon = $this->_semicolon->rewrite($rewriter, $child_parents);
    if ($semicolon === $this->semicolon()) {
      $node = $this;
    } else {
      $node = new self($semicolon);
    }
    return $rewriter($node, $parents);
  }

  public function semicolon(): EditableSyntax {
    return $this->_semicolon;
  }

  public function with_semicolon(EditableSyntax $value): this {
    return new self($value);
  }
}

final class NamespaceUseDeclaration extends EditableSyntax {

  private EditableSyntax $_keyword;
  private EditableSyntax $_kind;
  private EditableSyntax $_clauses;
  private EditableSyntax $_semicolon;

  public function __construct(
    EditableSyntax $keyword,
    EditableSyntax $kind,
    EditableSyntax $clauses,
    EditableSyntax $semicolon,
  ) {
    parent::__construct('namespace_use_declaration');
    $this->_keyword = $keyword;
    $this->_kind = $kind;
    $this->_clauses = $clauses;
    $this->_semicolon = $semicolon;
  }

  public static function from_json(
    array<string, mixed> $json,
    int $position,
    string $source,
  ): this {
    $keyword = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['namespace_use_keyword'],
      $position,
      $source,
    );
    $position += $keyword->width();
    $kind = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['namespace_use_kind'],
      $position,
      $source,
    );
    $position += $kind->width();
    $clauses = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['namespace_use_clauses'],
      $position,
      $source,
    );
    $position += $clauses->width();
    $semicolon = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['namespace_use_semicolon'],
      $position,
      $source,
    );
    $position += $semicolon->width();
    return new self($keyword, $kind, $clauses, $semicolon);
  }

  public function children(): KeyedTraversable<string, EditableSyntax> {
    yield 'keyword' => $this->_keyword;
    yield 'kind' => $this->_kind;
    yield 'clauses' => $this->_clauses;
    yield 'semicolon' => $this->_semicolon;
  }

  public function rewrite(
    self::TRewriter $rewriter,
    ?Traversable<EditableSyntax> $parents = null,
  ): EditableSyntax {
    $parents = $parents === null ? vec[] : vec($parents);
    $child_parents = $parents;
    $child_parents[] = $this;
    $keyword = $this->_keyword->rewrite($rewriter, $child_parents);
    $kind = $this->_kind->rewrite($rewriter, $child_parents);
    $clauses = $this->_clauses->rewrite($rewriter, $child_parents);
    $semicolon = $this->_semicolon->rewrite($rewriter, $child_parents);
    if (
      $keyword === $this->keyword() &&
      $kind === $this->kind() &&
      $clauses === $this->clauses() &&
      $semicolon === $this->semicolon()
    ) {
      $node = $this;
    } else {
      $node = new self($keyword, $kind, $clauses, $semicolon);
    }
    return $rewriter($node, $parents);
  }

  public function keyword(): EditableSyntax {
    return $this->_keyword;
  }

  public function with_keyword(EditableSyntax $value): this {
    return new self($value, $this->_kind, $this->_clauses, $this->_semicolon);
  }

  public function kind(): EditableSyntax {
    return $this->_kind;
  }

  public function with_kind(EditableSyntax $value): this {
    return
      new self($this->_keyword, $value, $this->_clauses, $this->_semicolon);
  }

  public function clauses(): EditableSyntax {
    return $this->_clauses;
  }

  public function with_clauses(EditableSyntax $value): this {
    return new self($this->_keyword, $this->_kind, $value, $this->_semicolon);
  }

  public function semicolon(): EditableSyntax {
    return $this->_semicolon;
  }

  public function with_semicolon(EditableSyntax $value): this {
    return new self($this->_keyword, $this->_kind, $this->_clauses, $value);
  }
}

final class NamespaceGroupUseDeclaration extends EditableSyntax {

  private EditableSyntax $_keyword;
  private EditableSyntax $_kind;
  private EditableSyntax $_prefix;
  private EditableSyntax $_left_brace;
  private EditableSyntax $_clauses;
  private EditableSyntax $_right_brace;
  private EditableSyntax $_semicolon;

  public function __construct(
    EditableSyntax $keyword,
    EditableSyntax $kind,
    EditableSyntax $prefix,
    EditableSyntax $left_brace,
    EditableSyntax $clauses,
    EditableSyntax $right_brace,
    EditableSyntax $semicolon,
  ) {
    parent::__construct('namespace_group_use_declaration');
    $this->_keyword = $keyword;
    $this->_kind = $kind;
    $this->_prefix = $prefix;
    $this->_left_brace = $left_brace;
    $this->_clauses = $clauses;
    $this->_right_brace = $right_brace;
    $this->_semicolon = $semicolon;
  }

  public static function from_json(
    array<string, mixed> $json,
    int $position,
    string $source,
  ): this {
    $keyword = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['namespace_group_use_keyword'],
      $position,
      $source,
    );
    $position += $keyword->width();
    $kind = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['namespace_group_use_kind'],
      $position,
      $source,
    );
    $position += $kind->width();
    $prefix = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['namespace_group_use_prefix'],
      $position,
      $source,
    );
    $position += $prefix->width();
    $left_brace = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['namespace_group_use_left_brace'],
      $position,
      $source,
    );
    $position += $left_brace->width();
    $clauses = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['namespace_group_use_clauses'],
      $position,
      $source,
    );
    $position += $clauses->width();
    $right_brace = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['namespace_group_use_right_brace'],
      $position,
      $source,
    );
    $position += $right_brace->width();
    $semicolon = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['namespace_group_use_semicolon'],
      $position,
      $source,
    );
    $position += $semicolon->width();
    return new self(
      $keyword,
      $kind,
      $prefix,
      $left_brace,
      $clauses,
      $right_brace,
      $semicolon,
    );
  }

  public function children(): KeyedTraversable<string, EditableSyntax> {
    yield 'keyword' => $this->_keyword;
    yield 'kind' => $this->_kind;
    yield 'prefix' => $this->_prefix;
    yield 'left_brace' => $this->_left_brace;
    yield 'clauses' => $this->_clauses;
    yield 'right_brace' => $this->_right_brace;
    yield 'semicolon' => $this->_semicolon;
  }

  public function rewrite(
    self::TRewriter $rewriter,
    ?Traversable<EditableSyntax> $parents = null,
  ): EditableSyntax {
    $parents = $parents === null ? vec[] : vec($parents);
    $child_parents = $parents;
    $child_parents[] = $this;
    $keyword = $this->_keyword->rewrite($rewriter, $child_parents);
    $kind = $this->_kind->rewrite($rewriter, $child_parents);
    $prefix = $this->_prefix->rewrite($rewriter, $child_parents);
    $left_brace = $this->_left_brace->rewrite($rewriter, $child_parents);
    $clauses = $this->_clauses->rewrite($rewriter, $child_parents);
    $right_brace = $this->_right_brace->rewrite($rewriter, $child_parents);
    $semicolon = $this->_semicolon->rewrite($rewriter, $child_parents);
    if (
      $keyword === $this->keyword() &&
      $kind === $this->kind() &&
      $prefix === $this->prefix() &&
      $left_brace === $this->left_brace() &&
      $clauses === $this->clauses() &&
      $right_brace === $this->right_brace() &&
      $semicolon === $this->semicolon()
    ) {
      $node = $this;
    } else {
      $node = new self(
        $keyword,
        $kind,
        $prefix,
        $left_brace,
        $clauses,
        $right_brace,
        $semicolon,
      );
    }
    return $rewriter($node, $parents);
  }

  public function keyword(): EditableSyntax {
    return $this->_keyword;
  }

  public function with_keyword(EditableSyntax $value): this {
    return new self(
      $value,
      $this->_kind,
      $this->_prefix,
      $this->_left_brace,
      $this->_clauses,
      $this->_right_brace,
      $this->_semicolon,
    );
  }

  public function kind(): EditableSyntax {
    return $this->_kind;
  }

  public function with_kind(EditableSyntax $value): this {
    return new self(
      $this->_keyword,
      $value,
      $this->_prefix,
      $this->_left_brace,
      $this->_clauses,
      $this->_right_brace,
      $this->_semicolon,
    );
  }

  public function prefix(): EditableSyntax {
    return $this->_prefix;
  }

  public function with_prefix(EditableSyntax $value): this {
    return new self(
      $this->_keyword,
      $this->_kind,
      $value,
      $this->_left_brace,
      $this->_clauses,
      $this->_right_brace,
      $this->_semicolon,
    );
  }

  public function left_brace(): EditableSyntax {
    return $this->_left_brace;
  }

  public function with_left_brace(EditableSyntax $value): this {
    return new self(
      $this->_keyword,
      $this->_kind,
      $this->_prefix,
      $value,
      $this->_clauses,
      $this->_right_brace,
      $this->_semicolon,
    );
  }

  public function clauses(): EditableSyntax {
    return $this->_clauses;
  }

  public function with_clauses(EditableSyntax $value): this {
    return new self(
      $this->_keyword,
      $this->_kind,
      $this->_prefix,
      $this->_left_brace,
      $value,
      $this->_right_brace,
      $this->_semicolon,
    );
  }

  public function right_brace(): EditableSyntax {
    return $this->_right_brace;
  }

  public function with_right_brace(EditableSyntax $value): this {
    return new self(
      $this->_keyword,
      $this->_kind,
      $this->_prefix,
      $this->_left_brace,
      $this->_clauses,
      $value,
      $this->_semicolon,
    );
  }

  public function semicolon(): EditableSyntax {
    return $this->_semicolon;
  }

  public function with_semicolon(EditableSyntax $value): this {
    return new self(
      $this->_keyword,
      $this->_kind,
      $this->_prefix,
      $this->_left_brace,
      $this->_clauses,
      $this->_right_brace,
      $value,
    );
  }
}

final class NamespaceUseClause extends EditableSyntax {

  private EditableSyntax $_clause_kind;
  private EditableSyntax $_name;
  private EditableSyntax $_as;
  private EditableSyntax $_alias;

  public function __construct(
    EditableSyntax $clause_kind,
    EditableSyntax $name,
    EditableSyntax $as,
    EditableSyntax $alias,
  ) {
    parent::__construct('namespace_use_clause');
    $this->_clause_kind = $clause_kind;
    $this->_name = $name;
    $this->_as = $as;
    $this->_alias = $alias;
  }

  public static function from_json(
    array<string, mixed> $json,
    int $position,
    string $source,
  ): this {
    $clause_kind = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['namespace_use_clause_kind'],
      $position,
      $source,
    );
    $position += $clause_kind->width();
    $name = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['namespace_use_name'],
      $position,
      $source,
    );
    $position += $name->width();
    $as = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['namespace_use_as'],
      $position,
      $source,
    );
    $position += $as->width();
    $alias = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['namespace_use_alias'],
      $position,
      $source,
    );
    $position += $alias->width();
    return new self($clause_kind, $name, $as, $alias);
  }

  public function children(): KeyedTraversable<string, EditableSyntax> {
    yield 'clause_kind' => $this->_clause_kind;
    yield 'name' => $this->_name;
    yield 'as' => $this->_as;
    yield 'alias' => $this->_alias;
  }

  public function rewrite(
    self::TRewriter $rewriter,
    ?Traversable<EditableSyntax> $parents = null,
  ): EditableSyntax {
    $parents = $parents === null ? vec[] : vec($parents);
    $child_parents = $parents;
    $child_parents[] = $this;
    $clause_kind = $this->_clause_kind->rewrite($rewriter, $child_parents);
    $name = $this->_name->rewrite($rewriter, $child_parents);
    $as = $this->_as->rewrite($rewriter, $child_parents);
    $alias = $this->_alias->rewrite($rewriter, $child_parents);
    if (
      $clause_kind === $this->clause_kind() &&
      $name === $this->name() &&
      $as === $this->as() &&
      $alias === $this->alias()
    ) {
      $node = $this;
    } else {
      $node = new self($clause_kind, $name, $as, $alias);
    }
    return $rewriter($node, $parents);
  }

  public function clause_kind(): EditableSyntax {
    return $this->_clause_kind;
  }

  public function with_clause_kind(EditableSyntax $value): this {
    return new self($value, $this->_name, $this->_as, $this->_alias);
  }

  public function name(): EditableSyntax {
    return $this->_name;
  }

  public function with_name(EditableSyntax $value): this {
    return new self($this->_clause_kind, $value, $this->_as, $this->_alias);
  }

  public function as(): EditableSyntax {
    return $this->_as;
  }

  public function with_as(EditableSyntax $value): this {
    return new self($this->_clause_kind, $this->_name, $value, $this->_alias);
  }

  public function alias(): EditableSyntax {
    return $this->_alias;
  }

  public function with_alias(EditableSyntax $value): this {
    return new self($this->_clause_kind, $this->_name, $this->_as, $value);
  }
}

final class FunctionDeclaration extends EditableSyntax {

  private EditableSyntax $_attribute_spec;
  private EditableSyntax $_declaration_header;
  private EditableSyntax $_body;

  public function __construct(
    EditableSyntax $attribute_spec,
    EditableSyntax $declaration_header,
    EditableSyntax $body,
  ) {
    parent::__construct('function_declaration');
    $this->_attribute_spec = $attribute_spec;
    $this->_declaration_header = $declaration_header;
    $this->_body = $body;
  }

  public static function from_json(
    array<string, mixed> $json,
    int $position,
    string $source,
  ): this {
    $attribute_spec = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['function_attribute_spec'],
      $position,
      $source,
    );
    $position += $attribute_spec->width();
    $declaration_header = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['function_declaration_header'],
      $position,
      $source,
    );
    $position += $declaration_header->width();
    $body = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['function_body'],
      $position,
      $source,
    );
    $position += $body->width();
    return new self($attribute_spec, $declaration_header, $body);
  }

  public function children(): KeyedTraversable<string, EditableSyntax> {
    yield 'attribute_spec' => $this->_attribute_spec;
    yield 'declaration_header' => $this->_declaration_header;
    yield 'body' => $this->_body;
  }

  public function rewrite(
    self::TRewriter $rewriter,
    ?Traversable<EditableSyntax> $parents = null,
  ): EditableSyntax {
    $parents = $parents === null ? vec[] : vec($parents);
    $child_parents = $parents;
    $child_parents[] = $this;
    $attribute_spec =
      $this->_attribute_spec->rewrite($rewriter, $child_parents);
    $declaration_header =
      $this->_declaration_header->rewrite($rewriter, $child_parents);
    $body = $this->_body->rewrite($rewriter, $child_parents);
    if (
      $attribute_spec === $this->attribute_spec() &&
      $declaration_header === $this->declaration_header() &&
      $body === $this->body()
    ) {
      $node = $this;
    } else {
      $node = new self($attribute_spec, $declaration_header, $body);
    }
    return $rewriter($node, $parents);
  }

  public function attribute_spec(): EditableSyntax {
    return $this->_attribute_spec;
  }

  public function with_attribute_spec(EditableSyntax $value): this {
    return new self($value, $this->_declaration_header, $this->_body);
  }

  public function declaration_header(): EditableSyntax {
    return $this->_declaration_header;
  }

  public function with_declaration_header(EditableSyntax $value): this {
    return new self($this->_attribute_spec, $value, $this->_body);
  }

  public function body(): EditableSyntax {
    return $this->_body;
  }

  public function with_body(EditableSyntax $value): this {
    return new self($this->_attribute_spec, $this->_declaration_header, $value);
  }
}

final class FunctionDeclarationHeader extends EditableSyntax {

  private EditableSyntax $_async;
  private EditableSyntax $_coroutine;
  private EditableSyntax $_keyword;
  private EditableSyntax $_ampersand;
  private EditableSyntax $_name;
  private EditableSyntax $_type_parameter_list;
  private EditableSyntax $_left_paren;
  private EditableSyntax $_parameter_list;
  private EditableSyntax $_right_paren;
  private EditableSyntax $_colon;
  private EditableSyntax $_type;
  private EditableSyntax $_where_clause;

  public function __construct(
    EditableSyntax $async,
    EditableSyntax $coroutine,
    EditableSyntax $keyword,
    EditableSyntax $ampersand,
    EditableSyntax $name,
    EditableSyntax $type_parameter_list,
    EditableSyntax $left_paren,
    EditableSyntax $parameter_list,
    EditableSyntax $right_paren,
    EditableSyntax $colon,
    EditableSyntax $type,
    EditableSyntax $where_clause,
  ) {
    parent::__construct('function_declaration_header');
    $this->_async = $async;
    $this->_coroutine = $coroutine;
    $this->_keyword = $keyword;
    $this->_ampersand = $ampersand;
    $this->_name = $name;
    $this->_type_parameter_list = $type_parameter_list;
    $this->_left_paren = $left_paren;
    $this->_parameter_list = $parameter_list;
    $this->_right_paren = $right_paren;
    $this->_colon = $colon;
    $this->_type = $type;
    $this->_where_clause = $where_clause;
  }

  public static function from_json(
    array<string, mixed> $json,
    int $position,
    string $source,
  ): this {
    $async = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['function_async'],
      $position,
      $source,
    );
    $position += $async->width();
    $coroutine = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['function_coroutine'],
      $position,
      $source,
    );
    $position += $coroutine->width();
    $keyword = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['function_keyword'],
      $position,
      $source,
    );
    $position += $keyword->width();
    $ampersand = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['function_ampersand'],
      $position,
      $source,
    );
    $position += $ampersand->width();
    $name = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['function_name'],
      $position,
      $source,
    );
    $position += $name->width();
    $type_parameter_list = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['function_type_parameter_list'],
      $position,
      $source,
    );
    $position += $type_parameter_list->width();
    $left_paren = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['function_left_paren'],
      $position,
      $source,
    );
    $position += $left_paren->width();
    $parameter_list = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['function_parameter_list'],
      $position,
      $source,
    );
    $position += $parameter_list->width();
    $right_paren = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['function_right_paren'],
      $position,
      $source,
    );
    $position += $right_paren->width();
    $colon = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['function_colon'],
      $position,
      $source,
    );
    $position += $colon->width();
    $type = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['function_type'],
      $position,
      $source,
    );
    $position += $type->width();
    $where_clause = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['function_where_clause'],
      $position,
      $source,
    );
    $position += $where_clause->width();
    return new self(
      $async,
      $coroutine,
      $keyword,
      $ampersand,
      $name,
      $type_parameter_list,
      $left_paren,
      $parameter_list,
      $right_paren,
      $colon,
      $type,
      $where_clause,
    );
  }

  public function children(): KeyedTraversable<string, EditableSyntax> {
    yield 'async' => $this->_async;
    yield 'coroutine' => $this->_coroutine;
    yield 'keyword' => $this->_keyword;
    yield 'ampersand' => $this->_ampersand;
    yield 'name' => $this->_name;
    yield 'type_parameter_list' => $this->_type_parameter_list;
    yield 'left_paren' => $this->_left_paren;
    yield 'parameter_list' => $this->_parameter_list;
    yield 'right_paren' => $this->_right_paren;
    yield 'colon' => $this->_colon;
    yield 'type' => $this->_type;
    yield 'where_clause' => $this->_where_clause;
  }

  public function rewrite(
    self::TRewriter $rewriter,
    ?Traversable<EditableSyntax> $parents = null,
  ): EditableSyntax {
    $parents = $parents === null ? vec[] : vec($parents);
    $child_parents = $parents;
    $child_parents[] = $this;
    $async = $this->_async->rewrite($rewriter, $child_parents);
    $coroutine = $this->_coroutine->rewrite($rewriter, $child_parents);
    $keyword = $this->_keyword->rewrite($rewriter, $child_parents);
    $ampersand = $this->_ampersand->rewrite($rewriter, $child_parents);
    $name = $this->_name->rewrite($rewriter, $child_parents);
    $type_parameter_list =
      $this->_type_parameter_list->rewrite($rewriter, $child_parents);
    $left_paren = $this->_left_paren->rewrite($rewriter, $child_parents);
    $parameter_list =
      $this->_parameter_list->rewrite($rewriter, $child_parents);
    $right_paren = $this->_right_paren->rewrite($rewriter, $child_parents);
    $colon = $this->_colon->rewrite($rewriter, $child_parents);
    $type = $this->_type->rewrite($rewriter, $child_parents);
    $where_clause = $this->_where_clause->rewrite($rewriter, $child_parents);
    if (
      $async === $this->async() &&
      $coroutine === $this->coroutine() &&
      $keyword === $this->keyword() &&
      $ampersand === $this->ampersand() &&
      $name === $this->name() &&
      $type_parameter_list === $this->type_parameter_list() &&
      $left_paren === $this->left_paren() &&
      $parameter_list === $this->parameter_list() &&
      $right_paren === $this->right_paren() &&
      $colon === $this->colon() &&
      $type === $this->type() &&
      $where_clause === $this->where_clause()
    ) {
      $node = $this;
    } else {
      $node = new self(
        $async,
        $coroutine,
        $keyword,
        $ampersand,
        $name,
        $type_parameter_list,
        $left_paren,
        $parameter_list,
        $right_paren,
        $colon,
        $type,
        $where_clause,
      );
    }
    return $rewriter($node, $parents);
  }

  public function async(): EditableSyntax {
    return $this->_async;
  }

  public function with_async(EditableSyntax $value): this {
    return new self(
      $value,
      $this->_coroutine,
      $this->_keyword,
      $this->_ampersand,
      $this->_name,
      $this->_type_parameter_list,
      $this->_left_paren,
      $this->_parameter_list,
      $this->_right_paren,
      $this->_colon,
      $this->_type,
      $this->_where_clause,
    );
  }

  public function coroutine(): EditableSyntax {
    return $this->_coroutine;
  }

  public function with_coroutine(EditableSyntax $value): this {
    return new self(
      $this->_async,
      $value,
      $this->_keyword,
      $this->_ampersand,
      $this->_name,
      $this->_type_parameter_list,
      $this->_left_paren,
      $this->_parameter_list,
      $this->_right_paren,
      $this->_colon,
      $this->_type,
      $this->_where_clause,
    );
  }

  public function keyword(): EditableSyntax {
    return $this->_keyword;
  }

  public function with_keyword(EditableSyntax $value): this {
    return new self(
      $this->_async,
      $this->_coroutine,
      $value,
      $this->_ampersand,
      $this->_name,
      $this->_type_parameter_list,
      $this->_left_paren,
      $this->_parameter_list,
      $this->_right_paren,
      $this->_colon,
      $this->_type,
      $this->_where_clause,
    );
  }

  public function ampersand(): EditableSyntax {
    return $this->_ampersand;
  }

  public function with_ampersand(EditableSyntax $value): this {
    return new self(
      $this->_async,
      $this->_coroutine,
      $this->_keyword,
      $value,
      $this->_name,
      $this->_type_parameter_list,
      $this->_left_paren,
      $this->_parameter_list,
      $this->_right_paren,
      $this->_colon,
      $this->_type,
      $this->_where_clause,
    );
  }

  public function name(): EditableSyntax {
    return $this->_name;
  }

  public function with_name(EditableSyntax $value): this {
    return new self(
      $this->_async,
      $this->_coroutine,
      $this->_keyword,
      $this->_ampersand,
      $value,
      $this->_type_parameter_list,
      $this->_left_paren,
      $this->_parameter_list,
      $this->_right_paren,
      $this->_colon,
      $this->_type,
      $this->_where_clause,
    );
  }

  public function type_parameter_list(): EditableSyntax {
    return $this->_type_parameter_list;
  }

  public function with_type_parameter_list(EditableSyntax $value): this {
    return new self(
      $this->_async,
      $this->_coroutine,
      $this->_keyword,
      $this->_ampersand,
      $this->_name,
      $value,
      $this->_left_paren,
      $this->_parameter_list,
      $this->_right_paren,
      $this->_colon,
      $this->_type,
      $this->_where_clause,
    );
  }

  public function left_paren(): EditableSyntax {
    return $this->_left_paren;
  }

  public function with_left_paren(EditableSyntax $value): this {
    return new self(
      $this->_async,
      $this->_coroutine,
      $this->_keyword,
      $this->_ampersand,
      $this->_name,
      $this->_type_parameter_list,
      $value,
      $this->_parameter_list,
      $this->_right_paren,
      $this->_colon,
      $this->_type,
      $this->_where_clause,
    );
  }

  public function parameter_list(): EditableSyntax {
    return $this->_parameter_list;
  }

  public function with_parameter_list(EditableSyntax $value): this {
    return new self(
      $this->_async,
      $this->_coroutine,
      $this->_keyword,
      $this->_ampersand,
      $this->_name,
      $this->_type_parameter_list,
      $this->_left_paren,
      $value,
      $this->_right_paren,
      $this->_colon,
      $this->_type,
      $this->_where_clause,
    );
  }

  public function right_paren(): EditableSyntax {
    return $this->_right_paren;
  }

  public function with_right_paren(EditableSyntax $value): this {
    return new self(
      $this->_async,
      $this->_coroutine,
      $this->_keyword,
      $this->_ampersand,
      $this->_name,
      $this->_type_parameter_list,
      $this->_left_paren,
      $this->_parameter_list,
      $value,
      $this->_colon,
      $this->_type,
      $this->_where_clause,
    );
  }

  public function colon(): EditableSyntax {
    return $this->_colon;
  }

  public function with_colon(EditableSyntax $value): this {
    return new self(
      $this->_async,
      $this->_coroutine,
      $this->_keyword,
      $this->_ampersand,
      $this->_name,
      $this->_type_parameter_list,
      $this->_left_paren,
      $this->_parameter_list,
      $this->_right_paren,
      $value,
      $this->_type,
      $this->_where_clause,
    );
  }

  public function type(): EditableSyntax {
    return $this->_type;
  }

  public function with_type(EditableSyntax $value): this {
    return new self(
      $this->_async,
      $this->_coroutine,
      $this->_keyword,
      $this->_ampersand,
      $this->_name,
      $this->_type_parameter_list,
      $this->_left_paren,
      $this->_parameter_list,
      $this->_right_paren,
      $this->_colon,
      $value,
      $this->_where_clause,
    );
  }

  public function where_clause(): EditableSyntax {
    return $this->_where_clause;
  }

  public function with_where_clause(EditableSyntax $value): this {
    return new self(
      $this->_async,
      $this->_coroutine,
      $this->_keyword,
      $this->_ampersand,
      $this->_name,
      $this->_type_parameter_list,
      $this->_left_paren,
      $this->_parameter_list,
      $this->_right_paren,
      $this->_colon,
      $this->_type,
      $value,
    );
  }
}

final class WhereClause extends EditableSyntax {

  private EditableSyntax $_keyword;
  private EditableSyntax $_constraints;

  public function __construct(
    EditableSyntax $keyword,
    EditableSyntax $constraints,
  ) {
    parent::__construct('where_clause');
    $this->_keyword = $keyword;
    $this->_constraints = $constraints;
  }

  public static function from_json(
    array<string, mixed> $json,
    int $position,
    string $source,
  ): this {
    $keyword = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['where_clause_keyword'],
      $position,
      $source,
    );
    $position += $keyword->width();
    $constraints = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['where_clause_constraints'],
      $position,
      $source,
    );
    $position += $constraints->width();
    return new self($keyword, $constraints);
  }

  public function children(): KeyedTraversable<string, EditableSyntax> {
    yield 'keyword' => $this->_keyword;
    yield 'constraints' => $this->_constraints;
  }

  public function rewrite(
    self::TRewriter $rewriter,
    ?Traversable<EditableSyntax> $parents = null,
  ): EditableSyntax {
    $parents = $parents === null ? vec[] : vec($parents);
    $child_parents = $parents;
    $child_parents[] = $this;
    $keyword = $this->_keyword->rewrite($rewriter, $child_parents);
    $constraints = $this->_constraints->rewrite($rewriter, $child_parents);
    if (
      $keyword === $this->keyword() && $constraints === $this->constraints()
    ) {
      $node = $this;
    } else {
      $node = new self($keyword, $constraints);
    }
    return $rewriter($node, $parents);
  }

  public function keyword(): EditableSyntax {
    return $this->_keyword;
  }

  public function with_keyword(EditableSyntax $value): this {
    return new self($value, $this->_constraints);
  }

  public function constraints(): EditableSyntax {
    return $this->_constraints;
  }

  public function with_constraints(EditableSyntax $value): this {
    return new self($this->_keyword, $value);
  }
}

final class WhereConstraint extends EditableSyntax {

  private EditableSyntax $_left_type;
  private EditableSyntax $_operator;
  private EditableSyntax $_right_type;

  public function __construct(
    EditableSyntax $left_type,
    EditableSyntax $operator,
    EditableSyntax $right_type,
  ) {
    parent::__construct('where_constraint');
    $this->_left_type = $left_type;
    $this->_operator = $operator;
    $this->_right_type = $right_type;
  }

  public static function from_json(
    array<string, mixed> $json,
    int $position,
    string $source,
  ): this {
    $left_type = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['where_constraint_left_type'],
      $position,
      $source,
    );
    $position += $left_type->width();
    $operator = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['where_constraint_operator'],
      $position,
      $source,
    );
    $position += $operator->width();
    $right_type = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['where_constraint_right_type'],
      $position,
      $source,
    );
    $position += $right_type->width();
    return new self($left_type, $operator, $right_type);
  }

  public function children(): KeyedTraversable<string, EditableSyntax> {
    yield 'left_type' => $this->_left_type;
    yield 'operator' => $this->_operator;
    yield 'right_type' => $this->_right_type;
  }

  public function rewrite(
    self::TRewriter $rewriter,
    ?Traversable<EditableSyntax> $parents = null,
  ): EditableSyntax {
    $parents = $parents === null ? vec[] : vec($parents);
    $child_parents = $parents;
    $child_parents[] = $this;
    $left_type = $this->_left_type->rewrite($rewriter, $child_parents);
    $operator = $this->_operator->rewrite($rewriter, $child_parents);
    $right_type = $this->_right_type->rewrite($rewriter, $child_parents);
    if (
      $left_type === $this->left_type() &&
      $operator === $this->operator() &&
      $right_type === $this->right_type()
    ) {
      $node = $this;
    } else {
      $node = new self($left_type, $operator, $right_type);
    }
    return $rewriter($node, $parents);
  }

  public function left_type(): EditableSyntax {
    return $this->_left_type;
  }

  public function with_left_type(EditableSyntax $value): this {
    return new self($value, $this->_operator, $this->_right_type);
  }

  public function operator(): EditableSyntax {
    return $this->_operator;
  }

  public function with_operator(EditableSyntax $value): this {
    return new self($this->_left_type, $value, $this->_right_type);
  }

  public function right_type(): EditableSyntax {
    return $this->_right_type;
  }

  public function with_right_type(EditableSyntax $value): this {
    return new self($this->_left_type, $this->_operator, $value);
  }
}

final class MethodishDeclaration extends EditableSyntax {

  private EditableSyntax $_attribute;
  private EditableSyntax $_modifiers;
  private EditableSyntax $_function_decl_header;
  private EditableSyntax $_function_body;
  private EditableSyntax $_semicolon;

  public function __construct(
    EditableSyntax $attribute,
    EditableSyntax $modifiers,
    EditableSyntax $function_decl_header,
    EditableSyntax $function_body,
    EditableSyntax $semicolon,
  ) {
    parent::__construct('methodish_declaration');
    $this->_attribute = $attribute;
    $this->_modifiers = $modifiers;
    $this->_function_decl_header = $function_decl_header;
    $this->_function_body = $function_body;
    $this->_semicolon = $semicolon;
  }

  public static function from_json(
    array<string, mixed> $json,
    int $position,
    string $source,
  ): this {
    $attribute = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['methodish_attribute'],
      $position,
      $source,
    );
    $position += $attribute->width();
    $modifiers = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['methodish_modifiers'],
      $position,
      $source,
    );
    $position += $modifiers->width();
    $function_decl_header = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['methodish_function_decl_header'],
      $position,
      $source,
    );
    $position += $function_decl_header->width();
    $function_body = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['methodish_function_body'],
      $position,
      $source,
    );
    $position += $function_body->width();
    $semicolon = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['methodish_semicolon'],
      $position,
      $source,
    );
    $position += $semicolon->width();
    return new self(
      $attribute,
      $modifiers,
      $function_decl_header,
      $function_body,
      $semicolon,
    );
  }

  public function children(): KeyedTraversable<string, EditableSyntax> {
    yield 'attribute' => $this->_attribute;
    yield 'modifiers' => $this->_modifiers;
    yield 'function_decl_header' => $this->_function_decl_header;
    yield 'function_body' => $this->_function_body;
    yield 'semicolon' => $this->_semicolon;
  }

  public function rewrite(
    self::TRewriter $rewriter,
    ?Traversable<EditableSyntax> $parents = null,
  ): EditableSyntax {
    $parents = $parents === null ? vec[] : vec($parents);
    $child_parents = $parents;
    $child_parents[] = $this;
    $attribute = $this->_attribute->rewrite($rewriter, $child_parents);
    $modifiers = $this->_modifiers->rewrite($rewriter, $child_parents);
    $function_decl_header =
      $this->_function_decl_header->rewrite($rewriter, $child_parents);
    $function_body = $this->_function_body->rewrite($rewriter, $child_parents);
    $semicolon = $this->_semicolon->rewrite($rewriter, $child_parents);
    if (
      $attribute === $this->attribute() &&
      $modifiers === $this->modifiers() &&
      $function_decl_header === $this->function_decl_header() &&
      $function_body === $this->function_body() &&
      $semicolon === $this->semicolon()
    ) {
      $node = $this;
    } else {
      $node = new self(
        $attribute,
        $modifiers,
        $function_decl_header,
        $function_body,
        $semicolon,
      );
    }
    return $rewriter($node, $parents);
  }

  public function attribute(): EditableSyntax {
    return $this->_attribute;
  }

  public function with_attribute(EditableSyntax $value): this {
    return new self(
      $value,
      $this->_modifiers,
      $this->_function_decl_header,
      $this->_function_body,
      $this->_semicolon,
    );
  }

  public function modifiers(): EditableSyntax {
    return $this->_modifiers;
  }

  public function with_modifiers(EditableSyntax $value): this {
    return new self(
      $this->_attribute,
      $value,
      $this->_function_decl_header,
      $this->_function_body,
      $this->_semicolon,
    );
  }

  public function function_decl_header(): EditableSyntax {
    return $this->_function_decl_header;
  }

  public function with_function_decl_header(EditableSyntax $value): this {
    return new self(
      $this->_attribute,
      $this->_modifiers,
      $value,
      $this->_function_body,
      $this->_semicolon,
    );
  }

  public function function_body(): EditableSyntax {
    return $this->_function_body;
  }

  public function with_function_body(EditableSyntax $value): this {
    return new self(
      $this->_attribute,
      $this->_modifiers,
      $this->_function_decl_header,
      $value,
      $this->_semicolon,
    );
  }

  public function semicolon(): EditableSyntax {
    return $this->_semicolon;
  }

  public function with_semicolon(EditableSyntax $value): this {
    return new self(
      $this->_attribute,
      $this->_modifiers,
      $this->_function_decl_header,
      $this->_function_body,
      $value,
    );
  }
}

final class ClassishDeclaration extends EditableSyntax {

  private EditableSyntax $_attribute;
  private EditableSyntax $_modifiers;
  private EditableSyntax $_keyword;
  private EditableSyntax $_name;
  private EditableSyntax $_type_parameters;
  private EditableSyntax $_extends_keyword;
  private EditableSyntax $_extends_list;
  private EditableSyntax $_implements_keyword;
  private EditableSyntax $_implements_list;
  private EditableSyntax $_body;

  public function __construct(
    EditableSyntax $attribute,
    EditableSyntax $modifiers,
    EditableSyntax $keyword,
    EditableSyntax $name,
    EditableSyntax $type_parameters,
    EditableSyntax $extends_keyword,
    EditableSyntax $extends_list,
    EditableSyntax $implements_keyword,
    EditableSyntax $implements_list,
    EditableSyntax $body,
  ) {
    parent::__construct('classish_declaration');
    $this->_attribute = $attribute;
    $this->_modifiers = $modifiers;
    $this->_keyword = $keyword;
    $this->_name = $name;
    $this->_type_parameters = $type_parameters;
    $this->_extends_keyword = $extends_keyword;
    $this->_extends_list = $extends_list;
    $this->_implements_keyword = $implements_keyword;
    $this->_implements_list = $implements_list;
    $this->_body = $body;
  }

  public static function from_json(
    array<string, mixed> $json,
    int $position,
    string $source,
  ): this {
    $attribute = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['classish_attribute'],
      $position,
      $source,
    );
    $position += $attribute->width();
    $modifiers = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['classish_modifiers'],
      $position,
      $source,
    );
    $position += $modifiers->width();
    $keyword = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['classish_keyword'],
      $position,
      $source,
    );
    $position += $keyword->width();
    $name = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['classish_name'],
      $position,
      $source,
    );
    $position += $name->width();
    $type_parameters = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['classish_type_parameters'],
      $position,
      $source,
    );
    $position += $type_parameters->width();
    $extends_keyword = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['classish_extends_keyword'],
      $position,
      $source,
    );
    $position += $extends_keyword->width();
    $extends_list = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['classish_extends_list'],
      $position,
      $source,
    );
    $position += $extends_list->width();
    $implements_keyword = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['classish_implements_keyword'],
      $position,
      $source,
    );
    $position += $implements_keyword->width();
    $implements_list = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['classish_implements_list'],
      $position,
      $source,
    );
    $position += $implements_list->width();
    $body = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['classish_body'],
      $position,
      $source,
    );
    $position += $body->width();
    return new self(
      $attribute,
      $modifiers,
      $keyword,
      $name,
      $type_parameters,
      $extends_keyword,
      $extends_list,
      $implements_keyword,
      $implements_list,
      $body,
    );
  }

  public function children(): KeyedTraversable<string, EditableSyntax> {
    yield 'attribute' => $this->_attribute;
    yield 'modifiers' => $this->_modifiers;
    yield 'keyword' => $this->_keyword;
    yield 'name' => $this->_name;
    yield 'type_parameters' => $this->_type_parameters;
    yield 'extends_keyword' => $this->_extends_keyword;
    yield 'extends_list' => $this->_extends_list;
    yield 'implements_keyword' => $this->_implements_keyword;
    yield 'implements_list' => $this->_implements_list;
    yield 'body' => $this->_body;
  }

  public function rewrite(
    self::TRewriter $rewriter,
    ?Traversable<EditableSyntax> $parents = null,
  ): EditableSyntax {
    $parents = $parents === null ? vec[] : vec($parents);
    $child_parents = $parents;
    $child_parents[] = $this;
    $attribute = $this->_attribute->rewrite($rewriter, $child_parents);
    $modifiers = $this->_modifiers->rewrite($rewriter, $child_parents);
    $keyword = $this->_keyword->rewrite($rewriter, $child_parents);
    $name = $this->_name->rewrite($rewriter, $child_parents);
    $type_parameters =
      $this->_type_parameters->rewrite($rewriter, $child_parents);
    $extends_keyword =
      $this->_extends_keyword->rewrite($rewriter, $child_parents);
    $extends_list = $this->_extends_list->rewrite($rewriter, $child_parents);
    $implements_keyword =
      $this->_implements_keyword->rewrite($rewriter, $child_parents);
    $implements_list =
      $this->_implements_list->rewrite($rewriter, $child_parents);
    $body = $this->_body->rewrite($rewriter, $child_parents);
    if (
      $attribute === $this->attribute() &&
      $modifiers === $this->modifiers() &&
      $keyword === $this->keyword() &&
      $name === $this->name() &&
      $type_parameters === $this->type_parameters() &&
      $extends_keyword === $this->extends_keyword() &&
      $extends_list === $this->extends_list() &&
      $implements_keyword === $this->implements_keyword() &&
      $implements_list === $this->implements_list() &&
      $body === $this->body()
    ) {
      $node = $this;
    } else {
      $node = new self(
        $attribute,
        $modifiers,
        $keyword,
        $name,
        $type_parameters,
        $extends_keyword,
        $extends_list,
        $implements_keyword,
        $implements_list,
        $body,
      );
    }
    return $rewriter($node, $parents);
  }

  public function attribute(): EditableSyntax {
    return $this->_attribute;
  }

  public function with_attribute(EditableSyntax $value): this {
    return new self(
      $value,
      $this->_modifiers,
      $this->_keyword,
      $this->_name,
      $this->_type_parameters,
      $this->_extends_keyword,
      $this->_extends_list,
      $this->_implements_keyword,
      $this->_implements_list,
      $this->_body,
    );
  }

  public function modifiers(): EditableSyntax {
    return $this->_modifiers;
  }

  public function with_modifiers(EditableSyntax $value): this {
    return new self(
      $this->_attribute,
      $value,
      $this->_keyword,
      $this->_name,
      $this->_type_parameters,
      $this->_extends_keyword,
      $this->_extends_list,
      $this->_implements_keyword,
      $this->_implements_list,
      $this->_body,
    );
  }

  public function keyword(): EditableSyntax {
    return $this->_keyword;
  }

  public function with_keyword(EditableSyntax $value): this {
    return new self(
      $this->_attribute,
      $this->_modifiers,
      $value,
      $this->_name,
      $this->_type_parameters,
      $this->_extends_keyword,
      $this->_extends_list,
      $this->_implements_keyword,
      $this->_implements_list,
      $this->_body,
    );
  }

  public function name(): EditableSyntax {
    return $this->_name;
  }

  public function with_name(EditableSyntax $value): this {
    return new self(
      $this->_attribute,
      $this->_modifiers,
      $this->_keyword,
      $value,
      $this->_type_parameters,
      $this->_extends_keyword,
      $this->_extends_list,
      $this->_implements_keyword,
      $this->_implements_list,
      $this->_body,
    );
  }

  public function type_parameters(): EditableSyntax {
    return $this->_type_parameters;
  }

  public function with_type_parameters(EditableSyntax $value): this {
    return new self(
      $this->_attribute,
      $this->_modifiers,
      $this->_keyword,
      $this->_name,
      $value,
      $this->_extends_keyword,
      $this->_extends_list,
      $this->_implements_keyword,
      $this->_implements_list,
      $this->_body,
    );
  }

  public function extends_keyword(): EditableSyntax {
    return $this->_extends_keyword;
  }

  public function with_extends_keyword(EditableSyntax $value): this {
    return new self(
      $this->_attribute,
      $this->_modifiers,
      $this->_keyword,
      $this->_name,
      $this->_type_parameters,
      $value,
      $this->_extends_list,
      $this->_implements_keyword,
      $this->_implements_list,
      $this->_body,
    );
  }

  public function extends_list(): EditableSyntax {
    return $this->_extends_list;
  }

  public function with_extends_list(EditableSyntax $value): this {
    return new self(
      $this->_attribute,
      $this->_modifiers,
      $this->_keyword,
      $this->_name,
      $this->_type_parameters,
      $this->_extends_keyword,
      $value,
      $this->_implements_keyword,
      $this->_implements_list,
      $this->_body,
    );
  }

  public function implements_keyword(): EditableSyntax {
    return $this->_implements_keyword;
  }

  public function with_implements_keyword(EditableSyntax $value): this {
    return new self(
      $this->_attribute,
      $this->_modifiers,
      $this->_keyword,
      $this->_name,
      $this->_type_parameters,
      $this->_extends_keyword,
      $this->_extends_list,
      $value,
      $this->_implements_list,
      $this->_body,
    );
  }

  public function implements_list(): EditableSyntax {
    return $this->_implements_list;
  }

  public function with_implements_list(EditableSyntax $value): this {
    return new self(
      $this->_attribute,
      $this->_modifiers,
      $this->_keyword,
      $this->_name,
      $this->_type_parameters,
      $this->_extends_keyword,
      $this->_extends_list,
      $this->_implements_keyword,
      $value,
      $this->_body,
    );
  }

  public function body(): EditableSyntax {
    return $this->_body;
  }

  public function with_body(EditableSyntax $value): this {
    return new self(
      $this->_attribute,
      $this->_modifiers,
      $this->_keyword,
      $this->_name,
      $this->_type_parameters,
      $this->_extends_keyword,
      $this->_extends_list,
      $this->_implements_keyword,
      $this->_implements_list,
      $value,
    );
  }
}

final class ClassishBody extends EditableSyntax {

  private EditableSyntax $_left_brace;
  private EditableSyntax $_elements;
  private EditableSyntax $_right_brace;

  public function __construct(
    EditableSyntax $left_brace,
    EditableSyntax $elements,
    EditableSyntax $right_brace,
  ) {
    parent::__construct('classish_body');
    $this->_left_brace = $left_brace;
    $this->_elements = $elements;
    $this->_right_brace = $right_brace;
  }

  public static function from_json(
    array<string, mixed> $json,
    int $position,
    string $source,
  ): this {
    $left_brace = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['classish_body_left_brace'],
      $position,
      $source,
    );
    $position += $left_brace->width();
    $elements = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['classish_body_elements'],
      $position,
      $source,
    );
    $position += $elements->width();
    $right_brace = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['classish_body_right_brace'],
      $position,
      $source,
    );
    $position += $right_brace->width();
    return new self($left_brace, $elements, $right_brace);
  }

  public function children(): KeyedTraversable<string, EditableSyntax> {
    yield 'left_brace' => $this->_left_brace;
    yield 'elements' => $this->_elements;
    yield 'right_brace' => $this->_right_brace;
  }

  public function rewrite(
    self::TRewriter $rewriter,
    ?Traversable<EditableSyntax> $parents = null,
  ): EditableSyntax {
    $parents = $parents === null ? vec[] : vec($parents);
    $child_parents = $parents;
    $child_parents[] = $this;
    $left_brace = $this->_left_brace->rewrite($rewriter, $child_parents);
    $elements = $this->_elements->rewrite($rewriter, $child_parents);
    $right_brace = $this->_right_brace->rewrite($rewriter, $child_parents);
    if (
      $left_brace === $this->left_brace() &&
      $elements === $this->elements() &&
      $right_brace === $this->right_brace()
    ) {
      $node = $this;
    } else {
      $node = new self($left_brace, $elements, $right_brace);
    }
    return $rewriter($node, $parents);
  }

  public function left_brace(): EditableSyntax {
    return $this->_left_brace;
  }

  public function with_left_brace(EditableSyntax $value): this {
    return new self($value, $this->_elements, $this->_right_brace);
  }

  public function elements(): EditableSyntax {
    return $this->_elements;
  }

  public function with_elements(EditableSyntax $value): this {
    return new self($this->_left_brace, $value, $this->_right_brace);
  }

  public function right_brace(): EditableSyntax {
    return $this->_right_brace;
  }

  public function with_right_brace(EditableSyntax $value): this {
    return new self($this->_left_brace, $this->_elements, $value);
  }
}

final class TraitUseConflictResolutionItem extends EditableSyntax {

  private EditableSyntax $_aliasing_name;
  private EditableSyntax $_aliasing_keyword;
  private EditableSyntax $_aliased_names;

  public function __construct(
    EditableSyntax $aliasing_name,
    EditableSyntax $aliasing_keyword,
    EditableSyntax $aliased_names,
  ) {
    parent::__construct('trait_use_conflict_resolution_item');
    $this->_aliasing_name = $aliasing_name;
    $this->_aliasing_keyword = $aliasing_keyword;
    $this->_aliased_names = $aliased_names;
  }

  public static function from_json(
    array<string, mixed> $json,
    int $position,
    string $source,
  ): this {
    $aliasing_name = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json[
        'trait_use_conflict_resolution_item_aliasing_name'
      ],
      $position,
      $source,
    );
    $position += $aliasing_name->width();
    $aliasing_keyword = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json[
        'trait_use_conflict_resolution_item_aliasing_keyword'
      ],
      $position,
      $source,
    );
    $position += $aliasing_keyword->width();
    $aliased_names = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json[
        'trait_use_conflict_resolution_item_aliased_names'
      ],
      $position,
      $source,
    );
    $position += $aliased_names->width();
    return new self($aliasing_name, $aliasing_keyword, $aliased_names);
  }

  public function children(): KeyedTraversable<string, EditableSyntax> {
    yield 'aliasing_name' => $this->_aliasing_name;
    yield 'aliasing_keyword' => $this->_aliasing_keyword;
    yield 'aliased_names' => $this->_aliased_names;
  }

  public function rewrite(
    self::TRewriter $rewriter,
    ?Traversable<EditableSyntax> $parents = null,
  ): EditableSyntax {
    $parents = $parents === null ? vec[] : vec($parents);
    $child_parents = $parents;
    $child_parents[] = $this;
    $aliasing_name = $this->_aliasing_name->rewrite($rewriter, $child_parents);
    $aliasing_keyword =
      $this->_aliasing_keyword->rewrite($rewriter, $child_parents);
    $aliased_names = $this->_aliased_names->rewrite($rewriter, $child_parents);
    if (
      $aliasing_name === $this->aliasing_name() &&
      $aliasing_keyword === $this->aliasing_keyword() &&
      $aliased_names === $this->aliased_names()
    ) {
      $node = $this;
    } else {
      $node = new self($aliasing_name, $aliasing_keyword, $aliased_names);
    }
    return $rewriter($node, $parents);
  }

  public function aliasing_name(): EditableSyntax {
    return $this->_aliasing_name;
  }

  public function with_aliasing_name(EditableSyntax $value): this {
    return new self($value, $this->_aliasing_keyword, $this->_aliased_names);
  }

  public function aliasing_keyword(): EditableSyntax {
    return $this->_aliasing_keyword;
  }

  public function with_aliasing_keyword(EditableSyntax $value): this {
    return new self($this->_aliasing_name, $value, $this->_aliased_names);
  }

  public function aliased_names(): EditableSyntax {
    return $this->_aliased_names;
  }

  public function with_aliased_names(EditableSyntax $value): this {
    return new self($this->_aliasing_name, $this->_aliasing_keyword, $value);
  }
}

final class TraitUseConflictResolution extends EditableSyntax {

  private EditableSyntax $_keyword;
  private EditableSyntax $_names;
  private EditableSyntax $_left_brace;
  private EditableSyntax $_clauses;
  private EditableSyntax $_right_brace;

  public function __construct(
    EditableSyntax $keyword,
    EditableSyntax $names,
    EditableSyntax $left_brace,
    EditableSyntax $clauses,
    EditableSyntax $right_brace,
  ) {
    parent::__construct('trait_use_conflict_resolution');
    $this->_keyword = $keyword;
    $this->_names = $names;
    $this->_left_brace = $left_brace;
    $this->_clauses = $clauses;
    $this->_right_brace = $right_brace;
  }

  public static function from_json(
    array<string, mixed> $json,
    int $position,
    string $source,
  ): this {
    $keyword = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['trait_use_conflict_resolution_keyword'],
      $position,
      $source,
    );
    $position += $keyword->width();
    $names = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['trait_use_conflict_resolution_names'],
      $position,
      $source,
    );
    $position += $names->width();
    $left_brace = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['trait_use_conflict_resolution_left_brace'],
      $position,
      $source,
    );
    $position += $left_brace->width();
    $clauses = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['trait_use_conflict_resolution_clauses'],
      $position,
      $source,
    );
    $position += $clauses->width();
    $right_brace = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['trait_use_conflict_resolution_right_brace'],
      $position,
      $source,
    );
    $position += $right_brace->width();
    return new self($keyword, $names, $left_brace, $clauses, $right_brace);
  }

  public function children(): KeyedTraversable<string, EditableSyntax> {
    yield 'keyword' => $this->_keyword;
    yield 'names' => $this->_names;
    yield 'left_brace' => $this->_left_brace;
    yield 'clauses' => $this->_clauses;
    yield 'right_brace' => $this->_right_brace;
  }

  public function rewrite(
    self::TRewriter $rewriter,
    ?Traversable<EditableSyntax> $parents = null,
  ): EditableSyntax {
    $parents = $parents === null ? vec[] : vec($parents);
    $child_parents = $parents;
    $child_parents[] = $this;
    $keyword = $this->_keyword->rewrite($rewriter, $child_parents);
    $names = $this->_names->rewrite($rewriter, $child_parents);
    $left_brace = $this->_left_brace->rewrite($rewriter, $child_parents);
    $clauses = $this->_clauses->rewrite($rewriter, $child_parents);
    $right_brace = $this->_right_brace->rewrite($rewriter, $child_parents);
    if (
      $keyword === $this->keyword() &&
      $names === $this->names() &&
      $left_brace === $this->left_brace() &&
      $clauses === $this->clauses() &&
      $right_brace === $this->right_brace()
    ) {
      $node = $this;
    } else {
      $node = new self($keyword, $names, $left_brace, $clauses, $right_brace);
    }
    return $rewriter($node, $parents);
  }

  public function keyword(): EditableSyntax {
    return $this->_keyword;
  }

  public function with_keyword(EditableSyntax $value): this {
    return new self(
      $value,
      $this->_names,
      $this->_left_brace,
      $this->_clauses,
      $this->_right_brace,
    );
  }

  public function names(): EditableSyntax {
    return $this->_names;
  }

  public function with_names(EditableSyntax $value): this {
    return new self(
      $this->_keyword,
      $value,
      $this->_left_brace,
      $this->_clauses,
      $this->_right_brace,
    );
  }

  public function left_brace(): EditableSyntax {
    return $this->_left_brace;
  }

  public function with_left_brace(EditableSyntax $value): this {
    return new self(
      $this->_keyword,
      $this->_names,
      $value,
      $this->_clauses,
      $this->_right_brace,
    );
  }

  public function clauses(): EditableSyntax {
    return $this->_clauses;
  }

  public function with_clauses(EditableSyntax $value): this {
    return new self(
      $this->_keyword,
      $this->_names,
      $this->_left_brace,
      $value,
      $this->_right_brace,
    );
  }

  public function right_brace(): EditableSyntax {
    return $this->_right_brace;
  }

  public function with_right_brace(EditableSyntax $value): this {
    return new self(
      $this->_keyword,
      $this->_names,
      $this->_left_brace,
      $this->_clauses,
      $value,
    );
  }
}

final class TraitUse extends EditableSyntax {

  private EditableSyntax $_keyword;
  private EditableSyntax $_names;
  private EditableSyntax $_semicolon;

  public function __construct(
    EditableSyntax $keyword,
    EditableSyntax $names,
    EditableSyntax $semicolon,
  ) {
    parent::__construct('trait_use');
    $this->_keyword = $keyword;
    $this->_names = $names;
    $this->_semicolon = $semicolon;
  }

  public static function from_json(
    array<string, mixed> $json,
    int $position,
    string $source,
  ): this {
    $keyword = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['trait_use_keyword'],
      $position,
      $source,
    );
    $position += $keyword->width();
    $names = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['trait_use_names'],
      $position,
      $source,
    );
    $position += $names->width();
    $semicolon = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['trait_use_semicolon'],
      $position,
      $source,
    );
    $position += $semicolon->width();
    return new self($keyword, $names, $semicolon);
  }

  public function children(): KeyedTraversable<string, EditableSyntax> {
    yield 'keyword' => $this->_keyword;
    yield 'names' => $this->_names;
    yield 'semicolon' => $this->_semicolon;
  }

  public function rewrite(
    self::TRewriter $rewriter,
    ?Traversable<EditableSyntax> $parents = null,
  ): EditableSyntax {
    $parents = $parents === null ? vec[] : vec($parents);
    $child_parents = $parents;
    $child_parents[] = $this;
    $keyword = $this->_keyword->rewrite($rewriter, $child_parents);
    $names = $this->_names->rewrite($rewriter, $child_parents);
    $semicolon = $this->_semicolon->rewrite($rewriter, $child_parents);
    if (
      $keyword === $this->keyword() &&
      $names === $this->names() &&
      $semicolon === $this->semicolon()
    ) {
      $node = $this;
    } else {
      $node = new self($keyword, $names, $semicolon);
    }
    return $rewriter($node, $parents);
  }

  public function keyword(): EditableSyntax {
    return $this->_keyword;
  }

  public function with_keyword(EditableSyntax $value): this {
    return new self($value, $this->_names, $this->_semicolon);
  }

  public function names(): EditableSyntax {
    return $this->_names;
  }

  public function with_names(EditableSyntax $value): this {
    return new self($this->_keyword, $value, $this->_semicolon);
  }

  public function semicolon(): EditableSyntax {
    return $this->_semicolon;
  }

  public function with_semicolon(EditableSyntax $value): this {
    return new self($this->_keyword, $this->_names, $value);
  }
}

final class RequireClause extends EditableSyntax {

  private EditableSyntax $_keyword;
  private EditableSyntax $_kind;
  private EditableSyntax $_name;
  private EditableSyntax $_semicolon;

  public function __construct(
    EditableSyntax $keyword,
    EditableSyntax $kind,
    EditableSyntax $name,
    EditableSyntax $semicolon,
  ) {
    parent::__construct('require_clause');
    $this->_keyword = $keyword;
    $this->_kind = $kind;
    $this->_name = $name;
    $this->_semicolon = $semicolon;
  }

  public static function from_json(
    array<string, mixed> $json,
    int $position,
    string $source,
  ): this {
    $keyword = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['require_keyword'],
      $position,
      $source,
    );
    $position += $keyword->width();
    $kind = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['require_kind'],
      $position,
      $source,
    );
    $position += $kind->width();
    $name = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['require_name'],
      $position,
      $source,
    );
    $position += $name->width();
    $semicolon = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['require_semicolon'],
      $position,
      $source,
    );
    $position += $semicolon->width();
    return new self($keyword, $kind, $name, $semicolon);
  }

  public function children(): KeyedTraversable<string, EditableSyntax> {
    yield 'keyword' => $this->_keyword;
    yield 'kind' => $this->_kind;
    yield 'name' => $this->_name;
    yield 'semicolon' => $this->_semicolon;
  }

  public function rewrite(
    self::TRewriter $rewriter,
    ?Traversable<EditableSyntax> $parents = null,
  ): EditableSyntax {
    $parents = $parents === null ? vec[] : vec($parents);
    $child_parents = $parents;
    $child_parents[] = $this;
    $keyword = $this->_keyword->rewrite($rewriter, $child_parents);
    $kind = $this->_kind->rewrite($rewriter, $child_parents);
    $name = $this->_name->rewrite($rewriter, $child_parents);
    $semicolon = $this->_semicolon->rewrite($rewriter, $child_parents);
    if (
      $keyword === $this->keyword() &&
      $kind === $this->kind() &&
      $name === $this->name() &&
      $semicolon === $this->semicolon()
    ) {
      $node = $this;
    } else {
      $node = new self($keyword, $kind, $name, $semicolon);
    }
    return $rewriter($node, $parents);
  }

  public function keyword(): EditableSyntax {
    return $this->_keyword;
  }

  public function with_keyword(EditableSyntax $value): this {
    return new self($value, $this->_kind, $this->_name, $this->_semicolon);
  }

  public function kind(): EditableSyntax {
    return $this->_kind;
  }

  public function with_kind(EditableSyntax $value): this {
    return new self($this->_keyword, $value, $this->_name, $this->_semicolon);
  }

  public function name(): EditableSyntax {
    return $this->_name;
  }

  public function with_name(EditableSyntax $value): this {
    return new self($this->_keyword, $this->_kind, $value, $this->_semicolon);
  }

  public function semicolon(): EditableSyntax {
    return $this->_semicolon;
  }

  public function with_semicolon(EditableSyntax $value): this {
    return new self($this->_keyword, $this->_kind, $this->_name, $value);
  }
}

final class ConstDeclaration extends EditableSyntax {

  private EditableSyntax $_abstract;
  private EditableSyntax $_keyword;
  private EditableSyntax $_type_specifier;
  private EditableSyntax $_declarators;
  private EditableSyntax $_semicolon;

  public function __construct(
    EditableSyntax $abstract,
    EditableSyntax $keyword,
    EditableSyntax $type_specifier,
    EditableSyntax $declarators,
    EditableSyntax $semicolon,
  ) {
    parent::__construct('const_declaration');
    $this->_abstract = $abstract;
    $this->_keyword = $keyword;
    $this->_type_specifier = $type_specifier;
    $this->_declarators = $declarators;
    $this->_semicolon = $semicolon;
  }

  public static function from_json(
    array<string, mixed> $json,
    int $position,
    string $source,
  ): this {
    $abstract = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['const_abstract'],
      $position,
      $source,
    );
    $position += $abstract->width();
    $keyword = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['const_keyword'],
      $position,
      $source,
    );
    $position += $keyword->width();
    $type_specifier = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['const_type_specifier'],
      $position,
      $source,
    );
    $position += $type_specifier->width();
    $declarators = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['const_declarators'],
      $position,
      $source,
    );
    $position += $declarators->width();
    $semicolon = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['const_semicolon'],
      $position,
      $source,
    );
    $position += $semicolon->width();
    return
      new self($abstract, $keyword, $type_specifier, $declarators, $semicolon);
  }

  public function children(): KeyedTraversable<string, EditableSyntax> {
    yield 'abstract' => $this->_abstract;
    yield 'keyword' => $this->_keyword;
    yield 'type_specifier' => $this->_type_specifier;
    yield 'declarators' => $this->_declarators;
    yield 'semicolon' => $this->_semicolon;
  }

  public function rewrite(
    self::TRewriter $rewriter,
    ?Traversable<EditableSyntax> $parents = null,
  ): EditableSyntax {
    $parents = $parents === null ? vec[] : vec($parents);
    $child_parents = $parents;
    $child_parents[] = $this;
    $abstract = $this->_abstract->rewrite($rewriter, $child_parents);
    $keyword = $this->_keyword->rewrite($rewriter, $child_parents);
    $type_specifier =
      $this->_type_specifier->rewrite($rewriter, $child_parents);
    $declarators = $this->_declarators->rewrite($rewriter, $child_parents);
    $semicolon = $this->_semicolon->rewrite($rewriter, $child_parents);
    if (
      $abstract === $this->abstract() &&
      $keyword === $this->keyword() &&
      $type_specifier === $this->type_specifier() &&
      $declarators === $this->declarators() &&
      $semicolon === $this->semicolon()
    ) {
      $node = $this;
    } else {
      $node = new self(
        $abstract,
        $keyword,
        $type_specifier,
        $declarators,
        $semicolon,
      );
    }
    return $rewriter($node, $parents);
  }

  public function abstract(): EditableSyntax {
    return $this->_abstract;
  }

  public function with_abstract(EditableSyntax $value): this {
    return new self(
      $value,
      $this->_keyword,
      $this->_type_specifier,
      $this->_declarators,
      $this->_semicolon,
    );
  }

  public function keyword(): EditableSyntax {
    return $this->_keyword;
  }

  public function with_keyword(EditableSyntax $value): this {
    return new self(
      $this->_abstract,
      $value,
      $this->_type_specifier,
      $this->_declarators,
      $this->_semicolon,
    );
  }

  public function type_specifier(): EditableSyntax {
    return $this->_type_specifier;
  }

  public function with_type_specifier(EditableSyntax $value): this {
    return new self(
      $this->_abstract,
      $this->_keyword,
      $value,
      $this->_declarators,
      $this->_semicolon,
    );
  }

  public function declarators(): EditableSyntax {
    return $this->_declarators;
  }

  public function with_declarators(EditableSyntax $value): this {
    return new self(
      $this->_abstract,
      $this->_keyword,
      $this->_type_specifier,
      $value,
      $this->_semicolon,
    );
  }

  public function semicolon(): EditableSyntax {
    return $this->_semicolon;
  }

  public function with_semicolon(EditableSyntax $value): this {
    return new self(
      $this->_abstract,
      $this->_keyword,
      $this->_type_specifier,
      $this->_declarators,
      $value,
    );
  }
}

final class ConstantDeclarator extends EditableSyntax {

  private EditableSyntax $_name;
  private EditableSyntax $_initializer;

  public function __construct(
    EditableSyntax $name,
    EditableSyntax $initializer,
  ) {
    parent::__construct('constant_declarator');
    $this->_name = $name;
    $this->_initializer = $initializer;
  }

  public static function from_json(
    array<string, mixed> $json,
    int $position,
    string $source,
  ): this {
    $name = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['constant_declarator_name'],
      $position,
      $source,
    );
    $position += $name->width();
    $initializer = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['constant_declarator_initializer'],
      $position,
      $source,
    );
    $position += $initializer->width();
    return new self($name, $initializer);
  }

  public function children(): KeyedTraversable<string, EditableSyntax> {
    yield 'name' => $this->_name;
    yield 'initializer' => $this->_initializer;
  }

  public function rewrite(
    self::TRewriter $rewriter,
    ?Traversable<EditableSyntax> $parents = null,
  ): EditableSyntax {
    $parents = $parents === null ? vec[] : vec($parents);
    $child_parents = $parents;
    $child_parents[] = $this;
    $name = $this->_name->rewrite($rewriter, $child_parents);
    $initializer = $this->_initializer->rewrite($rewriter, $child_parents);
    if ($name === $this->name() && $initializer === $this->initializer()) {
      $node = $this;
    } else {
      $node = new self($name, $initializer);
    }
    return $rewriter($node, $parents);
  }

  public function name(): EditableSyntax {
    return $this->_name;
  }

  public function with_name(EditableSyntax $value): this {
    return new self($value, $this->_initializer);
  }

  public function initializer(): EditableSyntax {
    return $this->_initializer;
  }

  public function with_initializer(EditableSyntax $value): this {
    return new self($this->_name, $value);
  }
}

final class TypeConstDeclaration extends EditableSyntax {

  private EditableSyntax $_abstract;
  private EditableSyntax $_keyword;
  private EditableSyntax $_type_keyword;
  private EditableSyntax $_name;
  private EditableSyntax $_type_constraint;
  private EditableSyntax $_equal;
  private EditableSyntax $_type_specifier;
  private EditableSyntax $_semicolon;

  public function __construct(
    EditableSyntax $abstract,
    EditableSyntax $keyword,
    EditableSyntax $type_keyword,
    EditableSyntax $name,
    EditableSyntax $type_constraint,
    EditableSyntax $equal,
    EditableSyntax $type_specifier,
    EditableSyntax $semicolon,
  ) {
    parent::__construct('type_const_declaration');
    $this->_abstract = $abstract;
    $this->_keyword = $keyword;
    $this->_type_keyword = $type_keyword;
    $this->_name = $name;
    $this->_type_constraint = $type_constraint;
    $this->_equal = $equal;
    $this->_type_specifier = $type_specifier;
    $this->_semicolon = $semicolon;
  }

  public static function from_json(
    array<string, mixed> $json,
    int $position,
    string $source,
  ): this {
    $abstract = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['type_const_abstract'],
      $position,
      $source,
    );
    $position += $abstract->width();
    $keyword = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['type_const_keyword'],
      $position,
      $source,
    );
    $position += $keyword->width();
    $type_keyword = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['type_const_type_keyword'],
      $position,
      $source,
    );
    $position += $type_keyword->width();
    $name = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['type_const_name'],
      $position,
      $source,
    );
    $position += $name->width();
    $type_constraint = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['type_const_type_constraint'],
      $position,
      $source,
    );
    $position += $type_constraint->width();
    $equal = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['type_const_equal'],
      $position,
      $source,
    );
    $position += $equal->width();
    $type_specifier = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['type_const_type_specifier'],
      $position,
      $source,
    );
    $position += $type_specifier->width();
    $semicolon = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['type_const_semicolon'],
      $position,
      $source,
    );
    $position += $semicolon->width();
    return new self(
      $abstract,
      $keyword,
      $type_keyword,
      $name,
      $type_constraint,
      $equal,
      $type_specifier,
      $semicolon,
    );
  }

  public function children(): KeyedTraversable<string, EditableSyntax> {
    yield 'abstract' => $this->_abstract;
    yield 'keyword' => $this->_keyword;
    yield 'type_keyword' => $this->_type_keyword;
    yield 'name' => $this->_name;
    yield 'type_constraint' => $this->_type_constraint;
    yield 'equal' => $this->_equal;
    yield 'type_specifier' => $this->_type_specifier;
    yield 'semicolon' => $this->_semicolon;
  }

  public function rewrite(
    self::TRewriter $rewriter,
    ?Traversable<EditableSyntax> $parents = null,
  ): EditableSyntax {
    $parents = $parents === null ? vec[] : vec($parents);
    $child_parents = $parents;
    $child_parents[] = $this;
    $abstract = $this->_abstract->rewrite($rewriter, $child_parents);
    $keyword = $this->_keyword->rewrite($rewriter, $child_parents);
    $type_keyword = $this->_type_keyword->rewrite($rewriter, $child_parents);
    $name = $this->_name->rewrite($rewriter, $child_parents);
    $type_constraint =
      $this->_type_constraint->rewrite($rewriter, $child_parents);
    $equal = $this->_equal->rewrite($rewriter, $child_parents);
    $type_specifier =
      $this->_type_specifier->rewrite($rewriter, $child_parents);
    $semicolon = $this->_semicolon->rewrite($rewriter, $child_parents);
    if (
      $abstract === $this->abstract() &&
      $keyword === $this->keyword() &&
      $type_keyword === $this->type_keyword() &&
      $name === $this->name() &&
      $type_constraint === $this->type_constraint() &&
      $equal === $this->equal() &&
      $type_specifier === $this->type_specifier() &&
      $semicolon === $this->semicolon()
    ) {
      $node = $this;
    } else {
      $node = new self(
        $abstract,
        $keyword,
        $type_keyword,
        $name,
        $type_constraint,
        $equal,
        $type_specifier,
        $semicolon,
      );
    }
    return $rewriter($node, $parents);
  }

  public function abstract(): EditableSyntax {
    return $this->_abstract;
  }

  public function with_abstract(EditableSyntax $value): this {
    return new self(
      $value,
      $this->_keyword,
      $this->_type_keyword,
      $this->_name,
      $this->_type_constraint,
      $this->_equal,
      $this->_type_specifier,
      $this->_semicolon,
    );
  }

  public function keyword(): EditableSyntax {
    return $this->_keyword;
  }

  public function with_keyword(EditableSyntax $value): this {
    return new self(
      $this->_abstract,
      $value,
      $this->_type_keyword,
      $this->_name,
      $this->_type_constraint,
      $this->_equal,
      $this->_type_specifier,
      $this->_semicolon,
    );
  }

  public function type_keyword(): EditableSyntax {
    return $this->_type_keyword;
  }

  public function with_type_keyword(EditableSyntax $value): this {
    return new self(
      $this->_abstract,
      $this->_keyword,
      $value,
      $this->_name,
      $this->_type_constraint,
      $this->_equal,
      $this->_type_specifier,
      $this->_semicolon,
    );
  }

  public function name(): EditableSyntax {
    return $this->_name;
  }

  public function with_name(EditableSyntax $value): this {
    return new self(
      $this->_abstract,
      $this->_keyword,
      $this->_type_keyword,
      $value,
      $this->_type_constraint,
      $this->_equal,
      $this->_type_specifier,
      $this->_semicolon,
    );
  }

  public function type_constraint(): EditableSyntax {
    return $this->_type_constraint;
  }

  public function with_type_constraint(EditableSyntax $value): this {
    return new self(
      $this->_abstract,
      $this->_keyword,
      $this->_type_keyword,
      $this->_name,
      $value,
      $this->_equal,
      $this->_type_specifier,
      $this->_semicolon,
    );
  }

  public function equal(): EditableSyntax {
    return $this->_equal;
  }

  public function with_equal(EditableSyntax $value): this {
    return new self(
      $this->_abstract,
      $this->_keyword,
      $this->_type_keyword,
      $this->_name,
      $this->_type_constraint,
      $value,
      $this->_type_specifier,
      $this->_semicolon,
    );
  }

  public function type_specifier(): EditableSyntax {
    return $this->_type_specifier;
  }

  public function with_type_specifier(EditableSyntax $value): this {
    return new self(
      $this->_abstract,
      $this->_keyword,
      $this->_type_keyword,
      $this->_name,
      $this->_type_constraint,
      $this->_equal,
      $value,
      $this->_semicolon,
    );
  }

  public function semicolon(): EditableSyntax {
    return $this->_semicolon;
  }

  public function with_semicolon(EditableSyntax $value): this {
    return new self(
      $this->_abstract,
      $this->_keyword,
      $this->_type_keyword,
      $this->_name,
      $this->_type_constraint,
      $this->_equal,
      $this->_type_specifier,
      $value,
    );
  }
}

final class DecoratedExpression extends EditableSyntax {

  private EditableSyntax $_decorator;
  private EditableSyntax $_expression;

  public function __construct(
    EditableSyntax $decorator,
    EditableSyntax $expression,
  ) {
    parent::__construct('decorated_expression');
    $this->_decorator = $decorator;
    $this->_expression = $expression;
  }

  public static function from_json(
    array<string, mixed> $json,
    int $position,
    string $source,
  ): this {
    $decorator = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['decorated_expression_decorator'],
      $position,
      $source,
    );
    $position += $decorator->width();
    $expression = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['decorated_expression_expression'],
      $position,
      $source,
    );
    $position += $expression->width();
    return new self($decorator, $expression);
  }

  public function children(): KeyedTraversable<string, EditableSyntax> {
    yield 'decorator' => $this->_decorator;
    yield 'expression' => $this->_expression;
  }

  public function rewrite(
    self::TRewriter $rewriter,
    ?Traversable<EditableSyntax> $parents = null,
  ): EditableSyntax {
    $parents = $parents === null ? vec[] : vec($parents);
    $child_parents = $parents;
    $child_parents[] = $this;
    $decorator = $this->_decorator->rewrite($rewriter, $child_parents);
    $expression = $this->_expression->rewrite($rewriter, $child_parents);
    if (
      $decorator === $this->decorator() && $expression === $this->expression()
    ) {
      $node = $this;
    } else {
      $node = new self($decorator, $expression);
    }
    return $rewriter($node, $parents);
  }

  public function decorator(): EditableSyntax {
    return $this->_decorator;
  }

  public function with_decorator(EditableSyntax $value): this {
    return new self($value, $this->_expression);
  }

  public function expression(): EditableSyntax {
    return $this->_expression;
  }

  public function with_expression(EditableSyntax $value): this {
    return new self($this->_decorator, $value);
  }
}

final class ParameterDeclaration extends EditableSyntax {

  private EditableSyntax $_attribute;
  private EditableSyntax $_visibility;
  private EditableSyntax $_type;
  private EditableSyntax $_name;
  private EditableSyntax $_default_value;

  public function __construct(
    EditableSyntax $attribute,
    EditableSyntax $visibility,
    EditableSyntax $type,
    EditableSyntax $name,
    EditableSyntax $default_value,
  ) {
    parent::__construct('parameter_declaration');
    $this->_attribute = $attribute;
    $this->_visibility = $visibility;
    $this->_type = $type;
    $this->_name = $name;
    $this->_default_value = $default_value;
  }

  public static function from_json(
    array<string, mixed> $json,
    int $position,
    string $source,
  ): this {
    $attribute = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['parameter_attribute'],
      $position,
      $source,
    );
    $position += $attribute->width();
    $visibility = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['parameter_visibility'],
      $position,
      $source,
    );
    $position += $visibility->width();
    $type = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['parameter_type'],
      $position,
      $source,
    );
    $position += $type->width();
    $name = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['parameter_name'],
      $position,
      $source,
    );
    $position += $name->width();
    $default_value = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['parameter_default_value'],
      $position,
      $source,
    );
    $position += $default_value->width();
    return new self($attribute, $visibility, $type, $name, $default_value);
  }

  public function children(): KeyedTraversable<string, EditableSyntax> {
    yield 'attribute' => $this->_attribute;
    yield 'visibility' => $this->_visibility;
    yield 'type' => $this->_type;
    yield 'name' => $this->_name;
    yield 'default_value' => $this->_default_value;
  }

  public function rewrite(
    self::TRewriter $rewriter,
    ?Traversable<EditableSyntax> $parents = null,
  ): EditableSyntax {
    $parents = $parents === null ? vec[] : vec($parents);
    $child_parents = $parents;
    $child_parents[] = $this;
    $attribute = $this->_attribute->rewrite($rewriter, $child_parents);
    $visibility = $this->_visibility->rewrite($rewriter, $child_parents);
    $type = $this->_type->rewrite($rewriter, $child_parents);
    $name = $this->_name->rewrite($rewriter, $child_parents);
    $default_value = $this->_default_value->rewrite($rewriter, $child_parents);
    if (
      $attribute === $this->attribute() &&
      $visibility === $this->visibility() &&
      $type === $this->type() &&
      $name === $this->name() &&
      $default_value === $this->default_value()
    ) {
      $node = $this;
    } else {
      $node = new self($attribute, $visibility, $type, $name, $default_value);
    }
    return $rewriter($node, $parents);
  }

  public function attribute(): EditableSyntax {
    return $this->_attribute;
  }

  public function with_attribute(EditableSyntax $value): this {
    return new self(
      $value,
      $this->_visibility,
      $this->_type,
      $this->_name,
      $this->_default_value,
    );
  }

  public function visibility(): EditableSyntax {
    return $this->_visibility;
  }

  public function with_visibility(EditableSyntax $value): this {
    return new self(
      $this->_attribute,
      $value,
      $this->_type,
      $this->_name,
      $this->_default_value,
    );
  }

  public function type(): EditableSyntax {
    return $this->_type;
  }

  public function with_type(EditableSyntax $value): this {
    return new self(
      $this->_attribute,
      $this->_visibility,
      $value,
      $this->_name,
      $this->_default_value,
    );
  }

  public function name(): EditableSyntax {
    return $this->_name;
  }

  public function with_name(EditableSyntax $value): this {
    return new self(
      $this->_attribute,
      $this->_visibility,
      $this->_type,
      $value,
      $this->_default_value,
    );
  }

  public function default_value(): EditableSyntax {
    return $this->_default_value;
  }

  public function with_default_value(EditableSyntax $value): this {
    return new self(
      $this->_attribute,
      $this->_visibility,
      $this->_type,
      $this->_name,
      $value,
    );
  }
}

final class VariadicParameter extends EditableSyntax {

  private EditableSyntax $_ellipsis;

  public function __construct(EditableSyntax $ellipsis) {
    parent::__construct('variadic_parameter');
    $this->_ellipsis = $ellipsis;
  }

  public static function from_json(
    array<string, mixed> $json,
    int $position,
    string $source,
  ): this {
    $ellipsis = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['variadic_parameter_ellipsis'],
      $position,
      $source,
    );
    $position += $ellipsis->width();
    return new self($ellipsis);
  }

  public function children(): KeyedTraversable<string, EditableSyntax> {
    yield 'ellipsis' => $this->_ellipsis;
  }

  public function rewrite(
    self::TRewriter $rewriter,
    ?Traversable<EditableSyntax> $parents = null,
  ): EditableSyntax {
    $parents = $parents === null ? vec[] : vec($parents);
    $child_parents = $parents;
    $child_parents[] = $this;
    $ellipsis = $this->_ellipsis->rewrite($rewriter, $child_parents);
    if ($ellipsis === $this->ellipsis()) {
      $node = $this;
    } else {
      $node = new self($ellipsis);
    }
    return $rewriter($node, $parents);
  }

  public function ellipsis(): EditableSyntax {
    return $this->_ellipsis;
  }

  public function with_ellipsis(EditableSyntax $value): this {
    return new self($value);
  }
}

final class AttributeSpecification extends EditableSyntax {

  private EditableSyntax $_left_double_angle;
  private EditableSyntax $_attributes;
  private EditableSyntax $_right_double_angle;

  public function __construct(
    EditableSyntax $left_double_angle,
    EditableSyntax $attributes,
    EditableSyntax $right_double_angle,
  ) {
    parent::__construct('attribute_specification');
    $this->_left_double_angle = $left_double_angle;
    $this->_attributes = $attributes;
    $this->_right_double_angle = $right_double_angle;
  }

  public static function from_json(
    array<string, mixed> $json,
    int $position,
    string $source,
  ): this {
    $left_double_angle = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['attribute_specification_left_double_angle'],
      $position,
      $source,
    );
    $position += $left_double_angle->width();
    $attributes = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['attribute_specification_attributes'],
      $position,
      $source,
    );
    $position += $attributes->width();
    $right_double_angle = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['attribute_specification_right_double_angle'],
      $position,
      $source,
    );
    $position += $right_double_angle->width();
    return new self($left_double_angle, $attributes, $right_double_angle);
  }

  public function children(): KeyedTraversable<string, EditableSyntax> {
    yield 'left_double_angle' => $this->_left_double_angle;
    yield 'attributes' => $this->_attributes;
    yield 'right_double_angle' => $this->_right_double_angle;
  }

  public function rewrite(
    self::TRewriter $rewriter,
    ?Traversable<EditableSyntax> $parents = null,
  ): EditableSyntax {
    $parents = $parents === null ? vec[] : vec($parents);
    $child_parents = $parents;
    $child_parents[] = $this;
    $left_double_angle =
      $this->_left_double_angle->rewrite($rewriter, $child_parents);
    $attributes = $this->_attributes->rewrite($rewriter, $child_parents);
    $right_double_angle =
      $this->_right_double_angle->rewrite($rewriter, $child_parents);
    if (
      $left_double_angle === $this->left_double_angle() &&
      $attributes === $this->attributes() &&
      $right_double_angle === $this->right_double_angle()
    ) {
      $node = $this;
    } else {
      $node = new self($left_double_angle, $attributes, $right_double_angle);
    }
    return $rewriter($node, $parents);
  }

  public function left_double_angle(): EditableSyntax {
    return $this->_left_double_angle;
  }

  public function with_left_double_angle(EditableSyntax $value): this {
    return new self($value, $this->_attributes, $this->_right_double_angle);
  }

  public function attributes(): EditableSyntax {
    return $this->_attributes;
  }

  public function with_attributes(EditableSyntax $value): this {
    return
      new self($this->_left_double_angle, $value, $this->_right_double_angle);
  }

  public function right_double_angle(): EditableSyntax {
    return $this->_right_double_angle;
  }

  public function with_right_double_angle(EditableSyntax $value): this {
    return new self($this->_left_double_angle, $this->_attributes, $value);
  }
}

final class Attribute extends EditableSyntax {

  private EditableSyntax $_name;
  private EditableSyntax $_left_paren;
  private EditableSyntax $_values;
  private EditableSyntax $_right_paren;

  public function __construct(
    EditableSyntax $name,
    EditableSyntax $left_paren,
    EditableSyntax $values,
    EditableSyntax $right_paren,
  ) {
    parent::__construct('attribute');
    $this->_name = $name;
    $this->_left_paren = $left_paren;
    $this->_values = $values;
    $this->_right_paren = $right_paren;
  }

  public static function from_json(
    array<string, mixed> $json,
    int $position,
    string $source,
  ): this {
    $name = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['attribute_name'],
      $position,
      $source,
    );
    $position += $name->width();
    $left_paren = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['attribute_left_paren'],
      $position,
      $source,
    );
    $position += $left_paren->width();
    $values = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['attribute_values'],
      $position,
      $source,
    );
    $position += $values->width();
    $right_paren = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['attribute_right_paren'],
      $position,
      $source,
    );
    $position += $right_paren->width();
    return new self($name, $left_paren, $values, $right_paren);
  }

  public function children(): KeyedTraversable<string, EditableSyntax> {
    yield 'name' => $this->_name;
    yield 'left_paren' => $this->_left_paren;
    yield 'values' => $this->_values;
    yield 'right_paren' => $this->_right_paren;
  }

  public function rewrite(
    self::TRewriter $rewriter,
    ?Traversable<EditableSyntax> $parents = null,
  ): EditableSyntax {
    $parents = $parents === null ? vec[] : vec($parents);
    $child_parents = $parents;
    $child_parents[] = $this;
    $name = $this->_name->rewrite($rewriter, $child_parents);
    $left_paren = $this->_left_paren->rewrite($rewriter, $child_parents);
    $values = $this->_values->rewrite($rewriter, $child_parents);
    $right_paren = $this->_right_paren->rewrite($rewriter, $child_parents);
    if (
      $name === $this->name() &&
      $left_paren === $this->left_paren() &&
      $values === $this->values() &&
      $right_paren === $this->right_paren()
    ) {
      $node = $this;
    } else {
      $node = new self($name, $left_paren, $values, $right_paren);
    }
    return $rewriter($node, $parents);
  }

  public function name(): EditableSyntax {
    return $this->_name;
  }

  public function with_name(EditableSyntax $value): this {
    return
      new self($value, $this->_left_paren, $this->_values, $this->_right_paren);
  }

  public function left_paren(): EditableSyntax {
    return $this->_left_paren;
  }

  public function with_left_paren(EditableSyntax $value): this {
    return new self($this->_name, $value, $this->_values, $this->_right_paren);
  }

  public function values(): EditableSyntax {
    return $this->_values;
  }

  public function with_values(EditableSyntax $value): this {
    return
      new self($this->_name, $this->_left_paren, $value, $this->_right_paren);
  }

  public function right_paren(): EditableSyntax {
    return $this->_right_paren;
  }

  public function with_right_paren(EditableSyntax $value): this {
    return new self($this->_name, $this->_left_paren, $this->_values, $value);
  }
}

final class InclusionExpression extends EditableSyntax {

  private EditableSyntax $_require;
  private EditableSyntax $_filename;

  public function __construct(
    EditableSyntax $require,
    EditableSyntax $filename,
  ) {
    parent::__construct('inclusion_expression');
    $this->_require = $require;
    $this->_filename = $filename;
  }

  public static function from_json(
    array<string, mixed> $json,
    int $position,
    string $source,
  ): this {
    $require = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['inclusion_require'],
      $position,
      $source,
    );
    $position += $require->width();
    $filename = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['inclusion_filename'],
      $position,
      $source,
    );
    $position += $filename->width();
    return new self($require, $filename);
  }

  public function children(): KeyedTraversable<string, EditableSyntax> {
    yield 'require' => $this->_require;
    yield 'filename' => $this->_filename;
  }

  public function rewrite(
    self::TRewriter $rewriter,
    ?Traversable<EditableSyntax> $parents = null,
  ): EditableSyntax {
    $parents = $parents === null ? vec[] : vec($parents);
    $child_parents = $parents;
    $child_parents[] = $this;
    $require = $this->_require->rewrite($rewriter, $child_parents);
    $filename = $this->_filename->rewrite($rewriter, $child_parents);
    if ($require === $this->require() && $filename === $this->filename()) {
      $node = $this;
    } else {
      $node = new self($require, $filename);
    }
    return $rewriter($node, $parents);
  }

  public function require(): EditableSyntax {
    return $this->_require;
  }

  public function with_require(EditableSyntax $value): this {
    return new self($value, $this->_filename);
  }

  public function filename(): EditableSyntax {
    return $this->_filename;
  }

  public function with_filename(EditableSyntax $value): this {
    return new self($this->_require, $value);
  }
}

final class InclusionDirective extends EditableSyntax {

  private EditableSyntax $_expression;
  private EditableSyntax $_semicolon;

  public function __construct(
    EditableSyntax $expression,
    EditableSyntax $semicolon,
  ) {
    parent::__construct('inclusion_directive');
    $this->_expression = $expression;
    $this->_semicolon = $semicolon;
  }

  public static function from_json(
    array<string, mixed> $json,
    int $position,
    string $source,
  ): this {
    $expression = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['inclusion_expression'],
      $position,
      $source,
    );
    $position += $expression->width();
    $semicolon = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['inclusion_semicolon'],
      $position,
      $source,
    );
    $position += $semicolon->width();
    return new self($expression, $semicolon);
  }

  public function children(): KeyedTraversable<string, EditableSyntax> {
    yield 'expression' => $this->_expression;
    yield 'semicolon' => $this->_semicolon;
  }

  public function rewrite(
    self::TRewriter $rewriter,
    ?Traversable<EditableSyntax> $parents = null,
  ): EditableSyntax {
    $parents = $parents === null ? vec[] : vec($parents);
    $child_parents = $parents;
    $child_parents[] = $this;
    $expression = $this->_expression->rewrite($rewriter, $child_parents);
    $semicolon = $this->_semicolon->rewrite($rewriter, $child_parents);
    if (
      $expression === $this->expression() && $semicolon === $this->semicolon()
    ) {
      $node = $this;
    } else {
      $node = new self($expression, $semicolon);
    }
    return $rewriter($node, $parents);
  }

  public function expression(): EditableSyntax {
    return $this->_expression;
  }

  public function with_expression(EditableSyntax $value): this {
    return new self($value, $this->_semicolon);
  }

  public function semicolon(): EditableSyntax {
    return $this->_semicolon;
  }

  public function with_semicolon(EditableSyntax $value): this {
    return new self($this->_expression, $value);
  }
}

final class CompoundStatement extends EditableSyntax {

  private EditableSyntax $_left_brace;
  private EditableSyntax $_statements;
  private EditableSyntax $_right_brace;

  public function __construct(
    EditableSyntax $left_brace,
    EditableSyntax $statements,
    EditableSyntax $right_brace,
  ) {
    parent::__construct('compound_statement');
    $this->_left_brace = $left_brace;
    $this->_statements = $statements;
    $this->_right_brace = $right_brace;
  }

  public static function from_json(
    array<string, mixed> $json,
    int $position,
    string $source,
  ): this {
    $left_brace = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['compound_left_brace'],
      $position,
      $source,
    );
    $position += $left_brace->width();
    $statements = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['compound_statements'],
      $position,
      $source,
    );
    $position += $statements->width();
    $right_brace = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['compound_right_brace'],
      $position,
      $source,
    );
    $position += $right_brace->width();
    return new self($left_brace, $statements, $right_brace);
  }

  public function children(): KeyedTraversable<string, EditableSyntax> {
    yield 'left_brace' => $this->_left_brace;
    yield 'statements' => $this->_statements;
    yield 'right_brace' => $this->_right_brace;
  }

  public function rewrite(
    self::TRewriter $rewriter,
    ?Traversable<EditableSyntax> $parents = null,
  ): EditableSyntax {
    $parents = $parents === null ? vec[] : vec($parents);
    $child_parents = $parents;
    $child_parents[] = $this;
    $left_brace = $this->_left_brace->rewrite($rewriter, $child_parents);
    $statements = $this->_statements->rewrite($rewriter, $child_parents);
    $right_brace = $this->_right_brace->rewrite($rewriter, $child_parents);
    if (
      $left_brace === $this->left_brace() &&
      $statements === $this->statements() &&
      $right_brace === $this->right_brace()
    ) {
      $node = $this;
    } else {
      $node = new self($left_brace, $statements, $right_brace);
    }
    return $rewriter($node, $parents);
  }

  public function left_brace(): EditableSyntax {
    return $this->_left_brace;
  }

  public function with_left_brace(EditableSyntax $value): this {
    return new self($value, $this->_statements, $this->_right_brace);
  }

  public function statements(): EditableSyntax {
    return $this->_statements;
  }

  public function with_statements(EditableSyntax $value): this {
    return new self($this->_left_brace, $value, $this->_right_brace);
  }

  public function right_brace(): EditableSyntax {
    return $this->_right_brace;
  }

  public function with_right_brace(EditableSyntax $value): this {
    return new self($this->_left_brace, $this->_statements, $value);
  }
}

final class ExpressionStatement extends EditableSyntax {

  private EditableSyntax $_expression;
  private EditableSyntax $_semicolon;

  public function __construct(
    EditableSyntax $expression,
    EditableSyntax $semicolon,
  ) {
    parent::__construct('expression_statement');
    $this->_expression = $expression;
    $this->_semicolon = $semicolon;
  }

  public static function from_json(
    array<string, mixed> $json,
    int $position,
    string $source,
  ): this {
    $expression = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['expression_statement_expression'],
      $position,
      $source,
    );
    $position += $expression->width();
    $semicolon = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['expression_statement_semicolon'],
      $position,
      $source,
    );
    $position += $semicolon->width();
    return new self($expression, $semicolon);
  }

  public function children(): KeyedTraversable<string, EditableSyntax> {
    yield 'expression' => $this->_expression;
    yield 'semicolon' => $this->_semicolon;
  }

  public function rewrite(
    self::TRewriter $rewriter,
    ?Traversable<EditableSyntax> $parents = null,
  ): EditableSyntax {
    $parents = $parents === null ? vec[] : vec($parents);
    $child_parents = $parents;
    $child_parents[] = $this;
    $expression = $this->_expression->rewrite($rewriter, $child_parents);
    $semicolon = $this->_semicolon->rewrite($rewriter, $child_parents);
    if (
      $expression === $this->expression() && $semicolon === $this->semicolon()
    ) {
      $node = $this;
    } else {
      $node = new self($expression, $semicolon);
    }
    return $rewriter($node, $parents);
  }

  public function expression(): EditableSyntax {
    return $this->_expression;
  }

  public function with_expression(EditableSyntax $value): this {
    return new self($value, $this->_semicolon);
  }

  public function semicolon(): EditableSyntax {
    return $this->_semicolon;
  }

  public function with_semicolon(EditableSyntax $value): this {
    return new self($this->_expression, $value);
  }
}

final class MarkupSection extends EditableSyntax {

  private EditableSyntax $_prefix;
  private EditableSyntax $_text;
  private EditableSyntax $_suffix;
  private EditableSyntax $_expression;

  public function __construct(
    EditableSyntax $prefix,
    EditableSyntax $text,
    EditableSyntax $suffix,
    EditableSyntax $expression,
  ) {
    parent::__construct('markup_section');
    $this->_prefix = $prefix;
    $this->_text = $text;
    $this->_suffix = $suffix;
    $this->_expression = $expression;
  }

  public static function from_json(
    array<string, mixed> $json,
    int $position,
    string $source,
  ): this {
    $prefix = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['markup_prefix'],
      $position,
      $source,
    );
    $position += $prefix->width();
    $text = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['markup_text'],
      $position,
      $source,
    );
    $position += $text->width();
    $suffix = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['markup_suffix'],
      $position,
      $source,
    );
    $position += $suffix->width();
    $expression = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['markup_expression'],
      $position,
      $source,
    );
    $position += $expression->width();
    return new self($prefix, $text, $suffix, $expression);
  }

  public function children(): KeyedTraversable<string, EditableSyntax> {
    yield 'prefix' => $this->_prefix;
    yield 'text' => $this->_text;
    yield 'suffix' => $this->_suffix;
    yield 'expression' => $this->_expression;
  }

  public function rewrite(
    self::TRewriter $rewriter,
    ?Traversable<EditableSyntax> $parents = null,
  ): EditableSyntax {
    $parents = $parents === null ? vec[] : vec($parents);
    $child_parents = $parents;
    $child_parents[] = $this;
    $prefix = $this->_prefix->rewrite($rewriter, $child_parents);
    $text = $this->_text->rewrite($rewriter, $child_parents);
    $suffix = $this->_suffix->rewrite($rewriter, $child_parents);
    $expression = $this->_expression->rewrite($rewriter, $child_parents);
    if (
      $prefix === $this->prefix() &&
      $text === $this->text() &&
      $suffix === $this->suffix() &&
      $expression === $this->expression()
    ) {
      $node = $this;
    } else {
      $node = new self($prefix, $text, $suffix, $expression);
    }
    return $rewriter($node, $parents);
  }

  public function prefix(): EditableSyntax {
    return $this->_prefix;
  }

  public function with_prefix(EditableSyntax $value): this {
    return new self($value, $this->_text, $this->_suffix, $this->_expression);
  }

  public function text(): EditableSyntax {
    return $this->_text;
  }

  public function with_text(EditableSyntax $value): this {
    return new self($this->_prefix, $value, $this->_suffix, $this->_expression);
  }

  public function suffix(): EditableSyntax {
    return $this->_suffix;
  }

  public function with_suffix(EditableSyntax $value): this {
    return new self($this->_prefix, $this->_text, $value, $this->_expression);
  }

  public function expression(): EditableSyntax {
    return $this->_expression;
  }

  public function with_expression(EditableSyntax $value): this {
    return new self($this->_prefix, $this->_text, $this->_suffix, $value);
  }
}

final class MarkupSuffix extends EditableSyntax {

  private EditableSyntax $_less_than_question;
  private EditableSyntax $_name;

  public function __construct(
    EditableSyntax $less_than_question,
    EditableSyntax $name,
  ) {
    parent::__construct('markup_suffix');
    $this->_less_than_question = $less_than_question;
    $this->_name = $name;
  }

  public static function from_json(
    array<string, mixed> $json,
    int $position,
    string $source,
  ): this {
    $less_than_question = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['markup_suffix_less_than_question'],
      $position,
      $source,
    );
    $position += $less_than_question->width();
    $name = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['markup_suffix_name'],
      $position,
      $source,
    );
    $position += $name->width();
    return new self($less_than_question, $name);
  }

  public function children(): KeyedTraversable<string, EditableSyntax> {
    yield 'less_than_question' => $this->_less_than_question;
    yield 'name' => $this->_name;
  }

  public function rewrite(
    self::TRewriter $rewriter,
    ?Traversable<EditableSyntax> $parents = null,
  ): EditableSyntax {
    $parents = $parents === null ? vec[] : vec($parents);
    $child_parents = $parents;
    $child_parents[] = $this;
    $less_than_question =
      $this->_less_than_question->rewrite($rewriter, $child_parents);
    $name = $this->_name->rewrite($rewriter, $child_parents);
    if (
      $less_than_question === $this->less_than_question() &&
      $name === $this->name()
    ) {
      $node = $this;
    } else {
      $node = new self($less_than_question, $name);
    }
    return $rewriter($node, $parents);
  }

  public function less_than_question(): EditableSyntax {
    return $this->_less_than_question;
  }

  public function with_less_than_question(EditableSyntax $value): this {
    return new self($value, $this->_name);
  }

  public function name(): EditableSyntax {
    return $this->_name;
  }

  public function with_name(EditableSyntax $value): this {
    return new self($this->_less_than_question, $value);
  }
}

final class UnsetStatement extends EditableSyntax {

  private EditableSyntax $_keyword;
  private EditableSyntax $_left_paren;
  private EditableSyntax $_variables;
  private EditableSyntax $_right_paren;
  private EditableSyntax $_semicolon;

  public function __construct(
    EditableSyntax $keyword,
    EditableSyntax $left_paren,
    EditableSyntax $variables,
    EditableSyntax $right_paren,
    EditableSyntax $semicolon,
  ) {
    parent::__construct('unset_statement');
    $this->_keyword = $keyword;
    $this->_left_paren = $left_paren;
    $this->_variables = $variables;
    $this->_right_paren = $right_paren;
    $this->_semicolon = $semicolon;
  }

  public static function from_json(
    array<string, mixed> $json,
    int $position,
    string $source,
  ): this {
    $keyword = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['unset_keyword'],
      $position,
      $source,
    );
    $position += $keyword->width();
    $left_paren = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['unset_left_paren'],
      $position,
      $source,
    );
    $position += $left_paren->width();
    $variables = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['unset_variables'],
      $position,
      $source,
    );
    $position += $variables->width();
    $right_paren = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['unset_right_paren'],
      $position,
      $source,
    );
    $position += $right_paren->width();
    $semicolon = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['unset_semicolon'],
      $position,
      $source,
    );
    $position += $semicolon->width();
    return
      new self($keyword, $left_paren, $variables, $right_paren, $semicolon);
  }

  public function children(): KeyedTraversable<string, EditableSyntax> {
    yield 'keyword' => $this->_keyword;
    yield 'left_paren' => $this->_left_paren;
    yield 'variables' => $this->_variables;
    yield 'right_paren' => $this->_right_paren;
    yield 'semicolon' => $this->_semicolon;
  }

  public function rewrite(
    self::TRewriter $rewriter,
    ?Traversable<EditableSyntax> $parents = null,
  ): EditableSyntax {
    $parents = $parents === null ? vec[] : vec($parents);
    $child_parents = $parents;
    $child_parents[] = $this;
    $keyword = $this->_keyword->rewrite($rewriter, $child_parents);
    $left_paren = $this->_left_paren->rewrite($rewriter, $child_parents);
    $variables = $this->_variables->rewrite($rewriter, $child_parents);
    $right_paren = $this->_right_paren->rewrite($rewriter, $child_parents);
    $semicolon = $this->_semicolon->rewrite($rewriter, $child_parents);
    if (
      $keyword === $this->keyword() &&
      $left_paren === $this->left_paren() &&
      $variables === $this->variables() &&
      $right_paren === $this->right_paren() &&
      $semicolon === $this->semicolon()
    ) {
      $node = $this;
    } else {
      $node =
        new self($keyword, $left_paren, $variables, $right_paren, $semicolon);
    }
    return $rewriter($node, $parents);
  }

  public function keyword(): EditableSyntax {
    return $this->_keyword;
  }

  public function with_keyword(EditableSyntax $value): this {
    return new self(
      $value,
      $this->_left_paren,
      $this->_variables,
      $this->_right_paren,
      $this->_semicolon,
    );
  }

  public function left_paren(): EditableSyntax {
    return $this->_left_paren;
  }

  public function with_left_paren(EditableSyntax $value): this {
    return new self(
      $this->_keyword,
      $value,
      $this->_variables,
      $this->_right_paren,
      $this->_semicolon,
    );
  }

  public function variables(): EditableSyntax {
    return $this->_variables;
  }

  public function with_variables(EditableSyntax $value): this {
    return new self(
      $this->_keyword,
      $this->_left_paren,
      $value,
      $this->_right_paren,
      $this->_semicolon,
    );
  }

  public function right_paren(): EditableSyntax {
    return $this->_right_paren;
  }

  public function with_right_paren(EditableSyntax $value): this {
    return new self(
      $this->_keyword,
      $this->_left_paren,
      $this->_variables,
      $value,
      $this->_semicolon,
    );
  }

  public function semicolon(): EditableSyntax {
    return $this->_semicolon;
  }

  public function with_semicolon(EditableSyntax $value): this {
    return new self(
      $this->_keyword,
      $this->_left_paren,
      $this->_variables,
      $this->_right_paren,
      $value,
    );
  }
}

final class WhileStatement extends EditableSyntax {

  private EditableSyntax $_keyword;
  private EditableSyntax $_left_paren;
  private EditableSyntax $_condition;
  private EditableSyntax $_right_paren;
  private EditableSyntax $_body;

  public function __construct(
    EditableSyntax $keyword,
    EditableSyntax $left_paren,
    EditableSyntax $condition,
    EditableSyntax $right_paren,
    EditableSyntax $body,
  ) {
    parent::__construct('while_statement');
    $this->_keyword = $keyword;
    $this->_left_paren = $left_paren;
    $this->_condition = $condition;
    $this->_right_paren = $right_paren;
    $this->_body = $body;
  }

  public static function from_json(
    array<string, mixed> $json,
    int $position,
    string $source,
  ): this {
    $keyword = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['while_keyword'],
      $position,
      $source,
    );
    $position += $keyword->width();
    $left_paren = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['while_left_paren'],
      $position,
      $source,
    );
    $position += $left_paren->width();
    $condition = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['while_condition'],
      $position,
      $source,
    );
    $position += $condition->width();
    $right_paren = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['while_right_paren'],
      $position,
      $source,
    );
    $position += $right_paren->width();
    $body = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['while_body'],
      $position,
      $source,
    );
    $position += $body->width();
    return new self($keyword, $left_paren, $condition, $right_paren, $body);
  }

  public function children(): KeyedTraversable<string, EditableSyntax> {
    yield 'keyword' => $this->_keyword;
    yield 'left_paren' => $this->_left_paren;
    yield 'condition' => $this->_condition;
    yield 'right_paren' => $this->_right_paren;
    yield 'body' => $this->_body;
  }

  public function rewrite(
    self::TRewriter $rewriter,
    ?Traversable<EditableSyntax> $parents = null,
  ): EditableSyntax {
    $parents = $parents === null ? vec[] : vec($parents);
    $child_parents = $parents;
    $child_parents[] = $this;
    $keyword = $this->_keyword->rewrite($rewriter, $child_parents);
    $left_paren = $this->_left_paren->rewrite($rewriter, $child_parents);
    $condition = $this->_condition->rewrite($rewriter, $child_parents);
    $right_paren = $this->_right_paren->rewrite($rewriter, $child_parents);
    $body = $this->_body->rewrite($rewriter, $child_parents);
    if (
      $keyword === $this->keyword() &&
      $left_paren === $this->left_paren() &&
      $condition === $this->condition() &&
      $right_paren === $this->right_paren() &&
      $body === $this->body()
    ) {
      $node = $this;
    } else {
      $node = new self($keyword, $left_paren, $condition, $right_paren, $body);
    }
    return $rewriter($node, $parents);
  }

  public function keyword(): EditableSyntax {
    return $this->_keyword;
  }

  public function with_keyword(EditableSyntax $value): this {
    return new self(
      $value,
      $this->_left_paren,
      $this->_condition,
      $this->_right_paren,
      $this->_body,
    );
  }

  public function left_paren(): EditableSyntax {
    return $this->_left_paren;
  }

  public function with_left_paren(EditableSyntax $value): this {
    return new self(
      $this->_keyword,
      $value,
      $this->_condition,
      $this->_right_paren,
      $this->_body,
    );
  }

  public function condition(): EditableSyntax {
    return $this->_condition;
  }

  public function with_condition(EditableSyntax $value): this {
    return new self(
      $this->_keyword,
      $this->_left_paren,
      $value,
      $this->_right_paren,
      $this->_body,
    );
  }

  public function right_paren(): EditableSyntax {
    return $this->_right_paren;
  }

  public function with_right_paren(EditableSyntax $value): this {
    return new self(
      $this->_keyword,
      $this->_left_paren,
      $this->_condition,
      $value,
      $this->_body,
    );
  }

  public function body(): EditableSyntax {
    return $this->_body;
  }

  public function with_body(EditableSyntax $value): this {
    return new self(
      $this->_keyword,
      $this->_left_paren,
      $this->_condition,
      $this->_right_paren,
      $value,
    );
  }
}

final class IfStatement extends EditableSyntax {

  private EditableSyntax $_keyword;
  private EditableSyntax $_left_paren;
  private EditableSyntax $_condition;
  private EditableSyntax $_right_paren;
  private EditableSyntax $_statement;
  private EditableSyntax $_elseif_clauses;
  private EditableSyntax $_else_clause;

  public function __construct(
    EditableSyntax $keyword,
    EditableSyntax $left_paren,
    EditableSyntax $condition,
    EditableSyntax $right_paren,
    EditableSyntax $statement,
    EditableSyntax $elseif_clauses,
    EditableSyntax $else_clause,
  ) {
    parent::__construct('if_statement');
    $this->_keyword = $keyword;
    $this->_left_paren = $left_paren;
    $this->_condition = $condition;
    $this->_right_paren = $right_paren;
    $this->_statement = $statement;
    $this->_elseif_clauses = $elseif_clauses;
    $this->_else_clause = $else_clause;
  }

  public static function from_json(
    array<string, mixed> $json,
    int $position,
    string $source,
  ): this {
    $keyword = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['if_keyword'],
      $position,
      $source,
    );
    $position += $keyword->width();
    $left_paren = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['if_left_paren'],
      $position,
      $source,
    );
    $position += $left_paren->width();
    $condition = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['if_condition'],
      $position,
      $source,
    );
    $position += $condition->width();
    $right_paren = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['if_right_paren'],
      $position,
      $source,
    );
    $position += $right_paren->width();
    $statement = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['if_statement'],
      $position,
      $source,
    );
    $position += $statement->width();
    $elseif_clauses = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['if_elseif_clauses'],
      $position,
      $source,
    );
    $position += $elseif_clauses->width();
    $else_clause = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['if_else_clause'],
      $position,
      $source,
    );
    $position += $else_clause->width();
    return new self(
      $keyword,
      $left_paren,
      $condition,
      $right_paren,
      $statement,
      $elseif_clauses,
      $else_clause,
    );
  }

  public function children(): KeyedTraversable<string, EditableSyntax> {
    yield 'keyword' => $this->_keyword;
    yield 'left_paren' => $this->_left_paren;
    yield 'condition' => $this->_condition;
    yield 'right_paren' => $this->_right_paren;
    yield 'statement' => $this->_statement;
    yield 'elseif_clauses' => $this->_elseif_clauses;
    yield 'else_clause' => $this->_else_clause;
  }

  public function rewrite(
    self::TRewriter $rewriter,
    ?Traversable<EditableSyntax> $parents = null,
  ): EditableSyntax {
    $parents = $parents === null ? vec[] : vec($parents);
    $child_parents = $parents;
    $child_parents[] = $this;
    $keyword = $this->_keyword->rewrite($rewriter, $child_parents);
    $left_paren = $this->_left_paren->rewrite($rewriter, $child_parents);
    $condition = $this->_condition->rewrite($rewriter, $child_parents);
    $right_paren = $this->_right_paren->rewrite($rewriter, $child_parents);
    $statement = $this->_statement->rewrite($rewriter, $child_parents);
    $elseif_clauses =
      $this->_elseif_clauses->rewrite($rewriter, $child_parents);
    $else_clause = $this->_else_clause->rewrite($rewriter, $child_parents);
    if (
      $keyword === $this->keyword() &&
      $left_paren === $this->left_paren() &&
      $condition === $this->condition() &&
      $right_paren === $this->right_paren() &&
      $statement === $this->statement() &&
      $elseif_clauses === $this->elseif_clauses() &&
      $else_clause === $this->else_clause()
    ) {
      $node = $this;
    } else {
      $node = new self(
        $keyword,
        $left_paren,
        $condition,
        $right_paren,
        $statement,
        $elseif_clauses,
        $else_clause,
      );
    }
    return $rewriter($node, $parents);
  }

  public function keyword(): EditableSyntax {
    return $this->_keyword;
  }

  public function with_keyword(EditableSyntax $value): this {
    return new self(
      $value,
      $this->_left_paren,
      $this->_condition,
      $this->_right_paren,
      $this->_statement,
      $this->_elseif_clauses,
      $this->_else_clause,
    );
  }

  public function left_paren(): EditableSyntax {
    return $this->_left_paren;
  }

  public function with_left_paren(EditableSyntax $value): this {
    return new self(
      $this->_keyword,
      $value,
      $this->_condition,
      $this->_right_paren,
      $this->_statement,
      $this->_elseif_clauses,
      $this->_else_clause,
    );
  }

  public function condition(): EditableSyntax {
    return $this->_condition;
  }

  public function with_condition(EditableSyntax $value): this {
    return new self(
      $this->_keyword,
      $this->_left_paren,
      $value,
      $this->_right_paren,
      $this->_statement,
      $this->_elseif_clauses,
      $this->_else_clause,
    );
  }

  public function right_paren(): EditableSyntax {
    return $this->_right_paren;
  }

  public function with_right_paren(EditableSyntax $value): this {
    return new self(
      $this->_keyword,
      $this->_left_paren,
      $this->_condition,
      $value,
      $this->_statement,
      $this->_elseif_clauses,
      $this->_else_clause,
    );
  }

  public function statement(): EditableSyntax {
    return $this->_statement;
  }

  public function with_statement(EditableSyntax $value): this {
    return new self(
      $this->_keyword,
      $this->_left_paren,
      $this->_condition,
      $this->_right_paren,
      $value,
      $this->_elseif_clauses,
      $this->_else_clause,
    );
  }

  public function elseif_clauses(): EditableSyntax {
    return $this->_elseif_clauses;
  }

  public function with_elseif_clauses(EditableSyntax $value): this {
    return new self(
      $this->_keyword,
      $this->_left_paren,
      $this->_condition,
      $this->_right_paren,
      $this->_statement,
      $value,
      $this->_else_clause,
    );
  }

  public function else_clause(): EditableSyntax {
    return $this->_else_clause;
  }

  public function with_else_clause(EditableSyntax $value): this {
    return new self(
      $this->_keyword,
      $this->_left_paren,
      $this->_condition,
      $this->_right_paren,
      $this->_statement,
      $this->_elseif_clauses,
      $value,
    );
  }
}

final class ElseifClause extends EditableSyntax {

  private EditableSyntax $_keyword;
  private EditableSyntax $_left_paren;
  private EditableSyntax $_condition;
  private EditableSyntax $_right_paren;
  private EditableSyntax $_statement;

  public function __construct(
    EditableSyntax $keyword,
    EditableSyntax $left_paren,
    EditableSyntax $condition,
    EditableSyntax $right_paren,
    EditableSyntax $statement,
  ) {
    parent::__construct('elseif_clause');
    $this->_keyword = $keyword;
    $this->_left_paren = $left_paren;
    $this->_condition = $condition;
    $this->_right_paren = $right_paren;
    $this->_statement = $statement;
  }

  public static function from_json(
    array<string, mixed> $json,
    int $position,
    string $source,
  ): this {
    $keyword = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['elseif_keyword'],
      $position,
      $source,
    );
    $position += $keyword->width();
    $left_paren = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['elseif_left_paren'],
      $position,
      $source,
    );
    $position += $left_paren->width();
    $condition = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['elseif_condition'],
      $position,
      $source,
    );
    $position += $condition->width();
    $right_paren = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['elseif_right_paren'],
      $position,
      $source,
    );
    $position += $right_paren->width();
    $statement = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['elseif_statement'],
      $position,
      $source,
    );
    $position += $statement->width();
    return
      new self($keyword, $left_paren, $condition, $right_paren, $statement);
  }

  public function children(): KeyedTraversable<string, EditableSyntax> {
    yield 'keyword' => $this->_keyword;
    yield 'left_paren' => $this->_left_paren;
    yield 'condition' => $this->_condition;
    yield 'right_paren' => $this->_right_paren;
    yield 'statement' => $this->_statement;
  }

  public function rewrite(
    self::TRewriter $rewriter,
    ?Traversable<EditableSyntax> $parents = null,
  ): EditableSyntax {
    $parents = $parents === null ? vec[] : vec($parents);
    $child_parents = $parents;
    $child_parents[] = $this;
    $keyword = $this->_keyword->rewrite($rewriter, $child_parents);
    $left_paren = $this->_left_paren->rewrite($rewriter, $child_parents);
    $condition = $this->_condition->rewrite($rewriter, $child_parents);
    $right_paren = $this->_right_paren->rewrite($rewriter, $child_parents);
    $statement = $this->_statement->rewrite($rewriter, $child_parents);
    if (
      $keyword === $this->keyword() &&
      $left_paren === $this->left_paren() &&
      $condition === $this->condition() &&
      $right_paren === $this->right_paren() &&
      $statement === $this->statement()
    ) {
      $node = $this;
    } else {
      $node =
        new self($keyword, $left_paren, $condition, $right_paren, $statement);
    }
    return $rewriter($node, $parents);
  }

  public function keyword(): EditableSyntax {
    return $this->_keyword;
  }

  public function with_keyword(EditableSyntax $value): this {
    return new self(
      $value,
      $this->_left_paren,
      $this->_condition,
      $this->_right_paren,
      $this->_statement,
    );
  }

  public function left_paren(): EditableSyntax {
    return $this->_left_paren;
  }

  public function with_left_paren(EditableSyntax $value): this {
    return new self(
      $this->_keyword,
      $value,
      $this->_condition,
      $this->_right_paren,
      $this->_statement,
    );
  }

  public function condition(): EditableSyntax {
    return $this->_condition;
  }

  public function with_condition(EditableSyntax $value): this {
    return new self(
      $this->_keyword,
      $this->_left_paren,
      $value,
      $this->_right_paren,
      $this->_statement,
    );
  }

  public function right_paren(): EditableSyntax {
    return $this->_right_paren;
  }

  public function with_right_paren(EditableSyntax $value): this {
    return new self(
      $this->_keyword,
      $this->_left_paren,
      $this->_condition,
      $value,
      $this->_statement,
    );
  }

  public function statement(): EditableSyntax {
    return $this->_statement;
  }

  public function with_statement(EditableSyntax $value): this {
    return new self(
      $this->_keyword,
      $this->_left_paren,
      $this->_condition,
      $this->_right_paren,
      $value,
    );
  }
}

final class ElseClause extends EditableSyntax {

  private EditableSyntax $_keyword;
  private EditableSyntax $_statement;

  public function __construct(
    EditableSyntax $keyword,
    EditableSyntax $statement,
  ) {
    parent::__construct('else_clause');
    $this->_keyword = $keyword;
    $this->_statement = $statement;
  }

  public static function from_json(
    array<string, mixed> $json,
    int $position,
    string $source,
  ): this {
    $keyword = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['else_keyword'],
      $position,
      $source,
    );
    $position += $keyword->width();
    $statement = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['else_statement'],
      $position,
      $source,
    );
    $position += $statement->width();
    return new self($keyword, $statement);
  }

  public function children(): KeyedTraversable<string, EditableSyntax> {
    yield 'keyword' => $this->_keyword;
    yield 'statement' => $this->_statement;
  }

  public function rewrite(
    self::TRewriter $rewriter,
    ?Traversable<EditableSyntax> $parents = null,
  ): EditableSyntax {
    $parents = $parents === null ? vec[] : vec($parents);
    $child_parents = $parents;
    $child_parents[] = $this;
    $keyword = $this->_keyword->rewrite($rewriter, $child_parents);
    $statement = $this->_statement->rewrite($rewriter, $child_parents);
    if ($keyword === $this->keyword() && $statement === $this->statement()) {
      $node = $this;
    } else {
      $node = new self($keyword, $statement);
    }
    return $rewriter($node, $parents);
  }

  public function keyword(): EditableSyntax {
    return $this->_keyword;
  }

  public function with_keyword(EditableSyntax $value): this {
    return new self($value, $this->_statement);
  }

  public function statement(): EditableSyntax {
    return $this->_statement;
  }

  public function with_statement(EditableSyntax $value): this {
    return new self($this->_keyword, $value);
  }
}

final class TryStatement extends EditableSyntax {

  private EditableSyntax $_keyword;
  private EditableSyntax $_compound_statement;
  private EditableSyntax $_catch_clauses;
  private EditableSyntax $_finally_clause;

  public function __construct(
    EditableSyntax $keyword,
    EditableSyntax $compound_statement,
    EditableSyntax $catch_clauses,
    EditableSyntax $finally_clause,
  ) {
    parent::__construct('try_statement');
    $this->_keyword = $keyword;
    $this->_compound_statement = $compound_statement;
    $this->_catch_clauses = $catch_clauses;
    $this->_finally_clause = $finally_clause;
  }

  public static function from_json(
    array<string, mixed> $json,
    int $position,
    string $source,
  ): this {
    $keyword = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['try_keyword'],
      $position,
      $source,
    );
    $position += $keyword->width();
    $compound_statement = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['try_compound_statement'],
      $position,
      $source,
    );
    $position += $compound_statement->width();
    $catch_clauses = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['try_catch_clauses'],
      $position,
      $source,
    );
    $position += $catch_clauses->width();
    $finally_clause = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['try_finally_clause'],
      $position,
      $source,
    );
    $position += $finally_clause->width();
    return
      new self($keyword, $compound_statement, $catch_clauses, $finally_clause);
  }

  public function children(): KeyedTraversable<string, EditableSyntax> {
    yield 'keyword' => $this->_keyword;
    yield 'compound_statement' => $this->_compound_statement;
    yield 'catch_clauses' => $this->_catch_clauses;
    yield 'finally_clause' => $this->_finally_clause;
  }

  public function rewrite(
    self::TRewriter $rewriter,
    ?Traversable<EditableSyntax> $parents = null,
  ): EditableSyntax {
    $parents = $parents === null ? vec[] : vec($parents);
    $child_parents = $parents;
    $child_parents[] = $this;
    $keyword = $this->_keyword->rewrite($rewriter, $child_parents);
    $compound_statement =
      $this->_compound_statement->rewrite($rewriter, $child_parents);
    $catch_clauses = $this->_catch_clauses->rewrite($rewriter, $child_parents);
    $finally_clause =
      $this->_finally_clause->rewrite($rewriter, $child_parents);
    if (
      $keyword === $this->keyword() &&
      $compound_statement === $this->compound_statement() &&
      $catch_clauses === $this->catch_clauses() &&
      $finally_clause === $this->finally_clause()
    ) {
      $node = $this;
    } else {
      $node = new self(
        $keyword,
        $compound_statement,
        $catch_clauses,
        $finally_clause,
      );
    }
    return $rewriter($node, $parents);
  }

  public function keyword(): EditableSyntax {
    return $this->_keyword;
  }

  public function with_keyword(EditableSyntax $value): this {
    return new self(
      $value,
      $this->_compound_statement,
      $this->_catch_clauses,
      $this->_finally_clause,
    );
  }

  public function compound_statement(): EditableSyntax {
    return $this->_compound_statement;
  }

  public function with_compound_statement(EditableSyntax $value): this {
    return new self(
      $this->_keyword,
      $value,
      $this->_catch_clauses,
      $this->_finally_clause,
    );
  }

  public function catch_clauses(): EditableSyntax {
    return $this->_catch_clauses;
  }

  public function with_catch_clauses(EditableSyntax $value): this {
    return new self(
      $this->_keyword,
      $this->_compound_statement,
      $value,
      $this->_finally_clause,
    );
  }

  public function finally_clause(): EditableSyntax {
    return $this->_finally_clause;
  }

  public function with_finally_clause(EditableSyntax $value): this {
    return new self(
      $this->_keyword,
      $this->_compound_statement,
      $this->_catch_clauses,
      $value,
    );
  }
}

final class CatchClause extends EditableSyntax {

  private EditableSyntax $_keyword;
  private EditableSyntax $_left_paren;
  private EditableSyntax $_type;
  private EditableSyntax $_variable;
  private EditableSyntax $_right_paren;
  private EditableSyntax $_body;

  public function __construct(
    EditableSyntax $keyword,
    EditableSyntax $left_paren,
    EditableSyntax $type,
    EditableSyntax $variable,
    EditableSyntax $right_paren,
    EditableSyntax $body,
  ) {
    parent::__construct('catch_clause');
    $this->_keyword = $keyword;
    $this->_left_paren = $left_paren;
    $this->_type = $type;
    $this->_variable = $variable;
    $this->_right_paren = $right_paren;
    $this->_body = $body;
  }

  public static function from_json(
    array<string, mixed> $json,
    int $position,
    string $source,
  ): this {
    $keyword = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['catch_keyword'],
      $position,
      $source,
    );
    $position += $keyword->width();
    $left_paren = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['catch_left_paren'],
      $position,
      $source,
    );
    $position += $left_paren->width();
    $type = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['catch_type'],
      $position,
      $source,
    );
    $position += $type->width();
    $variable = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['catch_variable'],
      $position,
      $source,
    );
    $position += $variable->width();
    $right_paren = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['catch_right_paren'],
      $position,
      $source,
    );
    $position += $right_paren->width();
    $body = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['catch_body'],
      $position,
      $source,
    );
    $position += $body->width();
    return
      new self($keyword, $left_paren, $type, $variable, $right_paren, $body);
  }

  public function children(): KeyedTraversable<string, EditableSyntax> {
    yield 'keyword' => $this->_keyword;
    yield 'left_paren' => $this->_left_paren;
    yield 'type' => $this->_type;
    yield 'variable' => $this->_variable;
    yield 'right_paren' => $this->_right_paren;
    yield 'body' => $this->_body;
  }

  public function rewrite(
    self::TRewriter $rewriter,
    ?Traversable<EditableSyntax> $parents = null,
  ): EditableSyntax {
    $parents = $parents === null ? vec[] : vec($parents);
    $child_parents = $parents;
    $child_parents[] = $this;
    $keyword = $this->_keyword->rewrite($rewriter, $child_parents);
    $left_paren = $this->_left_paren->rewrite($rewriter, $child_parents);
    $type = $this->_type->rewrite($rewriter, $child_parents);
    $variable = $this->_variable->rewrite($rewriter, $child_parents);
    $right_paren = $this->_right_paren->rewrite($rewriter, $child_parents);
    $body = $this->_body->rewrite($rewriter, $child_parents);
    if (
      $keyword === $this->keyword() &&
      $left_paren === $this->left_paren() &&
      $type === $this->type() &&
      $variable === $this->variable() &&
      $right_paren === $this->right_paren() &&
      $body === $this->body()
    ) {
      $node = $this;
    } else {
      $node =
        new self($keyword, $left_paren, $type, $variable, $right_paren, $body);
    }
    return $rewriter($node, $parents);
  }

  public function keyword(): EditableSyntax {
    return $this->_keyword;
  }

  public function with_keyword(EditableSyntax $value): this {
    return new self(
      $value,
      $this->_left_paren,
      $this->_type,
      $this->_variable,
      $this->_right_paren,
      $this->_body,
    );
  }

  public function left_paren(): EditableSyntax {
    return $this->_left_paren;
  }

  public function with_left_paren(EditableSyntax $value): this {
    return new self(
      $this->_keyword,
      $value,
      $this->_type,
      $this->_variable,
      $this->_right_paren,
      $this->_body,
    );
  }

  public function type(): EditableSyntax {
    return $this->_type;
  }

  public function with_type(EditableSyntax $value): this {
    return new self(
      $this->_keyword,
      $this->_left_paren,
      $value,
      $this->_variable,
      $this->_right_paren,
      $this->_body,
    );
  }

  public function variable(): EditableSyntax {
    return $this->_variable;
  }

  public function with_variable(EditableSyntax $value): this {
    return new self(
      $this->_keyword,
      $this->_left_paren,
      $this->_type,
      $value,
      $this->_right_paren,
      $this->_body,
    );
  }

  public function right_paren(): EditableSyntax {
    return $this->_right_paren;
  }

  public function with_right_paren(EditableSyntax $value): this {
    return new self(
      $this->_keyword,
      $this->_left_paren,
      $this->_type,
      $this->_variable,
      $value,
      $this->_body,
    );
  }

  public function body(): EditableSyntax {
    return $this->_body;
  }

  public function with_body(EditableSyntax $value): this {
    return new self(
      $this->_keyword,
      $this->_left_paren,
      $this->_type,
      $this->_variable,
      $this->_right_paren,
      $value,
    );
  }
}

final class FinallyClause extends EditableSyntax {

  private EditableSyntax $_keyword;
  private EditableSyntax $_body;

  public function __construct(EditableSyntax $keyword, EditableSyntax $body) {
    parent::__construct('finally_clause');
    $this->_keyword = $keyword;
    $this->_body = $body;
  }

  public static function from_json(
    array<string, mixed> $json,
    int $position,
    string $source,
  ): this {
    $keyword = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['finally_keyword'],
      $position,
      $source,
    );
    $position += $keyword->width();
    $body = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['finally_body'],
      $position,
      $source,
    );
    $position += $body->width();
    return new self($keyword, $body);
  }

  public function children(): KeyedTraversable<string, EditableSyntax> {
    yield 'keyword' => $this->_keyword;
    yield 'body' => $this->_body;
  }

  public function rewrite(
    self::TRewriter $rewriter,
    ?Traversable<EditableSyntax> $parents = null,
  ): EditableSyntax {
    $parents = $parents === null ? vec[] : vec($parents);
    $child_parents = $parents;
    $child_parents[] = $this;
    $keyword = $this->_keyword->rewrite($rewriter, $child_parents);
    $body = $this->_body->rewrite($rewriter, $child_parents);
    if ($keyword === $this->keyword() && $body === $this->body()) {
      $node = $this;
    } else {
      $node = new self($keyword, $body);
    }
    return $rewriter($node, $parents);
  }

  public function keyword(): EditableSyntax {
    return $this->_keyword;
  }

  public function with_keyword(EditableSyntax $value): this {
    return new self($value, $this->_body);
  }

  public function body(): EditableSyntax {
    return $this->_body;
  }

  public function with_body(EditableSyntax $value): this {
    return new self($this->_keyword, $value);
  }
}

final class DoStatement extends EditableSyntax {

  private EditableSyntax $_keyword;
  private EditableSyntax $_body;
  private EditableSyntax $_while_keyword;
  private EditableSyntax $_left_paren;
  private EditableSyntax $_condition;
  private EditableSyntax $_right_paren;
  private EditableSyntax $_semicolon;

  public function __construct(
    EditableSyntax $keyword,
    EditableSyntax $body,
    EditableSyntax $while_keyword,
    EditableSyntax $left_paren,
    EditableSyntax $condition,
    EditableSyntax $right_paren,
    EditableSyntax $semicolon,
  ) {
    parent::__construct('do_statement');
    $this->_keyword = $keyword;
    $this->_body = $body;
    $this->_while_keyword = $while_keyword;
    $this->_left_paren = $left_paren;
    $this->_condition = $condition;
    $this->_right_paren = $right_paren;
    $this->_semicolon = $semicolon;
  }

  public static function from_json(
    array<string, mixed> $json,
    int $position,
    string $source,
  ): this {
    $keyword = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['do_keyword'],
      $position,
      $source,
    );
    $position += $keyword->width();
    $body = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['do_body'],
      $position,
      $source,
    );
    $position += $body->width();
    $while_keyword = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['do_while_keyword'],
      $position,
      $source,
    );
    $position += $while_keyword->width();
    $left_paren = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['do_left_paren'],
      $position,
      $source,
    );
    $position += $left_paren->width();
    $condition = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['do_condition'],
      $position,
      $source,
    );
    $position += $condition->width();
    $right_paren = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['do_right_paren'],
      $position,
      $source,
    );
    $position += $right_paren->width();
    $semicolon = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['do_semicolon'],
      $position,
      $source,
    );
    $position += $semicolon->width();
    return new self(
      $keyword,
      $body,
      $while_keyword,
      $left_paren,
      $condition,
      $right_paren,
      $semicolon,
    );
  }

  public function children(): KeyedTraversable<string, EditableSyntax> {
    yield 'keyword' => $this->_keyword;
    yield 'body' => $this->_body;
    yield 'while_keyword' => $this->_while_keyword;
    yield 'left_paren' => $this->_left_paren;
    yield 'condition' => $this->_condition;
    yield 'right_paren' => $this->_right_paren;
    yield 'semicolon' => $this->_semicolon;
  }

  public function rewrite(
    self::TRewriter $rewriter,
    ?Traversable<EditableSyntax> $parents = null,
  ): EditableSyntax {
    $parents = $parents === null ? vec[] : vec($parents);
    $child_parents = $parents;
    $child_parents[] = $this;
    $keyword = $this->_keyword->rewrite($rewriter, $child_parents);
    $body = $this->_body->rewrite($rewriter, $child_parents);
    $while_keyword = $this->_while_keyword->rewrite($rewriter, $child_parents);
    $left_paren = $this->_left_paren->rewrite($rewriter, $child_parents);
    $condition = $this->_condition->rewrite($rewriter, $child_parents);
    $right_paren = $this->_right_paren->rewrite($rewriter, $child_parents);
    $semicolon = $this->_semicolon->rewrite($rewriter, $child_parents);
    if (
      $keyword === $this->keyword() &&
      $body === $this->body() &&
      $while_keyword === $this->while_keyword() &&
      $left_paren === $this->left_paren() &&
      $condition === $this->condition() &&
      $right_paren === $this->right_paren() &&
      $semicolon === $this->semicolon()
    ) {
      $node = $this;
    } else {
      $node = new self(
        $keyword,
        $body,
        $while_keyword,
        $left_paren,
        $condition,
        $right_paren,
        $semicolon,
      );
    }
    return $rewriter($node, $parents);
  }

  public function keyword(): EditableSyntax {
    return $this->_keyword;
  }

  public function with_keyword(EditableSyntax $value): this {
    return new self(
      $value,
      $this->_body,
      $this->_while_keyword,
      $this->_left_paren,
      $this->_condition,
      $this->_right_paren,
      $this->_semicolon,
    );
  }

  public function body(): EditableSyntax {
    return $this->_body;
  }

  public function with_body(EditableSyntax $value): this {
    return new self(
      $this->_keyword,
      $value,
      $this->_while_keyword,
      $this->_left_paren,
      $this->_condition,
      $this->_right_paren,
      $this->_semicolon,
    );
  }

  public function while_keyword(): EditableSyntax {
    return $this->_while_keyword;
  }

  public function with_while_keyword(EditableSyntax $value): this {
    return new self(
      $this->_keyword,
      $this->_body,
      $value,
      $this->_left_paren,
      $this->_condition,
      $this->_right_paren,
      $this->_semicolon,
    );
  }

  public function left_paren(): EditableSyntax {
    return $this->_left_paren;
  }

  public function with_left_paren(EditableSyntax $value): this {
    return new self(
      $this->_keyword,
      $this->_body,
      $this->_while_keyword,
      $value,
      $this->_condition,
      $this->_right_paren,
      $this->_semicolon,
    );
  }

  public function condition(): EditableSyntax {
    return $this->_condition;
  }

  public function with_condition(EditableSyntax $value): this {
    return new self(
      $this->_keyword,
      $this->_body,
      $this->_while_keyword,
      $this->_left_paren,
      $value,
      $this->_right_paren,
      $this->_semicolon,
    );
  }

  public function right_paren(): EditableSyntax {
    return $this->_right_paren;
  }

  public function with_right_paren(EditableSyntax $value): this {
    return new self(
      $this->_keyword,
      $this->_body,
      $this->_while_keyword,
      $this->_left_paren,
      $this->_condition,
      $value,
      $this->_semicolon,
    );
  }

  public function semicolon(): EditableSyntax {
    return $this->_semicolon;
  }

  public function with_semicolon(EditableSyntax $value): this {
    return new self(
      $this->_keyword,
      $this->_body,
      $this->_while_keyword,
      $this->_left_paren,
      $this->_condition,
      $this->_right_paren,
      $value,
    );
  }
}

final class ForStatement extends EditableSyntax {

  private EditableSyntax $_keyword;
  private EditableSyntax $_left_paren;
  private EditableSyntax $_initializer;
  private EditableSyntax $_first_semicolon;
  private EditableSyntax $_control;
  private EditableSyntax $_second_semicolon;
  private EditableSyntax $_end_of_loop;
  private EditableSyntax $_right_paren;
  private EditableSyntax $_body;

  public function __construct(
    EditableSyntax $keyword,
    EditableSyntax $left_paren,
    EditableSyntax $initializer,
    EditableSyntax $first_semicolon,
    EditableSyntax $control,
    EditableSyntax $second_semicolon,
    EditableSyntax $end_of_loop,
    EditableSyntax $right_paren,
    EditableSyntax $body,
  ) {
    parent::__construct('for_statement');
    $this->_keyword = $keyword;
    $this->_left_paren = $left_paren;
    $this->_initializer = $initializer;
    $this->_first_semicolon = $first_semicolon;
    $this->_control = $control;
    $this->_second_semicolon = $second_semicolon;
    $this->_end_of_loop = $end_of_loop;
    $this->_right_paren = $right_paren;
    $this->_body = $body;
  }

  public static function from_json(
    array<string, mixed> $json,
    int $position,
    string $source,
  ): this {
    $keyword = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['for_keyword'],
      $position,
      $source,
    );
    $position += $keyword->width();
    $left_paren = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['for_left_paren'],
      $position,
      $source,
    );
    $position += $left_paren->width();
    $initializer = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['for_initializer'],
      $position,
      $source,
    );
    $position += $initializer->width();
    $first_semicolon = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['for_first_semicolon'],
      $position,
      $source,
    );
    $position += $first_semicolon->width();
    $control = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['for_control'],
      $position,
      $source,
    );
    $position += $control->width();
    $second_semicolon = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['for_second_semicolon'],
      $position,
      $source,
    );
    $position += $second_semicolon->width();
    $end_of_loop = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['for_end_of_loop'],
      $position,
      $source,
    );
    $position += $end_of_loop->width();
    $right_paren = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['for_right_paren'],
      $position,
      $source,
    );
    $position += $right_paren->width();
    $body = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['for_body'],
      $position,
      $source,
    );
    $position += $body->width();
    return new self(
      $keyword,
      $left_paren,
      $initializer,
      $first_semicolon,
      $control,
      $second_semicolon,
      $end_of_loop,
      $right_paren,
      $body,
    );
  }

  public function children(): KeyedTraversable<string, EditableSyntax> {
    yield 'keyword' => $this->_keyword;
    yield 'left_paren' => $this->_left_paren;
    yield 'initializer' => $this->_initializer;
    yield 'first_semicolon' => $this->_first_semicolon;
    yield 'control' => $this->_control;
    yield 'second_semicolon' => $this->_second_semicolon;
    yield 'end_of_loop' => $this->_end_of_loop;
    yield 'right_paren' => $this->_right_paren;
    yield 'body' => $this->_body;
  }

  public function rewrite(
    self::TRewriter $rewriter,
    ?Traversable<EditableSyntax> $parents = null,
  ): EditableSyntax {
    $parents = $parents === null ? vec[] : vec($parents);
    $child_parents = $parents;
    $child_parents[] = $this;
    $keyword = $this->_keyword->rewrite($rewriter, $child_parents);
    $left_paren = $this->_left_paren->rewrite($rewriter, $child_parents);
    $initializer = $this->_initializer->rewrite($rewriter, $child_parents);
    $first_semicolon =
      $this->_first_semicolon->rewrite($rewriter, $child_parents);
    $control = $this->_control->rewrite($rewriter, $child_parents);
    $second_semicolon =
      $this->_second_semicolon->rewrite($rewriter, $child_parents);
    $end_of_loop = $this->_end_of_loop->rewrite($rewriter, $child_parents);
    $right_paren = $this->_right_paren->rewrite($rewriter, $child_parents);
    $body = $this->_body->rewrite($rewriter, $child_parents);
    if (
      $keyword === $this->keyword() &&
      $left_paren === $this->left_paren() &&
      $initializer === $this->initializer() &&
      $first_semicolon === $this->first_semicolon() &&
      $control === $this->control() &&
      $second_semicolon === $this->second_semicolon() &&
      $end_of_loop === $this->end_of_loop() &&
      $right_paren === $this->right_paren() &&
      $body === $this->body()
    ) {
      $node = $this;
    } else {
      $node = new self(
        $keyword,
        $left_paren,
        $initializer,
        $first_semicolon,
        $control,
        $second_semicolon,
        $end_of_loop,
        $right_paren,
        $body,
      );
    }
    return $rewriter($node, $parents);
  }

  public function keyword(): EditableSyntax {
    return $this->_keyword;
  }

  public function with_keyword(EditableSyntax $value): this {
    return new self(
      $value,
      $this->_left_paren,
      $this->_initializer,
      $this->_first_semicolon,
      $this->_control,
      $this->_second_semicolon,
      $this->_end_of_loop,
      $this->_right_paren,
      $this->_body,
    );
  }

  public function left_paren(): EditableSyntax {
    return $this->_left_paren;
  }

  public function with_left_paren(EditableSyntax $value): this {
    return new self(
      $this->_keyword,
      $value,
      $this->_initializer,
      $this->_first_semicolon,
      $this->_control,
      $this->_second_semicolon,
      $this->_end_of_loop,
      $this->_right_paren,
      $this->_body,
    );
  }

  public function initializer(): EditableSyntax {
    return $this->_initializer;
  }

  public function with_initializer(EditableSyntax $value): this {
    return new self(
      $this->_keyword,
      $this->_left_paren,
      $value,
      $this->_first_semicolon,
      $this->_control,
      $this->_second_semicolon,
      $this->_end_of_loop,
      $this->_right_paren,
      $this->_body,
    );
  }

  public function first_semicolon(): EditableSyntax {
    return $this->_first_semicolon;
  }

  public function with_first_semicolon(EditableSyntax $value): this {
    return new self(
      $this->_keyword,
      $this->_left_paren,
      $this->_initializer,
      $value,
      $this->_control,
      $this->_second_semicolon,
      $this->_end_of_loop,
      $this->_right_paren,
      $this->_body,
    );
  }

  public function control(): EditableSyntax {
    return $this->_control;
  }

  public function with_control(EditableSyntax $value): this {
    return new self(
      $this->_keyword,
      $this->_left_paren,
      $this->_initializer,
      $this->_first_semicolon,
      $value,
      $this->_second_semicolon,
      $this->_end_of_loop,
      $this->_right_paren,
      $this->_body,
    );
  }

  public function second_semicolon(): EditableSyntax {
    return $this->_second_semicolon;
  }

  public function with_second_semicolon(EditableSyntax $value): this {
    return new self(
      $this->_keyword,
      $this->_left_paren,
      $this->_initializer,
      $this->_first_semicolon,
      $this->_control,
      $value,
      $this->_end_of_loop,
      $this->_right_paren,
      $this->_body,
    );
  }

  public function end_of_loop(): EditableSyntax {
    return $this->_end_of_loop;
  }

  public function with_end_of_loop(EditableSyntax $value): this {
    return new self(
      $this->_keyword,
      $this->_left_paren,
      $this->_initializer,
      $this->_first_semicolon,
      $this->_control,
      $this->_second_semicolon,
      $value,
      $this->_right_paren,
      $this->_body,
    );
  }

  public function right_paren(): EditableSyntax {
    return $this->_right_paren;
  }

  public function with_right_paren(EditableSyntax $value): this {
    return new self(
      $this->_keyword,
      $this->_left_paren,
      $this->_initializer,
      $this->_first_semicolon,
      $this->_control,
      $this->_second_semicolon,
      $this->_end_of_loop,
      $value,
      $this->_body,
    );
  }

  public function body(): EditableSyntax {
    return $this->_body;
  }

  public function with_body(EditableSyntax $value): this {
    return new self(
      $this->_keyword,
      $this->_left_paren,
      $this->_initializer,
      $this->_first_semicolon,
      $this->_control,
      $this->_second_semicolon,
      $this->_end_of_loop,
      $this->_right_paren,
      $value,
    );
  }
}

final class ForeachStatement extends EditableSyntax {

  private EditableSyntax $_keyword;
  private EditableSyntax $_left_paren;
  private EditableSyntax $_collection;
  private EditableSyntax $_await_keyword;
  private EditableSyntax $_as;
  private EditableSyntax $_key;
  private EditableSyntax $_arrow;
  private EditableSyntax $_value;
  private EditableSyntax $_right_paren;
  private EditableSyntax $_body;

  public function __construct(
    EditableSyntax $keyword,
    EditableSyntax $left_paren,
    EditableSyntax $collection,
    EditableSyntax $await_keyword,
    EditableSyntax $as,
    EditableSyntax $key,
    EditableSyntax $arrow,
    EditableSyntax $value,
    EditableSyntax $right_paren,
    EditableSyntax $body,
  ) {
    parent::__construct('foreach_statement');
    $this->_keyword = $keyword;
    $this->_left_paren = $left_paren;
    $this->_collection = $collection;
    $this->_await_keyword = $await_keyword;
    $this->_as = $as;
    $this->_key = $key;
    $this->_arrow = $arrow;
    $this->_value = $value;
    $this->_right_paren = $right_paren;
    $this->_body = $body;
  }

  public static function from_json(
    array<string, mixed> $json,
    int $position,
    string $source,
  ): this {
    $keyword = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['foreach_keyword'],
      $position,
      $source,
    );
    $position += $keyword->width();
    $left_paren = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['foreach_left_paren'],
      $position,
      $source,
    );
    $position += $left_paren->width();
    $collection = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['foreach_collection'],
      $position,
      $source,
    );
    $position += $collection->width();
    $await_keyword = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['foreach_await_keyword'],
      $position,
      $source,
    );
    $position += $await_keyword->width();
    $as = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['foreach_as'],
      $position,
      $source,
    );
    $position += $as->width();
    $key = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['foreach_key'],
      $position,
      $source,
    );
    $position += $key->width();
    $arrow = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['foreach_arrow'],
      $position,
      $source,
    );
    $position += $arrow->width();
    $value = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['foreach_value'],
      $position,
      $source,
    );
    $position += $value->width();
    $right_paren = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['foreach_right_paren'],
      $position,
      $source,
    );
    $position += $right_paren->width();
    $body = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['foreach_body'],
      $position,
      $source,
    );
    $position += $body->width();
    return new self(
      $keyword,
      $left_paren,
      $collection,
      $await_keyword,
      $as,
      $key,
      $arrow,
      $value,
      $right_paren,
      $body,
    );
  }

  public function children(): KeyedTraversable<string, EditableSyntax> {
    yield 'keyword' => $this->_keyword;
    yield 'left_paren' => $this->_left_paren;
    yield 'collection' => $this->_collection;
    yield 'await_keyword' => $this->_await_keyword;
    yield 'as' => $this->_as;
    yield 'key' => $this->_key;
    yield 'arrow' => $this->_arrow;
    yield 'value' => $this->_value;
    yield 'right_paren' => $this->_right_paren;
    yield 'body' => $this->_body;
  }

  public function rewrite(
    self::TRewriter $rewriter,
    ?Traversable<EditableSyntax> $parents = null,
  ): EditableSyntax {
    $parents = $parents === null ? vec[] : vec($parents);
    $child_parents = $parents;
    $child_parents[] = $this;
    $keyword = $this->_keyword->rewrite($rewriter, $child_parents);
    $left_paren = $this->_left_paren->rewrite($rewriter, $child_parents);
    $collection = $this->_collection->rewrite($rewriter, $child_parents);
    $await_keyword = $this->_await_keyword->rewrite($rewriter, $child_parents);
    $as = $this->_as->rewrite($rewriter, $child_parents);
    $key = $this->_key->rewrite($rewriter, $child_parents);
    $arrow = $this->_arrow->rewrite($rewriter, $child_parents);
    $value = $this->_value->rewrite($rewriter, $child_parents);
    $right_paren = $this->_right_paren->rewrite($rewriter, $child_parents);
    $body = $this->_body->rewrite($rewriter, $child_parents);
    if (
      $keyword === $this->keyword() &&
      $left_paren === $this->left_paren() &&
      $collection === $this->collection() &&
      $await_keyword === $this->await_keyword() &&
      $as === $this->as() &&
      $key === $this->key() &&
      $arrow === $this->arrow() &&
      $value === $this->value() &&
      $right_paren === $this->right_paren() &&
      $body === $this->body()
    ) {
      $node = $this;
    } else {
      $node = new self(
        $keyword,
        $left_paren,
        $collection,
        $await_keyword,
        $as,
        $key,
        $arrow,
        $value,
        $right_paren,
        $body,
      );
    }
    return $rewriter($node, $parents);
  }

  public function keyword(): EditableSyntax {
    return $this->_keyword;
  }

  public function with_keyword(EditableSyntax $value): this {
    return new self(
      $value,
      $this->_left_paren,
      $this->_collection,
      $this->_await_keyword,
      $this->_as,
      $this->_key,
      $this->_arrow,
      $this->_value,
      $this->_right_paren,
      $this->_body,
    );
  }

  public function left_paren(): EditableSyntax {
    return $this->_left_paren;
  }

  public function with_left_paren(EditableSyntax $value): this {
    return new self(
      $this->_keyword,
      $value,
      $this->_collection,
      $this->_await_keyword,
      $this->_as,
      $this->_key,
      $this->_arrow,
      $this->_value,
      $this->_right_paren,
      $this->_body,
    );
  }

  public function collection(): EditableSyntax {
    return $this->_collection;
  }

  public function with_collection(EditableSyntax $value): this {
    return new self(
      $this->_keyword,
      $this->_left_paren,
      $value,
      $this->_await_keyword,
      $this->_as,
      $this->_key,
      $this->_arrow,
      $this->_value,
      $this->_right_paren,
      $this->_body,
    );
  }

  public function await_keyword(): EditableSyntax {
    return $this->_await_keyword;
  }

  public function with_await_keyword(EditableSyntax $value): this {
    return new self(
      $this->_keyword,
      $this->_left_paren,
      $this->_collection,
      $value,
      $this->_as,
      $this->_key,
      $this->_arrow,
      $this->_value,
      $this->_right_paren,
      $this->_body,
    );
  }

  public function as(): EditableSyntax {
    return $this->_as;
  }

  public function with_as(EditableSyntax $value): this {
    return new self(
      $this->_keyword,
      $this->_left_paren,
      $this->_collection,
      $this->_await_keyword,
      $value,
      $this->_key,
      $this->_arrow,
      $this->_value,
      $this->_right_paren,
      $this->_body,
    );
  }

  public function key(): EditableSyntax {
    return $this->_key;
  }

  public function with_key(EditableSyntax $value): this {
    return new self(
      $this->_keyword,
      $this->_left_paren,
      $this->_collection,
      $this->_await_keyword,
      $this->_as,
      $value,
      $this->_arrow,
      $this->_value,
      $this->_right_paren,
      $this->_body,
    );
  }

  public function arrow(): EditableSyntax {
    return $this->_arrow;
  }

  public function with_arrow(EditableSyntax $value): this {
    return new self(
      $this->_keyword,
      $this->_left_paren,
      $this->_collection,
      $this->_await_keyword,
      $this->_as,
      $this->_key,
      $value,
      $this->_value,
      $this->_right_paren,
      $this->_body,
    );
  }

  public function value(): EditableSyntax {
    return $this->_value;
  }

  public function with_value(EditableSyntax $value): this {
    return new self(
      $this->_keyword,
      $this->_left_paren,
      $this->_collection,
      $this->_await_keyword,
      $this->_as,
      $this->_key,
      $this->_arrow,
      $value,
      $this->_right_paren,
      $this->_body,
    );
  }

  public function right_paren(): EditableSyntax {
    return $this->_right_paren;
  }

  public function with_right_paren(EditableSyntax $value): this {
    return new self(
      $this->_keyword,
      $this->_left_paren,
      $this->_collection,
      $this->_await_keyword,
      $this->_as,
      $this->_key,
      $this->_arrow,
      $this->_value,
      $value,
      $this->_body,
    );
  }

  public function body(): EditableSyntax {
    return $this->_body;
  }

  public function with_body(EditableSyntax $value): this {
    return new self(
      $this->_keyword,
      $this->_left_paren,
      $this->_collection,
      $this->_await_keyword,
      $this->_as,
      $this->_key,
      $this->_arrow,
      $this->_value,
      $this->_right_paren,
      $value,
    );
  }
}

final class SwitchStatement extends EditableSyntax {

  private EditableSyntax $_keyword;
  private EditableSyntax $_left_paren;
  private EditableSyntax $_expression;
  private EditableSyntax $_right_paren;
  private EditableSyntax $_left_brace;
  private EditableSyntax $_sections;
  private EditableSyntax $_right_brace;

  public function __construct(
    EditableSyntax $keyword,
    EditableSyntax $left_paren,
    EditableSyntax $expression,
    EditableSyntax $right_paren,
    EditableSyntax $left_brace,
    EditableSyntax $sections,
    EditableSyntax $right_brace,
  ) {
    parent::__construct('switch_statement');
    $this->_keyword = $keyword;
    $this->_left_paren = $left_paren;
    $this->_expression = $expression;
    $this->_right_paren = $right_paren;
    $this->_left_brace = $left_brace;
    $this->_sections = $sections;
    $this->_right_brace = $right_brace;
  }

  public static function from_json(
    array<string, mixed> $json,
    int $position,
    string $source,
  ): this {
    $keyword = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['switch_keyword'],
      $position,
      $source,
    );
    $position += $keyword->width();
    $left_paren = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['switch_left_paren'],
      $position,
      $source,
    );
    $position += $left_paren->width();
    $expression = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['switch_expression'],
      $position,
      $source,
    );
    $position += $expression->width();
    $right_paren = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['switch_right_paren'],
      $position,
      $source,
    );
    $position += $right_paren->width();
    $left_brace = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['switch_left_brace'],
      $position,
      $source,
    );
    $position += $left_brace->width();
    $sections = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['switch_sections'],
      $position,
      $source,
    );
    $position += $sections->width();
    $right_brace = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['switch_right_brace'],
      $position,
      $source,
    );
    $position += $right_brace->width();
    return new self(
      $keyword,
      $left_paren,
      $expression,
      $right_paren,
      $left_brace,
      $sections,
      $right_brace,
    );
  }

  public function children(): KeyedTraversable<string, EditableSyntax> {
    yield 'keyword' => $this->_keyword;
    yield 'left_paren' => $this->_left_paren;
    yield 'expression' => $this->_expression;
    yield 'right_paren' => $this->_right_paren;
    yield 'left_brace' => $this->_left_brace;
    yield 'sections' => $this->_sections;
    yield 'right_brace' => $this->_right_brace;
  }

  public function rewrite(
    self::TRewriter $rewriter,
    ?Traversable<EditableSyntax> $parents = null,
  ): EditableSyntax {
    $parents = $parents === null ? vec[] : vec($parents);
    $child_parents = $parents;
    $child_parents[] = $this;
    $keyword = $this->_keyword->rewrite($rewriter, $child_parents);
    $left_paren = $this->_left_paren->rewrite($rewriter, $child_parents);
    $expression = $this->_expression->rewrite($rewriter, $child_parents);
    $right_paren = $this->_right_paren->rewrite($rewriter, $child_parents);
    $left_brace = $this->_left_brace->rewrite($rewriter, $child_parents);
    $sections = $this->_sections->rewrite($rewriter, $child_parents);
    $right_brace = $this->_right_brace->rewrite($rewriter, $child_parents);
    if (
      $keyword === $this->keyword() &&
      $left_paren === $this->left_paren() &&
      $expression === $this->expression() &&
      $right_paren === $this->right_paren() &&
      $left_brace === $this->left_brace() &&
      $sections === $this->sections() &&
      $right_brace === $this->right_brace()
    ) {
      $node = $this;
    } else {
      $node = new self(
        $keyword,
        $left_paren,
        $expression,
        $right_paren,
        $left_brace,
        $sections,
        $right_brace,
      );
    }
    return $rewriter($node, $parents);
  }

  public function keyword(): EditableSyntax {
    return $this->_keyword;
  }

  public function with_keyword(EditableSyntax $value): this {
    return new self(
      $value,
      $this->_left_paren,
      $this->_expression,
      $this->_right_paren,
      $this->_left_brace,
      $this->_sections,
      $this->_right_brace,
    );
  }

  public function left_paren(): EditableSyntax {
    return $this->_left_paren;
  }

  public function with_left_paren(EditableSyntax $value): this {
    return new self(
      $this->_keyword,
      $value,
      $this->_expression,
      $this->_right_paren,
      $this->_left_brace,
      $this->_sections,
      $this->_right_brace,
    );
  }

  public function expression(): EditableSyntax {
    return $this->_expression;
  }

  public function with_expression(EditableSyntax $value): this {
    return new self(
      $this->_keyword,
      $this->_left_paren,
      $value,
      $this->_right_paren,
      $this->_left_brace,
      $this->_sections,
      $this->_right_brace,
    );
  }

  public function right_paren(): EditableSyntax {
    return $this->_right_paren;
  }

  public function with_right_paren(EditableSyntax $value): this {
    return new self(
      $this->_keyword,
      $this->_left_paren,
      $this->_expression,
      $value,
      $this->_left_brace,
      $this->_sections,
      $this->_right_brace,
    );
  }

  public function left_brace(): EditableSyntax {
    return $this->_left_brace;
  }

  public function with_left_brace(EditableSyntax $value): this {
    return new self(
      $this->_keyword,
      $this->_left_paren,
      $this->_expression,
      $this->_right_paren,
      $value,
      $this->_sections,
      $this->_right_brace,
    );
  }

  public function sections(): EditableSyntax {
    return $this->_sections;
  }

  public function with_sections(EditableSyntax $value): this {
    return new self(
      $this->_keyword,
      $this->_left_paren,
      $this->_expression,
      $this->_right_paren,
      $this->_left_brace,
      $value,
      $this->_right_brace,
    );
  }

  public function right_brace(): EditableSyntax {
    return $this->_right_brace;
  }

  public function with_right_brace(EditableSyntax $value): this {
    return new self(
      $this->_keyword,
      $this->_left_paren,
      $this->_expression,
      $this->_right_paren,
      $this->_left_brace,
      $this->_sections,
      $value,
    );
  }
}

final class SwitchSection extends EditableSyntax {

  private EditableSyntax $_labels;
  private EditableSyntax $_statements;
  private EditableSyntax $_fallthrough;

  public function __construct(
    EditableSyntax $labels,
    EditableSyntax $statements,
    EditableSyntax $fallthrough,
  ) {
    parent::__construct('switch_section');
    $this->_labels = $labels;
    $this->_statements = $statements;
    $this->_fallthrough = $fallthrough;
  }

  public static function from_json(
    array<string, mixed> $json,
    int $position,
    string $source,
  ): this {
    $labels = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['switch_section_labels'],
      $position,
      $source,
    );
    $position += $labels->width();
    $statements = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['switch_section_statements'],
      $position,
      $source,
    );
    $position += $statements->width();
    $fallthrough = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['switch_section_fallthrough'],
      $position,
      $source,
    );
    $position += $fallthrough->width();
    return new self($labels, $statements, $fallthrough);
  }

  public function children(): KeyedTraversable<string, EditableSyntax> {
    yield 'labels' => $this->_labels;
    yield 'statements' => $this->_statements;
    yield 'fallthrough' => $this->_fallthrough;
  }

  public function rewrite(
    self::TRewriter $rewriter,
    ?Traversable<EditableSyntax> $parents = null,
  ): EditableSyntax {
    $parents = $parents === null ? vec[] : vec($parents);
    $child_parents = $parents;
    $child_parents[] = $this;
    $labels = $this->_labels->rewrite($rewriter, $child_parents);
    $statements = $this->_statements->rewrite($rewriter, $child_parents);
    $fallthrough = $this->_fallthrough->rewrite($rewriter, $child_parents);
    if (
      $labels === $this->labels() &&
      $statements === $this->statements() &&
      $fallthrough === $this->fallthrough()
    ) {
      $node = $this;
    } else {
      $node = new self($labels, $statements, $fallthrough);
    }
    return $rewriter($node, $parents);
  }

  public function labels(): EditableSyntax {
    return $this->_labels;
  }

  public function with_labels(EditableSyntax $value): this {
    return new self($value, $this->_statements, $this->_fallthrough);
  }

  public function statements(): EditableSyntax {
    return $this->_statements;
  }

  public function with_statements(EditableSyntax $value): this {
    return new self($this->_labels, $value, $this->_fallthrough);
  }

  public function fallthrough(): EditableSyntax {
    return $this->_fallthrough;
  }

  public function with_fallthrough(EditableSyntax $value): this {
    return new self($this->_labels, $this->_statements, $value);
  }
}

final class SwitchFallthrough extends EditableSyntax {

  private EditableSyntax $_keyword;
  private EditableSyntax $_semicolon;

  public function __construct(
    EditableSyntax $keyword,
    EditableSyntax $semicolon,
  ) {
    parent::__construct('switch_fallthrough');
    $this->_keyword = $keyword;
    $this->_semicolon = $semicolon;
  }

  public static function from_json(
    array<string, mixed> $json,
    int $position,
    string $source,
  ): this {
    $keyword = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['fallthrough_keyword'],
      $position,
      $source,
    );
    $position += $keyword->width();
    $semicolon = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['fallthrough_semicolon'],
      $position,
      $source,
    );
    $position += $semicolon->width();
    return new self($keyword, $semicolon);
  }

  public function children(): KeyedTraversable<string, EditableSyntax> {
    yield 'keyword' => $this->_keyword;
    yield 'semicolon' => $this->_semicolon;
  }

  public function rewrite(
    self::TRewriter $rewriter,
    ?Traversable<EditableSyntax> $parents = null,
  ): EditableSyntax {
    $parents = $parents === null ? vec[] : vec($parents);
    $child_parents = $parents;
    $child_parents[] = $this;
    $keyword = $this->_keyword->rewrite($rewriter, $child_parents);
    $semicolon = $this->_semicolon->rewrite($rewriter, $child_parents);
    if ($keyword === $this->keyword() && $semicolon === $this->semicolon()) {
      $node = $this;
    } else {
      $node = new self($keyword, $semicolon);
    }
    return $rewriter($node, $parents);
  }

  public function keyword(): EditableSyntax {
    return $this->_keyword;
  }

  public function with_keyword(EditableSyntax $value): this {
    return new self($value, $this->_semicolon);
  }

  public function semicolon(): EditableSyntax {
    return $this->_semicolon;
  }

  public function with_semicolon(EditableSyntax $value): this {
    return new self($this->_keyword, $value);
  }
}

final class CaseLabel extends EditableSyntax {

  private EditableSyntax $_keyword;
  private EditableSyntax $_expression;
  private EditableSyntax $_colon;

  public function __construct(
    EditableSyntax $keyword,
    EditableSyntax $expression,
    EditableSyntax $colon,
  ) {
    parent::__construct('case_label');
    $this->_keyword = $keyword;
    $this->_expression = $expression;
    $this->_colon = $colon;
  }

  public static function from_json(
    array<string, mixed> $json,
    int $position,
    string $source,
  ): this {
    $keyword = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['case_keyword'],
      $position,
      $source,
    );
    $position += $keyword->width();
    $expression = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['case_expression'],
      $position,
      $source,
    );
    $position += $expression->width();
    $colon = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['case_colon'],
      $position,
      $source,
    );
    $position += $colon->width();
    return new self($keyword, $expression, $colon);
  }

  public function children(): KeyedTraversable<string, EditableSyntax> {
    yield 'keyword' => $this->_keyword;
    yield 'expression' => $this->_expression;
    yield 'colon' => $this->_colon;
  }

  public function rewrite(
    self::TRewriter $rewriter,
    ?Traversable<EditableSyntax> $parents = null,
  ): EditableSyntax {
    $parents = $parents === null ? vec[] : vec($parents);
    $child_parents = $parents;
    $child_parents[] = $this;
    $keyword = $this->_keyword->rewrite($rewriter, $child_parents);
    $expression = $this->_expression->rewrite($rewriter, $child_parents);
    $colon = $this->_colon->rewrite($rewriter, $child_parents);
    if (
      $keyword === $this->keyword() &&
      $expression === $this->expression() &&
      $colon === $this->colon()
    ) {
      $node = $this;
    } else {
      $node = new self($keyword, $expression, $colon);
    }
    return $rewriter($node, $parents);
  }

  public function keyword(): EditableSyntax {
    return $this->_keyword;
  }

  public function with_keyword(EditableSyntax $value): this {
    return new self($value, $this->_expression, $this->_colon);
  }

  public function expression(): EditableSyntax {
    return $this->_expression;
  }

  public function with_expression(EditableSyntax $value): this {
    return new self($this->_keyword, $value, $this->_colon);
  }

  public function colon(): EditableSyntax {
    return $this->_colon;
  }

  public function with_colon(EditableSyntax $value): this {
    return new self($this->_keyword, $this->_expression, $value);
  }
}

final class DefaultLabel extends EditableSyntax {

  private EditableSyntax $_keyword;
  private EditableSyntax $_colon;

  public function __construct(EditableSyntax $keyword, EditableSyntax $colon) {
    parent::__construct('default_label');
    $this->_keyword = $keyword;
    $this->_colon = $colon;
  }

  public static function from_json(
    array<string, mixed> $json,
    int $position,
    string $source,
  ): this {
    $keyword = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['default_keyword'],
      $position,
      $source,
    );
    $position += $keyword->width();
    $colon = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['default_colon'],
      $position,
      $source,
    );
    $position += $colon->width();
    return new self($keyword, $colon);
  }

  public function children(): KeyedTraversable<string, EditableSyntax> {
    yield 'keyword' => $this->_keyword;
    yield 'colon' => $this->_colon;
  }

  public function rewrite(
    self::TRewriter $rewriter,
    ?Traversable<EditableSyntax> $parents = null,
  ): EditableSyntax {
    $parents = $parents === null ? vec[] : vec($parents);
    $child_parents = $parents;
    $child_parents[] = $this;
    $keyword = $this->_keyword->rewrite($rewriter, $child_parents);
    $colon = $this->_colon->rewrite($rewriter, $child_parents);
    if ($keyword === $this->keyword() && $colon === $this->colon()) {
      $node = $this;
    } else {
      $node = new self($keyword, $colon);
    }
    return $rewriter($node, $parents);
  }

  public function keyword(): EditableSyntax {
    return $this->_keyword;
  }

  public function with_keyword(EditableSyntax $value): this {
    return new self($value, $this->_colon);
  }

  public function colon(): EditableSyntax {
    return $this->_colon;
  }

  public function with_colon(EditableSyntax $value): this {
    return new self($this->_keyword, $value);
  }
}

final class ReturnStatement extends EditableSyntax {

  private EditableSyntax $_keyword;
  private EditableSyntax $_expression;
  private EditableSyntax $_semicolon;

  public function __construct(
    EditableSyntax $keyword,
    EditableSyntax $expression,
    EditableSyntax $semicolon,
  ) {
    parent::__construct('return_statement');
    $this->_keyword = $keyword;
    $this->_expression = $expression;
    $this->_semicolon = $semicolon;
  }

  public static function from_json(
    array<string, mixed> $json,
    int $position,
    string $source,
  ): this {
    $keyword = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['return_keyword'],
      $position,
      $source,
    );
    $position += $keyword->width();
    $expression = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['return_expression'],
      $position,
      $source,
    );
    $position += $expression->width();
    $semicolon = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['return_semicolon'],
      $position,
      $source,
    );
    $position += $semicolon->width();
    return new self($keyword, $expression, $semicolon);
  }

  public function children(): KeyedTraversable<string, EditableSyntax> {
    yield 'keyword' => $this->_keyword;
    yield 'expression' => $this->_expression;
    yield 'semicolon' => $this->_semicolon;
  }

  public function rewrite(
    self::TRewriter $rewriter,
    ?Traversable<EditableSyntax> $parents = null,
  ): EditableSyntax {
    $parents = $parents === null ? vec[] : vec($parents);
    $child_parents = $parents;
    $child_parents[] = $this;
    $keyword = $this->_keyword->rewrite($rewriter, $child_parents);
    $expression = $this->_expression->rewrite($rewriter, $child_parents);
    $semicolon = $this->_semicolon->rewrite($rewriter, $child_parents);
    if (
      $keyword === $this->keyword() &&
      $expression === $this->expression() &&
      $semicolon === $this->semicolon()
    ) {
      $node = $this;
    } else {
      $node = new self($keyword, $expression, $semicolon);
    }
    return $rewriter($node, $parents);
  }

  public function keyword(): EditableSyntax {
    return $this->_keyword;
  }

  public function with_keyword(EditableSyntax $value): this {
    return new self($value, $this->_expression, $this->_semicolon);
  }

  public function expression(): EditableSyntax {
    return $this->_expression;
  }

  public function with_expression(EditableSyntax $value): this {
    return new self($this->_keyword, $value, $this->_semicolon);
  }

  public function semicolon(): EditableSyntax {
    return $this->_semicolon;
  }

  public function with_semicolon(EditableSyntax $value): this {
    return new self($this->_keyword, $this->_expression, $value);
  }
}

final class GotoLabel extends EditableSyntax {

  private EditableSyntax $_name;
  private EditableSyntax $_colon;

  public function __construct(EditableSyntax $name, EditableSyntax $colon) {
    parent::__construct('goto_label');
    $this->_name = $name;
    $this->_colon = $colon;
  }

  public static function from_json(
    array<string, mixed> $json,
    int $position,
    string $source,
  ): this {
    $name = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['goto_label_name'],
      $position,
      $source,
    );
    $position += $name->width();
    $colon = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['goto_label_colon'],
      $position,
      $source,
    );
    $position += $colon->width();
    return new self($name, $colon);
  }

  public function children(): KeyedTraversable<string, EditableSyntax> {
    yield 'name' => $this->_name;
    yield 'colon' => $this->_colon;
  }

  public function rewrite(
    self::TRewriter $rewriter,
    ?Traversable<EditableSyntax> $parents = null,
  ): EditableSyntax {
    $parents = $parents === null ? vec[] : vec($parents);
    $child_parents = $parents;
    $child_parents[] = $this;
    $name = $this->_name->rewrite($rewriter, $child_parents);
    $colon = $this->_colon->rewrite($rewriter, $child_parents);
    if ($name === $this->name() && $colon === $this->colon()) {
      $node = $this;
    } else {
      $node = new self($name, $colon);
    }
    return $rewriter($node, $parents);
  }

  public function name(): EditableSyntax {
    return $this->_name;
  }

  public function with_name(EditableSyntax $value): this {
    return new self($value, $this->_colon);
  }

  public function colon(): EditableSyntax {
    return $this->_colon;
  }

  public function with_colon(EditableSyntax $value): this {
    return new self($this->_name, $value);
  }
}

final class GotoStatement extends EditableSyntax {

  private EditableSyntax $_keyword;
  private EditableSyntax $_label_name;
  private EditableSyntax $_semicolon;

  public function __construct(
    EditableSyntax $keyword,
    EditableSyntax $label_name,
    EditableSyntax $semicolon,
  ) {
    parent::__construct('goto_statement');
    $this->_keyword = $keyword;
    $this->_label_name = $label_name;
    $this->_semicolon = $semicolon;
  }

  public static function from_json(
    array<string, mixed> $json,
    int $position,
    string $source,
  ): this {
    $keyword = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['goto_statement_keyword'],
      $position,
      $source,
    );
    $position += $keyword->width();
    $label_name = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['goto_statement_label_name'],
      $position,
      $source,
    );
    $position += $label_name->width();
    $semicolon = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['goto_statement_semicolon'],
      $position,
      $source,
    );
    $position += $semicolon->width();
    return new self($keyword, $label_name, $semicolon);
  }

  public function children(): KeyedTraversable<string, EditableSyntax> {
    yield 'keyword' => $this->_keyword;
    yield 'label_name' => $this->_label_name;
    yield 'semicolon' => $this->_semicolon;
  }

  public function rewrite(
    self::TRewriter $rewriter,
    ?Traversable<EditableSyntax> $parents = null,
  ): EditableSyntax {
    $parents = $parents === null ? vec[] : vec($parents);
    $child_parents = $parents;
    $child_parents[] = $this;
    $keyword = $this->_keyword->rewrite($rewriter, $child_parents);
    $label_name = $this->_label_name->rewrite($rewriter, $child_parents);
    $semicolon = $this->_semicolon->rewrite($rewriter, $child_parents);
    if (
      $keyword === $this->keyword() &&
      $label_name === $this->label_name() &&
      $semicolon === $this->semicolon()
    ) {
      $node = $this;
    } else {
      $node = new self($keyword, $label_name, $semicolon);
    }
    return $rewriter($node, $parents);
  }

  public function keyword(): EditableSyntax {
    return $this->_keyword;
  }

  public function with_keyword(EditableSyntax $value): this {
    return new self($value, $this->_label_name, $this->_semicolon);
  }

  public function label_name(): EditableSyntax {
    return $this->_label_name;
  }

  public function with_label_name(EditableSyntax $value): this {
    return new self($this->_keyword, $value, $this->_semicolon);
  }

  public function semicolon(): EditableSyntax {
    return $this->_semicolon;
  }

  public function with_semicolon(EditableSyntax $value): this {
    return new self($this->_keyword, $this->_label_name, $value);
  }
}

final class ThrowStatement extends EditableSyntax {

  private EditableSyntax $_keyword;
  private EditableSyntax $_expression;
  private EditableSyntax $_semicolon;

  public function __construct(
    EditableSyntax $keyword,
    EditableSyntax $expression,
    EditableSyntax $semicolon,
  ) {
    parent::__construct('throw_statement');
    $this->_keyword = $keyword;
    $this->_expression = $expression;
    $this->_semicolon = $semicolon;
  }

  public static function from_json(
    array<string, mixed> $json,
    int $position,
    string $source,
  ): this {
    $keyword = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['throw_keyword'],
      $position,
      $source,
    );
    $position += $keyword->width();
    $expression = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['throw_expression'],
      $position,
      $source,
    );
    $position += $expression->width();
    $semicolon = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['throw_semicolon'],
      $position,
      $source,
    );
    $position += $semicolon->width();
    return new self($keyword, $expression, $semicolon);
  }

  public function children(): KeyedTraversable<string, EditableSyntax> {
    yield 'keyword' => $this->_keyword;
    yield 'expression' => $this->_expression;
    yield 'semicolon' => $this->_semicolon;
  }

  public function rewrite(
    self::TRewriter $rewriter,
    ?Traversable<EditableSyntax> $parents = null,
  ): EditableSyntax {
    $parents = $parents === null ? vec[] : vec($parents);
    $child_parents = $parents;
    $child_parents[] = $this;
    $keyword = $this->_keyword->rewrite($rewriter, $child_parents);
    $expression = $this->_expression->rewrite($rewriter, $child_parents);
    $semicolon = $this->_semicolon->rewrite($rewriter, $child_parents);
    if (
      $keyword === $this->keyword() &&
      $expression === $this->expression() &&
      $semicolon === $this->semicolon()
    ) {
      $node = $this;
    } else {
      $node = new self($keyword, $expression, $semicolon);
    }
    return $rewriter($node, $parents);
  }

  public function keyword(): EditableSyntax {
    return $this->_keyword;
  }

  public function with_keyword(EditableSyntax $value): this {
    return new self($value, $this->_expression, $this->_semicolon);
  }

  public function expression(): EditableSyntax {
    return $this->_expression;
  }

  public function with_expression(EditableSyntax $value): this {
    return new self($this->_keyword, $value, $this->_semicolon);
  }

  public function semicolon(): EditableSyntax {
    return $this->_semicolon;
  }

  public function with_semicolon(EditableSyntax $value): this {
    return new self($this->_keyword, $this->_expression, $value);
  }
}

final class BreakStatement extends EditableSyntax {

  private EditableSyntax $_keyword;
  private EditableSyntax $_level;
  private EditableSyntax $_semicolon;

  public function __construct(
    EditableSyntax $keyword,
    EditableSyntax $level,
    EditableSyntax $semicolon,
  ) {
    parent::__construct('break_statement');
    $this->_keyword = $keyword;
    $this->_level = $level;
    $this->_semicolon = $semicolon;
  }

  public static function from_json(
    array<string, mixed> $json,
    int $position,
    string $source,
  ): this {
    $keyword = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['break_keyword'],
      $position,
      $source,
    );
    $position += $keyword->width();
    $level = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['break_level'],
      $position,
      $source,
    );
    $position += $level->width();
    $semicolon = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['break_semicolon'],
      $position,
      $source,
    );
    $position += $semicolon->width();
    return new self($keyword, $level, $semicolon);
  }

  public function children(): KeyedTraversable<string, EditableSyntax> {
    yield 'keyword' => $this->_keyword;
    yield 'level' => $this->_level;
    yield 'semicolon' => $this->_semicolon;
  }

  public function rewrite(
    self::TRewriter $rewriter,
    ?Traversable<EditableSyntax> $parents = null,
  ): EditableSyntax {
    $parents = $parents === null ? vec[] : vec($parents);
    $child_parents = $parents;
    $child_parents[] = $this;
    $keyword = $this->_keyword->rewrite($rewriter, $child_parents);
    $level = $this->_level->rewrite($rewriter, $child_parents);
    $semicolon = $this->_semicolon->rewrite($rewriter, $child_parents);
    if (
      $keyword === $this->keyword() &&
      $level === $this->level() &&
      $semicolon === $this->semicolon()
    ) {
      $node = $this;
    } else {
      $node = new self($keyword, $level, $semicolon);
    }
    return $rewriter($node, $parents);
  }

  public function keyword(): EditableSyntax {
    return $this->_keyword;
  }

  public function with_keyword(EditableSyntax $value): this {
    return new self($value, $this->_level, $this->_semicolon);
  }

  public function level(): EditableSyntax {
    return $this->_level;
  }

  public function with_level(EditableSyntax $value): this {
    return new self($this->_keyword, $value, $this->_semicolon);
  }

  public function semicolon(): EditableSyntax {
    return $this->_semicolon;
  }

  public function with_semicolon(EditableSyntax $value): this {
    return new self($this->_keyword, $this->_level, $value);
  }
}

final class ContinueStatement extends EditableSyntax {

  private EditableSyntax $_keyword;
  private EditableSyntax $_level;
  private EditableSyntax $_semicolon;

  public function __construct(
    EditableSyntax $keyword,
    EditableSyntax $level,
    EditableSyntax $semicolon,
  ) {
    parent::__construct('continue_statement');
    $this->_keyword = $keyword;
    $this->_level = $level;
    $this->_semicolon = $semicolon;
  }

  public static function from_json(
    array<string, mixed> $json,
    int $position,
    string $source,
  ): this {
    $keyword = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['continue_keyword'],
      $position,
      $source,
    );
    $position += $keyword->width();
    $level = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['continue_level'],
      $position,
      $source,
    );
    $position += $level->width();
    $semicolon = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['continue_semicolon'],
      $position,
      $source,
    );
    $position += $semicolon->width();
    return new self($keyword, $level, $semicolon);
  }

  public function children(): KeyedTraversable<string, EditableSyntax> {
    yield 'keyword' => $this->_keyword;
    yield 'level' => $this->_level;
    yield 'semicolon' => $this->_semicolon;
  }

  public function rewrite(
    self::TRewriter $rewriter,
    ?Traversable<EditableSyntax> $parents = null,
  ): EditableSyntax {
    $parents = $parents === null ? vec[] : vec($parents);
    $child_parents = $parents;
    $child_parents[] = $this;
    $keyword = $this->_keyword->rewrite($rewriter, $child_parents);
    $level = $this->_level->rewrite($rewriter, $child_parents);
    $semicolon = $this->_semicolon->rewrite($rewriter, $child_parents);
    if (
      $keyword === $this->keyword() &&
      $level === $this->level() &&
      $semicolon === $this->semicolon()
    ) {
      $node = $this;
    } else {
      $node = new self($keyword, $level, $semicolon);
    }
    return $rewriter($node, $parents);
  }

  public function keyword(): EditableSyntax {
    return $this->_keyword;
  }

  public function with_keyword(EditableSyntax $value): this {
    return new self($value, $this->_level, $this->_semicolon);
  }

  public function level(): EditableSyntax {
    return $this->_level;
  }

  public function with_level(EditableSyntax $value): this {
    return new self($this->_keyword, $value, $this->_semicolon);
  }

  public function semicolon(): EditableSyntax {
    return $this->_semicolon;
  }

  public function with_semicolon(EditableSyntax $value): this {
    return new self($this->_keyword, $this->_level, $value);
  }
}

final class FunctionStaticStatement extends EditableSyntax {

  private EditableSyntax $_static_keyword;
  private EditableSyntax $_declarations;
  private EditableSyntax $_semicolon;

  public function __construct(
    EditableSyntax $static_keyword,
    EditableSyntax $declarations,
    EditableSyntax $semicolon,
  ) {
    parent::__construct('function_static_statement');
    $this->_static_keyword = $static_keyword;
    $this->_declarations = $declarations;
    $this->_semicolon = $semicolon;
  }

  public static function from_json(
    array<string, mixed> $json,
    int $position,
    string $source,
  ): this {
    $static_keyword = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['static_static_keyword'],
      $position,
      $source,
    );
    $position += $static_keyword->width();
    $declarations = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['static_declarations'],
      $position,
      $source,
    );
    $position += $declarations->width();
    $semicolon = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['static_semicolon'],
      $position,
      $source,
    );
    $position += $semicolon->width();
    return new self($static_keyword, $declarations, $semicolon);
  }

  public function children(): KeyedTraversable<string, EditableSyntax> {
    yield 'static_keyword' => $this->_static_keyword;
    yield 'declarations' => $this->_declarations;
    yield 'semicolon' => $this->_semicolon;
  }

  public function rewrite(
    self::TRewriter $rewriter,
    ?Traversable<EditableSyntax> $parents = null,
  ): EditableSyntax {
    $parents = $parents === null ? vec[] : vec($parents);
    $child_parents = $parents;
    $child_parents[] = $this;
    $static_keyword =
      $this->_static_keyword->rewrite($rewriter, $child_parents);
    $declarations = $this->_declarations->rewrite($rewriter, $child_parents);
    $semicolon = $this->_semicolon->rewrite($rewriter, $child_parents);
    if (
      $static_keyword === $this->static_keyword() &&
      $declarations === $this->declarations() &&
      $semicolon === $this->semicolon()
    ) {
      $node = $this;
    } else {
      $node = new self($static_keyword, $declarations, $semicolon);
    }
    return $rewriter($node, $parents);
  }

  public function static_keyword(): EditableSyntax {
    return $this->_static_keyword;
  }

  public function with_static_keyword(EditableSyntax $value): this {
    return new self($value, $this->_declarations, $this->_semicolon);
  }

  public function declarations(): EditableSyntax {
    return $this->_declarations;
  }

  public function with_declarations(EditableSyntax $value): this {
    return new self($this->_static_keyword, $value, $this->_semicolon);
  }

  public function semicolon(): EditableSyntax {
    return $this->_semicolon;
  }

  public function with_semicolon(EditableSyntax $value): this {
    return new self($this->_static_keyword, $this->_declarations, $value);
  }
}

final class StaticDeclarator extends EditableSyntax {

  private EditableSyntax $_name;
  private EditableSyntax $_initializer;

  public function __construct(
    EditableSyntax $name,
    EditableSyntax $initializer,
  ) {
    parent::__construct('static_declarator');
    $this->_name = $name;
    $this->_initializer = $initializer;
  }

  public static function from_json(
    array<string, mixed> $json,
    int $position,
    string $source,
  ): this {
    $name = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['static_name'],
      $position,
      $source,
    );
    $position += $name->width();
    $initializer = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['static_initializer'],
      $position,
      $source,
    );
    $position += $initializer->width();
    return new self($name, $initializer);
  }

  public function children(): KeyedTraversable<string, EditableSyntax> {
    yield 'name' => $this->_name;
    yield 'initializer' => $this->_initializer;
  }

  public function rewrite(
    self::TRewriter $rewriter,
    ?Traversable<EditableSyntax> $parents = null,
  ): EditableSyntax {
    $parents = $parents === null ? vec[] : vec($parents);
    $child_parents = $parents;
    $child_parents[] = $this;
    $name = $this->_name->rewrite($rewriter, $child_parents);
    $initializer = $this->_initializer->rewrite($rewriter, $child_parents);
    if ($name === $this->name() && $initializer === $this->initializer()) {
      $node = $this;
    } else {
      $node = new self($name, $initializer);
    }
    return $rewriter($node, $parents);
  }

  public function name(): EditableSyntax {
    return $this->_name;
  }

  public function with_name(EditableSyntax $value): this {
    return new self($value, $this->_initializer);
  }

  public function initializer(): EditableSyntax {
    return $this->_initializer;
  }

  public function with_initializer(EditableSyntax $value): this {
    return new self($this->_name, $value);
  }
}

final class EchoStatement extends EditableSyntax {

  private EditableSyntax $_keyword;
  private EditableSyntax $_expressions;
  private EditableSyntax $_semicolon;

  public function __construct(
    EditableSyntax $keyword,
    EditableSyntax $expressions,
    EditableSyntax $semicolon,
  ) {
    parent::__construct('echo_statement');
    $this->_keyword = $keyword;
    $this->_expressions = $expressions;
    $this->_semicolon = $semicolon;
  }

  public static function from_json(
    array<string, mixed> $json,
    int $position,
    string $source,
  ): this {
    $keyword = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['echo_keyword'],
      $position,
      $source,
    );
    $position += $keyword->width();
    $expressions = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['echo_expressions'],
      $position,
      $source,
    );
    $position += $expressions->width();
    $semicolon = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['echo_semicolon'],
      $position,
      $source,
    );
    $position += $semicolon->width();
    return new self($keyword, $expressions, $semicolon);
  }

  public function children(): KeyedTraversable<string, EditableSyntax> {
    yield 'keyword' => $this->_keyword;
    yield 'expressions' => $this->_expressions;
    yield 'semicolon' => $this->_semicolon;
  }

  public function rewrite(
    self::TRewriter $rewriter,
    ?Traversable<EditableSyntax> $parents = null,
  ): EditableSyntax {
    $parents = $parents === null ? vec[] : vec($parents);
    $child_parents = $parents;
    $child_parents[] = $this;
    $keyword = $this->_keyword->rewrite($rewriter, $child_parents);
    $expressions = $this->_expressions->rewrite($rewriter, $child_parents);
    $semicolon = $this->_semicolon->rewrite($rewriter, $child_parents);
    if (
      $keyword === $this->keyword() &&
      $expressions === $this->expressions() &&
      $semicolon === $this->semicolon()
    ) {
      $node = $this;
    } else {
      $node = new self($keyword, $expressions, $semicolon);
    }
    return $rewriter($node, $parents);
  }

  public function keyword(): EditableSyntax {
    return $this->_keyword;
  }

  public function with_keyword(EditableSyntax $value): this {
    return new self($value, $this->_expressions, $this->_semicolon);
  }

  public function expressions(): EditableSyntax {
    return $this->_expressions;
  }

  public function with_expressions(EditableSyntax $value): this {
    return new self($this->_keyword, $value, $this->_semicolon);
  }

  public function semicolon(): EditableSyntax {
    return $this->_semicolon;
  }

  public function with_semicolon(EditableSyntax $value): this {
    return new self($this->_keyword, $this->_expressions, $value);
  }
}

final class GlobalStatement extends EditableSyntax {

  private EditableSyntax $_keyword;
  private EditableSyntax $_variables;
  private EditableSyntax $_semicolon;

  public function __construct(
    EditableSyntax $keyword,
    EditableSyntax $variables,
    EditableSyntax $semicolon,
  ) {
    parent::__construct('global_statement');
    $this->_keyword = $keyword;
    $this->_variables = $variables;
    $this->_semicolon = $semicolon;
  }

  public static function from_json(
    array<string, mixed> $json,
    int $position,
    string $source,
  ): this {
    $keyword = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['global_keyword'],
      $position,
      $source,
    );
    $position += $keyword->width();
    $variables = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['global_variables'],
      $position,
      $source,
    );
    $position += $variables->width();
    $semicolon = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['global_semicolon'],
      $position,
      $source,
    );
    $position += $semicolon->width();
    return new self($keyword, $variables, $semicolon);
  }

  public function children(): KeyedTraversable<string, EditableSyntax> {
    yield 'keyword' => $this->_keyword;
    yield 'variables' => $this->_variables;
    yield 'semicolon' => $this->_semicolon;
  }

  public function rewrite(
    self::TRewriter $rewriter,
    ?Traversable<EditableSyntax> $parents = null,
  ): EditableSyntax {
    $parents = $parents === null ? vec[] : vec($parents);
    $child_parents = $parents;
    $child_parents[] = $this;
    $keyword = $this->_keyword->rewrite($rewriter, $child_parents);
    $variables = $this->_variables->rewrite($rewriter, $child_parents);
    $semicolon = $this->_semicolon->rewrite($rewriter, $child_parents);
    if (
      $keyword === $this->keyword() &&
      $variables === $this->variables() &&
      $semicolon === $this->semicolon()
    ) {
      $node = $this;
    } else {
      $node = new self($keyword, $variables, $semicolon);
    }
    return $rewriter($node, $parents);
  }

  public function keyword(): EditableSyntax {
    return $this->_keyword;
  }

  public function with_keyword(EditableSyntax $value): this {
    return new self($value, $this->_variables, $this->_semicolon);
  }

  public function variables(): EditableSyntax {
    return $this->_variables;
  }

  public function with_variables(EditableSyntax $value): this {
    return new self($this->_keyword, $value, $this->_semicolon);
  }

  public function semicolon(): EditableSyntax {
    return $this->_semicolon;
  }

  public function with_semicolon(EditableSyntax $value): this {
    return new self($this->_keyword, $this->_variables, $value);
  }
}

final class SimpleInitializer extends EditableSyntax {

  private EditableSyntax $_equal;
  private EditableSyntax $_value;

  public function __construct(EditableSyntax $equal, EditableSyntax $value) {
    parent::__construct('simple_initializer');
    $this->_equal = $equal;
    $this->_value = $value;
  }

  public static function from_json(
    array<string, mixed> $json,
    int $position,
    string $source,
  ): this {
    $equal = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['simple_initializer_equal'],
      $position,
      $source,
    );
    $position += $equal->width();
    $value = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['simple_initializer_value'],
      $position,
      $source,
    );
    $position += $value->width();
    return new self($equal, $value);
  }

  public function children(): KeyedTraversable<string, EditableSyntax> {
    yield 'equal' => $this->_equal;
    yield 'value' => $this->_value;
  }

  public function rewrite(
    self::TRewriter $rewriter,
    ?Traversable<EditableSyntax> $parents = null,
  ): EditableSyntax {
    $parents = $parents === null ? vec[] : vec($parents);
    $child_parents = $parents;
    $child_parents[] = $this;
    $equal = $this->_equal->rewrite($rewriter, $child_parents);
    $value = $this->_value->rewrite($rewriter, $child_parents);
    if ($equal === $this->equal() && $value === $this->value()) {
      $node = $this;
    } else {
      $node = new self($equal, $value);
    }
    return $rewriter($node, $parents);
  }

  public function equal(): EditableSyntax {
    return $this->_equal;
  }

  public function with_equal(EditableSyntax $value): this {
    return new self($value, $this->_value);
  }

  public function value(): EditableSyntax {
    return $this->_value;
  }

  public function with_value(EditableSyntax $value): this {
    return new self($this->_equal, $value);
  }
}

final class AnonymousFunction extends EditableSyntax {

  private EditableSyntax $_static_keyword;
  private EditableSyntax $_async_keyword;
  private EditableSyntax $_coroutine_keyword;
  private EditableSyntax $_function_keyword;
  private EditableSyntax $_left_paren;
  private EditableSyntax $_parameters;
  private EditableSyntax $_right_paren;
  private EditableSyntax $_colon;
  private EditableSyntax $_type;
  private EditableSyntax $_use;
  private EditableSyntax $_body;

  public function __construct(
    EditableSyntax $static_keyword,
    EditableSyntax $async_keyword,
    EditableSyntax $coroutine_keyword,
    EditableSyntax $function_keyword,
    EditableSyntax $left_paren,
    EditableSyntax $parameters,
    EditableSyntax $right_paren,
    EditableSyntax $colon,
    EditableSyntax $type,
    EditableSyntax $use,
    EditableSyntax $body,
  ) {
    parent::__construct('anonymous_function');
    $this->_static_keyword = $static_keyword;
    $this->_async_keyword = $async_keyword;
    $this->_coroutine_keyword = $coroutine_keyword;
    $this->_function_keyword = $function_keyword;
    $this->_left_paren = $left_paren;
    $this->_parameters = $parameters;
    $this->_right_paren = $right_paren;
    $this->_colon = $colon;
    $this->_type = $type;
    $this->_use = $use;
    $this->_body = $body;
  }

  public static function from_json(
    array<string, mixed> $json,
    int $position,
    string $source,
  ): this {
    $static_keyword = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['anonymous_static_keyword'],
      $position,
      $source,
    );
    $position += $static_keyword->width();
    $async_keyword = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['anonymous_async_keyword'],
      $position,
      $source,
    );
    $position += $async_keyword->width();
    $coroutine_keyword = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['anonymous_coroutine_keyword'],
      $position,
      $source,
    );
    $position += $coroutine_keyword->width();
    $function_keyword = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['anonymous_function_keyword'],
      $position,
      $source,
    );
    $position += $function_keyword->width();
    $left_paren = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['anonymous_left_paren'],
      $position,
      $source,
    );
    $position += $left_paren->width();
    $parameters = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['anonymous_parameters'],
      $position,
      $source,
    );
    $position += $parameters->width();
    $right_paren = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['anonymous_right_paren'],
      $position,
      $source,
    );
    $position += $right_paren->width();
    $colon = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['anonymous_colon'],
      $position,
      $source,
    );
    $position += $colon->width();
    $type = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['anonymous_type'],
      $position,
      $source,
    );
    $position += $type->width();
    $use = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['anonymous_use'],
      $position,
      $source,
    );
    $position += $use->width();
    $body = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['anonymous_body'],
      $position,
      $source,
    );
    $position += $body->width();
    return new self(
      $static_keyword,
      $async_keyword,
      $coroutine_keyword,
      $function_keyword,
      $left_paren,
      $parameters,
      $right_paren,
      $colon,
      $type,
      $use,
      $body,
    );
  }

  public function children(): KeyedTraversable<string, EditableSyntax> {
    yield 'static_keyword' => $this->_static_keyword;
    yield 'async_keyword' => $this->_async_keyword;
    yield 'coroutine_keyword' => $this->_coroutine_keyword;
    yield 'function_keyword' => $this->_function_keyword;
    yield 'left_paren' => $this->_left_paren;
    yield 'parameters' => $this->_parameters;
    yield 'right_paren' => $this->_right_paren;
    yield 'colon' => $this->_colon;
    yield 'type' => $this->_type;
    yield 'use' => $this->_use;
    yield 'body' => $this->_body;
  }

  public function rewrite(
    self::TRewriter $rewriter,
    ?Traversable<EditableSyntax> $parents = null,
  ): EditableSyntax {
    $parents = $parents === null ? vec[] : vec($parents);
    $child_parents = $parents;
    $child_parents[] = $this;
    $static_keyword =
      $this->_static_keyword->rewrite($rewriter, $child_parents);
    $async_keyword = $this->_async_keyword->rewrite($rewriter, $child_parents);
    $coroutine_keyword =
      $this->_coroutine_keyword->rewrite($rewriter, $child_parents);
    $function_keyword =
      $this->_function_keyword->rewrite($rewriter, $child_parents);
    $left_paren = $this->_left_paren->rewrite($rewriter, $child_parents);
    $parameters = $this->_parameters->rewrite($rewriter, $child_parents);
    $right_paren = $this->_right_paren->rewrite($rewriter, $child_parents);
    $colon = $this->_colon->rewrite($rewriter, $child_parents);
    $type = $this->_type->rewrite($rewriter, $child_parents);
    $use = $this->_use->rewrite($rewriter, $child_parents);
    $body = $this->_body->rewrite($rewriter, $child_parents);
    if (
      $static_keyword === $this->static_keyword() &&
      $async_keyword === $this->async_keyword() &&
      $coroutine_keyword === $this->coroutine_keyword() &&
      $function_keyword === $this->function_keyword() &&
      $left_paren === $this->left_paren() &&
      $parameters === $this->parameters() &&
      $right_paren === $this->right_paren() &&
      $colon === $this->colon() &&
      $type === $this->type() &&
      $use === $this->use() &&
      $body === $this->body()
    ) {
      $node = $this;
    } else {
      $node = new self(
        $static_keyword,
        $async_keyword,
        $coroutine_keyword,
        $function_keyword,
        $left_paren,
        $parameters,
        $right_paren,
        $colon,
        $type,
        $use,
        $body,
      );
    }
    return $rewriter($node, $parents);
  }

  public function static_keyword(): EditableSyntax {
    return $this->_static_keyword;
  }

  public function with_static_keyword(EditableSyntax $value): this {
    return new self(
      $value,
      $this->_async_keyword,
      $this->_coroutine_keyword,
      $this->_function_keyword,
      $this->_left_paren,
      $this->_parameters,
      $this->_right_paren,
      $this->_colon,
      $this->_type,
      $this->_use,
      $this->_body,
    );
  }

  public function async_keyword(): EditableSyntax {
    return $this->_async_keyword;
  }

  public function with_async_keyword(EditableSyntax $value): this {
    return new self(
      $this->_static_keyword,
      $value,
      $this->_coroutine_keyword,
      $this->_function_keyword,
      $this->_left_paren,
      $this->_parameters,
      $this->_right_paren,
      $this->_colon,
      $this->_type,
      $this->_use,
      $this->_body,
    );
  }

  public function coroutine_keyword(): EditableSyntax {
    return $this->_coroutine_keyword;
  }

  public function with_coroutine_keyword(EditableSyntax $value): this {
    return new self(
      $this->_static_keyword,
      $this->_async_keyword,
      $value,
      $this->_function_keyword,
      $this->_left_paren,
      $this->_parameters,
      $this->_right_paren,
      $this->_colon,
      $this->_type,
      $this->_use,
      $this->_body,
    );
  }

  public function function_keyword(): EditableSyntax {
    return $this->_function_keyword;
  }

  public function with_function_keyword(EditableSyntax $value): this {
    return new self(
      $this->_static_keyword,
      $this->_async_keyword,
      $this->_coroutine_keyword,
      $value,
      $this->_left_paren,
      $this->_parameters,
      $this->_right_paren,
      $this->_colon,
      $this->_type,
      $this->_use,
      $this->_body,
    );
  }

  public function left_paren(): EditableSyntax {
    return $this->_left_paren;
  }

  public function with_left_paren(EditableSyntax $value): this {
    return new self(
      $this->_static_keyword,
      $this->_async_keyword,
      $this->_coroutine_keyword,
      $this->_function_keyword,
      $value,
      $this->_parameters,
      $this->_right_paren,
      $this->_colon,
      $this->_type,
      $this->_use,
      $this->_body,
    );
  }

  public function parameters(): EditableSyntax {
    return $this->_parameters;
  }

  public function with_parameters(EditableSyntax $value): this {
    return new self(
      $this->_static_keyword,
      $this->_async_keyword,
      $this->_coroutine_keyword,
      $this->_function_keyword,
      $this->_left_paren,
      $value,
      $this->_right_paren,
      $this->_colon,
      $this->_type,
      $this->_use,
      $this->_body,
    );
  }

  public function right_paren(): EditableSyntax {
    return $this->_right_paren;
  }

  public function with_right_paren(EditableSyntax $value): this {
    return new self(
      $this->_static_keyword,
      $this->_async_keyword,
      $this->_coroutine_keyword,
      $this->_function_keyword,
      $this->_left_paren,
      $this->_parameters,
      $value,
      $this->_colon,
      $this->_type,
      $this->_use,
      $this->_body,
    );
  }

  public function colon(): EditableSyntax {
    return $this->_colon;
  }

  public function with_colon(EditableSyntax $value): this {
    return new self(
      $this->_static_keyword,
      $this->_async_keyword,
      $this->_coroutine_keyword,
      $this->_function_keyword,
      $this->_left_paren,
      $this->_parameters,
      $this->_right_paren,
      $value,
      $this->_type,
      $this->_use,
      $this->_body,
    );
  }

  public function type(): EditableSyntax {
    return $this->_type;
  }

  public function with_type(EditableSyntax $value): this {
    return new self(
      $this->_static_keyword,
      $this->_async_keyword,
      $this->_coroutine_keyword,
      $this->_function_keyword,
      $this->_left_paren,
      $this->_parameters,
      $this->_right_paren,
      $this->_colon,
      $value,
      $this->_use,
      $this->_body,
    );
  }

  public function use(): EditableSyntax {
    return $this->_use;
  }

  public function with_use(EditableSyntax $value): this {
    return new self(
      $this->_static_keyword,
      $this->_async_keyword,
      $this->_coroutine_keyword,
      $this->_function_keyword,
      $this->_left_paren,
      $this->_parameters,
      $this->_right_paren,
      $this->_colon,
      $this->_type,
      $value,
      $this->_body,
    );
  }

  public function body(): EditableSyntax {
    return $this->_body;
  }

  public function with_body(EditableSyntax $value): this {
    return new self(
      $this->_static_keyword,
      $this->_async_keyword,
      $this->_coroutine_keyword,
      $this->_function_keyword,
      $this->_left_paren,
      $this->_parameters,
      $this->_right_paren,
      $this->_colon,
      $this->_type,
      $this->_use,
      $value,
    );
  }
}

final class AnonymousFunctionUseClause extends EditableSyntax {

  private EditableSyntax $_keyword;
  private EditableSyntax $_left_paren;
  private EditableSyntax $_variables;
  private EditableSyntax $_right_paren;

  public function __construct(
    EditableSyntax $keyword,
    EditableSyntax $left_paren,
    EditableSyntax $variables,
    EditableSyntax $right_paren,
  ) {
    parent::__construct('anonymous_function_use_clause');
    $this->_keyword = $keyword;
    $this->_left_paren = $left_paren;
    $this->_variables = $variables;
    $this->_right_paren = $right_paren;
  }

  public static function from_json(
    array<string, mixed> $json,
    int $position,
    string $source,
  ): this {
    $keyword = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['anonymous_use_keyword'],
      $position,
      $source,
    );
    $position += $keyword->width();
    $left_paren = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['anonymous_use_left_paren'],
      $position,
      $source,
    );
    $position += $left_paren->width();
    $variables = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['anonymous_use_variables'],
      $position,
      $source,
    );
    $position += $variables->width();
    $right_paren = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['anonymous_use_right_paren'],
      $position,
      $source,
    );
    $position += $right_paren->width();
    return new self($keyword, $left_paren, $variables, $right_paren);
  }

  public function children(): KeyedTraversable<string, EditableSyntax> {
    yield 'keyword' => $this->_keyword;
    yield 'left_paren' => $this->_left_paren;
    yield 'variables' => $this->_variables;
    yield 'right_paren' => $this->_right_paren;
  }

  public function rewrite(
    self::TRewriter $rewriter,
    ?Traversable<EditableSyntax> $parents = null,
  ): EditableSyntax {
    $parents = $parents === null ? vec[] : vec($parents);
    $child_parents = $parents;
    $child_parents[] = $this;
    $keyword = $this->_keyword->rewrite($rewriter, $child_parents);
    $left_paren = $this->_left_paren->rewrite($rewriter, $child_parents);
    $variables = $this->_variables->rewrite($rewriter, $child_parents);
    $right_paren = $this->_right_paren->rewrite($rewriter, $child_parents);
    if (
      $keyword === $this->keyword() &&
      $left_paren === $this->left_paren() &&
      $variables === $this->variables() &&
      $right_paren === $this->right_paren()
    ) {
      $node = $this;
    } else {
      $node = new self($keyword, $left_paren, $variables, $right_paren);
    }
    return $rewriter($node, $parents);
  }

  public function keyword(): EditableSyntax {
    return $this->_keyword;
  }

  public function with_keyword(EditableSyntax $value): this {
    return new self(
      $value,
      $this->_left_paren,
      $this->_variables,
      $this->_right_paren,
    );
  }

  public function left_paren(): EditableSyntax {
    return $this->_left_paren;
  }

  public function with_left_paren(EditableSyntax $value): this {
    return
      new self($this->_keyword, $value, $this->_variables, $this->_right_paren);
  }

  public function variables(): EditableSyntax {
    return $this->_variables;
  }

  public function with_variables(EditableSyntax $value): this {
    return new self(
      $this->_keyword,
      $this->_left_paren,
      $value,
      $this->_right_paren,
    );
  }

  public function right_paren(): EditableSyntax {
    return $this->_right_paren;
  }

  public function with_right_paren(EditableSyntax $value): this {
    return
      new self($this->_keyword, $this->_left_paren, $this->_variables, $value);
  }
}

final class LambdaExpression extends EditableSyntax {

  private EditableSyntax $_async;
  private EditableSyntax $_coroutine;
  private EditableSyntax $_signature;
  private EditableSyntax $_arrow;
  private EditableSyntax $_body;

  public function __construct(
    EditableSyntax $async,
    EditableSyntax $coroutine,
    EditableSyntax $signature,
    EditableSyntax $arrow,
    EditableSyntax $body,
  ) {
    parent::__construct('lambda_expression');
    $this->_async = $async;
    $this->_coroutine = $coroutine;
    $this->_signature = $signature;
    $this->_arrow = $arrow;
    $this->_body = $body;
  }

  public static function from_json(
    array<string, mixed> $json,
    int $position,
    string $source,
  ): this {
    $async = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['lambda_async'],
      $position,
      $source,
    );
    $position += $async->width();
    $coroutine = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['lambda_coroutine'],
      $position,
      $source,
    );
    $position += $coroutine->width();
    $signature = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['lambda_signature'],
      $position,
      $source,
    );
    $position += $signature->width();
    $arrow = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['lambda_arrow'],
      $position,
      $source,
    );
    $position += $arrow->width();
    $body = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['lambda_body'],
      $position,
      $source,
    );
    $position += $body->width();
    return new self($async, $coroutine, $signature, $arrow, $body);
  }

  public function children(): KeyedTraversable<string, EditableSyntax> {
    yield 'async' => $this->_async;
    yield 'coroutine' => $this->_coroutine;
    yield 'signature' => $this->_signature;
    yield 'arrow' => $this->_arrow;
    yield 'body' => $this->_body;
  }

  public function rewrite(
    self::TRewriter $rewriter,
    ?Traversable<EditableSyntax> $parents = null,
  ): EditableSyntax {
    $parents = $parents === null ? vec[] : vec($parents);
    $child_parents = $parents;
    $child_parents[] = $this;
    $async = $this->_async->rewrite($rewriter, $child_parents);
    $coroutine = $this->_coroutine->rewrite($rewriter, $child_parents);
    $signature = $this->_signature->rewrite($rewriter, $child_parents);
    $arrow = $this->_arrow->rewrite($rewriter, $child_parents);
    $body = $this->_body->rewrite($rewriter, $child_parents);
    if (
      $async === $this->async() &&
      $coroutine === $this->coroutine() &&
      $signature === $this->signature() &&
      $arrow === $this->arrow() &&
      $body === $this->body()
    ) {
      $node = $this;
    } else {
      $node = new self($async, $coroutine, $signature, $arrow, $body);
    }
    return $rewriter($node, $parents);
  }

  public function async(): EditableSyntax {
    return $this->_async;
  }

  public function with_async(EditableSyntax $value): this {
    return new self(
      $value,
      $this->_coroutine,
      $this->_signature,
      $this->_arrow,
      $this->_body,
    );
  }

  public function coroutine(): EditableSyntax {
    return $this->_coroutine;
  }

  public function with_coroutine(EditableSyntax $value): this {
    return new self(
      $this->_async,
      $value,
      $this->_signature,
      $this->_arrow,
      $this->_body,
    );
  }

  public function signature(): EditableSyntax {
    return $this->_signature;
  }

  public function with_signature(EditableSyntax $value): this {
    return new self(
      $this->_async,
      $this->_coroutine,
      $value,
      $this->_arrow,
      $this->_body,
    );
  }

  public function arrow(): EditableSyntax {
    return $this->_arrow;
  }

  public function with_arrow(EditableSyntax $value): this {
    return new self(
      $this->_async,
      $this->_coroutine,
      $this->_signature,
      $value,
      $this->_body,
    );
  }

  public function body(): EditableSyntax {
    return $this->_body;
  }

  public function with_body(EditableSyntax $value): this {
    return new self(
      $this->_async,
      $this->_coroutine,
      $this->_signature,
      $this->_arrow,
      $value,
    );
  }
}

final class LambdaSignature extends EditableSyntax {

  private EditableSyntax $_left_paren;
  private EditableSyntax $_parameters;
  private EditableSyntax $_right_paren;
  private EditableSyntax $_colon;
  private EditableSyntax $_type;

  public function __construct(
    EditableSyntax $left_paren,
    EditableSyntax $parameters,
    EditableSyntax $right_paren,
    EditableSyntax $colon,
    EditableSyntax $type,
  ) {
    parent::__construct('lambda_signature');
    $this->_left_paren = $left_paren;
    $this->_parameters = $parameters;
    $this->_right_paren = $right_paren;
    $this->_colon = $colon;
    $this->_type = $type;
  }

  public static function from_json(
    array<string, mixed> $json,
    int $position,
    string $source,
  ): this {
    $left_paren = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['lambda_left_paren'],
      $position,
      $source,
    );
    $position += $left_paren->width();
    $parameters = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['lambda_parameters'],
      $position,
      $source,
    );
    $position += $parameters->width();
    $right_paren = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['lambda_right_paren'],
      $position,
      $source,
    );
    $position += $right_paren->width();
    $colon = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['lambda_colon'],
      $position,
      $source,
    );
    $position += $colon->width();
    $type = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['lambda_type'],
      $position,
      $source,
    );
    $position += $type->width();
    return new self($left_paren, $parameters, $right_paren, $colon, $type);
  }

  public function children(): KeyedTraversable<string, EditableSyntax> {
    yield 'left_paren' => $this->_left_paren;
    yield 'parameters' => $this->_parameters;
    yield 'right_paren' => $this->_right_paren;
    yield 'colon' => $this->_colon;
    yield 'type' => $this->_type;
  }

  public function rewrite(
    self::TRewriter $rewriter,
    ?Traversable<EditableSyntax> $parents = null,
  ): EditableSyntax {
    $parents = $parents === null ? vec[] : vec($parents);
    $child_parents = $parents;
    $child_parents[] = $this;
    $left_paren = $this->_left_paren->rewrite($rewriter, $child_parents);
    $parameters = $this->_parameters->rewrite($rewriter, $child_parents);
    $right_paren = $this->_right_paren->rewrite($rewriter, $child_parents);
    $colon = $this->_colon->rewrite($rewriter, $child_parents);
    $type = $this->_type->rewrite($rewriter, $child_parents);
    if (
      $left_paren === $this->left_paren() &&
      $parameters === $this->parameters() &&
      $right_paren === $this->right_paren() &&
      $colon === $this->colon() &&
      $type === $this->type()
    ) {
      $node = $this;
    } else {
      $node = new self($left_paren, $parameters, $right_paren, $colon, $type);
    }
    return $rewriter($node, $parents);
  }

  public function left_paren(): EditableSyntax {
    return $this->_left_paren;
  }

  public function with_left_paren(EditableSyntax $value): this {
    return new self(
      $value,
      $this->_parameters,
      $this->_right_paren,
      $this->_colon,
      $this->_type,
    );
  }

  public function parameters(): EditableSyntax {
    return $this->_parameters;
  }

  public function with_parameters(EditableSyntax $value): this {
    return new self(
      $this->_left_paren,
      $value,
      $this->_right_paren,
      $this->_colon,
      $this->_type,
    );
  }

  public function right_paren(): EditableSyntax {
    return $this->_right_paren;
  }

  public function with_right_paren(EditableSyntax $value): this {
    return new self(
      $this->_left_paren,
      $this->_parameters,
      $value,
      $this->_colon,
      $this->_type,
    );
  }

  public function colon(): EditableSyntax {
    return $this->_colon;
  }

  public function with_colon(EditableSyntax $value): this {
    return new self(
      $this->_left_paren,
      $this->_parameters,
      $this->_right_paren,
      $value,
      $this->_type,
    );
  }

  public function type(): EditableSyntax {
    return $this->_type;
  }

  public function with_type(EditableSyntax $value): this {
    return new self(
      $this->_left_paren,
      $this->_parameters,
      $this->_right_paren,
      $this->_colon,
      $value,
    );
  }
}

final class CastExpression extends EditableSyntax {

  private EditableSyntax $_left_paren;
  private EditableSyntax $_type;
  private EditableSyntax $_right_paren;
  private EditableSyntax $_operand;

  public function __construct(
    EditableSyntax $left_paren,
    EditableSyntax $type,
    EditableSyntax $right_paren,
    EditableSyntax $operand,
  ) {
    parent::__construct('cast_expression');
    $this->_left_paren = $left_paren;
    $this->_type = $type;
    $this->_right_paren = $right_paren;
    $this->_operand = $operand;
  }

  public static function from_json(
    array<string, mixed> $json,
    int $position,
    string $source,
  ): this {
    $left_paren = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['cast_left_paren'],
      $position,
      $source,
    );
    $position += $left_paren->width();
    $type = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['cast_type'],
      $position,
      $source,
    );
    $position += $type->width();
    $right_paren = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['cast_right_paren'],
      $position,
      $source,
    );
    $position += $right_paren->width();
    $operand = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['cast_operand'],
      $position,
      $source,
    );
    $position += $operand->width();
    return new self($left_paren, $type, $right_paren, $operand);
  }

  public function children(): KeyedTraversable<string, EditableSyntax> {
    yield 'left_paren' => $this->_left_paren;
    yield 'type' => $this->_type;
    yield 'right_paren' => $this->_right_paren;
    yield 'operand' => $this->_operand;
  }

  public function rewrite(
    self::TRewriter $rewriter,
    ?Traversable<EditableSyntax> $parents = null,
  ): EditableSyntax {
    $parents = $parents === null ? vec[] : vec($parents);
    $child_parents = $parents;
    $child_parents[] = $this;
    $left_paren = $this->_left_paren->rewrite($rewriter, $child_parents);
    $type = $this->_type->rewrite($rewriter, $child_parents);
    $right_paren = $this->_right_paren->rewrite($rewriter, $child_parents);
    $operand = $this->_operand->rewrite($rewriter, $child_parents);
    if (
      $left_paren === $this->left_paren() &&
      $type === $this->type() &&
      $right_paren === $this->right_paren() &&
      $operand === $this->operand()
    ) {
      $node = $this;
    } else {
      $node = new self($left_paren, $type, $right_paren, $operand);
    }
    return $rewriter($node, $parents);
  }

  public function left_paren(): EditableSyntax {
    return $this->_left_paren;
  }

  public function with_left_paren(EditableSyntax $value): this {
    return new self($value, $this->_type, $this->_right_paren, $this->_operand);
  }

  public function type(): EditableSyntax {
    return $this->_type;
  }

  public function with_type(EditableSyntax $value): this {
    return new self(
      $this->_left_paren,
      $value,
      $this->_right_paren,
      $this->_operand,
    );
  }

  public function right_paren(): EditableSyntax {
    return $this->_right_paren;
  }

  public function with_right_paren(EditableSyntax $value): this {
    return new self($this->_left_paren, $this->_type, $value, $this->_operand);
  }

  public function operand(): EditableSyntax {
    return $this->_operand;
  }

  public function with_operand(EditableSyntax $value): this {
    return
      new self($this->_left_paren, $this->_type, $this->_right_paren, $value);
  }
}

final class ScopeResolutionExpression extends EditableSyntax {

  private EditableSyntax $_qualifier;
  private EditableSyntax $_operator;
  private EditableSyntax $_name;

  public function __construct(
    EditableSyntax $qualifier,
    EditableSyntax $operator,
    EditableSyntax $name,
  ) {
    parent::__construct('scope_resolution_expression');
    $this->_qualifier = $qualifier;
    $this->_operator = $operator;
    $this->_name = $name;
  }

  public static function from_json(
    array<string, mixed> $json,
    int $position,
    string $source,
  ): this {
    $qualifier = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['scope_resolution_qualifier'],
      $position,
      $source,
    );
    $position += $qualifier->width();
    $operator = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['scope_resolution_operator'],
      $position,
      $source,
    );
    $position += $operator->width();
    $name = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['scope_resolution_name'],
      $position,
      $source,
    );
    $position += $name->width();
    return new self($qualifier, $operator, $name);
  }

  public function children(): KeyedTraversable<string, EditableSyntax> {
    yield 'qualifier' => $this->_qualifier;
    yield 'operator' => $this->_operator;
    yield 'name' => $this->_name;
  }

  public function rewrite(
    self::TRewriter $rewriter,
    ?Traversable<EditableSyntax> $parents = null,
  ): EditableSyntax {
    $parents = $parents === null ? vec[] : vec($parents);
    $child_parents = $parents;
    $child_parents[] = $this;
    $qualifier = $this->_qualifier->rewrite($rewriter, $child_parents);
    $operator = $this->_operator->rewrite($rewriter, $child_parents);
    $name = $this->_name->rewrite($rewriter, $child_parents);
    if (
      $qualifier === $this->qualifier() &&
      $operator === $this->operator() &&
      $name === $this->name()
    ) {
      $node = $this;
    } else {
      $node = new self($qualifier, $operator, $name);
    }
    return $rewriter($node, $parents);
  }

  public function qualifier(): EditableSyntax {
    return $this->_qualifier;
  }

  public function with_qualifier(EditableSyntax $value): this {
    return new self($value, $this->_operator, $this->_name);
  }

  public function operator(): EditableSyntax {
    return $this->_operator;
  }

  public function with_operator(EditableSyntax $value): this {
    return new self($this->_qualifier, $value, $this->_name);
  }

  public function name(): EditableSyntax {
    return $this->_name;
  }

  public function with_name(EditableSyntax $value): this {
    return new self($this->_qualifier, $this->_operator, $value);
  }
}

final class MemberSelectionExpression extends EditableSyntax {

  private EditableSyntax $_object;
  private EditableSyntax $_operator;
  private EditableSyntax $_name;

  public function __construct(
    EditableSyntax $object,
    EditableSyntax $operator,
    EditableSyntax $name,
  ) {
    parent::__construct('member_selection_expression');
    $this->_object = $object;
    $this->_operator = $operator;
    $this->_name = $name;
  }

  public static function from_json(
    array<string, mixed> $json,
    int $position,
    string $source,
  ): this {
    $object = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['member_object'],
      $position,
      $source,
    );
    $position += $object->width();
    $operator = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['member_operator'],
      $position,
      $source,
    );
    $position += $operator->width();
    $name = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['member_name'],
      $position,
      $source,
    );
    $position += $name->width();
    return new self($object, $operator, $name);
  }

  public function children(): KeyedTraversable<string, EditableSyntax> {
    yield 'object' => $this->_object;
    yield 'operator' => $this->_operator;
    yield 'name' => $this->_name;
  }

  public function rewrite(
    self::TRewriter $rewriter,
    ?Traversable<EditableSyntax> $parents = null,
  ): EditableSyntax {
    $parents = $parents === null ? vec[] : vec($parents);
    $child_parents = $parents;
    $child_parents[] = $this;
    $object = $this->_object->rewrite($rewriter, $child_parents);
    $operator = $this->_operator->rewrite($rewriter, $child_parents);
    $name = $this->_name->rewrite($rewriter, $child_parents);
    if (
      $object === $this->object() &&
      $operator === $this->operator() &&
      $name === $this->name()
    ) {
      $node = $this;
    } else {
      $node = new self($object, $operator, $name);
    }
    return $rewriter($node, $parents);
  }

  public function object(): EditableSyntax {
    return $this->_object;
  }

  public function with_object(EditableSyntax $value): this {
    return new self($value, $this->_operator, $this->_name);
  }

  public function operator(): EditableSyntax {
    return $this->_operator;
  }

  public function with_operator(EditableSyntax $value): this {
    return new self($this->_object, $value, $this->_name);
  }

  public function name(): EditableSyntax {
    return $this->_name;
  }

  public function with_name(EditableSyntax $value): this {
    return new self($this->_object, $this->_operator, $value);
  }
}

final class SafeMemberSelectionExpression extends EditableSyntax {

  private EditableSyntax $_object;
  private EditableSyntax $_operator;
  private EditableSyntax $_name;

  public function __construct(
    EditableSyntax $object,
    EditableSyntax $operator,
    EditableSyntax $name,
  ) {
    parent::__construct('safe_member_selection_expression');
    $this->_object = $object;
    $this->_operator = $operator;
    $this->_name = $name;
  }

  public static function from_json(
    array<string, mixed> $json,
    int $position,
    string $source,
  ): this {
    $object = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['safe_member_object'],
      $position,
      $source,
    );
    $position += $object->width();
    $operator = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['safe_member_operator'],
      $position,
      $source,
    );
    $position += $operator->width();
    $name = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['safe_member_name'],
      $position,
      $source,
    );
    $position += $name->width();
    return new self($object, $operator, $name);
  }

  public function children(): KeyedTraversable<string, EditableSyntax> {
    yield 'object' => $this->_object;
    yield 'operator' => $this->_operator;
    yield 'name' => $this->_name;
  }

  public function rewrite(
    self::TRewriter $rewriter,
    ?Traversable<EditableSyntax> $parents = null,
  ): EditableSyntax {
    $parents = $parents === null ? vec[] : vec($parents);
    $child_parents = $parents;
    $child_parents[] = $this;
    $object = $this->_object->rewrite($rewriter, $child_parents);
    $operator = $this->_operator->rewrite($rewriter, $child_parents);
    $name = $this->_name->rewrite($rewriter, $child_parents);
    if (
      $object === $this->object() &&
      $operator === $this->operator() &&
      $name === $this->name()
    ) {
      $node = $this;
    } else {
      $node = new self($object, $operator, $name);
    }
    return $rewriter($node, $parents);
  }

  public function object(): EditableSyntax {
    return $this->_object;
  }

  public function with_object(EditableSyntax $value): this {
    return new self($value, $this->_operator, $this->_name);
  }

  public function operator(): EditableSyntax {
    return $this->_operator;
  }

  public function with_operator(EditableSyntax $value): this {
    return new self($this->_object, $value, $this->_name);
  }

  public function name(): EditableSyntax {
    return $this->_name;
  }

  public function with_name(EditableSyntax $value): this {
    return new self($this->_object, $this->_operator, $value);
  }
}

final class EmbeddedMemberSelectionExpression extends EditableSyntax {

  private EditableSyntax $_object;
  private EditableSyntax $_operator;
  private EditableSyntax $_name;

  public function __construct(
    EditableSyntax $object,
    EditableSyntax $operator,
    EditableSyntax $name,
  ) {
    parent::__construct('embedded_member_selection_expression');
    $this->_object = $object;
    $this->_operator = $operator;
    $this->_name = $name;
  }

  public static function from_json(
    array<string, mixed> $json,
    int $position,
    string $source,
  ): this {
    $object = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['embedded_member_object'],
      $position,
      $source,
    );
    $position += $object->width();
    $operator = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['embedded_member_operator'],
      $position,
      $source,
    );
    $position += $operator->width();
    $name = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['embedded_member_name'],
      $position,
      $source,
    );
    $position += $name->width();
    return new self($object, $operator, $name);
  }

  public function children(): KeyedTraversable<string, EditableSyntax> {
    yield 'object' => $this->_object;
    yield 'operator' => $this->_operator;
    yield 'name' => $this->_name;
  }

  public function rewrite(
    self::TRewriter $rewriter,
    ?Traversable<EditableSyntax> $parents = null,
  ): EditableSyntax {
    $parents = $parents === null ? vec[] : vec($parents);
    $child_parents = $parents;
    $child_parents[] = $this;
    $object = $this->_object->rewrite($rewriter, $child_parents);
    $operator = $this->_operator->rewrite($rewriter, $child_parents);
    $name = $this->_name->rewrite($rewriter, $child_parents);
    if (
      $object === $this->object() &&
      $operator === $this->operator() &&
      $name === $this->name()
    ) {
      $node = $this;
    } else {
      $node = new self($object, $operator, $name);
    }
    return $rewriter($node, $parents);
  }

  public function object(): EditableSyntax {
    return $this->_object;
  }

  public function with_object(EditableSyntax $value): this {
    return new self($value, $this->_operator, $this->_name);
  }

  public function operator(): EditableSyntax {
    return $this->_operator;
  }

  public function with_operator(EditableSyntax $value): this {
    return new self($this->_object, $value, $this->_name);
  }

  public function name(): EditableSyntax {
    return $this->_name;
  }

  public function with_name(EditableSyntax $value): this {
    return new self($this->_object, $this->_operator, $value);
  }
}

final class YieldExpression extends EditableSyntax {

  private EditableSyntax $_keyword;
  private EditableSyntax $_operand;

  public function __construct(
    EditableSyntax $keyword,
    EditableSyntax $operand,
  ) {
    parent::__construct('yield_expression');
    $this->_keyword = $keyword;
    $this->_operand = $operand;
  }

  public static function from_json(
    array<string, mixed> $json,
    int $position,
    string $source,
  ): this {
    $keyword = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['yield_keyword'],
      $position,
      $source,
    );
    $position += $keyword->width();
    $operand = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['yield_operand'],
      $position,
      $source,
    );
    $position += $operand->width();
    return new self($keyword, $operand);
  }

  public function children(): KeyedTraversable<string, EditableSyntax> {
    yield 'keyword' => $this->_keyword;
    yield 'operand' => $this->_operand;
  }

  public function rewrite(
    self::TRewriter $rewriter,
    ?Traversable<EditableSyntax> $parents = null,
  ): EditableSyntax {
    $parents = $parents === null ? vec[] : vec($parents);
    $child_parents = $parents;
    $child_parents[] = $this;
    $keyword = $this->_keyword->rewrite($rewriter, $child_parents);
    $operand = $this->_operand->rewrite($rewriter, $child_parents);
    if ($keyword === $this->keyword() && $operand === $this->operand()) {
      $node = $this;
    } else {
      $node = new self($keyword, $operand);
    }
    return $rewriter($node, $parents);
  }

  public function keyword(): EditableSyntax {
    return $this->_keyword;
  }

  public function with_keyword(EditableSyntax $value): this {
    return new self($value, $this->_operand);
  }

  public function operand(): EditableSyntax {
    return $this->_operand;
  }

  public function with_operand(EditableSyntax $value): this {
    return new self($this->_keyword, $value);
  }
}

final class PrefixUnaryExpression extends EditableSyntax {

  private EditableSyntax $_operator;
  private EditableSyntax $_operand;

  public function __construct(
    EditableSyntax $operator,
    EditableSyntax $operand,
  ) {
    parent::__construct('prefix_unary_expression');
    $this->_operator = $operator;
    $this->_operand = $operand;
  }

  public static function from_json(
    array<string, mixed> $json,
    int $position,
    string $source,
  ): this {
    $operator = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['prefix_unary_operator'],
      $position,
      $source,
    );
    $position += $operator->width();
    $operand = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['prefix_unary_operand'],
      $position,
      $source,
    );
    $position += $operand->width();
    return new self($operator, $operand);
  }

  public function children(): KeyedTraversable<string, EditableSyntax> {
    yield 'operator' => $this->_operator;
    yield 'operand' => $this->_operand;
  }

  public function rewrite(
    self::TRewriter $rewriter,
    ?Traversable<EditableSyntax> $parents = null,
  ): EditableSyntax {
    $parents = $parents === null ? vec[] : vec($parents);
    $child_parents = $parents;
    $child_parents[] = $this;
    $operator = $this->_operator->rewrite($rewriter, $child_parents);
    $operand = $this->_operand->rewrite($rewriter, $child_parents);
    if ($operator === $this->operator() && $operand === $this->operand()) {
      $node = $this;
    } else {
      $node = new self($operator, $operand);
    }
    return $rewriter($node, $parents);
  }

  public function operator(): EditableSyntax {
    return $this->_operator;
  }

  public function with_operator(EditableSyntax $value): this {
    return new self($value, $this->_operand);
  }

  public function operand(): EditableSyntax {
    return $this->_operand;
  }

  public function with_operand(EditableSyntax $value): this {
    return new self($this->_operator, $value);
  }
}

final class PostfixUnaryExpression extends EditableSyntax {

  private EditableSyntax $_operand;
  private EditableSyntax $_operator;

  public function __construct(
    EditableSyntax $operand,
    EditableSyntax $operator,
  ) {
    parent::__construct('postfix_unary_expression');
    $this->_operand = $operand;
    $this->_operator = $operator;
  }

  public static function from_json(
    array<string, mixed> $json,
    int $position,
    string $source,
  ): this {
    $operand = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['postfix_unary_operand'],
      $position,
      $source,
    );
    $position += $operand->width();
    $operator = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['postfix_unary_operator'],
      $position,
      $source,
    );
    $position += $operator->width();
    return new self($operand, $operator);
  }

  public function children(): KeyedTraversable<string, EditableSyntax> {
    yield 'operand' => $this->_operand;
    yield 'operator' => $this->_operator;
  }

  public function rewrite(
    self::TRewriter $rewriter,
    ?Traversable<EditableSyntax> $parents = null,
  ): EditableSyntax {
    $parents = $parents === null ? vec[] : vec($parents);
    $child_parents = $parents;
    $child_parents[] = $this;
    $operand = $this->_operand->rewrite($rewriter, $child_parents);
    $operator = $this->_operator->rewrite($rewriter, $child_parents);
    if ($operand === $this->operand() && $operator === $this->operator()) {
      $node = $this;
    } else {
      $node = new self($operand, $operator);
    }
    return $rewriter($node, $parents);
  }

  public function operand(): EditableSyntax {
    return $this->_operand;
  }

  public function with_operand(EditableSyntax $value): this {
    return new self($value, $this->_operator);
  }

  public function operator(): EditableSyntax {
    return $this->_operator;
  }

  public function with_operator(EditableSyntax $value): this {
    return new self($this->_operand, $value);
  }
}

final class BinaryExpression extends EditableSyntax {

  private EditableSyntax $_left_operand;
  private EditableSyntax $_operator;
  private EditableSyntax $_right_operand;

  public function __construct(
    EditableSyntax $left_operand,
    EditableSyntax $operator,
    EditableSyntax $right_operand,
  ) {
    parent::__construct('binary_expression');
    $this->_left_operand = $left_operand;
    $this->_operator = $operator;
    $this->_right_operand = $right_operand;
  }

  public static function from_json(
    array<string, mixed> $json,
    int $position,
    string $source,
  ): this {
    $left_operand = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['binary_left_operand'],
      $position,
      $source,
    );
    $position += $left_operand->width();
    $operator = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['binary_operator'],
      $position,
      $source,
    );
    $position += $operator->width();
    $right_operand = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['binary_right_operand'],
      $position,
      $source,
    );
    $position += $right_operand->width();
    return new self($left_operand, $operator, $right_operand);
  }

  public function children(): KeyedTraversable<string, EditableSyntax> {
    yield 'left_operand' => $this->_left_operand;
    yield 'operator' => $this->_operator;
    yield 'right_operand' => $this->_right_operand;
  }

  public function rewrite(
    self::TRewriter $rewriter,
    ?Traversable<EditableSyntax> $parents = null,
  ): EditableSyntax {
    $parents = $parents === null ? vec[] : vec($parents);
    $child_parents = $parents;
    $child_parents[] = $this;
    $left_operand = $this->_left_operand->rewrite($rewriter, $child_parents);
    $operator = $this->_operator->rewrite($rewriter, $child_parents);
    $right_operand = $this->_right_operand->rewrite($rewriter, $child_parents);
    if (
      $left_operand === $this->left_operand() &&
      $operator === $this->operator() &&
      $right_operand === $this->right_operand()
    ) {
      $node = $this;
    } else {
      $node = new self($left_operand, $operator, $right_operand);
    }
    return $rewriter($node, $parents);
  }

  public function left_operand(): EditableSyntax {
    return $this->_left_operand;
  }

  public function with_left_operand(EditableSyntax $value): this {
    return new self($value, $this->_operator, $this->_right_operand);
  }

  public function operator(): EditableSyntax {
    return $this->_operator;
  }

  public function with_operator(EditableSyntax $value): this {
    return new self($this->_left_operand, $value, $this->_right_operand);
  }

  public function right_operand(): EditableSyntax {
    return $this->_right_operand;
  }

  public function with_right_operand(EditableSyntax $value): this {
    return new self($this->_left_operand, $this->_operator, $value);
  }
}

final class InstanceofExpression extends EditableSyntax {

  private EditableSyntax $_left_operand;
  private EditableSyntax $_operator;
  private EditableSyntax $_right_operand;

  public function __construct(
    EditableSyntax $left_operand,
    EditableSyntax $operator,
    EditableSyntax $right_operand,
  ) {
    parent::__construct('instanceof_expression');
    $this->_left_operand = $left_operand;
    $this->_operator = $operator;
    $this->_right_operand = $right_operand;
  }

  public static function from_json(
    array<string, mixed> $json,
    int $position,
    string $source,
  ): this {
    $left_operand = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['instanceof_left_operand'],
      $position,
      $source,
    );
    $position += $left_operand->width();
    $operator = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['instanceof_operator'],
      $position,
      $source,
    );
    $position += $operator->width();
    $right_operand = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['instanceof_right_operand'],
      $position,
      $source,
    );
    $position += $right_operand->width();
    return new self($left_operand, $operator, $right_operand);
  }

  public function children(): KeyedTraversable<string, EditableSyntax> {
    yield 'left_operand' => $this->_left_operand;
    yield 'operator' => $this->_operator;
    yield 'right_operand' => $this->_right_operand;
  }

  public function rewrite(
    self::TRewriter $rewriter,
    ?Traversable<EditableSyntax> $parents = null,
  ): EditableSyntax {
    $parents = $parents === null ? vec[] : vec($parents);
    $child_parents = $parents;
    $child_parents[] = $this;
    $left_operand = $this->_left_operand->rewrite($rewriter, $child_parents);
    $operator = $this->_operator->rewrite($rewriter, $child_parents);
    $right_operand = $this->_right_operand->rewrite($rewriter, $child_parents);
    if (
      $left_operand === $this->left_operand() &&
      $operator === $this->operator() &&
      $right_operand === $this->right_operand()
    ) {
      $node = $this;
    } else {
      $node = new self($left_operand, $operator, $right_operand);
    }
    return $rewriter($node, $parents);
  }

  public function left_operand(): EditableSyntax {
    return $this->_left_operand;
  }

  public function with_left_operand(EditableSyntax $value): this {
    return new self($value, $this->_operator, $this->_right_operand);
  }

  public function operator(): EditableSyntax {
    return $this->_operator;
  }

  public function with_operator(EditableSyntax $value): this {
    return new self($this->_left_operand, $value, $this->_right_operand);
  }

  public function right_operand(): EditableSyntax {
    return $this->_right_operand;
  }

  public function with_right_operand(EditableSyntax $value): this {
    return new self($this->_left_operand, $this->_operator, $value);
  }
}

final class ConditionalExpression extends EditableSyntax {

  private EditableSyntax $_test;
  private EditableSyntax $_question;
  private EditableSyntax $_consequence;
  private EditableSyntax $_colon;
  private EditableSyntax $_alternative;

  public function __construct(
    EditableSyntax $test,
    EditableSyntax $question,
    EditableSyntax $consequence,
    EditableSyntax $colon,
    EditableSyntax $alternative,
  ) {
    parent::__construct('conditional_expression');
    $this->_test = $test;
    $this->_question = $question;
    $this->_consequence = $consequence;
    $this->_colon = $colon;
    $this->_alternative = $alternative;
  }

  public static function from_json(
    array<string, mixed> $json,
    int $position,
    string $source,
  ): this {
    $test = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['conditional_test'],
      $position,
      $source,
    );
    $position += $test->width();
    $question = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['conditional_question'],
      $position,
      $source,
    );
    $position += $question->width();
    $consequence = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['conditional_consequence'],
      $position,
      $source,
    );
    $position += $consequence->width();
    $colon = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['conditional_colon'],
      $position,
      $source,
    );
    $position += $colon->width();
    $alternative = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['conditional_alternative'],
      $position,
      $source,
    );
    $position += $alternative->width();
    return new self($test, $question, $consequence, $colon, $alternative);
  }

  public function children(): KeyedTraversable<string, EditableSyntax> {
    yield 'test' => $this->_test;
    yield 'question' => $this->_question;
    yield 'consequence' => $this->_consequence;
    yield 'colon' => $this->_colon;
    yield 'alternative' => $this->_alternative;
  }

  public function rewrite(
    self::TRewriter $rewriter,
    ?Traversable<EditableSyntax> $parents = null,
  ): EditableSyntax {
    $parents = $parents === null ? vec[] : vec($parents);
    $child_parents = $parents;
    $child_parents[] = $this;
    $test = $this->_test->rewrite($rewriter, $child_parents);
    $question = $this->_question->rewrite($rewriter, $child_parents);
    $consequence = $this->_consequence->rewrite($rewriter, $child_parents);
    $colon = $this->_colon->rewrite($rewriter, $child_parents);
    $alternative = $this->_alternative->rewrite($rewriter, $child_parents);
    if (
      $test === $this->test() &&
      $question === $this->question() &&
      $consequence === $this->consequence() &&
      $colon === $this->colon() &&
      $alternative === $this->alternative()
    ) {
      $node = $this;
    } else {
      $node = new self($test, $question, $consequence, $colon, $alternative);
    }
    return $rewriter($node, $parents);
  }

  public function test(): EditableSyntax {
    return $this->_test;
  }

  public function with_test(EditableSyntax $value): this {
    return new self(
      $value,
      $this->_question,
      $this->_consequence,
      $this->_colon,
      $this->_alternative,
    );
  }

  public function question(): EditableSyntax {
    return $this->_question;
  }

  public function with_question(EditableSyntax $value): this {
    return new self(
      $this->_test,
      $value,
      $this->_consequence,
      $this->_colon,
      $this->_alternative,
    );
  }

  public function consequence(): EditableSyntax {
    return $this->_consequence;
  }

  public function with_consequence(EditableSyntax $value): this {
    return new self(
      $this->_test,
      $this->_question,
      $value,
      $this->_colon,
      $this->_alternative,
    );
  }

  public function colon(): EditableSyntax {
    return $this->_colon;
  }

  public function with_colon(EditableSyntax $value): this {
    return new self(
      $this->_test,
      $this->_question,
      $this->_consequence,
      $value,
      $this->_alternative,
    );
  }

  public function alternative(): EditableSyntax {
    return $this->_alternative;
  }

  public function with_alternative(EditableSyntax $value): this {
    return new self(
      $this->_test,
      $this->_question,
      $this->_consequence,
      $this->_colon,
      $value,
    );
  }
}

final class EvalExpression extends EditableSyntax {

  private EditableSyntax $_keyword;
  private EditableSyntax $_left_paren;
  private EditableSyntax $_argument;
  private EditableSyntax $_right_paren;

  public function __construct(
    EditableSyntax $keyword,
    EditableSyntax $left_paren,
    EditableSyntax $argument,
    EditableSyntax $right_paren,
  ) {
    parent::__construct('eval_expression');
    $this->_keyword = $keyword;
    $this->_left_paren = $left_paren;
    $this->_argument = $argument;
    $this->_right_paren = $right_paren;
  }

  public static function from_json(
    array<string, mixed> $json,
    int $position,
    string $source,
  ): this {
    $keyword = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['eval_keyword'],
      $position,
      $source,
    );
    $position += $keyword->width();
    $left_paren = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['eval_left_paren'],
      $position,
      $source,
    );
    $position += $left_paren->width();
    $argument = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['eval_argument'],
      $position,
      $source,
    );
    $position += $argument->width();
    $right_paren = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['eval_right_paren'],
      $position,
      $source,
    );
    $position += $right_paren->width();
    return new self($keyword, $left_paren, $argument, $right_paren);
  }

  public function children(): KeyedTraversable<string, EditableSyntax> {
    yield 'keyword' => $this->_keyword;
    yield 'left_paren' => $this->_left_paren;
    yield 'argument' => $this->_argument;
    yield 'right_paren' => $this->_right_paren;
  }

  public function rewrite(
    self::TRewriter $rewriter,
    ?Traversable<EditableSyntax> $parents = null,
  ): EditableSyntax {
    $parents = $parents === null ? vec[] : vec($parents);
    $child_parents = $parents;
    $child_parents[] = $this;
    $keyword = $this->_keyword->rewrite($rewriter, $child_parents);
    $left_paren = $this->_left_paren->rewrite($rewriter, $child_parents);
    $argument = $this->_argument->rewrite($rewriter, $child_parents);
    $right_paren = $this->_right_paren->rewrite($rewriter, $child_parents);
    if (
      $keyword === $this->keyword() &&
      $left_paren === $this->left_paren() &&
      $argument === $this->argument() &&
      $right_paren === $this->right_paren()
    ) {
      $node = $this;
    } else {
      $node = new self($keyword, $left_paren, $argument, $right_paren);
    }
    return $rewriter($node, $parents);
  }

  public function keyword(): EditableSyntax {
    return $this->_keyword;
  }

  public function with_keyword(EditableSyntax $value): this {
    return new self(
      $value,
      $this->_left_paren,
      $this->_argument,
      $this->_right_paren,
    );
  }

  public function left_paren(): EditableSyntax {
    return $this->_left_paren;
  }

  public function with_left_paren(EditableSyntax $value): this {
    return
      new self($this->_keyword, $value, $this->_argument, $this->_right_paren);
  }

  public function argument(): EditableSyntax {
    return $this->_argument;
  }

  public function with_argument(EditableSyntax $value): this {
    return new self(
      $this->_keyword,
      $this->_left_paren,
      $value,
      $this->_right_paren,
    );
  }

  public function right_paren(): EditableSyntax {
    return $this->_right_paren;
  }

  public function with_right_paren(EditableSyntax $value): this {
    return
      new self($this->_keyword, $this->_left_paren, $this->_argument, $value);
  }
}

final class EmptyExpression extends EditableSyntax {

  private EditableSyntax $_keyword;
  private EditableSyntax $_left_paren;
  private EditableSyntax $_argument;
  private EditableSyntax $_right_paren;

  public function __construct(
    EditableSyntax $keyword,
    EditableSyntax $left_paren,
    EditableSyntax $argument,
    EditableSyntax $right_paren,
  ) {
    parent::__construct('empty_expression');
    $this->_keyword = $keyword;
    $this->_left_paren = $left_paren;
    $this->_argument = $argument;
    $this->_right_paren = $right_paren;
  }

  public static function from_json(
    array<string, mixed> $json,
    int $position,
    string $source,
  ): this {
    $keyword = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['empty_keyword'],
      $position,
      $source,
    );
    $position += $keyword->width();
    $left_paren = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['empty_left_paren'],
      $position,
      $source,
    );
    $position += $left_paren->width();
    $argument = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['empty_argument'],
      $position,
      $source,
    );
    $position += $argument->width();
    $right_paren = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['empty_right_paren'],
      $position,
      $source,
    );
    $position += $right_paren->width();
    return new self($keyword, $left_paren, $argument, $right_paren);
  }

  public function children(): KeyedTraversable<string, EditableSyntax> {
    yield 'keyword' => $this->_keyword;
    yield 'left_paren' => $this->_left_paren;
    yield 'argument' => $this->_argument;
    yield 'right_paren' => $this->_right_paren;
  }

  public function rewrite(
    self::TRewriter $rewriter,
    ?Traversable<EditableSyntax> $parents = null,
  ): EditableSyntax {
    $parents = $parents === null ? vec[] : vec($parents);
    $child_parents = $parents;
    $child_parents[] = $this;
    $keyword = $this->_keyword->rewrite($rewriter, $child_parents);
    $left_paren = $this->_left_paren->rewrite($rewriter, $child_parents);
    $argument = $this->_argument->rewrite($rewriter, $child_parents);
    $right_paren = $this->_right_paren->rewrite($rewriter, $child_parents);
    if (
      $keyword === $this->keyword() &&
      $left_paren === $this->left_paren() &&
      $argument === $this->argument() &&
      $right_paren === $this->right_paren()
    ) {
      $node = $this;
    } else {
      $node = new self($keyword, $left_paren, $argument, $right_paren);
    }
    return $rewriter($node, $parents);
  }

  public function keyword(): EditableSyntax {
    return $this->_keyword;
  }

  public function with_keyword(EditableSyntax $value): this {
    return new self(
      $value,
      $this->_left_paren,
      $this->_argument,
      $this->_right_paren,
    );
  }

  public function left_paren(): EditableSyntax {
    return $this->_left_paren;
  }

  public function with_left_paren(EditableSyntax $value): this {
    return
      new self($this->_keyword, $value, $this->_argument, $this->_right_paren);
  }

  public function argument(): EditableSyntax {
    return $this->_argument;
  }

  public function with_argument(EditableSyntax $value): this {
    return new self(
      $this->_keyword,
      $this->_left_paren,
      $value,
      $this->_right_paren,
    );
  }

  public function right_paren(): EditableSyntax {
    return $this->_right_paren;
  }

  public function with_right_paren(EditableSyntax $value): this {
    return
      new self($this->_keyword, $this->_left_paren, $this->_argument, $value);
  }
}

final class DefineExpression extends EditableSyntax {

  private EditableSyntax $_keyword;
  private EditableSyntax $_left_paren;
  private EditableSyntax $_argument_list;
  private EditableSyntax $_right_paren;

  public function __construct(
    EditableSyntax $keyword,
    EditableSyntax $left_paren,
    EditableSyntax $argument_list,
    EditableSyntax $right_paren,
  ) {
    parent::__construct('define_expression');
    $this->_keyword = $keyword;
    $this->_left_paren = $left_paren;
    $this->_argument_list = $argument_list;
    $this->_right_paren = $right_paren;
  }

  public static function from_json(
    array<string, mixed> $json,
    int $position,
    string $source,
  ): this {
    $keyword = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['define_keyword'],
      $position,
      $source,
    );
    $position += $keyword->width();
    $left_paren = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['define_left_paren'],
      $position,
      $source,
    );
    $position += $left_paren->width();
    $argument_list = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['define_argument_list'],
      $position,
      $source,
    );
    $position += $argument_list->width();
    $right_paren = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['define_right_paren'],
      $position,
      $source,
    );
    $position += $right_paren->width();
    return new self($keyword, $left_paren, $argument_list, $right_paren);
  }

  public function children(): KeyedTraversable<string, EditableSyntax> {
    yield 'keyword' => $this->_keyword;
    yield 'left_paren' => $this->_left_paren;
    yield 'argument_list' => $this->_argument_list;
    yield 'right_paren' => $this->_right_paren;
  }

  public function rewrite(
    self::TRewriter $rewriter,
    ?Traversable<EditableSyntax> $parents = null,
  ): EditableSyntax {
    $parents = $parents === null ? vec[] : vec($parents);
    $child_parents = $parents;
    $child_parents[] = $this;
    $keyword = $this->_keyword->rewrite($rewriter, $child_parents);
    $left_paren = $this->_left_paren->rewrite($rewriter, $child_parents);
    $argument_list = $this->_argument_list->rewrite($rewriter, $child_parents);
    $right_paren = $this->_right_paren->rewrite($rewriter, $child_parents);
    if (
      $keyword === $this->keyword() &&
      $left_paren === $this->left_paren() &&
      $argument_list === $this->argument_list() &&
      $right_paren === $this->right_paren()
    ) {
      $node = $this;
    } else {
      $node = new self($keyword, $left_paren, $argument_list, $right_paren);
    }
    return $rewriter($node, $parents);
  }

  public function keyword(): EditableSyntax {
    return $this->_keyword;
  }

  public function with_keyword(EditableSyntax $value): this {
    return new self(
      $value,
      $this->_left_paren,
      $this->_argument_list,
      $this->_right_paren,
    );
  }

  public function left_paren(): EditableSyntax {
    return $this->_left_paren;
  }

  public function with_left_paren(EditableSyntax $value): this {
    return new self(
      $this->_keyword,
      $value,
      $this->_argument_list,
      $this->_right_paren,
    );
  }

  public function argument_list(): EditableSyntax {
    return $this->_argument_list;
  }

  public function with_argument_list(EditableSyntax $value): this {
    return new self(
      $this->_keyword,
      $this->_left_paren,
      $value,
      $this->_right_paren,
    );
  }

  public function right_paren(): EditableSyntax {
    return $this->_right_paren;
  }

  public function with_right_paren(EditableSyntax $value): this {
    return new self(
      $this->_keyword,
      $this->_left_paren,
      $this->_argument_list,
      $value,
    );
  }
}

final class IssetExpression extends EditableSyntax {

  private EditableSyntax $_keyword;
  private EditableSyntax $_left_paren;
  private EditableSyntax $_argument_list;
  private EditableSyntax $_right_paren;

  public function __construct(
    EditableSyntax $keyword,
    EditableSyntax $left_paren,
    EditableSyntax $argument_list,
    EditableSyntax $right_paren,
  ) {
    parent::__construct('isset_expression');
    $this->_keyword = $keyword;
    $this->_left_paren = $left_paren;
    $this->_argument_list = $argument_list;
    $this->_right_paren = $right_paren;
  }

  public static function from_json(
    array<string, mixed> $json,
    int $position,
    string $source,
  ): this {
    $keyword = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['isset_keyword'],
      $position,
      $source,
    );
    $position += $keyword->width();
    $left_paren = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['isset_left_paren'],
      $position,
      $source,
    );
    $position += $left_paren->width();
    $argument_list = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['isset_argument_list'],
      $position,
      $source,
    );
    $position += $argument_list->width();
    $right_paren = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['isset_right_paren'],
      $position,
      $source,
    );
    $position += $right_paren->width();
    return new self($keyword, $left_paren, $argument_list, $right_paren);
  }

  public function children(): KeyedTraversable<string, EditableSyntax> {
    yield 'keyword' => $this->_keyword;
    yield 'left_paren' => $this->_left_paren;
    yield 'argument_list' => $this->_argument_list;
    yield 'right_paren' => $this->_right_paren;
  }

  public function rewrite(
    self::TRewriter $rewriter,
    ?Traversable<EditableSyntax> $parents = null,
  ): EditableSyntax {
    $parents = $parents === null ? vec[] : vec($parents);
    $child_parents = $parents;
    $child_parents[] = $this;
    $keyword = $this->_keyword->rewrite($rewriter, $child_parents);
    $left_paren = $this->_left_paren->rewrite($rewriter, $child_parents);
    $argument_list = $this->_argument_list->rewrite($rewriter, $child_parents);
    $right_paren = $this->_right_paren->rewrite($rewriter, $child_parents);
    if (
      $keyword === $this->keyword() &&
      $left_paren === $this->left_paren() &&
      $argument_list === $this->argument_list() &&
      $right_paren === $this->right_paren()
    ) {
      $node = $this;
    } else {
      $node = new self($keyword, $left_paren, $argument_list, $right_paren);
    }
    return $rewriter($node, $parents);
  }

  public function keyword(): EditableSyntax {
    return $this->_keyword;
  }

  public function with_keyword(EditableSyntax $value): this {
    return new self(
      $value,
      $this->_left_paren,
      $this->_argument_list,
      $this->_right_paren,
    );
  }

  public function left_paren(): EditableSyntax {
    return $this->_left_paren;
  }

  public function with_left_paren(EditableSyntax $value): this {
    return new self(
      $this->_keyword,
      $value,
      $this->_argument_list,
      $this->_right_paren,
    );
  }

  public function argument_list(): EditableSyntax {
    return $this->_argument_list;
  }

  public function with_argument_list(EditableSyntax $value): this {
    return new self(
      $this->_keyword,
      $this->_left_paren,
      $value,
      $this->_right_paren,
    );
  }

  public function right_paren(): EditableSyntax {
    return $this->_right_paren;
  }

  public function with_right_paren(EditableSyntax $value): this {
    return new self(
      $this->_keyword,
      $this->_left_paren,
      $this->_argument_list,
      $value,
    );
  }
}

final class FunctionCallExpression extends EditableSyntax {

  private EditableSyntax $_receiver;
  private EditableSyntax $_left_paren;
  private EditableSyntax $_argument_list;
  private EditableSyntax $_right_paren;

  public function __construct(
    EditableSyntax $receiver,
    EditableSyntax $left_paren,
    EditableSyntax $argument_list,
    EditableSyntax $right_paren,
  ) {
    parent::__construct('function_call_expression');
    $this->_receiver = $receiver;
    $this->_left_paren = $left_paren;
    $this->_argument_list = $argument_list;
    $this->_right_paren = $right_paren;
  }

  public static function from_json(
    array<string, mixed> $json,
    int $position,
    string $source,
  ): this {
    $receiver = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['function_call_receiver'],
      $position,
      $source,
    );
    $position += $receiver->width();
    $left_paren = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['function_call_left_paren'],
      $position,
      $source,
    );
    $position += $left_paren->width();
    $argument_list = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['function_call_argument_list'],
      $position,
      $source,
    );
    $position += $argument_list->width();
    $right_paren = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['function_call_right_paren'],
      $position,
      $source,
    );
    $position += $right_paren->width();
    return new self($receiver, $left_paren, $argument_list, $right_paren);
  }

  public function children(): KeyedTraversable<string, EditableSyntax> {
    yield 'receiver' => $this->_receiver;
    yield 'left_paren' => $this->_left_paren;
    yield 'argument_list' => $this->_argument_list;
    yield 'right_paren' => $this->_right_paren;
  }

  public function rewrite(
    self::TRewriter $rewriter,
    ?Traversable<EditableSyntax> $parents = null,
  ): EditableSyntax {
    $parents = $parents === null ? vec[] : vec($parents);
    $child_parents = $parents;
    $child_parents[] = $this;
    $receiver = $this->_receiver->rewrite($rewriter, $child_parents);
    $left_paren = $this->_left_paren->rewrite($rewriter, $child_parents);
    $argument_list = $this->_argument_list->rewrite($rewriter, $child_parents);
    $right_paren = $this->_right_paren->rewrite($rewriter, $child_parents);
    if (
      $receiver === $this->receiver() &&
      $left_paren === $this->left_paren() &&
      $argument_list === $this->argument_list() &&
      $right_paren === $this->right_paren()
    ) {
      $node = $this;
    } else {
      $node = new self($receiver, $left_paren, $argument_list, $right_paren);
    }
    return $rewriter($node, $parents);
  }

  public function receiver(): EditableSyntax {
    return $this->_receiver;
  }

  public function with_receiver(EditableSyntax $value): this {
    return new self(
      $value,
      $this->_left_paren,
      $this->_argument_list,
      $this->_right_paren,
    );
  }

  public function left_paren(): EditableSyntax {
    return $this->_left_paren;
  }

  public function with_left_paren(EditableSyntax $value): this {
    return new self(
      $this->_receiver,
      $value,
      $this->_argument_list,
      $this->_right_paren,
    );
  }

  public function argument_list(): EditableSyntax {
    return $this->_argument_list;
  }

  public function with_argument_list(EditableSyntax $value): this {
    return new self(
      $this->_receiver,
      $this->_left_paren,
      $value,
      $this->_right_paren,
    );
  }

  public function right_paren(): EditableSyntax {
    return $this->_right_paren;
  }

  public function with_right_paren(EditableSyntax $value): this {
    return new self(
      $this->_receiver,
      $this->_left_paren,
      $this->_argument_list,
      $value,
    );
  }
}

final class ParenthesizedExpression extends EditableSyntax {

  private EditableSyntax $_left_paren;
  private EditableSyntax $_expression;
  private EditableSyntax $_right_paren;

  public function __construct(
    EditableSyntax $left_paren,
    EditableSyntax $expression,
    EditableSyntax $right_paren,
  ) {
    parent::__construct('parenthesized_expression');
    $this->_left_paren = $left_paren;
    $this->_expression = $expression;
    $this->_right_paren = $right_paren;
  }

  public static function from_json(
    array<string, mixed> $json,
    int $position,
    string $source,
  ): this {
    $left_paren = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['parenthesized_expression_left_paren'],
      $position,
      $source,
    );
    $position += $left_paren->width();
    $expression = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['parenthesized_expression_expression'],
      $position,
      $source,
    );
    $position += $expression->width();
    $right_paren = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['parenthesized_expression_right_paren'],
      $position,
      $source,
    );
    $position += $right_paren->width();
    return new self($left_paren, $expression, $right_paren);
  }

  public function children(): KeyedTraversable<string, EditableSyntax> {
    yield 'left_paren' => $this->_left_paren;
    yield 'expression' => $this->_expression;
    yield 'right_paren' => $this->_right_paren;
  }

  public function rewrite(
    self::TRewriter $rewriter,
    ?Traversable<EditableSyntax> $parents = null,
  ): EditableSyntax {
    $parents = $parents === null ? vec[] : vec($parents);
    $child_parents = $parents;
    $child_parents[] = $this;
    $left_paren = $this->_left_paren->rewrite($rewriter, $child_parents);
    $expression = $this->_expression->rewrite($rewriter, $child_parents);
    $right_paren = $this->_right_paren->rewrite($rewriter, $child_parents);
    if (
      $left_paren === $this->left_paren() &&
      $expression === $this->expression() &&
      $right_paren === $this->right_paren()
    ) {
      $node = $this;
    } else {
      $node = new self($left_paren, $expression, $right_paren);
    }
    return $rewriter($node, $parents);
  }

  public function left_paren(): EditableSyntax {
    return $this->_left_paren;
  }

  public function with_left_paren(EditableSyntax $value): this {
    return new self($value, $this->_expression, $this->_right_paren);
  }

  public function expression(): EditableSyntax {
    return $this->_expression;
  }

  public function with_expression(EditableSyntax $value): this {
    return new self($this->_left_paren, $value, $this->_right_paren);
  }

  public function right_paren(): EditableSyntax {
    return $this->_right_paren;
  }

  public function with_right_paren(EditableSyntax $value): this {
    return new self($this->_left_paren, $this->_expression, $value);
  }
}

final class BracedExpression extends EditableSyntax {

  private EditableSyntax $_left_brace;
  private EditableSyntax $_expression;
  private EditableSyntax $_right_brace;

  public function __construct(
    EditableSyntax $left_brace,
    EditableSyntax $expression,
    EditableSyntax $right_brace,
  ) {
    parent::__construct('braced_expression');
    $this->_left_brace = $left_brace;
    $this->_expression = $expression;
    $this->_right_brace = $right_brace;
  }

  public static function from_json(
    array<string, mixed> $json,
    int $position,
    string $source,
  ): this {
    $left_brace = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['braced_expression_left_brace'],
      $position,
      $source,
    );
    $position += $left_brace->width();
    $expression = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['braced_expression_expression'],
      $position,
      $source,
    );
    $position += $expression->width();
    $right_brace = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['braced_expression_right_brace'],
      $position,
      $source,
    );
    $position += $right_brace->width();
    return new self($left_brace, $expression, $right_brace);
  }

  public function children(): KeyedTraversable<string, EditableSyntax> {
    yield 'left_brace' => $this->_left_brace;
    yield 'expression' => $this->_expression;
    yield 'right_brace' => $this->_right_brace;
  }

  public function rewrite(
    self::TRewriter $rewriter,
    ?Traversable<EditableSyntax> $parents = null,
  ): EditableSyntax {
    $parents = $parents === null ? vec[] : vec($parents);
    $child_parents = $parents;
    $child_parents[] = $this;
    $left_brace = $this->_left_brace->rewrite($rewriter, $child_parents);
    $expression = $this->_expression->rewrite($rewriter, $child_parents);
    $right_brace = $this->_right_brace->rewrite($rewriter, $child_parents);
    if (
      $left_brace === $this->left_brace() &&
      $expression === $this->expression() &&
      $right_brace === $this->right_brace()
    ) {
      $node = $this;
    } else {
      $node = new self($left_brace, $expression, $right_brace);
    }
    return $rewriter($node, $parents);
  }

  public function left_brace(): EditableSyntax {
    return $this->_left_brace;
  }

  public function with_left_brace(EditableSyntax $value): this {
    return new self($value, $this->_expression, $this->_right_brace);
  }

  public function expression(): EditableSyntax {
    return $this->_expression;
  }

  public function with_expression(EditableSyntax $value): this {
    return new self($this->_left_brace, $value, $this->_right_brace);
  }

  public function right_brace(): EditableSyntax {
    return $this->_right_brace;
  }

  public function with_right_brace(EditableSyntax $value): this {
    return new self($this->_left_brace, $this->_expression, $value);
  }
}

final class EmbeddedBracedExpression extends EditableSyntax {

  private EditableSyntax $_left_brace;
  private EditableSyntax $_expression;
  private EditableSyntax $_right_brace;

  public function __construct(
    EditableSyntax $left_brace,
    EditableSyntax $expression,
    EditableSyntax $right_brace,
  ) {
    parent::__construct('embedded_braced_expression');
    $this->_left_brace = $left_brace;
    $this->_expression = $expression;
    $this->_right_brace = $right_brace;
  }

  public static function from_json(
    array<string, mixed> $json,
    int $position,
    string $source,
  ): this {
    $left_brace = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['embedded_braced_expression_left_brace'],
      $position,
      $source,
    );
    $position += $left_brace->width();
    $expression = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['embedded_braced_expression_expression'],
      $position,
      $source,
    );
    $position += $expression->width();
    $right_brace = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['embedded_braced_expression_right_brace'],
      $position,
      $source,
    );
    $position += $right_brace->width();
    return new self($left_brace, $expression, $right_brace);
  }

  public function children(): KeyedTraversable<string, EditableSyntax> {
    yield 'left_brace' => $this->_left_brace;
    yield 'expression' => $this->_expression;
    yield 'right_brace' => $this->_right_brace;
  }

  public function rewrite(
    self::TRewriter $rewriter,
    ?Traversable<EditableSyntax> $parents = null,
  ): EditableSyntax {
    $parents = $parents === null ? vec[] : vec($parents);
    $child_parents = $parents;
    $child_parents[] = $this;
    $left_brace = $this->_left_brace->rewrite($rewriter, $child_parents);
    $expression = $this->_expression->rewrite($rewriter, $child_parents);
    $right_brace = $this->_right_brace->rewrite($rewriter, $child_parents);
    if (
      $left_brace === $this->left_brace() &&
      $expression === $this->expression() &&
      $right_brace === $this->right_brace()
    ) {
      $node = $this;
    } else {
      $node = new self($left_brace, $expression, $right_brace);
    }
    return $rewriter($node, $parents);
  }

  public function left_brace(): EditableSyntax {
    return $this->_left_brace;
  }

  public function with_left_brace(EditableSyntax $value): this {
    return new self($value, $this->_expression, $this->_right_brace);
  }

  public function expression(): EditableSyntax {
    return $this->_expression;
  }

  public function with_expression(EditableSyntax $value): this {
    return new self($this->_left_brace, $value, $this->_right_brace);
  }

  public function right_brace(): EditableSyntax {
    return $this->_right_brace;
  }

  public function with_right_brace(EditableSyntax $value): this {
    return new self($this->_left_brace, $this->_expression, $value);
  }
}

final class ListExpression extends EditableSyntax {

  private EditableSyntax $_keyword;
  private EditableSyntax $_left_paren;
  private EditableSyntax $_members;
  private EditableSyntax $_right_paren;

  public function __construct(
    EditableSyntax $keyword,
    EditableSyntax $left_paren,
    EditableSyntax $members,
    EditableSyntax $right_paren,
  ) {
    parent::__construct('list_expression');
    $this->_keyword = $keyword;
    $this->_left_paren = $left_paren;
    $this->_members = $members;
    $this->_right_paren = $right_paren;
  }

  public static function from_json(
    array<string, mixed> $json,
    int $position,
    string $source,
  ): this {
    $keyword = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['list_keyword'],
      $position,
      $source,
    );
    $position += $keyword->width();
    $left_paren = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['list_left_paren'],
      $position,
      $source,
    );
    $position += $left_paren->width();
    $members = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['list_members'],
      $position,
      $source,
    );
    $position += $members->width();
    $right_paren = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['list_right_paren'],
      $position,
      $source,
    );
    $position += $right_paren->width();
    return new self($keyword, $left_paren, $members, $right_paren);
  }

  public function children(): KeyedTraversable<string, EditableSyntax> {
    yield 'keyword' => $this->_keyword;
    yield 'left_paren' => $this->_left_paren;
    yield 'members' => $this->_members;
    yield 'right_paren' => $this->_right_paren;
  }

  public function rewrite(
    self::TRewriter $rewriter,
    ?Traversable<EditableSyntax> $parents = null,
  ): EditableSyntax {
    $parents = $parents === null ? vec[] : vec($parents);
    $child_parents = $parents;
    $child_parents[] = $this;
    $keyword = $this->_keyword->rewrite($rewriter, $child_parents);
    $left_paren = $this->_left_paren->rewrite($rewriter, $child_parents);
    $members = $this->_members->rewrite($rewriter, $child_parents);
    $right_paren = $this->_right_paren->rewrite($rewriter, $child_parents);
    if (
      $keyword === $this->keyword() &&
      $left_paren === $this->left_paren() &&
      $members === $this->members() &&
      $right_paren === $this->right_paren()
    ) {
      $node = $this;
    } else {
      $node = new self($keyword, $left_paren, $members, $right_paren);
    }
    return $rewriter($node, $parents);
  }

  public function keyword(): EditableSyntax {
    return $this->_keyword;
  }

  public function with_keyword(EditableSyntax $value): this {
    return new self(
      $value,
      $this->_left_paren,
      $this->_members,
      $this->_right_paren,
    );
  }

  public function left_paren(): EditableSyntax {
    return $this->_left_paren;
  }

  public function with_left_paren(EditableSyntax $value): this {
    return
      new self($this->_keyword, $value, $this->_members, $this->_right_paren);
  }

  public function members(): EditableSyntax {
    return $this->_members;
  }

  public function with_members(EditableSyntax $value): this {
    return new self(
      $this->_keyword,
      $this->_left_paren,
      $value,
      $this->_right_paren,
    );
  }

  public function right_paren(): EditableSyntax {
    return $this->_right_paren;
  }

  public function with_right_paren(EditableSyntax $value): this {
    return
      new self($this->_keyword, $this->_left_paren, $this->_members, $value);
  }
}

final class CollectionLiteralExpression extends EditableSyntax {

  private EditableSyntax $_name;
  private EditableSyntax $_left_brace;
  private EditableSyntax $_initializers;
  private EditableSyntax $_right_brace;

  public function __construct(
    EditableSyntax $name,
    EditableSyntax $left_brace,
    EditableSyntax $initializers,
    EditableSyntax $right_brace,
  ) {
    parent::__construct('collection_literal_expression');
    $this->_name = $name;
    $this->_left_brace = $left_brace;
    $this->_initializers = $initializers;
    $this->_right_brace = $right_brace;
  }

  public static function from_json(
    array<string, mixed> $json,
    int $position,
    string $source,
  ): this {
    $name = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['collection_literal_name'],
      $position,
      $source,
    );
    $position += $name->width();
    $left_brace = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['collection_literal_left_brace'],
      $position,
      $source,
    );
    $position += $left_brace->width();
    $initializers = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['collection_literal_initializers'],
      $position,
      $source,
    );
    $position += $initializers->width();
    $right_brace = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['collection_literal_right_brace'],
      $position,
      $source,
    );
    $position += $right_brace->width();
    return new self($name, $left_brace, $initializers, $right_brace);
  }

  public function children(): KeyedTraversable<string, EditableSyntax> {
    yield 'name' => $this->_name;
    yield 'left_brace' => $this->_left_brace;
    yield 'initializers' => $this->_initializers;
    yield 'right_brace' => $this->_right_brace;
  }

  public function rewrite(
    self::TRewriter $rewriter,
    ?Traversable<EditableSyntax> $parents = null,
  ): EditableSyntax {
    $parents = $parents === null ? vec[] : vec($parents);
    $child_parents = $parents;
    $child_parents[] = $this;
    $name = $this->_name->rewrite($rewriter, $child_parents);
    $left_brace = $this->_left_brace->rewrite($rewriter, $child_parents);
    $initializers = $this->_initializers->rewrite($rewriter, $child_parents);
    $right_brace = $this->_right_brace->rewrite($rewriter, $child_parents);
    if (
      $name === $this->name() &&
      $left_brace === $this->left_brace() &&
      $initializers === $this->initializers() &&
      $right_brace === $this->right_brace()
    ) {
      $node = $this;
    } else {
      $node = new self($name, $left_brace, $initializers, $right_brace);
    }
    return $rewriter($node, $parents);
  }

  public function name(): EditableSyntax {
    return $this->_name;
  }

  public function with_name(EditableSyntax $value): this {
    return new self(
      $value,
      $this->_left_brace,
      $this->_initializers,
      $this->_right_brace,
    );
  }

  public function left_brace(): EditableSyntax {
    return $this->_left_brace;
  }

  public function with_left_brace(EditableSyntax $value): this {
    return
      new self($this->_name, $value, $this->_initializers, $this->_right_brace);
  }

  public function initializers(): EditableSyntax {
    return $this->_initializers;
  }

  public function with_initializers(EditableSyntax $value): this {
    return
      new self($this->_name, $this->_left_brace, $value, $this->_right_brace);
  }

  public function right_brace(): EditableSyntax {
    return $this->_right_brace;
  }

  public function with_right_brace(EditableSyntax $value): this {
    return
      new self($this->_name, $this->_left_brace, $this->_initializers, $value);
  }
}

final class ObjectCreationExpression extends EditableSyntax {

  private EditableSyntax $_new_keyword;
  private EditableSyntax $_type;
  private EditableSyntax $_left_paren;
  private EditableSyntax $_argument_list;
  private EditableSyntax $_right_paren;

  public function __construct(
    EditableSyntax $new_keyword,
    EditableSyntax $type,
    EditableSyntax $left_paren,
    EditableSyntax $argument_list,
    EditableSyntax $right_paren,
  ) {
    parent::__construct('object_creation_expression');
    $this->_new_keyword = $new_keyword;
    $this->_type = $type;
    $this->_left_paren = $left_paren;
    $this->_argument_list = $argument_list;
    $this->_right_paren = $right_paren;
  }

  public static function from_json(
    array<string, mixed> $json,
    int $position,
    string $source,
  ): this {
    $new_keyword = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['object_creation_new_keyword'],
      $position,
      $source,
    );
    $position += $new_keyword->width();
    $type = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['object_creation_type'],
      $position,
      $source,
    );
    $position += $type->width();
    $left_paren = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['object_creation_left_paren'],
      $position,
      $source,
    );
    $position += $left_paren->width();
    $argument_list = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['object_creation_argument_list'],
      $position,
      $source,
    );
    $position += $argument_list->width();
    $right_paren = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['object_creation_right_paren'],
      $position,
      $source,
    );
    $position += $right_paren->width();
    return
      new self($new_keyword, $type, $left_paren, $argument_list, $right_paren);
  }

  public function children(): KeyedTraversable<string, EditableSyntax> {
    yield 'new_keyword' => $this->_new_keyword;
    yield 'type' => $this->_type;
    yield 'left_paren' => $this->_left_paren;
    yield 'argument_list' => $this->_argument_list;
    yield 'right_paren' => $this->_right_paren;
  }

  public function rewrite(
    self::TRewriter $rewriter,
    ?Traversable<EditableSyntax> $parents = null,
  ): EditableSyntax {
    $parents = $parents === null ? vec[] : vec($parents);
    $child_parents = $parents;
    $child_parents[] = $this;
    $new_keyword = $this->_new_keyword->rewrite($rewriter, $child_parents);
    $type = $this->_type->rewrite($rewriter, $child_parents);
    $left_paren = $this->_left_paren->rewrite($rewriter, $child_parents);
    $argument_list = $this->_argument_list->rewrite($rewriter, $child_parents);
    $right_paren = $this->_right_paren->rewrite($rewriter, $child_parents);
    if (
      $new_keyword === $this->new_keyword() &&
      $type === $this->type() &&
      $left_paren === $this->left_paren() &&
      $argument_list === $this->argument_list() &&
      $right_paren === $this->right_paren()
    ) {
      $node = $this;
    } else {
      $node = new self(
        $new_keyword,
        $type,
        $left_paren,
        $argument_list,
        $right_paren,
      );
    }
    return $rewriter($node, $parents);
  }

  public function new_keyword(): EditableSyntax {
    return $this->_new_keyword;
  }

  public function with_new_keyword(EditableSyntax $value): this {
    return new self(
      $value,
      $this->_type,
      $this->_left_paren,
      $this->_argument_list,
      $this->_right_paren,
    );
  }

  public function type(): EditableSyntax {
    return $this->_type;
  }

  public function with_type(EditableSyntax $value): this {
    return new self(
      $this->_new_keyword,
      $value,
      $this->_left_paren,
      $this->_argument_list,
      $this->_right_paren,
    );
  }

  public function left_paren(): EditableSyntax {
    return $this->_left_paren;
  }

  public function with_left_paren(EditableSyntax $value): this {
    return new self(
      $this->_new_keyword,
      $this->_type,
      $value,
      $this->_argument_list,
      $this->_right_paren,
    );
  }

  public function argument_list(): EditableSyntax {
    return $this->_argument_list;
  }

  public function with_argument_list(EditableSyntax $value): this {
    return new self(
      $this->_new_keyword,
      $this->_type,
      $this->_left_paren,
      $value,
      $this->_right_paren,
    );
  }

  public function right_paren(): EditableSyntax {
    return $this->_right_paren;
  }

  public function with_right_paren(EditableSyntax $value): this {
    return new self(
      $this->_new_keyword,
      $this->_type,
      $this->_left_paren,
      $this->_argument_list,
      $value,
    );
  }
}

final class ArrayCreationExpression extends EditableSyntax {

  private EditableSyntax $_left_bracket;
  private EditableSyntax $_members;
  private EditableSyntax $_right_bracket;

  public function __construct(
    EditableSyntax $left_bracket,
    EditableSyntax $members,
    EditableSyntax $right_bracket,
  ) {
    parent::__construct('array_creation_expression');
    $this->_left_bracket = $left_bracket;
    $this->_members = $members;
    $this->_right_bracket = $right_bracket;
  }

  public static function from_json(
    array<string, mixed> $json,
    int $position,
    string $source,
  ): this {
    $left_bracket = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['array_creation_left_bracket'],
      $position,
      $source,
    );
    $position += $left_bracket->width();
    $members = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['array_creation_members'],
      $position,
      $source,
    );
    $position += $members->width();
    $right_bracket = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['array_creation_right_bracket'],
      $position,
      $source,
    );
    $position += $right_bracket->width();
    return new self($left_bracket, $members, $right_bracket);
  }

  public function children(): KeyedTraversable<string, EditableSyntax> {
    yield 'left_bracket' => $this->_left_bracket;
    yield 'members' => $this->_members;
    yield 'right_bracket' => $this->_right_bracket;
  }

  public function rewrite(
    self::TRewriter $rewriter,
    ?Traversable<EditableSyntax> $parents = null,
  ): EditableSyntax {
    $parents = $parents === null ? vec[] : vec($parents);
    $child_parents = $parents;
    $child_parents[] = $this;
    $left_bracket = $this->_left_bracket->rewrite($rewriter, $child_parents);
    $members = $this->_members->rewrite($rewriter, $child_parents);
    $right_bracket = $this->_right_bracket->rewrite($rewriter, $child_parents);
    if (
      $left_bracket === $this->left_bracket() &&
      $members === $this->members() &&
      $right_bracket === $this->right_bracket()
    ) {
      $node = $this;
    } else {
      $node = new self($left_bracket, $members, $right_bracket);
    }
    return $rewriter($node, $parents);
  }

  public function left_bracket(): EditableSyntax {
    return $this->_left_bracket;
  }

  public function with_left_bracket(EditableSyntax $value): this {
    return new self($value, $this->_members, $this->_right_bracket);
  }

  public function members(): EditableSyntax {
    return $this->_members;
  }

  public function with_members(EditableSyntax $value): this {
    return new self($this->_left_bracket, $value, $this->_right_bracket);
  }

  public function right_bracket(): EditableSyntax {
    return $this->_right_bracket;
  }

  public function with_right_bracket(EditableSyntax $value): this {
    return new self($this->_left_bracket, $this->_members, $value);
  }
}

final class ArrayIntrinsicExpression extends EditableSyntax {

  private EditableSyntax $_keyword;
  private EditableSyntax $_left_paren;
  private EditableSyntax $_members;
  private EditableSyntax $_right_paren;

  public function __construct(
    EditableSyntax $keyword,
    EditableSyntax $left_paren,
    EditableSyntax $members,
    EditableSyntax $right_paren,
  ) {
    parent::__construct('array_intrinsic_expression');
    $this->_keyword = $keyword;
    $this->_left_paren = $left_paren;
    $this->_members = $members;
    $this->_right_paren = $right_paren;
  }

  public static function from_json(
    array<string, mixed> $json,
    int $position,
    string $source,
  ): this {
    $keyword = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['array_intrinsic_keyword'],
      $position,
      $source,
    );
    $position += $keyword->width();
    $left_paren = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['array_intrinsic_left_paren'],
      $position,
      $source,
    );
    $position += $left_paren->width();
    $members = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['array_intrinsic_members'],
      $position,
      $source,
    );
    $position += $members->width();
    $right_paren = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['array_intrinsic_right_paren'],
      $position,
      $source,
    );
    $position += $right_paren->width();
    return new self($keyword, $left_paren, $members, $right_paren);
  }

  public function children(): KeyedTraversable<string, EditableSyntax> {
    yield 'keyword' => $this->_keyword;
    yield 'left_paren' => $this->_left_paren;
    yield 'members' => $this->_members;
    yield 'right_paren' => $this->_right_paren;
  }

  public function rewrite(
    self::TRewriter $rewriter,
    ?Traversable<EditableSyntax> $parents = null,
  ): EditableSyntax {
    $parents = $parents === null ? vec[] : vec($parents);
    $child_parents = $parents;
    $child_parents[] = $this;
    $keyword = $this->_keyword->rewrite($rewriter, $child_parents);
    $left_paren = $this->_left_paren->rewrite($rewriter, $child_parents);
    $members = $this->_members->rewrite($rewriter, $child_parents);
    $right_paren = $this->_right_paren->rewrite($rewriter, $child_parents);
    if (
      $keyword === $this->keyword() &&
      $left_paren === $this->left_paren() &&
      $members === $this->members() &&
      $right_paren === $this->right_paren()
    ) {
      $node = $this;
    } else {
      $node = new self($keyword, $left_paren, $members, $right_paren);
    }
    return $rewriter($node, $parents);
  }

  public function keyword(): EditableSyntax {
    return $this->_keyword;
  }

  public function with_keyword(EditableSyntax $value): this {
    return new self(
      $value,
      $this->_left_paren,
      $this->_members,
      $this->_right_paren,
    );
  }

  public function left_paren(): EditableSyntax {
    return $this->_left_paren;
  }

  public function with_left_paren(EditableSyntax $value): this {
    return
      new self($this->_keyword, $value, $this->_members, $this->_right_paren);
  }

  public function members(): EditableSyntax {
    return $this->_members;
  }

  public function with_members(EditableSyntax $value): this {
    return new self(
      $this->_keyword,
      $this->_left_paren,
      $value,
      $this->_right_paren,
    );
  }

  public function right_paren(): EditableSyntax {
    return $this->_right_paren;
  }

  public function with_right_paren(EditableSyntax $value): this {
    return
      new self($this->_keyword, $this->_left_paren, $this->_members, $value);
  }
}

final class DarrayIntrinsicExpression extends EditableSyntax {

  private EditableSyntax $_keyword;
  private EditableSyntax $_left_bracket;
  private EditableSyntax $_members;
  private EditableSyntax $_right_bracket;

  public function __construct(
    EditableSyntax $keyword,
    EditableSyntax $left_bracket,
    EditableSyntax $members,
    EditableSyntax $right_bracket,
  ) {
    parent::__construct('darray_intrinsic_expression');
    $this->_keyword = $keyword;
    $this->_left_bracket = $left_bracket;
    $this->_members = $members;
    $this->_right_bracket = $right_bracket;
  }

  public static function from_json(
    array<string, mixed> $json,
    int $position,
    string $source,
  ): this {
    $keyword = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['darray_intrinsic_keyword'],
      $position,
      $source,
    );
    $position += $keyword->width();
    $left_bracket = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['darray_intrinsic_left_bracket'],
      $position,
      $source,
    );
    $position += $left_bracket->width();
    $members = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['darray_intrinsic_members'],
      $position,
      $source,
    );
    $position += $members->width();
    $right_bracket = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['darray_intrinsic_right_bracket'],
      $position,
      $source,
    );
    $position += $right_bracket->width();
    return new self($keyword, $left_bracket, $members, $right_bracket);
  }

  public function children(): KeyedTraversable<string, EditableSyntax> {
    yield 'keyword' => $this->_keyword;
    yield 'left_bracket' => $this->_left_bracket;
    yield 'members' => $this->_members;
    yield 'right_bracket' => $this->_right_bracket;
  }

  public function rewrite(
    self::TRewriter $rewriter,
    ?Traversable<EditableSyntax> $parents = null,
  ): EditableSyntax {
    $parents = $parents === null ? vec[] : vec($parents);
    $child_parents = $parents;
    $child_parents[] = $this;
    $keyword = $this->_keyword->rewrite($rewriter, $child_parents);
    $left_bracket = $this->_left_bracket->rewrite($rewriter, $child_parents);
    $members = $this->_members->rewrite($rewriter, $child_parents);
    $right_bracket = $this->_right_bracket->rewrite($rewriter, $child_parents);
    if (
      $keyword === $this->keyword() &&
      $left_bracket === $this->left_bracket() &&
      $members === $this->members() &&
      $right_bracket === $this->right_bracket()
    ) {
      $node = $this;
    } else {
      $node = new self($keyword, $left_bracket, $members, $right_bracket);
    }
    return $rewriter($node, $parents);
  }

  public function keyword(): EditableSyntax {
    return $this->_keyword;
  }

  public function with_keyword(EditableSyntax $value): this {
    return new self(
      $value,
      $this->_left_bracket,
      $this->_members,
      $this->_right_bracket,
    );
  }

  public function left_bracket(): EditableSyntax {
    return $this->_left_bracket;
  }

  public function with_left_bracket(EditableSyntax $value): this {
    return
      new self($this->_keyword, $value, $this->_members, $this->_right_bracket);
  }

  public function members(): EditableSyntax {
    return $this->_members;
  }

  public function with_members(EditableSyntax $value): this {
    return new self(
      $this->_keyword,
      $this->_left_bracket,
      $value,
      $this->_right_bracket,
    );
  }

  public function right_bracket(): EditableSyntax {
    return $this->_right_bracket;
  }

  public function with_right_bracket(EditableSyntax $value): this {
    return
      new self($this->_keyword, $this->_left_bracket, $this->_members, $value);
  }
}

final class DictionaryIntrinsicExpression extends EditableSyntax {

  private EditableSyntax $_keyword;
  private EditableSyntax $_left_bracket;
  private EditableSyntax $_members;
  private EditableSyntax $_right_bracket;

  public function __construct(
    EditableSyntax $keyword,
    EditableSyntax $left_bracket,
    EditableSyntax $members,
    EditableSyntax $right_bracket,
  ) {
    parent::__construct('dictionary_intrinsic_expression');
    $this->_keyword = $keyword;
    $this->_left_bracket = $left_bracket;
    $this->_members = $members;
    $this->_right_bracket = $right_bracket;
  }

  public static function from_json(
    array<string, mixed> $json,
    int $position,
    string $source,
  ): this {
    $keyword = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['dictionary_intrinsic_keyword'],
      $position,
      $source,
    );
    $position += $keyword->width();
    $left_bracket = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['dictionary_intrinsic_left_bracket'],
      $position,
      $source,
    );
    $position += $left_bracket->width();
    $members = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['dictionary_intrinsic_members'],
      $position,
      $source,
    );
    $position += $members->width();
    $right_bracket = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['dictionary_intrinsic_right_bracket'],
      $position,
      $source,
    );
    $position += $right_bracket->width();
    return new self($keyword, $left_bracket, $members, $right_bracket);
  }

  public function children(): KeyedTraversable<string, EditableSyntax> {
    yield 'keyword' => $this->_keyword;
    yield 'left_bracket' => $this->_left_bracket;
    yield 'members' => $this->_members;
    yield 'right_bracket' => $this->_right_bracket;
  }

  public function rewrite(
    self::TRewriter $rewriter,
    ?Traversable<EditableSyntax> $parents = null,
  ): EditableSyntax {
    $parents = $parents === null ? vec[] : vec($parents);
    $child_parents = $parents;
    $child_parents[] = $this;
    $keyword = $this->_keyword->rewrite($rewriter, $child_parents);
    $left_bracket = $this->_left_bracket->rewrite($rewriter, $child_parents);
    $members = $this->_members->rewrite($rewriter, $child_parents);
    $right_bracket = $this->_right_bracket->rewrite($rewriter, $child_parents);
    if (
      $keyword === $this->keyword() &&
      $left_bracket === $this->left_bracket() &&
      $members === $this->members() &&
      $right_bracket === $this->right_bracket()
    ) {
      $node = $this;
    } else {
      $node = new self($keyword, $left_bracket, $members, $right_bracket);
    }
    return $rewriter($node, $parents);
  }

  public function keyword(): EditableSyntax {
    return $this->_keyword;
  }

  public function with_keyword(EditableSyntax $value): this {
    return new self(
      $value,
      $this->_left_bracket,
      $this->_members,
      $this->_right_bracket,
    );
  }

  public function left_bracket(): EditableSyntax {
    return $this->_left_bracket;
  }

  public function with_left_bracket(EditableSyntax $value): this {
    return
      new self($this->_keyword, $value, $this->_members, $this->_right_bracket);
  }

  public function members(): EditableSyntax {
    return $this->_members;
  }

  public function with_members(EditableSyntax $value): this {
    return new self(
      $this->_keyword,
      $this->_left_bracket,
      $value,
      $this->_right_bracket,
    );
  }

  public function right_bracket(): EditableSyntax {
    return $this->_right_bracket;
  }

  public function with_right_bracket(EditableSyntax $value): this {
    return
      new self($this->_keyword, $this->_left_bracket, $this->_members, $value);
  }
}

final class KeysetIntrinsicExpression extends EditableSyntax {

  private EditableSyntax $_keyword;
  private EditableSyntax $_left_bracket;
  private EditableSyntax $_members;
  private EditableSyntax $_right_bracket;

  public function __construct(
    EditableSyntax $keyword,
    EditableSyntax $left_bracket,
    EditableSyntax $members,
    EditableSyntax $right_bracket,
  ) {
    parent::__construct('keyset_intrinsic_expression');
    $this->_keyword = $keyword;
    $this->_left_bracket = $left_bracket;
    $this->_members = $members;
    $this->_right_bracket = $right_bracket;
  }

  public static function from_json(
    array<string, mixed> $json,
    int $position,
    string $source,
  ): this {
    $keyword = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['keyset_intrinsic_keyword'],
      $position,
      $source,
    );
    $position += $keyword->width();
    $left_bracket = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['keyset_intrinsic_left_bracket'],
      $position,
      $source,
    );
    $position += $left_bracket->width();
    $members = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['keyset_intrinsic_members'],
      $position,
      $source,
    );
    $position += $members->width();
    $right_bracket = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['keyset_intrinsic_right_bracket'],
      $position,
      $source,
    );
    $position += $right_bracket->width();
    return new self($keyword, $left_bracket, $members, $right_bracket);
  }

  public function children(): KeyedTraversable<string, EditableSyntax> {
    yield 'keyword' => $this->_keyword;
    yield 'left_bracket' => $this->_left_bracket;
    yield 'members' => $this->_members;
    yield 'right_bracket' => $this->_right_bracket;
  }

  public function rewrite(
    self::TRewriter $rewriter,
    ?Traversable<EditableSyntax> $parents = null,
  ): EditableSyntax {
    $parents = $parents === null ? vec[] : vec($parents);
    $child_parents = $parents;
    $child_parents[] = $this;
    $keyword = $this->_keyword->rewrite($rewriter, $child_parents);
    $left_bracket = $this->_left_bracket->rewrite($rewriter, $child_parents);
    $members = $this->_members->rewrite($rewriter, $child_parents);
    $right_bracket = $this->_right_bracket->rewrite($rewriter, $child_parents);
    if (
      $keyword === $this->keyword() &&
      $left_bracket === $this->left_bracket() &&
      $members === $this->members() &&
      $right_bracket === $this->right_bracket()
    ) {
      $node = $this;
    } else {
      $node = new self($keyword, $left_bracket, $members, $right_bracket);
    }
    return $rewriter($node, $parents);
  }

  public function keyword(): EditableSyntax {
    return $this->_keyword;
  }

  public function with_keyword(EditableSyntax $value): this {
    return new self(
      $value,
      $this->_left_bracket,
      $this->_members,
      $this->_right_bracket,
    );
  }

  public function left_bracket(): EditableSyntax {
    return $this->_left_bracket;
  }

  public function with_left_bracket(EditableSyntax $value): this {
    return
      new self($this->_keyword, $value, $this->_members, $this->_right_bracket);
  }

  public function members(): EditableSyntax {
    return $this->_members;
  }

  public function with_members(EditableSyntax $value): this {
    return new self(
      $this->_keyword,
      $this->_left_bracket,
      $value,
      $this->_right_bracket,
    );
  }

  public function right_bracket(): EditableSyntax {
    return $this->_right_bracket;
  }

  public function with_right_bracket(EditableSyntax $value): this {
    return
      new self($this->_keyword, $this->_left_bracket, $this->_members, $value);
  }
}

final class VarrayIntrinsicExpression extends EditableSyntax {

  private EditableSyntax $_keyword;
  private EditableSyntax $_left_bracket;
  private EditableSyntax $_members;
  private EditableSyntax $_right_bracket;

  public function __construct(
    EditableSyntax $keyword,
    EditableSyntax $left_bracket,
    EditableSyntax $members,
    EditableSyntax $right_bracket,
  ) {
    parent::__construct('varray_intrinsic_expression');
    $this->_keyword = $keyword;
    $this->_left_bracket = $left_bracket;
    $this->_members = $members;
    $this->_right_bracket = $right_bracket;
  }

  public static function from_json(
    array<string, mixed> $json,
    int $position,
    string $source,
  ): this {
    $keyword = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['varray_intrinsic_keyword'],
      $position,
      $source,
    );
    $position += $keyword->width();
    $left_bracket = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['varray_intrinsic_left_bracket'],
      $position,
      $source,
    );
    $position += $left_bracket->width();
    $members = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['varray_intrinsic_members'],
      $position,
      $source,
    );
    $position += $members->width();
    $right_bracket = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['varray_intrinsic_right_bracket'],
      $position,
      $source,
    );
    $position += $right_bracket->width();
    return new self($keyword, $left_bracket, $members, $right_bracket);
  }

  public function children(): KeyedTraversable<string, EditableSyntax> {
    yield 'keyword' => $this->_keyword;
    yield 'left_bracket' => $this->_left_bracket;
    yield 'members' => $this->_members;
    yield 'right_bracket' => $this->_right_bracket;
  }

  public function rewrite(
    self::TRewriter $rewriter,
    ?Traversable<EditableSyntax> $parents = null,
  ): EditableSyntax {
    $parents = $parents === null ? vec[] : vec($parents);
    $child_parents = $parents;
    $child_parents[] = $this;
    $keyword = $this->_keyword->rewrite($rewriter, $child_parents);
    $left_bracket = $this->_left_bracket->rewrite($rewriter, $child_parents);
    $members = $this->_members->rewrite($rewriter, $child_parents);
    $right_bracket = $this->_right_bracket->rewrite($rewriter, $child_parents);
    if (
      $keyword === $this->keyword() &&
      $left_bracket === $this->left_bracket() &&
      $members === $this->members() &&
      $right_bracket === $this->right_bracket()
    ) {
      $node = $this;
    } else {
      $node = new self($keyword, $left_bracket, $members, $right_bracket);
    }
    return $rewriter($node, $parents);
  }

  public function keyword(): EditableSyntax {
    return $this->_keyword;
  }

  public function with_keyword(EditableSyntax $value): this {
    return new self(
      $value,
      $this->_left_bracket,
      $this->_members,
      $this->_right_bracket,
    );
  }

  public function left_bracket(): EditableSyntax {
    return $this->_left_bracket;
  }

  public function with_left_bracket(EditableSyntax $value): this {
    return
      new self($this->_keyword, $value, $this->_members, $this->_right_bracket);
  }

  public function members(): EditableSyntax {
    return $this->_members;
  }

  public function with_members(EditableSyntax $value): this {
    return new self(
      $this->_keyword,
      $this->_left_bracket,
      $value,
      $this->_right_bracket,
    );
  }

  public function right_bracket(): EditableSyntax {
    return $this->_right_bracket;
  }

  public function with_right_bracket(EditableSyntax $value): this {
    return
      new self($this->_keyword, $this->_left_bracket, $this->_members, $value);
  }
}

final class VectorIntrinsicExpression extends EditableSyntax {

  private EditableSyntax $_keyword;
  private EditableSyntax $_left_bracket;
  private EditableSyntax $_members;
  private EditableSyntax $_right_bracket;

  public function __construct(
    EditableSyntax $keyword,
    EditableSyntax $left_bracket,
    EditableSyntax $members,
    EditableSyntax $right_bracket,
  ) {
    parent::__construct('vector_intrinsic_expression');
    $this->_keyword = $keyword;
    $this->_left_bracket = $left_bracket;
    $this->_members = $members;
    $this->_right_bracket = $right_bracket;
  }

  public static function from_json(
    array<string, mixed> $json,
    int $position,
    string $source,
  ): this {
    $keyword = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['vector_intrinsic_keyword'],
      $position,
      $source,
    );
    $position += $keyword->width();
    $left_bracket = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['vector_intrinsic_left_bracket'],
      $position,
      $source,
    );
    $position += $left_bracket->width();
    $members = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['vector_intrinsic_members'],
      $position,
      $source,
    );
    $position += $members->width();
    $right_bracket = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['vector_intrinsic_right_bracket'],
      $position,
      $source,
    );
    $position += $right_bracket->width();
    return new self($keyword, $left_bracket, $members, $right_bracket);
  }

  public function children(): KeyedTraversable<string, EditableSyntax> {
    yield 'keyword' => $this->_keyword;
    yield 'left_bracket' => $this->_left_bracket;
    yield 'members' => $this->_members;
    yield 'right_bracket' => $this->_right_bracket;
  }

  public function rewrite(
    self::TRewriter $rewriter,
    ?Traversable<EditableSyntax> $parents = null,
  ): EditableSyntax {
    $parents = $parents === null ? vec[] : vec($parents);
    $child_parents = $parents;
    $child_parents[] = $this;
    $keyword = $this->_keyword->rewrite($rewriter, $child_parents);
    $left_bracket = $this->_left_bracket->rewrite($rewriter, $child_parents);
    $members = $this->_members->rewrite($rewriter, $child_parents);
    $right_bracket = $this->_right_bracket->rewrite($rewriter, $child_parents);
    if (
      $keyword === $this->keyword() &&
      $left_bracket === $this->left_bracket() &&
      $members === $this->members() &&
      $right_bracket === $this->right_bracket()
    ) {
      $node = $this;
    } else {
      $node = new self($keyword, $left_bracket, $members, $right_bracket);
    }
    return $rewriter($node, $parents);
  }

  public function keyword(): EditableSyntax {
    return $this->_keyword;
  }

  public function with_keyword(EditableSyntax $value): this {
    return new self(
      $value,
      $this->_left_bracket,
      $this->_members,
      $this->_right_bracket,
    );
  }

  public function left_bracket(): EditableSyntax {
    return $this->_left_bracket;
  }

  public function with_left_bracket(EditableSyntax $value): this {
    return
      new self($this->_keyword, $value, $this->_members, $this->_right_bracket);
  }

  public function members(): EditableSyntax {
    return $this->_members;
  }

  public function with_members(EditableSyntax $value): this {
    return new self(
      $this->_keyword,
      $this->_left_bracket,
      $value,
      $this->_right_bracket,
    );
  }

  public function right_bracket(): EditableSyntax {
    return $this->_right_bracket;
  }

  public function with_right_bracket(EditableSyntax $value): this {
    return
      new self($this->_keyword, $this->_left_bracket, $this->_members, $value);
  }
}

final class ElementInitializer extends EditableSyntax {

  private EditableSyntax $_key;
  private EditableSyntax $_arrow;
  private EditableSyntax $_value;

  public function __construct(
    EditableSyntax $key,
    EditableSyntax $arrow,
    EditableSyntax $value,
  ) {
    parent::__construct('element_initializer');
    $this->_key = $key;
    $this->_arrow = $arrow;
    $this->_value = $value;
  }

  public static function from_json(
    array<string, mixed> $json,
    int $position,
    string $source,
  ): this {
    $key = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['element_key'],
      $position,
      $source,
    );
    $position += $key->width();
    $arrow = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['element_arrow'],
      $position,
      $source,
    );
    $position += $arrow->width();
    $value = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['element_value'],
      $position,
      $source,
    );
    $position += $value->width();
    return new self($key, $arrow, $value);
  }

  public function children(): KeyedTraversable<string, EditableSyntax> {
    yield 'key' => $this->_key;
    yield 'arrow' => $this->_arrow;
    yield 'value' => $this->_value;
  }

  public function rewrite(
    self::TRewriter $rewriter,
    ?Traversable<EditableSyntax> $parents = null,
  ): EditableSyntax {
    $parents = $parents === null ? vec[] : vec($parents);
    $child_parents = $parents;
    $child_parents[] = $this;
    $key = $this->_key->rewrite($rewriter, $child_parents);
    $arrow = $this->_arrow->rewrite($rewriter, $child_parents);
    $value = $this->_value->rewrite($rewriter, $child_parents);
    if (
      $key === $this->key() &&
      $arrow === $this->arrow() &&
      $value === $this->value()
    ) {
      $node = $this;
    } else {
      $node = new self($key, $arrow, $value);
    }
    return $rewriter($node, $parents);
  }

  public function key(): EditableSyntax {
    return $this->_key;
  }

  public function with_key(EditableSyntax $value): this {
    return new self($value, $this->_arrow, $this->_value);
  }

  public function arrow(): EditableSyntax {
    return $this->_arrow;
  }

  public function with_arrow(EditableSyntax $value): this {
    return new self($this->_key, $value, $this->_value);
  }

  public function value(): EditableSyntax {
    return $this->_value;
  }

  public function with_value(EditableSyntax $value): this {
    return new self($this->_key, $this->_arrow, $value);
  }
}

final class SubscriptExpression extends EditableSyntax {

  private EditableSyntax $_receiver;
  private EditableSyntax $_left_bracket;
  private EditableSyntax $_index;
  private EditableSyntax $_right_bracket;

  public function __construct(
    EditableSyntax $receiver,
    EditableSyntax $left_bracket,
    EditableSyntax $index,
    EditableSyntax $right_bracket,
  ) {
    parent::__construct('subscript_expression');
    $this->_receiver = $receiver;
    $this->_left_bracket = $left_bracket;
    $this->_index = $index;
    $this->_right_bracket = $right_bracket;
  }

  public static function from_json(
    array<string, mixed> $json,
    int $position,
    string $source,
  ): this {
    $receiver = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['subscript_receiver'],
      $position,
      $source,
    );
    $position += $receiver->width();
    $left_bracket = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['subscript_left_bracket'],
      $position,
      $source,
    );
    $position += $left_bracket->width();
    $index = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['subscript_index'],
      $position,
      $source,
    );
    $position += $index->width();
    $right_bracket = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['subscript_right_bracket'],
      $position,
      $source,
    );
    $position += $right_bracket->width();
    return new self($receiver, $left_bracket, $index, $right_bracket);
  }

  public function children(): KeyedTraversable<string, EditableSyntax> {
    yield 'receiver' => $this->_receiver;
    yield 'left_bracket' => $this->_left_bracket;
    yield 'index' => $this->_index;
    yield 'right_bracket' => $this->_right_bracket;
  }

  public function rewrite(
    self::TRewriter $rewriter,
    ?Traversable<EditableSyntax> $parents = null,
  ): EditableSyntax {
    $parents = $parents === null ? vec[] : vec($parents);
    $child_parents = $parents;
    $child_parents[] = $this;
    $receiver = $this->_receiver->rewrite($rewriter, $child_parents);
    $left_bracket = $this->_left_bracket->rewrite($rewriter, $child_parents);
    $index = $this->_index->rewrite($rewriter, $child_parents);
    $right_bracket = $this->_right_bracket->rewrite($rewriter, $child_parents);
    if (
      $receiver === $this->receiver() &&
      $left_bracket === $this->left_bracket() &&
      $index === $this->index() &&
      $right_bracket === $this->right_bracket()
    ) {
      $node = $this;
    } else {
      $node = new self($receiver, $left_bracket, $index, $right_bracket);
    }
    return $rewriter($node, $parents);
  }

  public function receiver(): EditableSyntax {
    return $this->_receiver;
  }

  public function with_receiver(EditableSyntax $value): this {
    return new self(
      $value,
      $this->_left_bracket,
      $this->_index,
      $this->_right_bracket,
    );
  }

  public function left_bracket(): EditableSyntax {
    return $this->_left_bracket;
  }

  public function with_left_bracket(EditableSyntax $value): this {
    return
      new self($this->_receiver, $value, $this->_index, $this->_right_bracket);
  }

  public function index(): EditableSyntax {
    return $this->_index;
  }

  public function with_index(EditableSyntax $value): this {
    return new self(
      $this->_receiver,
      $this->_left_bracket,
      $value,
      $this->_right_bracket,
    );
  }

  public function right_bracket(): EditableSyntax {
    return $this->_right_bracket;
  }

  public function with_right_bracket(EditableSyntax $value): this {
    return
      new self($this->_receiver, $this->_left_bracket, $this->_index, $value);
  }
}

final class EmbeddedSubscriptExpression extends EditableSyntax {

  private EditableSyntax $_receiver;
  private EditableSyntax $_left_bracket;
  private EditableSyntax $_index;
  private EditableSyntax $_right_bracket;

  public function __construct(
    EditableSyntax $receiver,
    EditableSyntax $left_bracket,
    EditableSyntax $index,
    EditableSyntax $right_bracket,
  ) {
    parent::__construct('embedded_subscript_expression');
    $this->_receiver = $receiver;
    $this->_left_bracket = $left_bracket;
    $this->_index = $index;
    $this->_right_bracket = $right_bracket;
  }

  public static function from_json(
    array<string, mixed> $json,
    int $position,
    string $source,
  ): this {
    $receiver = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['embedded_subscript_receiver'],
      $position,
      $source,
    );
    $position += $receiver->width();
    $left_bracket = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['embedded_subscript_left_bracket'],
      $position,
      $source,
    );
    $position += $left_bracket->width();
    $index = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['embedded_subscript_index'],
      $position,
      $source,
    );
    $position += $index->width();
    $right_bracket = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['embedded_subscript_right_bracket'],
      $position,
      $source,
    );
    $position += $right_bracket->width();
    return new self($receiver, $left_bracket, $index, $right_bracket);
  }

  public function children(): KeyedTraversable<string, EditableSyntax> {
    yield 'receiver' => $this->_receiver;
    yield 'left_bracket' => $this->_left_bracket;
    yield 'index' => $this->_index;
    yield 'right_bracket' => $this->_right_bracket;
  }

  public function rewrite(
    self::TRewriter $rewriter,
    ?Traversable<EditableSyntax> $parents = null,
  ): EditableSyntax {
    $parents = $parents === null ? vec[] : vec($parents);
    $child_parents = $parents;
    $child_parents[] = $this;
    $receiver = $this->_receiver->rewrite($rewriter, $child_parents);
    $left_bracket = $this->_left_bracket->rewrite($rewriter, $child_parents);
    $index = $this->_index->rewrite($rewriter, $child_parents);
    $right_bracket = $this->_right_bracket->rewrite($rewriter, $child_parents);
    if (
      $receiver === $this->receiver() &&
      $left_bracket === $this->left_bracket() &&
      $index === $this->index() &&
      $right_bracket === $this->right_bracket()
    ) {
      $node = $this;
    } else {
      $node = new self($receiver, $left_bracket, $index, $right_bracket);
    }
    return $rewriter($node, $parents);
  }

  public function receiver(): EditableSyntax {
    return $this->_receiver;
  }

  public function with_receiver(EditableSyntax $value): this {
    return new self(
      $value,
      $this->_left_bracket,
      $this->_index,
      $this->_right_bracket,
    );
  }

  public function left_bracket(): EditableSyntax {
    return $this->_left_bracket;
  }

  public function with_left_bracket(EditableSyntax $value): this {
    return
      new self($this->_receiver, $value, $this->_index, $this->_right_bracket);
  }

  public function index(): EditableSyntax {
    return $this->_index;
  }

  public function with_index(EditableSyntax $value): this {
    return new self(
      $this->_receiver,
      $this->_left_bracket,
      $value,
      $this->_right_bracket,
    );
  }

  public function right_bracket(): EditableSyntax {
    return $this->_right_bracket;
  }

  public function with_right_bracket(EditableSyntax $value): this {
    return
      new self($this->_receiver, $this->_left_bracket, $this->_index, $value);
  }
}

final class AwaitableCreationExpression extends EditableSyntax {

  private EditableSyntax $_async;
  private EditableSyntax $_coroutine;
  private EditableSyntax $_compound_statement;

  public function __construct(
    EditableSyntax $async,
    EditableSyntax $coroutine,
    EditableSyntax $compound_statement,
  ) {
    parent::__construct('awaitable_creation_expression');
    $this->_async = $async;
    $this->_coroutine = $coroutine;
    $this->_compound_statement = $compound_statement;
  }

  public static function from_json(
    array<string, mixed> $json,
    int $position,
    string $source,
  ): this {
    $async = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['awaitable_async'],
      $position,
      $source,
    );
    $position += $async->width();
    $coroutine = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['awaitable_coroutine'],
      $position,
      $source,
    );
    $position += $coroutine->width();
    $compound_statement = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['awaitable_compound_statement'],
      $position,
      $source,
    );
    $position += $compound_statement->width();
    return new self($async, $coroutine, $compound_statement);
  }

  public function children(): KeyedTraversable<string, EditableSyntax> {
    yield 'async' => $this->_async;
    yield 'coroutine' => $this->_coroutine;
    yield 'compound_statement' => $this->_compound_statement;
  }

  public function rewrite(
    self::TRewriter $rewriter,
    ?Traversable<EditableSyntax> $parents = null,
  ): EditableSyntax {
    $parents = $parents === null ? vec[] : vec($parents);
    $child_parents = $parents;
    $child_parents[] = $this;
    $async = $this->_async->rewrite($rewriter, $child_parents);
    $coroutine = $this->_coroutine->rewrite($rewriter, $child_parents);
    $compound_statement =
      $this->_compound_statement->rewrite($rewriter, $child_parents);
    if (
      $async === $this->async() &&
      $coroutine === $this->coroutine() &&
      $compound_statement === $this->compound_statement()
    ) {
      $node = $this;
    } else {
      $node = new self($async, $coroutine, $compound_statement);
    }
    return $rewriter($node, $parents);
  }

  public function async(): EditableSyntax {
    return $this->_async;
  }

  public function with_async(EditableSyntax $value): this {
    return new self($value, $this->_coroutine, $this->_compound_statement);
  }

  public function coroutine(): EditableSyntax {
    return $this->_coroutine;
  }

  public function with_coroutine(EditableSyntax $value): this {
    return new self($this->_async, $value, $this->_compound_statement);
  }

  public function compound_statement(): EditableSyntax {
    return $this->_compound_statement;
  }

  public function with_compound_statement(EditableSyntax $value): this {
    return new self($this->_async, $this->_coroutine, $value);
  }
}

final class XHPChildrenDeclaration extends EditableSyntax {

  private EditableSyntax $_keyword;
  private EditableSyntax $_expression;
  private EditableSyntax $_semicolon;

  public function __construct(
    EditableSyntax $keyword,
    EditableSyntax $expression,
    EditableSyntax $semicolon,
  ) {
    parent::__construct('xhp_children_declaration');
    $this->_keyword = $keyword;
    $this->_expression = $expression;
    $this->_semicolon = $semicolon;
  }

  public static function from_json(
    array<string, mixed> $json,
    int $position,
    string $source,
  ): this {
    $keyword = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['xhp_children_keyword'],
      $position,
      $source,
    );
    $position += $keyword->width();
    $expression = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['xhp_children_expression'],
      $position,
      $source,
    );
    $position += $expression->width();
    $semicolon = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['xhp_children_semicolon'],
      $position,
      $source,
    );
    $position += $semicolon->width();
    return new self($keyword, $expression, $semicolon);
  }

  public function children(): KeyedTraversable<string, EditableSyntax> {
    yield 'keyword' => $this->_keyword;
    yield 'expression' => $this->_expression;
    yield 'semicolon' => $this->_semicolon;
  }

  public function rewrite(
    self::TRewriter $rewriter,
    ?Traversable<EditableSyntax> $parents = null,
  ): EditableSyntax {
    $parents = $parents === null ? vec[] : vec($parents);
    $child_parents = $parents;
    $child_parents[] = $this;
    $keyword = $this->_keyword->rewrite($rewriter, $child_parents);
    $expression = $this->_expression->rewrite($rewriter, $child_parents);
    $semicolon = $this->_semicolon->rewrite($rewriter, $child_parents);
    if (
      $keyword === $this->keyword() &&
      $expression === $this->expression() &&
      $semicolon === $this->semicolon()
    ) {
      $node = $this;
    } else {
      $node = new self($keyword, $expression, $semicolon);
    }
    return $rewriter($node, $parents);
  }

  public function keyword(): EditableSyntax {
    return $this->_keyword;
  }

  public function with_keyword(EditableSyntax $value): this {
    return new self($value, $this->_expression, $this->_semicolon);
  }

  public function expression(): EditableSyntax {
    return $this->_expression;
  }

  public function with_expression(EditableSyntax $value): this {
    return new self($this->_keyword, $value, $this->_semicolon);
  }

  public function semicolon(): EditableSyntax {
    return $this->_semicolon;
  }

  public function with_semicolon(EditableSyntax $value): this {
    return new self($this->_keyword, $this->_expression, $value);
  }
}

final class XHPChildrenParenthesizedList extends EditableSyntax {

  private EditableSyntax $_left_paren;
  private EditableSyntax $_xhp_children;
  private EditableSyntax $_right_paren;

  public function __construct(
    EditableSyntax $left_paren,
    EditableSyntax $xhp_children,
    EditableSyntax $right_paren,
  ) {
    parent::__construct('xhp_children_parenthesized_list');
    $this->_left_paren = $left_paren;
    $this->_xhp_children = $xhp_children;
    $this->_right_paren = $right_paren;
  }

  public static function from_json(
    array<string, mixed> $json,
    int $position,
    string $source,
  ): this {
    $left_paren = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['xhp_children_list_left_paren'],
      $position,
      $source,
    );
    $position += $left_paren->width();
    $xhp_children = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['xhp_children_list_xhp_children'],
      $position,
      $source,
    );
    $position += $xhp_children->width();
    $right_paren = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['xhp_children_list_right_paren'],
      $position,
      $source,
    );
    $position += $right_paren->width();
    return new self($left_paren, $xhp_children, $right_paren);
  }

  public function children(): KeyedTraversable<string, EditableSyntax> {
    yield 'left_paren' => $this->_left_paren;
    yield 'xhp_children' => $this->_xhp_children;
    yield 'right_paren' => $this->_right_paren;
  }

  public function rewrite(
    self::TRewriter $rewriter,
    ?Traversable<EditableSyntax> $parents = null,
  ): EditableSyntax {
    $parents = $parents === null ? vec[] : vec($parents);
    $child_parents = $parents;
    $child_parents[] = $this;
    $left_paren = $this->_left_paren->rewrite($rewriter, $child_parents);
    $xhp_children = $this->_xhp_children->rewrite($rewriter, $child_parents);
    $right_paren = $this->_right_paren->rewrite($rewriter, $child_parents);
    if (
      $left_paren === $this->left_paren() &&
      $xhp_children === $this->xhp_children() &&
      $right_paren === $this->right_paren()
    ) {
      $node = $this;
    } else {
      $node = new self($left_paren, $xhp_children, $right_paren);
    }
    return $rewriter($node, $parents);
  }

  public function left_paren(): EditableSyntax {
    return $this->_left_paren;
  }

  public function with_left_paren(EditableSyntax $value): this {
    return new self($value, $this->_xhp_children, $this->_right_paren);
  }

  public function xhp_children(): EditableSyntax {
    return $this->_xhp_children;
  }

  public function with_xhp_children(EditableSyntax $value): this {
    return new self($this->_left_paren, $value, $this->_right_paren);
  }

  public function right_paren(): EditableSyntax {
    return $this->_right_paren;
  }

  public function with_right_paren(EditableSyntax $value): this {
    return new self($this->_left_paren, $this->_xhp_children, $value);
  }
}

final class XHPCategoryDeclaration extends EditableSyntax {

  private EditableSyntax $_keyword;
  private EditableSyntax $_categories;
  private EditableSyntax $_semicolon;

  public function __construct(
    EditableSyntax $keyword,
    EditableSyntax $categories,
    EditableSyntax $semicolon,
  ) {
    parent::__construct('xhp_category_declaration');
    $this->_keyword = $keyword;
    $this->_categories = $categories;
    $this->_semicolon = $semicolon;
  }

  public static function from_json(
    array<string, mixed> $json,
    int $position,
    string $source,
  ): this {
    $keyword = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['xhp_category_keyword'],
      $position,
      $source,
    );
    $position += $keyword->width();
    $categories = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['xhp_category_categories'],
      $position,
      $source,
    );
    $position += $categories->width();
    $semicolon = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['xhp_category_semicolon'],
      $position,
      $source,
    );
    $position += $semicolon->width();
    return new self($keyword, $categories, $semicolon);
  }

  public function children(): KeyedTraversable<string, EditableSyntax> {
    yield 'keyword' => $this->_keyword;
    yield 'categories' => $this->_categories;
    yield 'semicolon' => $this->_semicolon;
  }

  public function rewrite(
    self::TRewriter $rewriter,
    ?Traversable<EditableSyntax> $parents = null,
  ): EditableSyntax {
    $parents = $parents === null ? vec[] : vec($parents);
    $child_parents = $parents;
    $child_parents[] = $this;
    $keyword = $this->_keyword->rewrite($rewriter, $child_parents);
    $categories = $this->_categories->rewrite($rewriter, $child_parents);
    $semicolon = $this->_semicolon->rewrite($rewriter, $child_parents);
    if (
      $keyword === $this->keyword() &&
      $categories === $this->categories() &&
      $semicolon === $this->semicolon()
    ) {
      $node = $this;
    } else {
      $node = new self($keyword, $categories, $semicolon);
    }
    return $rewriter($node, $parents);
  }

  public function keyword(): EditableSyntax {
    return $this->_keyword;
  }

  public function with_keyword(EditableSyntax $value): this {
    return new self($value, $this->_categories, $this->_semicolon);
  }

  public function categories(): EditableSyntax {
    return $this->_categories;
  }

  public function with_categories(EditableSyntax $value): this {
    return new self($this->_keyword, $value, $this->_semicolon);
  }

  public function semicolon(): EditableSyntax {
    return $this->_semicolon;
  }

  public function with_semicolon(EditableSyntax $value): this {
    return new self($this->_keyword, $this->_categories, $value);
  }
}

final class XHPEnumType extends EditableSyntax {

  private EditableSyntax $_keyword;
  private EditableSyntax $_left_brace;
  private EditableSyntax $_values;
  private EditableSyntax $_right_brace;

  public function __construct(
    EditableSyntax $keyword,
    EditableSyntax $left_brace,
    EditableSyntax $values,
    EditableSyntax $right_brace,
  ) {
    parent::__construct('xhp_enum_type');
    $this->_keyword = $keyword;
    $this->_left_brace = $left_brace;
    $this->_values = $values;
    $this->_right_brace = $right_brace;
  }

  public static function from_json(
    array<string, mixed> $json,
    int $position,
    string $source,
  ): this {
    $keyword = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['xhp_enum_keyword'],
      $position,
      $source,
    );
    $position += $keyword->width();
    $left_brace = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['xhp_enum_left_brace'],
      $position,
      $source,
    );
    $position += $left_brace->width();
    $values = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['xhp_enum_values'],
      $position,
      $source,
    );
    $position += $values->width();
    $right_brace = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['xhp_enum_right_brace'],
      $position,
      $source,
    );
    $position += $right_brace->width();
    return new self($keyword, $left_brace, $values, $right_brace);
  }

  public function children(): KeyedTraversable<string, EditableSyntax> {
    yield 'keyword' => $this->_keyword;
    yield 'left_brace' => $this->_left_brace;
    yield 'values' => $this->_values;
    yield 'right_brace' => $this->_right_brace;
  }

  public function rewrite(
    self::TRewriter $rewriter,
    ?Traversable<EditableSyntax> $parents = null,
  ): EditableSyntax {
    $parents = $parents === null ? vec[] : vec($parents);
    $child_parents = $parents;
    $child_parents[] = $this;
    $keyword = $this->_keyword->rewrite($rewriter, $child_parents);
    $left_brace = $this->_left_brace->rewrite($rewriter, $child_parents);
    $values = $this->_values->rewrite($rewriter, $child_parents);
    $right_brace = $this->_right_brace->rewrite($rewriter, $child_parents);
    if (
      $keyword === $this->keyword() &&
      $left_brace === $this->left_brace() &&
      $values === $this->values() &&
      $right_brace === $this->right_brace()
    ) {
      $node = $this;
    } else {
      $node = new self($keyword, $left_brace, $values, $right_brace);
    }
    return $rewriter($node, $parents);
  }

  public function keyword(): EditableSyntax {
    return $this->_keyword;
  }

  public function with_keyword(EditableSyntax $value): this {
    return
      new self($value, $this->_left_brace, $this->_values, $this->_right_brace);
  }

  public function left_brace(): EditableSyntax {
    return $this->_left_brace;
  }

  public function with_left_brace(EditableSyntax $value): this {
    return
      new self($this->_keyword, $value, $this->_values, $this->_right_brace);
  }

  public function values(): EditableSyntax {
    return $this->_values;
  }

  public function with_values(EditableSyntax $value): this {
    return new self(
      $this->_keyword,
      $this->_left_brace,
      $value,
      $this->_right_brace,
    );
  }

  public function right_brace(): EditableSyntax {
    return $this->_right_brace;
  }

  public function with_right_brace(EditableSyntax $value): this {
    return
      new self($this->_keyword, $this->_left_brace, $this->_values, $value);
  }
}

final class XHPRequired extends EditableSyntax {

  private EditableSyntax $_at;
  private EditableSyntax $_keyword;

  public function __construct(EditableSyntax $at, EditableSyntax $keyword) {
    parent::__construct('xhp_required');
    $this->_at = $at;
    $this->_keyword = $keyword;
  }

  public static function from_json(
    array<string, mixed> $json,
    int $position,
    string $source,
  ): this {
    $at = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['xhp_required_at'],
      $position,
      $source,
    );
    $position += $at->width();
    $keyword = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['xhp_required_keyword'],
      $position,
      $source,
    );
    $position += $keyword->width();
    return new self($at, $keyword);
  }

  public function children(): KeyedTraversable<string, EditableSyntax> {
    yield 'at' => $this->_at;
    yield 'keyword' => $this->_keyword;
  }

  public function rewrite(
    self::TRewriter $rewriter,
    ?Traversable<EditableSyntax> $parents = null,
  ): EditableSyntax {
    $parents = $parents === null ? vec[] : vec($parents);
    $child_parents = $parents;
    $child_parents[] = $this;
    $at = $this->_at->rewrite($rewriter, $child_parents);
    $keyword = $this->_keyword->rewrite($rewriter, $child_parents);
    if ($at === $this->at() && $keyword === $this->keyword()) {
      $node = $this;
    } else {
      $node = new self($at, $keyword);
    }
    return $rewriter($node, $parents);
  }

  public function at(): EditableSyntax {
    return $this->_at;
  }

  public function with_at(EditableSyntax $value): this {
    return new self($value, $this->_keyword);
  }

  public function keyword(): EditableSyntax {
    return $this->_keyword;
  }

  public function with_keyword(EditableSyntax $value): this {
    return new self($this->_at, $value);
  }
}

final class XHPClassAttributeDeclaration extends EditableSyntax {

  private EditableSyntax $_keyword;
  private EditableSyntax $_attributes;
  private EditableSyntax $_semicolon;

  public function __construct(
    EditableSyntax $keyword,
    EditableSyntax $attributes,
    EditableSyntax $semicolon,
  ) {
    parent::__construct('xhp_class_attribute_declaration');
    $this->_keyword = $keyword;
    $this->_attributes = $attributes;
    $this->_semicolon = $semicolon;
  }

  public static function from_json(
    array<string, mixed> $json,
    int $position,
    string $source,
  ): this {
    $keyword = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['xhp_attribute_keyword'],
      $position,
      $source,
    );
    $position += $keyword->width();
    $attributes = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['xhp_attribute_attributes'],
      $position,
      $source,
    );
    $position += $attributes->width();
    $semicolon = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['xhp_attribute_semicolon'],
      $position,
      $source,
    );
    $position += $semicolon->width();
    return new self($keyword, $attributes, $semicolon);
  }

  public function children(): KeyedTraversable<string, EditableSyntax> {
    yield 'keyword' => $this->_keyword;
    yield 'attributes' => $this->_attributes;
    yield 'semicolon' => $this->_semicolon;
  }

  public function rewrite(
    self::TRewriter $rewriter,
    ?Traversable<EditableSyntax> $parents = null,
  ): EditableSyntax {
    $parents = $parents === null ? vec[] : vec($parents);
    $child_parents = $parents;
    $child_parents[] = $this;
    $keyword = $this->_keyword->rewrite($rewriter, $child_parents);
    $attributes = $this->_attributes->rewrite($rewriter, $child_parents);
    $semicolon = $this->_semicolon->rewrite($rewriter, $child_parents);
    if (
      $keyword === $this->keyword() &&
      $attributes === $this->attributes() &&
      $semicolon === $this->semicolon()
    ) {
      $node = $this;
    } else {
      $node = new self($keyword, $attributes, $semicolon);
    }
    return $rewriter($node, $parents);
  }

  public function keyword(): EditableSyntax {
    return $this->_keyword;
  }

  public function with_keyword(EditableSyntax $value): this {
    return new self($value, $this->_attributes, $this->_semicolon);
  }

  public function attributes(): EditableSyntax {
    return $this->_attributes;
  }

  public function with_attributes(EditableSyntax $value): this {
    return new self($this->_keyword, $value, $this->_semicolon);
  }

  public function semicolon(): EditableSyntax {
    return $this->_semicolon;
  }

  public function with_semicolon(EditableSyntax $value): this {
    return new self($this->_keyword, $this->_attributes, $value);
  }
}

final class XHPClassAttribute extends EditableSyntax {

  private EditableSyntax $_type;
  private EditableSyntax $_name;
  private EditableSyntax $_initializer;
  private EditableSyntax $_required;

  public function __construct(
    EditableSyntax $type,
    EditableSyntax $name,
    EditableSyntax $initializer,
    EditableSyntax $required,
  ) {
    parent::__construct('xhp_class_attribute');
    $this->_type = $type;
    $this->_name = $name;
    $this->_initializer = $initializer;
    $this->_required = $required;
  }

  public static function from_json(
    array<string, mixed> $json,
    int $position,
    string $source,
  ): this {
    $type = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['xhp_attribute_decl_type'],
      $position,
      $source,
    );
    $position += $type->width();
    $name = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['xhp_attribute_decl_name'],
      $position,
      $source,
    );
    $position += $name->width();
    $initializer = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['xhp_attribute_decl_initializer'],
      $position,
      $source,
    );
    $position += $initializer->width();
    $required = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['xhp_attribute_decl_required'],
      $position,
      $source,
    );
    $position += $required->width();
    return new self($type, $name, $initializer, $required);
  }

  public function children(): KeyedTraversable<string, EditableSyntax> {
    yield 'type' => $this->_type;
    yield 'name' => $this->_name;
    yield 'initializer' => $this->_initializer;
    yield 'required' => $this->_required;
  }

  public function rewrite(
    self::TRewriter $rewriter,
    ?Traversable<EditableSyntax> $parents = null,
  ): EditableSyntax {
    $parents = $parents === null ? vec[] : vec($parents);
    $child_parents = $parents;
    $child_parents[] = $this;
    $type = $this->_type->rewrite($rewriter, $child_parents);
    $name = $this->_name->rewrite($rewriter, $child_parents);
    $initializer = $this->_initializer->rewrite($rewriter, $child_parents);
    $required = $this->_required->rewrite($rewriter, $child_parents);
    if (
      $type === $this->type() &&
      $name === $this->name() &&
      $initializer === $this->initializer() &&
      $required === $this->required()
    ) {
      $node = $this;
    } else {
      $node = new self($type, $name, $initializer, $required);
    }
    return $rewriter($node, $parents);
  }

  public function type(): EditableSyntax {
    return $this->_type;
  }

  public function with_type(EditableSyntax $value): this {
    return
      new self($value, $this->_name, $this->_initializer, $this->_required);
  }

  public function name(): EditableSyntax {
    return $this->_name;
  }

  public function with_name(EditableSyntax $value): this {
    return
      new self($this->_type, $value, $this->_initializer, $this->_required);
  }

  public function initializer(): EditableSyntax {
    return $this->_initializer;
  }

  public function with_initializer(EditableSyntax $value): this {
    return new self($this->_type, $this->_name, $value, $this->_required);
  }

  public function required(): EditableSyntax {
    return $this->_required;
  }

  public function with_required(EditableSyntax $value): this {
    return new self($this->_type, $this->_name, $this->_initializer, $value);
  }
}

final class XHPSimpleClassAttribute extends EditableSyntax {

  private EditableSyntax $_type;

  public function __construct(EditableSyntax $type) {
    parent::__construct('xhp_simple_class_attribute');
    $this->_type = $type;
  }

  public static function from_json(
    array<string, mixed> $json,
    int $position,
    string $source,
  ): this {
    $type = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['xhp_simple_class_attribute_type'],
      $position,
      $source,
    );
    $position += $type->width();
    return new self($type);
  }

  public function children(): KeyedTraversable<string, EditableSyntax> {
    yield 'type' => $this->_type;
  }

  public function rewrite(
    self::TRewriter $rewriter,
    ?Traversable<EditableSyntax> $parents = null,
  ): EditableSyntax {
    $parents = $parents === null ? vec[] : vec($parents);
    $child_parents = $parents;
    $child_parents[] = $this;
    $type = $this->_type->rewrite($rewriter, $child_parents);
    if ($type === $this->type()) {
      $node = $this;
    } else {
      $node = new self($type);
    }
    return $rewriter($node, $parents);
  }

  public function type(): EditableSyntax {
    return $this->_type;
  }

  public function with_type(EditableSyntax $value): this {
    return new self($value);
  }
}

final class XHPAttribute extends EditableSyntax {

  private EditableSyntax $_name;
  private EditableSyntax $_equal;
  private EditableSyntax $_expression;

  public function __construct(
    EditableSyntax $name,
    EditableSyntax $equal,
    EditableSyntax $expression,
  ) {
    parent::__construct('xhp_attribute');
    $this->_name = $name;
    $this->_equal = $equal;
    $this->_expression = $expression;
  }

  public static function from_json(
    array<string, mixed> $json,
    int $position,
    string $source,
  ): this {
    $name = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['xhp_attribute_name'],
      $position,
      $source,
    );
    $position += $name->width();
    $equal = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['xhp_attribute_equal'],
      $position,
      $source,
    );
    $position += $equal->width();
    $expression = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['xhp_attribute_expression'],
      $position,
      $source,
    );
    $position += $expression->width();
    return new self($name, $equal, $expression);
  }

  public function children(): KeyedTraversable<string, EditableSyntax> {
    yield 'name' => $this->_name;
    yield 'equal' => $this->_equal;
    yield 'expression' => $this->_expression;
  }

  public function rewrite(
    self::TRewriter $rewriter,
    ?Traversable<EditableSyntax> $parents = null,
  ): EditableSyntax {
    $parents = $parents === null ? vec[] : vec($parents);
    $child_parents = $parents;
    $child_parents[] = $this;
    $name = $this->_name->rewrite($rewriter, $child_parents);
    $equal = $this->_equal->rewrite($rewriter, $child_parents);
    $expression = $this->_expression->rewrite($rewriter, $child_parents);
    if (
      $name === $this->name() &&
      $equal === $this->equal() &&
      $expression === $this->expression()
    ) {
      $node = $this;
    } else {
      $node = new self($name, $equal, $expression);
    }
    return $rewriter($node, $parents);
  }

  public function name(): EditableSyntax {
    return $this->_name;
  }

  public function with_name(EditableSyntax $value): this {
    return new self($value, $this->_equal, $this->_expression);
  }

  public function equal(): EditableSyntax {
    return $this->_equal;
  }

  public function with_equal(EditableSyntax $value): this {
    return new self($this->_name, $value, $this->_expression);
  }

  public function expression(): EditableSyntax {
    return $this->_expression;
  }

  public function with_expression(EditableSyntax $value): this {
    return new self($this->_name, $this->_equal, $value);
  }
}

final class XHPOpen extends EditableSyntax {

  private EditableSyntax $_left_angle;
  private EditableSyntax $_name;
  private EditableSyntax $_attributes;
  private EditableSyntax $_right_angle;

  public function __construct(
    EditableSyntax $left_angle,
    EditableSyntax $name,
    EditableSyntax $attributes,
    EditableSyntax $right_angle,
  ) {
    parent::__construct('xhp_open');
    $this->_left_angle = $left_angle;
    $this->_name = $name;
    $this->_attributes = $attributes;
    $this->_right_angle = $right_angle;
  }

  public static function from_json(
    array<string, mixed> $json,
    int $position,
    string $source,
  ): this {
    $left_angle = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['xhp_open_left_angle'],
      $position,
      $source,
    );
    $position += $left_angle->width();
    $name = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['xhp_open_name'],
      $position,
      $source,
    );
    $position += $name->width();
    $attributes = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['xhp_open_attributes'],
      $position,
      $source,
    );
    $position += $attributes->width();
    $right_angle = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['xhp_open_right_angle'],
      $position,
      $source,
    );
    $position += $right_angle->width();
    return new self($left_angle, $name, $attributes, $right_angle);
  }

  public function children(): KeyedTraversable<string, EditableSyntax> {
    yield 'left_angle' => $this->_left_angle;
    yield 'name' => $this->_name;
    yield 'attributes' => $this->_attributes;
    yield 'right_angle' => $this->_right_angle;
  }

  public function rewrite(
    self::TRewriter $rewriter,
    ?Traversable<EditableSyntax> $parents = null,
  ): EditableSyntax {
    $parents = $parents === null ? vec[] : vec($parents);
    $child_parents = $parents;
    $child_parents[] = $this;
    $left_angle = $this->_left_angle->rewrite($rewriter, $child_parents);
    $name = $this->_name->rewrite($rewriter, $child_parents);
    $attributes = $this->_attributes->rewrite($rewriter, $child_parents);
    $right_angle = $this->_right_angle->rewrite($rewriter, $child_parents);
    if (
      $left_angle === $this->left_angle() &&
      $name === $this->name() &&
      $attributes === $this->attributes() &&
      $right_angle === $this->right_angle()
    ) {
      $node = $this;
    } else {
      $node = new self($left_angle, $name, $attributes, $right_angle);
    }
    return $rewriter($node, $parents);
  }

  public function left_angle(): EditableSyntax {
    return $this->_left_angle;
  }

  public function with_left_angle(EditableSyntax $value): this {
    return
      new self($value, $this->_name, $this->_attributes, $this->_right_angle);
  }

  public function name(): EditableSyntax {
    return $this->_name;
  }

  public function with_name(EditableSyntax $value): this {
    return new self(
      $this->_left_angle,
      $value,
      $this->_attributes,
      $this->_right_angle,
    );
  }

  public function attributes(): EditableSyntax {
    return $this->_attributes;
  }

  public function with_attributes(EditableSyntax $value): this {
    return
      new self($this->_left_angle, $this->_name, $value, $this->_right_angle);
  }

  public function right_angle(): EditableSyntax {
    return $this->_right_angle;
  }

  public function with_right_angle(EditableSyntax $value): this {
    return
      new self($this->_left_angle, $this->_name, $this->_attributes, $value);
  }
}

final class XHPExpression extends EditableSyntax {

  private EditableSyntax $_open;
  private EditableSyntax $_body;
  private EditableSyntax $_close;

  public function __construct(
    EditableSyntax $open,
    EditableSyntax $body,
    EditableSyntax $close,
  ) {
    parent::__construct('xhp_expression');
    $this->_open = $open;
    $this->_body = $body;
    $this->_close = $close;
  }

  public static function from_json(
    array<string, mixed> $json,
    int $position,
    string $source,
  ): this {
    $open = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['xhp_open'],
      $position,
      $source,
    );
    $position += $open->width();
    $body = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['xhp_body'],
      $position,
      $source,
    );
    $position += $body->width();
    $close = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['xhp_close'],
      $position,
      $source,
    );
    $position += $close->width();
    return new self($open, $body, $close);
  }

  public function children(): KeyedTraversable<string, EditableSyntax> {
    yield 'open' => $this->_open;
    yield 'body' => $this->_body;
    yield 'close' => $this->_close;
  }

  public function rewrite(
    self::TRewriter $rewriter,
    ?Traversable<EditableSyntax> $parents = null,
  ): EditableSyntax {
    $parents = $parents === null ? vec[] : vec($parents);
    $child_parents = $parents;
    $child_parents[] = $this;
    $open = $this->_open->rewrite($rewriter, $child_parents);
    $body = $this->_body->rewrite($rewriter, $child_parents);
    $close = $this->_close->rewrite($rewriter, $child_parents);
    if (
      $open === $this->open() &&
      $body === $this->body() &&
      $close === $this->close()
    ) {
      $node = $this;
    } else {
      $node = new self($open, $body, $close);
    }
    return $rewriter($node, $parents);
  }

  public function open(): EditableSyntax {
    return $this->_open;
  }

  public function with_open(EditableSyntax $value): this {
    return new self($value, $this->_body, $this->_close);
  }

  public function body(): EditableSyntax {
    return $this->_body;
  }

  public function with_body(EditableSyntax $value): this {
    return new self($this->_open, $value, $this->_close);
  }

  public function close(): EditableSyntax {
    return $this->_close;
  }

  public function with_close(EditableSyntax $value): this {
    return new self($this->_open, $this->_body, $value);
  }
}

final class XHPClose extends EditableSyntax {

  private EditableSyntax $_left_angle;
  private EditableSyntax $_name;
  private EditableSyntax $_right_angle;

  public function __construct(
    EditableSyntax $left_angle,
    EditableSyntax $name,
    EditableSyntax $right_angle,
  ) {
    parent::__construct('xhp_close');
    $this->_left_angle = $left_angle;
    $this->_name = $name;
    $this->_right_angle = $right_angle;
  }

  public static function from_json(
    array<string, mixed> $json,
    int $position,
    string $source,
  ): this {
    $left_angle = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['xhp_close_left_angle'],
      $position,
      $source,
    );
    $position += $left_angle->width();
    $name = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['xhp_close_name'],
      $position,
      $source,
    );
    $position += $name->width();
    $right_angle = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['xhp_close_right_angle'],
      $position,
      $source,
    );
    $position += $right_angle->width();
    return new self($left_angle, $name, $right_angle);
  }

  public function children(): KeyedTraversable<string, EditableSyntax> {
    yield 'left_angle' => $this->_left_angle;
    yield 'name' => $this->_name;
    yield 'right_angle' => $this->_right_angle;
  }

  public function rewrite(
    self::TRewriter $rewriter,
    ?Traversable<EditableSyntax> $parents = null,
  ): EditableSyntax {
    $parents = $parents === null ? vec[] : vec($parents);
    $child_parents = $parents;
    $child_parents[] = $this;
    $left_angle = $this->_left_angle->rewrite($rewriter, $child_parents);
    $name = $this->_name->rewrite($rewriter, $child_parents);
    $right_angle = $this->_right_angle->rewrite($rewriter, $child_parents);
    if (
      $left_angle === $this->left_angle() &&
      $name === $this->name() &&
      $right_angle === $this->right_angle()
    ) {
      $node = $this;
    } else {
      $node = new self($left_angle, $name, $right_angle);
    }
    return $rewriter($node, $parents);
  }

  public function left_angle(): EditableSyntax {
    return $this->_left_angle;
  }

  public function with_left_angle(EditableSyntax $value): this {
    return new self($value, $this->_name, $this->_right_angle);
  }

  public function name(): EditableSyntax {
    return $this->_name;
  }

  public function with_name(EditableSyntax $value): this {
    return new self($this->_left_angle, $value, $this->_right_angle);
  }

  public function right_angle(): EditableSyntax {
    return $this->_right_angle;
  }

  public function with_right_angle(EditableSyntax $value): this {
    return new self($this->_left_angle, $this->_name, $value);
  }
}

final class TypeConstant extends EditableSyntax {

  private EditableSyntax $_left_type;
  private EditableSyntax $_separator;
  private EditableSyntax $_right_type;

  public function __construct(
    EditableSyntax $left_type,
    EditableSyntax $separator,
    EditableSyntax $right_type,
  ) {
    parent::__construct('type_constant');
    $this->_left_type = $left_type;
    $this->_separator = $separator;
    $this->_right_type = $right_type;
  }

  public static function from_json(
    array<string, mixed> $json,
    int $position,
    string $source,
  ): this {
    $left_type = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['type_constant_left_type'],
      $position,
      $source,
    );
    $position += $left_type->width();
    $separator = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['type_constant_separator'],
      $position,
      $source,
    );
    $position += $separator->width();
    $right_type = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['type_constant_right_type'],
      $position,
      $source,
    );
    $position += $right_type->width();
    return new self($left_type, $separator, $right_type);
  }

  public function children(): KeyedTraversable<string, EditableSyntax> {
    yield 'left_type' => $this->_left_type;
    yield 'separator' => $this->_separator;
    yield 'right_type' => $this->_right_type;
  }

  public function rewrite(
    self::TRewriter $rewriter,
    ?Traversable<EditableSyntax> $parents = null,
  ): EditableSyntax {
    $parents = $parents === null ? vec[] : vec($parents);
    $child_parents = $parents;
    $child_parents[] = $this;
    $left_type = $this->_left_type->rewrite($rewriter, $child_parents);
    $separator = $this->_separator->rewrite($rewriter, $child_parents);
    $right_type = $this->_right_type->rewrite($rewriter, $child_parents);
    if (
      $left_type === $this->left_type() &&
      $separator === $this->separator() &&
      $right_type === $this->right_type()
    ) {
      $node = $this;
    } else {
      $node = new self($left_type, $separator, $right_type);
    }
    return $rewriter($node, $parents);
  }

  public function left_type(): EditableSyntax {
    return $this->_left_type;
  }

  public function with_left_type(EditableSyntax $value): this {
    return new self($value, $this->_separator, $this->_right_type);
  }

  public function separator(): EditableSyntax {
    return $this->_separator;
  }

  public function with_separator(EditableSyntax $value): this {
    return new self($this->_left_type, $value, $this->_right_type);
  }

  public function right_type(): EditableSyntax {
    return $this->_right_type;
  }

  public function with_right_type(EditableSyntax $value): this {
    return new self($this->_left_type, $this->_separator, $value);
  }
}

final class VectorTypeSpecifier extends EditableSyntax {

  private EditableSyntax $_keyword;
  private EditableSyntax $_left_angle;
  private EditableSyntax $_type;
  private EditableSyntax $_trailing_comma;
  private EditableSyntax $_right_angle;

  public function __construct(
    EditableSyntax $keyword,
    EditableSyntax $left_angle,
    EditableSyntax $type,
    EditableSyntax $trailing_comma,
    EditableSyntax $right_angle,
  ) {
    parent::__construct('vector_type_specifier');
    $this->_keyword = $keyword;
    $this->_left_angle = $left_angle;
    $this->_type = $type;
    $this->_trailing_comma = $trailing_comma;
    $this->_right_angle = $right_angle;
  }

  public static function from_json(
    array<string, mixed> $json,
    int $position,
    string $source,
  ): this {
    $keyword = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['vector_type_keyword'],
      $position,
      $source,
    );
    $position += $keyword->width();
    $left_angle = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['vector_type_left_angle'],
      $position,
      $source,
    );
    $position += $left_angle->width();
    $type = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['vector_type_type'],
      $position,
      $source,
    );
    $position += $type->width();
    $trailing_comma = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['vector_type_trailing_comma'],
      $position,
      $source,
    );
    $position += $trailing_comma->width();
    $right_angle = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['vector_type_right_angle'],
      $position,
      $source,
    );
    $position += $right_angle->width();
    return
      new self($keyword, $left_angle, $type, $trailing_comma, $right_angle);
  }

  public function children(): KeyedTraversable<string, EditableSyntax> {
    yield 'keyword' => $this->_keyword;
    yield 'left_angle' => $this->_left_angle;
    yield 'type' => $this->_type;
    yield 'trailing_comma' => $this->_trailing_comma;
    yield 'right_angle' => $this->_right_angle;
  }

  public function rewrite(
    self::TRewriter $rewriter,
    ?Traversable<EditableSyntax> $parents = null,
  ): EditableSyntax {
    $parents = $parents === null ? vec[] : vec($parents);
    $child_parents = $parents;
    $child_parents[] = $this;
    $keyword = $this->_keyword->rewrite($rewriter, $child_parents);
    $left_angle = $this->_left_angle->rewrite($rewriter, $child_parents);
    $type = $this->_type->rewrite($rewriter, $child_parents);
    $trailing_comma =
      $this->_trailing_comma->rewrite($rewriter, $child_parents);
    $right_angle = $this->_right_angle->rewrite($rewriter, $child_parents);
    if (
      $keyword === $this->keyword() &&
      $left_angle === $this->left_angle() &&
      $type === $this->type() &&
      $trailing_comma === $this->trailing_comma() &&
      $right_angle === $this->right_angle()
    ) {
      $node = $this;
    } else {
      $node =
        new self($keyword, $left_angle, $type, $trailing_comma, $right_angle);
    }
    return $rewriter($node, $parents);
  }

  public function keyword(): EditableSyntax {
    return $this->_keyword;
  }

  public function with_keyword(EditableSyntax $value): this {
    return new self(
      $value,
      $this->_left_angle,
      $this->_type,
      $this->_trailing_comma,
      $this->_right_angle,
    );
  }

  public function left_angle(): EditableSyntax {
    return $this->_left_angle;
  }

  public function with_left_angle(EditableSyntax $value): this {
    return new self(
      $this->_keyword,
      $value,
      $this->_type,
      $this->_trailing_comma,
      $this->_right_angle,
    );
  }

  public function type(): EditableSyntax {
    return $this->_type;
  }

  public function with_type(EditableSyntax $value): this {
    return new self(
      $this->_keyword,
      $this->_left_angle,
      $value,
      $this->_trailing_comma,
      $this->_right_angle,
    );
  }

  public function trailing_comma(): EditableSyntax {
    return $this->_trailing_comma;
  }

  public function with_trailing_comma(EditableSyntax $value): this {
    return new self(
      $this->_keyword,
      $this->_left_angle,
      $this->_type,
      $value,
      $this->_right_angle,
    );
  }

  public function right_angle(): EditableSyntax {
    return $this->_right_angle;
  }

  public function with_right_angle(EditableSyntax $value): this {
    return new self(
      $this->_keyword,
      $this->_left_angle,
      $this->_type,
      $this->_trailing_comma,
      $value,
    );
  }
}

final class KeysetTypeSpecifier extends EditableSyntax {

  private EditableSyntax $_keyword;
  private EditableSyntax $_left_angle;
  private EditableSyntax $_type;
  private EditableSyntax $_trailing_comma;
  private EditableSyntax $_right_angle;

  public function __construct(
    EditableSyntax $keyword,
    EditableSyntax $left_angle,
    EditableSyntax $type,
    EditableSyntax $trailing_comma,
    EditableSyntax $right_angle,
  ) {
    parent::__construct('keyset_type_specifier');
    $this->_keyword = $keyword;
    $this->_left_angle = $left_angle;
    $this->_type = $type;
    $this->_trailing_comma = $trailing_comma;
    $this->_right_angle = $right_angle;
  }

  public static function from_json(
    array<string, mixed> $json,
    int $position,
    string $source,
  ): this {
    $keyword = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['keyset_type_keyword'],
      $position,
      $source,
    );
    $position += $keyword->width();
    $left_angle = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['keyset_type_left_angle'],
      $position,
      $source,
    );
    $position += $left_angle->width();
    $type = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['keyset_type_type'],
      $position,
      $source,
    );
    $position += $type->width();
    $trailing_comma = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['keyset_type_trailing_comma'],
      $position,
      $source,
    );
    $position += $trailing_comma->width();
    $right_angle = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['keyset_type_right_angle'],
      $position,
      $source,
    );
    $position += $right_angle->width();
    return
      new self($keyword, $left_angle, $type, $trailing_comma, $right_angle);
  }

  public function children(): KeyedTraversable<string, EditableSyntax> {
    yield 'keyword' => $this->_keyword;
    yield 'left_angle' => $this->_left_angle;
    yield 'type' => $this->_type;
    yield 'trailing_comma' => $this->_trailing_comma;
    yield 'right_angle' => $this->_right_angle;
  }

  public function rewrite(
    self::TRewriter $rewriter,
    ?Traversable<EditableSyntax> $parents = null,
  ): EditableSyntax {
    $parents = $parents === null ? vec[] : vec($parents);
    $child_parents = $parents;
    $child_parents[] = $this;
    $keyword = $this->_keyword->rewrite($rewriter, $child_parents);
    $left_angle = $this->_left_angle->rewrite($rewriter, $child_parents);
    $type = $this->_type->rewrite($rewriter, $child_parents);
    $trailing_comma =
      $this->_trailing_comma->rewrite($rewriter, $child_parents);
    $right_angle = $this->_right_angle->rewrite($rewriter, $child_parents);
    if (
      $keyword === $this->keyword() &&
      $left_angle === $this->left_angle() &&
      $type === $this->type() &&
      $trailing_comma === $this->trailing_comma() &&
      $right_angle === $this->right_angle()
    ) {
      $node = $this;
    } else {
      $node =
        new self($keyword, $left_angle, $type, $trailing_comma, $right_angle);
    }
    return $rewriter($node, $parents);
  }

  public function keyword(): EditableSyntax {
    return $this->_keyword;
  }

  public function with_keyword(EditableSyntax $value): this {
    return new self(
      $value,
      $this->_left_angle,
      $this->_type,
      $this->_trailing_comma,
      $this->_right_angle,
    );
  }

  public function left_angle(): EditableSyntax {
    return $this->_left_angle;
  }

  public function with_left_angle(EditableSyntax $value): this {
    return new self(
      $this->_keyword,
      $value,
      $this->_type,
      $this->_trailing_comma,
      $this->_right_angle,
    );
  }

  public function type(): EditableSyntax {
    return $this->_type;
  }

  public function with_type(EditableSyntax $value): this {
    return new self(
      $this->_keyword,
      $this->_left_angle,
      $value,
      $this->_trailing_comma,
      $this->_right_angle,
    );
  }

  public function trailing_comma(): EditableSyntax {
    return $this->_trailing_comma;
  }

  public function with_trailing_comma(EditableSyntax $value): this {
    return new self(
      $this->_keyword,
      $this->_left_angle,
      $this->_type,
      $value,
      $this->_right_angle,
    );
  }

  public function right_angle(): EditableSyntax {
    return $this->_right_angle;
  }

  public function with_right_angle(EditableSyntax $value): this {
    return new self(
      $this->_keyword,
      $this->_left_angle,
      $this->_type,
      $this->_trailing_comma,
      $value,
    );
  }
}

final class TupleTypeExplicitSpecifier extends EditableSyntax {

  private EditableSyntax $_keyword;
  private EditableSyntax $_left_angle;
  private EditableSyntax $_types;
  private EditableSyntax $_right_angle;

  public function __construct(
    EditableSyntax $keyword,
    EditableSyntax $left_angle,
    EditableSyntax $types,
    EditableSyntax $right_angle,
  ) {
    parent::__construct('tuple_type_explicit_specifier');
    $this->_keyword = $keyword;
    $this->_left_angle = $left_angle;
    $this->_types = $types;
    $this->_right_angle = $right_angle;
  }

  public static function from_json(
    array<string, mixed> $json,
    int $position,
    string $source,
  ): this {
    $keyword = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['tuple_type_keyword'],
      $position,
      $source,
    );
    $position += $keyword->width();
    $left_angle = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['tuple_type_left_angle'],
      $position,
      $source,
    );
    $position += $left_angle->width();
    $types = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['tuple_type_types'],
      $position,
      $source,
    );
    $position += $types->width();
    $right_angle = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['tuple_type_right_angle'],
      $position,
      $source,
    );
    $position += $right_angle->width();
    return new self($keyword, $left_angle, $types, $right_angle);
  }

  public function children(): KeyedTraversable<string, EditableSyntax> {
    yield 'keyword' => $this->_keyword;
    yield 'left_angle' => $this->_left_angle;
    yield 'types' => $this->_types;
    yield 'right_angle' => $this->_right_angle;
  }

  public function rewrite(
    self::TRewriter $rewriter,
    ?Traversable<EditableSyntax> $parents = null,
  ): EditableSyntax {
    $parents = $parents === null ? vec[] : vec($parents);
    $child_parents = $parents;
    $child_parents[] = $this;
    $keyword = $this->_keyword->rewrite($rewriter, $child_parents);
    $left_angle = $this->_left_angle->rewrite($rewriter, $child_parents);
    $types = $this->_types->rewrite($rewriter, $child_parents);
    $right_angle = $this->_right_angle->rewrite($rewriter, $child_parents);
    if (
      $keyword === $this->keyword() &&
      $left_angle === $this->left_angle() &&
      $types === $this->types() &&
      $right_angle === $this->right_angle()
    ) {
      $node = $this;
    } else {
      $node = new self($keyword, $left_angle, $types, $right_angle);
    }
    return $rewriter($node, $parents);
  }

  public function keyword(): EditableSyntax {
    return $this->_keyword;
  }

  public function with_keyword(EditableSyntax $value): this {
    return
      new self($value, $this->_left_angle, $this->_types, $this->_right_angle);
  }

  public function left_angle(): EditableSyntax {
    return $this->_left_angle;
  }

  public function with_left_angle(EditableSyntax $value): this {
    return
      new self($this->_keyword, $value, $this->_types, $this->_right_angle);
  }

  public function types(): EditableSyntax {
    return $this->_types;
  }

  public function with_types(EditableSyntax $value): this {
    return new self(
      $this->_keyword,
      $this->_left_angle,
      $value,
      $this->_right_angle,
    );
  }

  public function right_angle(): EditableSyntax {
    return $this->_right_angle;
  }

  public function with_right_angle(EditableSyntax $value): this {
    return new self($this->_keyword, $this->_left_angle, $this->_types, $value);
  }
}

final class VarrayTypeSpecifier extends EditableSyntax {

  private EditableSyntax $_keyword;
  private EditableSyntax $_left_angle;
  private EditableSyntax $_type;
  private EditableSyntax $_trailing_comma;
  private EditableSyntax $_right_angle;

  public function __construct(
    EditableSyntax $keyword,
    EditableSyntax $left_angle,
    EditableSyntax $type,
    EditableSyntax $trailing_comma,
    EditableSyntax $right_angle,
  ) {
    parent::__construct('varray_type_specifier');
    $this->_keyword = $keyword;
    $this->_left_angle = $left_angle;
    $this->_type = $type;
    $this->_trailing_comma = $trailing_comma;
    $this->_right_angle = $right_angle;
  }

  public static function from_json(
    array<string, mixed> $json,
    int $position,
    string $source,
  ): this {
    $keyword = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['varray_keyword'],
      $position,
      $source,
    );
    $position += $keyword->width();
    $left_angle = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['varray_left_angle'],
      $position,
      $source,
    );
    $position += $left_angle->width();
    $type = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['varray_type'],
      $position,
      $source,
    );
    $position += $type->width();
    $trailing_comma = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['varray_trailing_comma'],
      $position,
      $source,
    );
    $position += $trailing_comma->width();
    $right_angle = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['varray_right_angle'],
      $position,
      $source,
    );
    $position += $right_angle->width();
    return
      new self($keyword, $left_angle, $type, $trailing_comma, $right_angle);
  }

  public function children(): KeyedTraversable<string, EditableSyntax> {
    yield 'keyword' => $this->_keyword;
    yield 'left_angle' => $this->_left_angle;
    yield 'type' => $this->_type;
    yield 'trailing_comma' => $this->_trailing_comma;
    yield 'right_angle' => $this->_right_angle;
  }

  public function rewrite(
    self::TRewriter $rewriter,
    ?Traversable<EditableSyntax> $parents = null,
  ): EditableSyntax {
    $parents = $parents === null ? vec[] : vec($parents);
    $child_parents = $parents;
    $child_parents[] = $this;
    $keyword = $this->_keyword->rewrite($rewriter, $child_parents);
    $left_angle = $this->_left_angle->rewrite($rewriter, $child_parents);
    $type = $this->_type->rewrite($rewriter, $child_parents);
    $trailing_comma =
      $this->_trailing_comma->rewrite($rewriter, $child_parents);
    $right_angle = $this->_right_angle->rewrite($rewriter, $child_parents);
    if (
      $keyword === $this->keyword() &&
      $left_angle === $this->left_angle() &&
      $type === $this->type() &&
      $trailing_comma === $this->trailing_comma() &&
      $right_angle === $this->right_angle()
    ) {
      $node = $this;
    } else {
      $node =
        new self($keyword, $left_angle, $type, $trailing_comma, $right_angle);
    }
    return $rewriter($node, $parents);
  }

  public function keyword(): EditableSyntax {
    return $this->_keyword;
  }

  public function with_keyword(EditableSyntax $value): this {
    return new self(
      $value,
      $this->_left_angle,
      $this->_type,
      $this->_trailing_comma,
      $this->_right_angle,
    );
  }

  public function left_angle(): EditableSyntax {
    return $this->_left_angle;
  }

  public function with_left_angle(EditableSyntax $value): this {
    return new self(
      $this->_keyword,
      $value,
      $this->_type,
      $this->_trailing_comma,
      $this->_right_angle,
    );
  }

  public function type(): EditableSyntax {
    return $this->_type;
  }

  public function with_type(EditableSyntax $value): this {
    return new self(
      $this->_keyword,
      $this->_left_angle,
      $value,
      $this->_trailing_comma,
      $this->_right_angle,
    );
  }

  public function trailing_comma(): EditableSyntax {
    return $this->_trailing_comma;
  }

  public function with_trailing_comma(EditableSyntax $value): this {
    return new self(
      $this->_keyword,
      $this->_left_angle,
      $this->_type,
      $value,
      $this->_right_angle,
    );
  }

  public function right_angle(): EditableSyntax {
    return $this->_right_angle;
  }

  public function with_right_angle(EditableSyntax $value): this {
    return new self(
      $this->_keyword,
      $this->_left_angle,
      $this->_type,
      $this->_trailing_comma,
      $value,
    );
  }
}

final class VectorArrayTypeSpecifier extends EditableSyntax {

  private EditableSyntax $_keyword;
  private EditableSyntax $_left_angle;
  private EditableSyntax $_type;
  private EditableSyntax $_right_angle;

  public function __construct(
    EditableSyntax $keyword,
    EditableSyntax $left_angle,
    EditableSyntax $type,
    EditableSyntax $right_angle,
  ) {
    parent::__construct('vector_array_type_specifier');
    $this->_keyword = $keyword;
    $this->_left_angle = $left_angle;
    $this->_type = $type;
    $this->_right_angle = $right_angle;
  }

  public static function from_json(
    array<string, mixed> $json,
    int $position,
    string $source,
  ): this {
    $keyword = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['vector_array_keyword'],
      $position,
      $source,
    );
    $position += $keyword->width();
    $left_angle = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['vector_array_left_angle'],
      $position,
      $source,
    );
    $position += $left_angle->width();
    $type = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['vector_array_type'],
      $position,
      $source,
    );
    $position += $type->width();
    $right_angle = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['vector_array_right_angle'],
      $position,
      $source,
    );
    $position += $right_angle->width();
    return new self($keyword, $left_angle, $type, $right_angle);
  }

  public function children(): KeyedTraversable<string, EditableSyntax> {
    yield 'keyword' => $this->_keyword;
    yield 'left_angle' => $this->_left_angle;
    yield 'type' => $this->_type;
    yield 'right_angle' => $this->_right_angle;
  }

  public function rewrite(
    self::TRewriter $rewriter,
    ?Traversable<EditableSyntax> $parents = null,
  ): EditableSyntax {
    $parents = $parents === null ? vec[] : vec($parents);
    $child_parents = $parents;
    $child_parents[] = $this;
    $keyword = $this->_keyword->rewrite($rewriter, $child_parents);
    $left_angle = $this->_left_angle->rewrite($rewriter, $child_parents);
    $type = $this->_type->rewrite($rewriter, $child_parents);
    $right_angle = $this->_right_angle->rewrite($rewriter, $child_parents);
    if (
      $keyword === $this->keyword() &&
      $left_angle === $this->left_angle() &&
      $type === $this->type() &&
      $right_angle === $this->right_angle()
    ) {
      $node = $this;
    } else {
      $node = new self($keyword, $left_angle, $type, $right_angle);
    }
    return $rewriter($node, $parents);
  }

  public function keyword(): EditableSyntax {
    return $this->_keyword;
  }

  public function with_keyword(EditableSyntax $value): this {
    return
      new self($value, $this->_left_angle, $this->_type, $this->_right_angle);
  }

  public function left_angle(): EditableSyntax {
    return $this->_left_angle;
  }

  public function with_left_angle(EditableSyntax $value): this {
    return new self($this->_keyword, $value, $this->_type, $this->_right_angle);
  }

  public function type(): EditableSyntax {
    return $this->_type;
  }

  public function with_type(EditableSyntax $value): this {
    return new self(
      $this->_keyword,
      $this->_left_angle,
      $value,
      $this->_right_angle,
    );
  }

  public function right_angle(): EditableSyntax {
    return $this->_right_angle;
  }

  public function with_right_angle(EditableSyntax $value): this {
    return new self($this->_keyword, $this->_left_angle, $this->_type, $value);
  }
}

final class TypeParameter extends EditableSyntax {

  private EditableSyntax $_variance;
  private EditableSyntax $_name;
  private EditableSyntax $_constraints;

  public function __construct(
    EditableSyntax $variance,
    EditableSyntax $name,
    EditableSyntax $constraints,
  ) {
    parent::__construct('type_parameter');
    $this->_variance = $variance;
    $this->_name = $name;
    $this->_constraints = $constraints;
  }

  public static function from_json(
    array<string, mixed> $json,
    int $position,
    string $source,
  ): this {
    $variance = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['type_variance'],
      $position,
      $source,
    );
    $position += $variance->width();
    $name = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['type_name'],
      $position,
      $source,
    );
    $position += $name->width();
    $constraints = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['type_constraints'],
      $position,
      $source,
    );
    $position += $constraints->width();
    return new self($variance, $name, $constraints);
  }

  public function children(): KeyedTraversable<string, EditableSyntax> {
    yield 'variance' => $this->_variance;
    yield 'name' => $this->_name;
    yield 'constraints' => $this->_constraints;
  }

  public function rewrite(
    self::TRewriter $rewriter,
    ?Traversable<EditableSyntax> $parents = null,
  ): EditableSyntax {
    $parents = $parents === null ? vec[] : vec($parents);
    $child_parents = $parents;
    $child_parents[] = $this;
    $variance = $this->_variance->rewrite($rewriter, $child_parents);
    $name = $this->_name->rewrite($rewriter, $child_parents);
    $constraints = $this->_constraints->rewrite($rewriter, $child_parents);
    if (
      $variance === $this->variance() &&
      $name === $this->name() &&
      $constraints === $this->constraints()
    ) {
      $node = $this;
    } else {
      $node = new self($variance, $name, $constraints);
    }
    return $rewriter($node, $parents);
  }

  public function variance(): EditableSyntax {
    return $this->_variance;
  }

  public function with_variance(EditableSyntax $value): this {
    return new self($value, $this->_name, $this->_constraints);
  }

  public function name(): EditableSyntax {
    return $this->_name;
  }

  public function with_name(EditableSyntax $value): this {
    return new self($this->_variance, $value, $this->_constraints);
  }

  public function constraints(): EditableSyntax {
    return $this->_constraints;
  }

  public function with_constraints(EditableSyntax $value): this {
    return new self($this->_variance, $this->_name, $value);
  }
}

final class TypeConstraint extends EditableSyntax {

  private EditableSyntax $_keyword;
  private EditableSyntax $_type;

  public function __construct(EditableSyntax $keyword, EditableSyntax $type) {
    parent::__construct('type_constraint');
    $this->_keyword = $keyword;
    $this->_type = $type;
  }

  public static function from_json(
    array<string, mixed> $json,
    int $position,
    string $source,
  ): this {
    $keyword = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['constraint_keyword'],
      $position,
      $source,
    );
    $position += $keyword->width();
    $type = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['constraint_type'],
      $position,
      $source,
    );
    $position += $type->width();
    return new self($keyword, $type);
  }

  public function children(): KeyedTraversable<string, EditableSyntax> {
    yield 'keyword' => $this->_keyword;
    yield 'type' => $this->_type;
  }

  public function rewrite(
    self::TRewriter $rewriter,
    ?Traversable<EditableSyntax> $parents = null,
  ): EditableSyntax {
    $parents = $parents === null ? vec[] : vec($parents);
    $child_parents = $parents;
    $child_parents[] = $this;
    $keyword = $this->_keyword->rewrite($rewriter, $child_parents);
    $type = $this->_type->rewrite($rewriter, $child_parents);
    if ($keyword === $this->keyword() && $type === $this->type()) {
      $node = $this;
    } else {
      $node = new self($keyword, $type);
    }
    return $rewriter($node, $parents);
  }

  public function keyword(): EditableSyntax {
    return $this->_keyword;
  }

  public function with_keyword(EditableSyntax $value): this {
    return new self($value, $this->_type);
  }

  public function type(): EditableSyntax {
    return $this->_type;
  }

  public function with_type(EditableSyntax $value): this {
    return new self($this->_keyword, $value);
  }
}

final class DarrayTypeSpecifier extends EditableSyntax {

  private EditableSyntax $_keyword;
  private EditableSyntax $_left_angle;
  private EditableSyntax $_key;
  private EditableSyntax $_comma;
  private EditableSyntax $_value;
  private EditableSyntax $_trailing_comma;
  private EditableSyntax $_right_angle;

  public function __construct(
    EditableSyntax $keyword,
    EditableSyntax $left_angle,
    EditableSyntax $key,
    EditableSyntax $comma,
    EditableSyntax $value,
    EditableSyntax $trailing_comma,
    EditableSyntax $right_angle,
  ) {
    parent::__construct('darray_type_specifier');
    $this->_keyword = $keyword;
    $this->_left_angle = $left_angle;
    $this->_key = $key;
    $this->_comma = $comma;
    $this->_value = $value;
    $this->_trailing_comma = $trailing_comma;
    $this->_right_angle = $right_angle;
  }

  public static function from_json(
    array<string, mixed> $json,
    int $position,
    string $source,
  ): this {
    $keyword = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['darray_keyword'],
      $position,
      $source,
    );
    $position += $keyword->width();
    $left_angle = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['darray_left_angle'],
      $position,
      $source,
    );
    $position += $left_angle->width();
    $key = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['darray_key'],
      $position,
      $source,
    );
    $position += $key->width();
    $comma = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['darray_comma'],
      $position,
      $source,
    );
    $position += $comma->width();
    $value = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['darray_value'],
      $position,
      $source,
    );
    $position += $value->width();
    $trailing_comma = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['darray_trailing_comma'],
      $position,
      $source,
    );
    $position += $trailing_comma->width();
    $right_angle = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['darray_right_angle'],
      $position,
      $source,
    );
    $position += $right_angle->width();
    return new self(
      $keyword,
      $left_angle,
      $key,
      $comma,
      $value,
      $trailing_comma,
      $right_angle,
    );
  }

  public function children(): KeyedTraversable<string, EditableSyntax> {
    yield 'keyword' => $this->_keyword;
    yield 'left_angle' => $this->_left_angle;
    yield 'key' => $this->_key;
    yield 'comma' => $this->_comma;
    yield 'value' => $this->_value;
    yield 'trailing_comma' => $this->_trailing_comma;
    yield 'right_angle' => $this->_right_angle;
  }

  public function rewrite(
    self::TRewriter $rewriter,
    ?Traversable<EditableSyntax> $parents = null,
  ): EditableSyntax {
    $parents = $parents === null ? vec[] : vec($parents);
    $child_parents = $parents;
    $child_parents[] = $this;
    $keyword = $this->_keyword->rewrite($rewriter, $child_parents);
    $left_angle = $this->_left_angle->rewrite($rewriter, $child_parents);
    $key = $this->_key->rewrite($rewriter, $child_parents);
    $comma = $this->_comma->rewrite($rewriter, $child_parents);
    $value = $this->_value->rewrite($rewriter, $child_parents);
    $trailing_comma =
      $this->_trailing_comma->rewrite($rewriter, $child_parents);
    $right_angle = $this->_right_angle->rewrite($rewriter, $child_parents);
    if (
      $keyword === $this->keyword() &&
      $left_angle === $this->left_angle() &&
      $key === $this->key() &&
      $comma === $this->comma() &&
      $value === $this->value() &&
      $trailing_comma === $this->trailing_comma() &&
      $right_angle === $this->right_angle()
    ) {
      $node = $this;
    } else {
      $node = new self(
        $keyword,
        $left_angle,
        $key,
        $comma,
        $value,
        $trailing_comma,
        $right_angle,
      );
    }
    return $rewriter($node, $parents);
  }

  public function keyword(): EditableSyntax {
    return $this->_keyword;
  }

  public function with_keyword(EditableSyntax $value): this {
    return new self(
      $value,
      $this->_left_angle,
      $this->_key,
      $this->_comma,
      $this->_value,
      $this->_trailing_comma,
      $this->_right_angle,
    );
  }

  public function left_angle(): EditableSyntax {
    return $this->_left_angle;
  }

  public function with_left_angle(EditableSyntax $value): this {
    return new self(
      $this->_keyword,
      $value,
      $this->_key,
      $this->_comma,
      $this->_value,
      $this->_trailing_comma,
      $this->_right_angle,
    );
  }

  public function key(): EditableSyntax {
    return $this->_key;
  }

  public function with_key(EditableSyntax $value): this {
    return new self(
      $this->_keyword,
      $this->_left_angle,
      $value,
      $this->_comma,
      $this->_value,
      $this->_trailing_comma,
      $this->_right_angle,
    );
  }

  public function comma(): EditableSyntax {
    return $this->_comma;
  }

  public function with_comma(EditableSyntax $value): this {
    return new self(
      $this->_keyword,
      $this->_left_angle,
      $this->_key,
      $value,
      $this->_value,
      $this->_trailing_comma,
      $this->_right_angle,
    );
  }

  public function value(): EditableSyntax {
    return $this->_value;
  }

  public function with_value(EditableSyntax $value): this {
    return new self(
      $this->_keyword,
      $this->_left_angle,
      $this->_key,
      $this->_comma,
      $value,
      $this->_trailing_comma,
      $this->_right_angle,
    );
  }

  public function trailing_comma(): EditableSyntax {
    return $this->_trailing_comma;
  }

  public function with_trailing_comma(EditableSyntax $value): this {
    return new self(
      $this->_keyword,
      $this->_left_angle,
      $this->_key,
      $this->_comma,
      $this->_value,
      $value,
      $this->_right_angle,
    );
  }

  public function right_angle(): EditableSyntax {
    return $this->_right_angle;
  }

  public function with_right_angle(EditableSyntax $value): this {
    return new self(
      $this->_keyword,
      $this->_left_angle,
      $this->_key,
      $this->_comma,
      $this->_value,
      $this->_trailing_comma,
      $value,
    );
  }
}

final class MapArrayTypeSpecifier extends EditableSyntax {

  private EditableSyntax $_keyword;
  private EditableSyntax $_left_angle;
  private EditableSyntax $_key;
  private EditableSyntax $_comma;
  private EditableSyntax $_value;
  private EditableSyntax $_right_angle;

  public function __construct(
    EditableSyntax $keyword,
    EditableSyntax $left_angle,
    EditableSyntax $key,
    EditableSyntax $comma,
    EditableSyntax $value,
    EditableSyntax $right_angle,
  ) {
    parent::__construct('map_array_type_specifier');
    $this->_keyword = $keyword;
    $this->_left_angle = $left_angle;
    $this->_key = $key;
    $this->_comma = $comma;
    $this->_value = $value;
    $this->_right_angle = $right_angle;
  }

  public static function from_json(
    array<string, mixed> $json,
    int $position,
    string $source,
  ): this {
    $keyword = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['map_array_keyword'],
      $position,
      $source,
    );
    $position += $keyword->width();
    $left_angle = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['map_array_left_angle'],
      $position,
      $source,
    );
    $position += $left_angle->width();
    $key = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['map_array_key'],
      $position,
      $source,
    );
    $position += $key->width();
    $comma = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['map_array_comma'],
      $position,
      $source,
    );
    $position += $comma->width();
    $value = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['map_array_value'],
      $position,
      $source,
    );
    $position += $value->width();
    $right_angle = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['map_array_right_angle'],
      $position,
      $source,
    );
    $position += $right_angle->width();
    return new self($keyword, $left_angle, $key, $comma, $value, $right_angle);
  }

  public function children(): KeyedTraversable<string, EditableSyntax> {
    yield 'keyword' => $this->_keyword;
    yield 'left_angle' => $this->_left_angle;
    yield 'key' => $this->_key;
    yield 'comma' => $this->_comma;
    yield 'value' => $this->_value;
    yield 'right_angle' => $this->_right_angle;
  }

  public function rewrite(
    self::TRewriter $rewriter,
    ?Traversable<EditableSyntax> $parents = null,
  ): EditableSyntax {
    $parents = $parents === null ? vec[] : vec($parents);
    $child_parents = $parents;
    $child_parents[] = $this;
    $keyword = $this->_keyword->rewrite($rewriter, $child_parents);
    $left_angle = $this->_left_angle->rewrite($rewriter, $child_parents);
    $key = $this->_key->rewrite($rewriter, $child_parents);
    $comma = $this->_comma->rewrite($rewriter, $child_parents);
    $value = $this->_value->rewrite($rewriter, $child_parents);
    $right_angle = $this->_right_angle->rewrite($rewriter, $child_parents);
    if (
      $keyword === $this->keyword() &&
      $left_angle === $this->left_angle() &&
      $key === $this->key() &&
      $comma === $this->comma() &&
      $value === $this->value() &&
      $right_angle === $this->right_angle()
    ) {
      $node = $this;
    } else {
      $node =
        new self($keyword, $left_angle, $key, $comma, $value, $right_angle);
    }
    return $rewriter($node, $parents);
  }

  public function keyword(): EditableSyntax {
    return $this->_keyword;
  }

  public function with_keyword(EditableSyntax $value): this {
    return new self(
      $value,
      $this->_left_angle,
      $this->_key,
      $this->_comma,
      $this->_value,
      $this->_right_angle,
    );
  }

  public function left_angle(): EditableSyntax {
    return $this->_left_angle;
  }

  public function with_left_angle(EditableSyntax $value): this {
    return new self(
      $this->_keyword,
      $value,
      $this->_key,
      $this->_comma,
      $this->_value,
      $this->_right_angle,
    );
  }

  public function key(): EditableSyntax {
    return $this->_key;
  }

  public function with_key(EditableSyntax $value): this {
    return new self(
      $this->_keyword,
      $this->_left_angle,
      $value,
      $this->_comma,
      $this->_value,
      $this->_right_angle,
    );
  }

  public function comma(): EditableSyntax {
    return $this->_comma;
  }

  public function with_comma(EditableSyntax $value): this {
    return new self(
      $this->_keyword,
      $this->_left_angle,
      $this->_key,
      $value,
      $this->_value,
      $this->_right_angle,
    );
  }

  public function value(): EditableSyntax {
    return $this->_value;
  }

  public function with_value(EditableSyntax $value): this {
    return new self(
      $this->_keyword,
      $this->_left_angle,
      $this->_key,
      $this->_comma,
      $value,
      $this->_right_angle,
    );
  }

  public function right_angle(): EditableSyntax {
    return $this->_right_angle;
  }

  public function with_right_angle(EditableSyntax $value): this {
    return new self(
      $this->_keyword,
      $this->_left_angle,
      $this->_key,
      $this->_comma,
      $this->_value,
      $value,
    );
  }
}

final class DictionaryTypeSpecifier extends EditableSyntax {

  private EditableSyntax $_keyword;
  private EditableSyntax $_left_angle;
  private EditableSyntax $_members;
  private EditableSyntax $_right_angle;

  public function __construct(
    EditableSyntax $keyword,
    EditableSyntax $left_angle,
    EditableSyntax $members,
    EditableSyntax $right_angle,
  ) {
    parent::__construct('dictionary_type_specifier');
    $this->_keyword = $keyword;
    $this->_left_angle = $left_angle;
    $this->_members = $members;
    $this->_right_angle = $right_angle;
  }

  public static function from_json(
    array<string, mixed> $json,
    int $position,
    string $source,
  ): this {
    $keyword = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['dictionary_type_keyword'],
      $position,
      $source,
    );
    $position += $keyword->width();
    $left_angle = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['dictionary_type_left_angle'],
      $position,
      $source,
    );
    $position += $left_angle->width();
    $members = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['dictionary_type_members'],
      $position,
      $source,
    );
    $position += $members->width();
    $right_angle = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['dictionary_type_right_angle'],
      $position,
      $source,
    );
    $position += $right_angle->width();
    return new self($keyword, $left_angle, $members, $right_angle);
  }

  public function children(): KeyedTraversable<string, EditableSyntax> {
    yield 'keyword' => $this->_keyword;
    yield 'left_angle' => $this->_left_angle;
    yield 'members' => $this->_members;
    yield 'right_angle' => $this->_right_angle;
  }

  public function rewrite(
    self::TRewriter $rewriter,
    ?Traversable<EditableSyntax> $parents = null,
  ): EditableSyntax {
    $parents = $parents === null ? vec[] : vec($parents);
    $child_parents = $parents;
    $child_parents[] = $this;
    $keyword = $this->_keyword->rewrite($rewriter, $child_parents);
    $left_angle = $this->_left_angle->rewrite($rewriter, $child_parents);
    $members = $this->_members->rewrite($rewriter, $child_parents);
    $right_angle = $this->_right_angle->rewrite($rewriter, $child_parents);
    if (
      $keyword === $this->keyword() &&
      $left_angle === $this->left_angle() &&
      $members === $this->members() &&
      $right_angle === $this->right_angle()
    ) {
      $node = $this;
    } else {
      $node = new self($keyword, $left_angle, $members, $right_angle);
    }
    return $rewriter($node, $parents);
  }

  public function keyword(): EditableSyntax {
    return $this->_keyword;
  }

  public function with_keyword(EditableSyntax $value): this {
    return new self(
      $value,
      $this->_left_angle,
      $this->_members,
      $this->_right_angle,
    );
  }

  public function left_angle(): EditableSyntax {
    return $this->_left_angle;
  }

  public function with_left_angle(EditableSyntax $value): this {
    return
      new self($this->_keyword, $value, $this->_members, $this->_right_angle);
  }

  public function members(): EditableSyntax {
    return $this->_members;
  }

  public function with_members(EditableSyntax $value): this {
    return new self(
      $this->_keyword,
      $this->_left_angle,
      $value,
      $this->_right_angle,
    );
  }

  public function right_angle(): EditableSyntax {
    return $this->_right_angle;
  }

  public function with_right_angle(EditableSyntax $value): this {
    return
      new self($this->_keyword, $this->_left_angle, $this->_members, $value);
  }
}

final class ClosureTypeSpecifier extends EditableSyntax {

  private EditableSyntax $_outer_left_paren;
  private EditableSyntax $_coroutine;
  private EditableSyntax $_function_keyword;
  private EditableSyntax $_inner_left_paren;
  private EditableSyntax $_parameter_types;
  private EditableSyntax $_inner_right_paren;
  private EditableSyntax $_colon;
  private EditableSyntax $_return_type;
  private EditableSyntax $_outer_right_paren;

  public function __construct(
    EditableSyntax $outer_left_paren,
    EditableSyntax $coroutine,
    EditableSyntax $function_keyword,
    EditableSyntax $inner_left_paren,
    EditableSyntax $parameter_types,
    EditableSyntax $inner_right_paren,
    EditableSyntax $colon,
    EditableSyntax $return_type,
    EditableSyntax $outer_right_paren,
  ) {
    parent::__construct('closure_type_specifier');
    $this->_outer_left_paren = $outer_left_paren;
    $this->_coroutine = $coroutine;
    $this->_function_keyword = $function_keyword;
    $this->_inner_left_paren = $inner_left_paren;
    $this->_parameter_types = $parameter_types;
    $this->_inner_right_paren = $inner_right_paren;
    $this->_colon = $colon;
    $this->_return_type = $return_type;
    $this->_outer_right_paren = $outer_right_paren;
  }

  public static function from_json(
    array<string, mixed> $json,
    int $position,
    string $source,
  ): this {
    $outer_left_paren = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['closure_outer_left_paren'],
      $position,
      $source,
    );
    $position += $outer_left_paren->width();
    $coroutine = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['closure_coroutine'],
      $position,
      $source,
    );
    $position += $coroutine->width();
    $function_keyword = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['closure_function_keyword'],
      $position,
      $source,
    );
    $position += $function_keyword->width();
    $inner_left_paren = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['closure_inner_left_paren'],
      $position,
      $source,
    );
    $position += $inner_left_paren->width();
    $parameter_types = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['closure_parameter_types'],
      $position,
      $source,
    );
    $position += $parameter_types->width();
    $inner_right_paren = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['closure_inner_right_paren'],
      $position,
      $source,
    );
    $position += $inner_right_paren->width();
    $colon = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['closure_colon'],
      $position,
      $source,
    );
    $position += $colon->width();
    $return_type = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['closure_return_type'],
      $position,
      $source,
    );
    $position += $return_type->width();
    $outer_right_paren = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['closure_outer_right_paren'],
      $position,
      $source,
    );
    $position += $outer_right_paren->width();
    return new self(
      $outer_left_paren,
      $coroutine,
      $function_keyword,
      $inner_left_paren,
      $parameter_types,
      $inner_right_paren,
      $colon,
      $return_type,
      $outer_right_paren,
    );
  }

  public function children(): KeyedTraversable<string, EditableSyntax> {
    yield 'outer_left_paren' => $this->_outer_left_paren;
    yield 'coroutine' => $this->_coroutine;
    yield 'function_keyword' => $this->_function_keyword;
    yield 'inner_left_paren' => $this->_inner_left_paren;
    yield 'parameter_types' => $this->_parameter_types;
    yield 'inner_right_paren' => $this->_inner_right_paren;
    yield 'colon' => $this->_colon;
    yield 'return_type' => $this->_return_type;
    yield 'outer_right_paren' => $this->_outer_right_paren;
  }

  public function rewrite(
    self::TRewriter $rewriter,
    ?Traversable<EditableSyntax> $parents = null,
  ): EditableSyntax {
    $parents = $parents === null ? vec[] : vec($parents);
    $child_parents = $parents;
    $child_parents[] = $this;
    $outer_left_paren =
      $this->_outer_left_paren->rewrite($rewriter, $child_parents);
    $coroutine = $this->_coroutine->rewrite($rewriter, $child_parents);
    $function_keyword =
      $this->_function_keyword->rewrite($rewriter, $child_parents);
    $inner_left_paren =
      $this->_inner_left_paren->rewrite($rewriter, $child_parents);
    $parameter_types =
      $this->_parameter_types->rewrite($rewriter, $child_parents);
    $inner_right_paren =
      $this->_inner_right_paren->rewrite($rewriter, $child_parents);
    $colon = $this->_colon->rewrite($rewriter, $child_parents);
    $return_type = $this->_return_type->rewrite($rewriter, $child_parents);
    $outer_right_paren =
      $this->_outer_right_paren->rewrite($rewriter, $child_parents);
    if (
      $outer_left_paren === $this->outer_left_paren() &&
      $coroutine === $this->coroutine() &&
      $function_keyword === $this->function_keyword() &&
      $inner_left_paren === $this->inner_left_paren() &&
      $parameter_types === $this->parameter_types() &&
      $inner_right_paren === $this->inner_right_paren() &&
      $colon === $this->colon() &&
      $return_type === $this->return_type() &&
      $outer_right_paren === $this->outer_right_paren()
    ) {
      $node = $this;
    } else {
      $node = new self(
        $outer_left_paren,
        $coroutine,
        $function_keyword,
        $inner_left_paren,
        $parameter_types,
        $inner_right_paren,
        $colon,
        $return_type,
        $outer_right_paren,
      );
    }
    return $rewriter($node, $parents);
  }

  public function outer_left_paren(): EditableSyntax {
    return $this->_outer_left_paren;
  }

  public function with_outer_left_paren(EditableSyntax $value): this {
    return new self(
      $value,
      $this->_coroutine,
      $this->_function_keyword,
      $this->_inner_left_paren,
      $this->_parameter_types,
      $this->_inner_right_paren,
      $this->_colon,
      $this->_return_type,
      $this->_outer_right_paren,
    );
  }

  public function coroutine(): EditableSyntax {
    return $this->_coroutine;
  }

  public function with_coroutine(EditableSyntax $value): this {
    return new self(
      $this->_outer_left_paren,
      $value,
      $this->_function_keyword,
      $this->_inner_left_paren,
      $this->_parameter_types,
      $this->_inner_right_paren,
      $this->_colon,
      $this->_return_type,
      $this->_outer_right_paren,
    );
  }

  public function function_keyword(): EditableSyntax {
    return $this->_function_keyword;
  }

  public function with_function_keyword(EditableSyntax $value): this {
    return new self(
      $this->_outer_left_paren,
      $this->_coroutine,
      $value,
      $this->_inner_left_paren,
      $this->_parameter_types,
      $this->_inner_right_paren,
      $this->_colon,
      $this->_return_type,
      $this->_outer_right_paren,
    );
  }

  public function inner_left_paren(): EditableSyntax {
    return $this->_inner_left_paren;
  }

  public function with_inner_left_paren(EditableSyntax $value): this {
    return new self(
      $this->_outer_left_paren,
      $this->_coroutine,
      $this->_function_keyword,
      $value,
      $this->_parameter_types,
      $this->_inner_right_paren,
      $this->_colon,
      $this->_return_type,
      $this->_outer_right_paren,
    );
  }

  public function parameter_types(): EditableSyntax {
    return $this->_parameter_types;
  }

  public function with_parameter_types(EditableSyntax $value): this {
    return new self(
      $this->_outer_left_paren,
      $this->_coroutine,
      $this->_function_keyword,
      $this->_inner_left_paren,
      $value,
      $this->_inner_right_paren,
      $this->_colon,
      $this->_return_type,
      $this->_outer_right_paren,
    );
  }

  public function inner_right_paren(): EditableSyntax {
    return $this->_inner_right_paren;
  }

  public function with_inner_right_paren(EditableSyntax $value): this {
    return new self(
      $this->_outer_left_paren,
      $this->_coroutine,
      $this->_function_keyword,
      $this->_inner_left_paren,
      $this->_parameter_types,
      $value,
      $this->_colon,
      $this->_return_type,
      $this->_outer_right_paren,
    );
  }

  public function colon(): EditableSyntax {
    return $this->_colon;
  }

  public function with_colon(EditableSyntax $value): this {
    return new self(
      $this->_outer_left_paren,
      $this->_coroutine,
      $this->_function_keyword,
      $this->_inner_left_paren,
      $this->_parameter_types,
      $this->_inner_right_paren,
      $value,
      $this->_return_type,
      $this->_outer_right_paren,
    );
  }

  public function return_type(): EditableSyntax {
    return $this->_return_type;
  }

  public function with_return_type(EditableSyntax $value): this {
    return new self(
      $this->_outer_left_paren,
      $this->_coroutine,
      $this->_function_keyword,
      $this->_inner_left_paren,
      $this->_parameter_types,
      $this->_inner_right_paren,
      $this->_colon,
      $value,
      $this->_outer_right_paren,
    );
  }

  public function outer_right_paren(): EditableSyntax {
    return $this->_outer_right_paren;
  }

  public function with_outer_right_paren(EditableSyntax $value): this {
    return new self(
      $this->_outer_left_paren,
      $this->_coroutine,
      $this->_function_keyword,
      $this->_inner_left_paren,
      $this->_parameter_types,
      $this->_inner_right_paren,
      $this->_colon,
      $this->_return_type,
      $value,
    );
  }
}

final class ClassnameTypeSpecifier extends EditableSyntax {

  private EditableSyntax $_keyword;
  private EditableSyntax $_left_angle;
  private EditableSyntax $_type;
  private EditableSyntax $_trailing_comma;
  private EditableSyntax $_right_angle;

  public function __construct(
    EditableSyntax $keyword,
    EditableSyntax $left_angle,
    EditableSyntax $type,
    EditableSyntax $trailing_comma,
    EditableSyntax $right_angle,
  ) {
    parent::__construct('classname_type_specifier');
    $this->_keyword = $keyword;
    $this->_left_angle = $left_angle;
    $this->_type = $type;
    $this->_trailing_comma = $trailing_comma;
    $this->_right_angle = $right_angle;
  }

  public static function from_json(
    array<string, mixed> $json,
    int $position,
    string $source,
  ): this {
    $keyword = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['classname_keyword'],
      $position,
      $source,
    );
    $position += $keyword->width();
    $left_angle = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['classname_left_angle'],
      $position,
      $source,
    );
    $position += $left_angle->width();
    $type = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['classname_type'],
      $position,
      $source,
    );
    $position += $type->width();
    $trailing_comma = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['classname_trailing_comma'],
      $position,
      $source,
    );
    $position += $trailing_comma->width();
    $right_angle = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['classname_right_angle'],
      $position,
      $source,
    );
    $position += $right_angle->width();
    return
      new self($keyword, $left_angle, $type, $trailing_comma, $right_angle);
  }

  public function children(): KeyedTraversable<string, EditableSyntax> {
    yield 'keyword' => $this->_keyword;
    yield 'left_angle' => $this->_left_angle;
    yield 'type' => $this->_type;
    yield 'trailing_comma' => $this->_trailing_comma;
    yield 'right_angle' => $this->_right_angle;
  }

  public function rewrite(
    self::TRewriter $rewriter,
    ?Traversable<EditableSyntax> $parents = null,
  ): EditableSyntax {
    $parents = $parents === null ? vec[] : vec($parents);
    $child_parents = $parents;
    $child_parents[] = $this;
    $keyword = $this->_keyword->rewrite($rewriter, $child_parents);
    $left_angle = $this->_left_angle->rewrite($rewriter, $child_parents);
    $type = $this->_type->rewrite($rewriter, $child_parents);
    $trailing_comma =
      $this->_trailing_comma->rewrite($rewriter, $child_parents);
    $right_angle = $this->_right_angle->rewrite($rewriter, $child_parents);
    if (
      $keyword === $this->keyword() &&
      $left_angle === $this->left_angle() &&
      $type === $this->type() &&
      $trailing_comma === $this->trailing_comma() &&
      $right_angle === $this->right_angle()
    ) {
      $node = $this;
    } else {
      $node =
        new self($keyword, $left_angle, $type, $trailing_comma, $right_angle);
    }
    return $rewriter($node, $parents);
  }

  public function keyword(): EditableSyntax {
    return $this->_keyword;
  }

  public function with_keyword(EditableSyntax $value): this {
    return new self(
      $value,
      $this->_left_angle,
      $this->_type,
      $this->_trailing_comma,
      $this->_right_angle,
    );
  }

  public function left_angle(): EditableSyntax {
    return $this->_left_angle;
  }

  public function with_left_angle(EditableSyntax $value): this {
    return new self(
      $this->_keyword,
      $value,
      $this->_type,
      $this->_trailing_comma,
      $this->_right_angle,
    );
  }

  public function type(): EditableSyntax {
    return $this->_type;
  }

  public function with_type(EditableSyntax $value): this {
    return new self(
      $this->_keyword,
      $this->_left_angle,
      $value,
      $this->_trailing_comma,
      $this->_right_angle,
    );
  }

  public function trailing_comma(): EditableSyntax {
    return $this->_trailing_comma;
  }

  public function with_trailing_comma(EditableSyntax $value): this {
    return new self(
      $this->_keyword,
      $this->_left_angle,
      $this->_type,
      $value,
      $this->_right_angle,
    );
  }

  public function right_angle(): EditableSyntax {
    return $this->_right_angle;
  }

  public function with_right_angle(EditableSyntax $value): this {
    return new self(
      $this->_keyword,
      $this->_left_angle,
      $this->_type,
      $this->_trailing_comma,
      $value,
    );
  }
}

final class FieldSpecifier extends EditableSyntax {

  private EditableSyntax $_question;
  private EditableSyntax $_name;
  private EditableSyntax $_arrow;
  private EditableSyntax $_type;

  public function __construct(
    EditableSyntax $question,
    EditableSyntax $name,
    EditableSyntax $arrow,
    EditableSyntax $type,
  ) {
    parent::__construct('field_specifier');
    $this->_question = $question;
    $this->_name = $name;
    $this->_arrow = $arrow;
    $this->_type = $type;
  }

  public static function from_json(
    array<string, mixed> $json,
    int $position,
    string $source,
  ): this {
    $question = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['field_question'],
      $position,
      $source,
    );
    $position += $question->width();
    $name = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['field_name'],
      $position,
      $source,
    );
    $position += $name->width();
    $arrow = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['field_arrow'],
      $position,
      $source,
    );
    $position += $arrow->width();
    $type = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['field_type'],
      $position,
      $source,
    );
    $position += $type->width();
    return new self($question, $name, $arrow, $type);
  }

  public function children(): KeyedTraversable<string, EditableSyntax> {
    yield 'question' => $this->_question;
    yield 'name' => $this->_name;
    yield 'arrow' => $this->_arrow;
    yield 'type' => $this->_type;
  }

  public function rewrite(
    self::TRewriter $rewriter,
    ?Traversable<EditableSyntax> $parents = null,
  ): EditableSyntax {
    $parents = $parents === null ? vec[] : vec($parents);
    $child_parents = $parents;
    $child_parents[] = $this;
    $question = $this->_question->rewrite($rewriter, $child_parents);
    $name = $this->_name->rewrite($rewriter, $child_parents);
    $arrow = $this->_arrow->rewrite($rewriter, $child_parents);
    $type = $this->_type->rewrite($rewriter, $child_parents);
    if (
      $question === $this->question() &&
      $name === $this->name() &&
      $arrow === $this->arrow() &&
      $type === $this->type()
    ) {
      $node = $this;
    } else {
      $node = new self($question, $name, $arrow, $type);
    }
    return $rewriter($node, $parents);
  }

  public function question(): EditableSyntax {
    return $this->_question;
  }

  public function with_question(EditableSyntax $value): this {
    return new self($value, $this->_name, $this->_arrow, $this->_type);
  }

  public function name(): EditableSyntax {
    return $this->_name;
  }

  public function with_name(EditableSyntax $value): this {
    return new self($this->_question, $value, $this->_arrow, $this->_type);
  }

  public function arrow(): EditableSyntax {
    return $this->_arrow;
  }

  public function with_arrow(EditableSyntax $value): this {
    return new self($this->_question, $this->_name, $value, $this->_type);
  }

  public function type(): EditableSyntax {
    return $this->_type;
  }

  public function with_type(EditableSyntax $value): this {
    return new self($this->_question, $this->_name, $this->_arrow, $value);
  }
}

final class FieldInitializer extends EditableSyntax {

  private EditableSyntax $_name;
  private EditableSyntax $_arrow;
  private EditableSyntax $_value;

  public function __construct(
    EditableSyntax $name,
    EditableSyntax $arrow,
    EditableSyntax $value,
  ) {
    parent::__construct('field_initializer');
    $this->_name = $name;
    $this->_arrow = $arrow;
    $this->_value = $value;
  }

  public static function from_json(
    array<string, mixed> $json,
    int $position,
    string $source,
  ): this {
    $name = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['field_initializer_name'],
      $position,
      $source,
    );
    $position += $name->width();
    $arrow = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['field_initializer_arrow'],
      $position,
      $source,
    );
    $position += $arrow->width();
    $value = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['field_initializer_value'],
      $position,
      $source,
    );
    $position += $value->width();
    return new self($name, $arrow, $value);
  }

  public function children(): KeyedTraversable<string, EditableSyntax> {
    yield 'name' => $this->_name;
    yield 'arrow' => $this->_arrow;
    yield 'value' => $this->_value;
  }

  public function rewrite(
    self::TRewriter $rewriter,
    ?Traversable<EditableSyntax> $parents = null,
  ): EditableSyntax {
    $parents = $parents === null ? vec[] : vec($parents);
    $child_parents = $parents;
    $child_parents[] = $this;
    $name = $this->_name->rewrite($rewriter, $child_parents);
    $arrow = $this->_arrow->rewrite($rewriter, $child_parents);
    $value = $this->_value->rewrite($rewriter, $child_parents);
    if (
      $name === $this->name() &&
      $arrow === $this->arrow() &&
      $value === $this->value()
    ) {
      $node = $this;
    } else {
      $node = new self($name, $arrow, $value);
    }
    return $rewriter($node, $parents);
  }

  public function name(): EditableSyntax {
    return $this->_name;
  }

  public function with_name(EditableSyntax $value): this {
    return new self($value, $this->_arrow, $this->_value);
  }

  public function arrow(): EditableSyntax {
    return $this->_arrow;
  }

  public function with_arrow(EditableSyntax $value): this {
    return new self($this->_name, $value, $this->_value);
  }

  public function value(): EditableSyntax {
    return $this->_value;
  }

  public function with_value(EditableSyntax $value): this {
    return new self($this->_name, $this->_arrow, $value);
  }
}

final class ShapeTypeSpecifier extends EditableSyntax {

  private EditableSyntax $_keyword;
  private EditableSyntax $_left_paren;
  private EditableSyntax $_fields;
  private EditableSyntax $_ellipsis;
  private EditableSyntax $_right_paren;

  public function __construct(
    EditableSyntax $keyword,
    EditableSyntax $left_paren,
    EditableSyntax $fields,
    EditableSyntax $ellipsis,
    EditableSyntax $right_paren,
  ) {
    parent::__construct('shape_type_specifier');
    $this->_keyword = $keyword;
    $this->_left_paren = $left_paren;
    $this->_fields = $fields;
    $this->_ellipsis = $ellipsis;
    $this->_right_paren = $right_paren;
  }

  public static function from_json(
    array<string, mixed> $json,
    int $position,
    string $source,
  ): this {
    $keyword = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['shape_type_keyword'],
      $position,
      $source,
    );
    $position += $keyword->width();
    $left_paren = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['shape_type_left_paren'],
      $position,
      $source,
    );
    $position += $left_paren->width();
    $fields = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['shape_type_fields'],
      $position,
      $source,
    );
    $position += $fields->width();
    $ellipsis = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['shape_type_ellipsis'],
      $position,
      $source,
    );
    $position += $ellipsis->width();
    $right_paren = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['shape_type_right_paren'],
      $position,
      $source,
    );
    $position += $right_paren->width();
    return new self($keyword, $left_paren, $fields, $ellipsis, $right_paren);
  }

  public function children(): KeyedTraversable<string, EditableSyntax> {
    yield 'keyword' => $this->_keyword;
    yield 'left_paren' => $this->_left_paren;
    yield 'fields' => $this->_fields;
    yield 'ellipsis' => $this->_ellipsis;
    yield 'right_paren' => $this->_right_paren;
  }

  public function rewrite(
    self::TRewriter $rewriter,
    ?Traversable<EditableSyntax> $parents = null,
  ): EditableSyntax {
    $parents = $parents === null ? vec[] : vec($parents);
    $child_parents = $parents;
    $child_parents[] = $this;
    $keyword = $this->_keyword->rewrite($rewriter, $child_parents);
    $left_paren = $this->_left_paren->rewrite($rewriter, $child_parents);
    $fields = $this->_fields->rewrite($rewriter, $child_parents);
    $ellipsis = $this->_ellipsis->rewrite($rewriter, $child_parents);
    $right_paren = $this->_right_paren->rewrite($rewriter, $child_parents);
    if (
      $keyword === $this->keyword() &&
      $left_paren === $this->left_paren() &&
      $fields === $this->fields() &&
      $ellipsis === $this->ellipsis() &&
      $right_paren === $this->right_paren()
    ) {
      $node = $this;
    } else {
      $node = new self($keyword, $left_paren, $fields, $ellipsis, $right_paren);
    }
    return $rewriter($node, $parents);
  }

  public function keyword(): EditableSyntax {
    return $this->_keyword;
  }

  public function with_keyword(EditableSyntax $value): this {
    return new self(
      $value,
      $this->_left_paren,
      $this->_fields,
      $this->_ellipsis,
      $this->_right_paren,
    );
  }

  public function left_paren(): EditableSyntax {
    return $this->_left_paren;
  }

  public function with_left_paren(EditableSyntax $value): this {
    return new self(
      $this->_keyword,
      $value,
      $this->_fields,
      $this->_ellipsis,
      $this->_right_paren,
    );
  }

  public function fields(): EditableSyntax {
    return $this->_fields;
  }

  public function with_fields(EditableSyntax $value): this {
    return new self(
      $this->_keyword,
      $this->_left_paren,
      $value,
      $this->_ellipsis,
      $this->_right_paren,
    );
  }

  public function ellipsis(): EditableSyntax {
    return $this->_ellipsis;
  }

  public function with_ellipsis(EditableSyntax $value): this {
    return new self(
      $this->_keyword,
      $this->_left_paren,
      $this->_fields,
      $value,
      $this->_right_paren,
    );
  }

  public function right_paren(): EditableSyntax {
    return $this->_right_paren;
  }

  public function with_right_paren(EditableSyntax $value): this {
    return new self(
      $this->_keyword,
      $this->_left_paren,
      $this->_fields,
      $this->_ellipsis,
      $value,
    );
  }
}

final class ShapeExpression extends EditableSyntax {

  private EditableSyntax $_keyword;
  private EditableSyntax $_left_paren;
  private EditableSyntax $_fields;
  private EditableSyntax $_right_paren;

  public function __construct(
    EditableSyntax $keyword,
    EditableSyntax $left_paren,
    EditableSyntax $fields,
    EditableSyntax $right_paren,
  ) {
    parent::__construct('shape_expression');
    $this->_keyword = $keyword;
    $this->_left_paren = $left_paren;
    $this->_fields = $fields;
    $this->_right_paren = $right_paren;
  }

  public static function from_json(
    array<string, mixed> $json,
    int $position,
    string $source,
  ): this {
    $keyword = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['shape_expression_keyword'],
      $position,
      $source,
    );
    $position += $keyword->width();
    $left_paren = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['shape_expression_left_paren'],
      $position,
      $source,
    );
    $position += $left_paren->width();
    $fields = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['shape_expression_fields'],
      $position,
      $source,
    );
    $position += $fields->width();
    $right_paren = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['shape_expression_right_paren'],
      $position,
      $source,
    );
    $position += $right_paren->width();
    return new self($keyword, $left_paren, $fields, $right_paren);
  }

  public function children(): KeyedTraversable<string, EditableSyntax> {
    yield 'keyword' => $this->_keyword;
    yield 'left_paren' => $this->_left_paren;
    yield 'fields' => $this->_fields;
    yield 'right_paren' => $this->_right_paren;
  }

  public function rewrite(
    self::TRewriter $rewriter,
    ?Traversable<EditableSyntax> $parents = null,
  ): EditableSyntax {
    $parents = $parents === null ? vec[] : vec($parents);
    $child_parents = $parents;
    $child_parents[] = $this;
    $keyword = $this->_keyword->rewrite($rewriter, $child_parents);
    $left_paren = $this->_left_paren->rewrite($rewriter, $child_parents);
    $fields = $this->_fields->rewrite($rewriter, $child_parents);
    $right_paren = $this->_right_paren->rewrite($rewriter, $child_parents);
    if (
      $keyword === $this->keyword() &&
      $left_paren === $this->left_paren() &&
      $fields === $this->fields() &&
      $right_paren === $this->right_paren()
    ) {
      $node = $this;
    } else {
      $node = new self($keyword, $left_paren, $fields, $right_paren);
    }
    return $rewriter($node, $parents);
  }

  public function keyword(): EditableSyntax {
    return $this->_keyword;
  }

  public function with_keyword(EditableSyntax $value): this {
    return
      new self($value, $this->_left_paren, $this->_fields, $this->_right_paren);
  }

  public function left_paren(): EditableSyntax {
    return $this->_left_paren;
  }

  public function with_left_paren(EditableSyntax $value): this {
    return
      new self($this->_keyword, $value, $this->_fields, $this->_right_paren);
  }

  public function fields(): EditableSyntax {
    return $this->_fields;
  }

  public function with_fields(EditableSyntax $value): this {
    return new self(
      $this->_keyword,
      $this->_left_paren,
      $value,
      $this->_right_paren,
    );
  }

  public function right_paren(): EditableSyntax {
    return $this->_right_paren;
  }

  public function with_right_paren(EditableSyntax $value): this {
    return
      new self($this->_keyword, $this->_left_paren, $this->_fields, $value);
  }
}

final class TupleExpression extends EditableSyntax {

  private EditableSyntax $_keyword;
  private EditableSyntax $_left_paren;
  private EditableSyntax $_items;
  private EditableSyntax $_right_paren;

  public function __construct(
    EditableSyntax $keyword,
    EditableSyntax $left_paren,
    EditableSyntax $items,
    EditableSyntax $right_paren,
  ) {
    parent::__construct('tuple_expression');
    $this->_keyword = $keyword;
    $this->_left_paren = $left_paren;
    $this->_items = $items;
    $this->_right_paren = $right_paren;
  }

  public static function from_json(
    array<string, mixed> $json,
    int $position,
    string $source,
  ): this {
    $keyword = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['tuple_expression_keyword'],
      $position,
      $source,
    );
    $position += $keyword->width();
    $left_paren = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['tuple_expression_left_paren'],
      $position,
      $source,
    );
    $position += $left_paren->width();
    $items = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['tuple_expression_items'],
      $position,
      $source,
    );
    $position += $items->width();
    $right_paren = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['tuple_expression_right_paren'],
      $position,
      $source,
    );
    $position += $right_paren->width();
    return new self($keyword, $left_paren, $items, $right_paren);
  }

  public function children(): KeyedTraversable<string, EditableSyntax> {
    yield 'keyword' => $this->_keyword;
    yield 'left_paren' => $this->_left_paren;
    yield 'items' => $this->_items;
    yield 'right_paren' => $this->_right_paren;
  }

  public function rewrite(
    self::TRewriter $rewriter,
    ?Traversable<EditableSyntax> $parents = null,
  ): EditableSyntax {
    $parents = $parents === null ? vec[] : vec($parents);
    $child_parents = $parents;
    $child_parents[] = $this;
    $keyword = $this->_keyword->rewrite($rewriter, $child_parents);
    $left_paren = $this->_left_paren->rewrite($rewriter, $child_parents);
    $items = $this->_items->rewrite($rewriter, $child_parents);
    $right_paren = $this->_right_paren->rewrite($rewriter, $child_parents);
    if (
      $keyword === $this->keyword() &&
      $left_paren === $this->left_paren() &&
      $items === $this->items() &&
      $right_paren === $this->right_paren()
    ) {
      $node = $this;
    } else {
      $node = new self($keyword, $left_paren, $items, $right_paren);
    }
    return $rewriter($node, $parents);
  }

  public function keyword(): EditableSyntax {
    return $this->_keyword;
  }

  public function with_keyword(EditableSyntax $value): this {
    return
      new self($value, $this->_left_paren, $this->_items, $this->_right_paren);
  }

  public function left_paren(): EditableSyntax {
    return $this->_left_paren;
  }

  public function with_left_paren(EditableSyntax $value): this {
    return
      new self($this->_keyword, $value, $this->_items, $this->_right_paren);
  }

  public function items(): EditableSyntax {
    return $this->_items;
  }

  public function with_items(EditableSyntax $value): this {
    return new self(
      $this->_keyword,
      $this->_left_paren,
      $value,
      $this->_right_paren,
    );
  }

  public function right_paren(): EditableSyntax {
    return $this->_right_paren;
  }

  public function with_right_paren(EditableSyntax $value): this {
    return new self($this->_keyword, $this->_left_paren, $this->_items, $value);
  }
}

final class GenericTypeSpecifier extends EditableSyntax {

  private EditableSyntax $_class_type;
  private EditableSyntax $_argument_list;

  public function __construct(
    EditableSyntax $class_type,
    EditableSyntax $argument_list,
  ) {
    parent::__construct('generic_type_specifier');
    $this->_class_type = $class_type;
    $this->_argument_list = $argument_list;
  }

  public static function from_json(
    array<string, mixed> $json,
    int $position,
    string $source,
  ): this {
    $class_type = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['generic_class_type'],
      $position,
      $source,
    );
    $position += $class_type->width();
    $argument_list = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['generic_argument_list'],
      $position,
      $source,
    );
    $position += $argument_list->width();
    return new self($class_type, $argument_list);
  }

  public function children(): KeyedTraversable<string, EditableSyntax> {
    yield 'class_type' => $this->_class_type;
    yield 'argument_list' => $this->_argument_list;
  }

  public function rewrite(
    self::TRewriter $rewriter,
    ?Traversable<EditableSyntax> $parents = null,
  ): EditableSyntax {
    $parents = $parents === null ? vec[] : vec($parents);
    $child_parents = $parents;
    $child_parents[] = $this;
    $class_type = $this->_class_type->rewrite($rewriter, $child_parents);
    $argument_list = $this->_argument_list->rewrite($rewriter, $child_parents);
    if (
      $class_type === $this->class_type() &&
      $argument_list === $this->argument_list()
    ) {
      $node = $this;
    } else {
      $node = new self($class_type, $argument_list);
    }
    return $rewriter($node, $parents);
  }

  public function class_type(): EditableSyntax {
    return $this->_class_type;
  }

  public function with_class_type(EditableSyntax $value): this {
    return new self($value, $this->_argument_list);
  }

  public function argument_list(): EditableSyntax {
    return $this->_argument_list;
  }

  public function with_argument_list(EditableSyntax $value): this {
    return new self($this->_class_type, $value);
  }
}

final class NullableTypeSpecifier extends EditableSyntax {

  private EditableSyntax $_question;
  private EditableSyntax $_type;

  public function __construct(EditableSyntax $question, EditableSyntax $type) {
    parent::__construct('nullable_type_specifier');
    $this->_question = $question;
    $this->_type = $type;
  }

  public static function from_json(
    array<string, mixed> $json,
    int $position,
    string $source,
  ): this {
    $question = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['nullable_question'],
      $position,
      $source,
    );
    $position += $question->width();
    $type = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['nullable_type'],
      $position,
      $source,
    );
    $position += $type->width();
    return new self($question, $type);
  }

  public function children(): KeyedTraversable<string, EditableSyntax> {
    yield 'question' => $this->_question;
    yield 'type' => $this->_type;
  }

  public function rewrite(
    self::TRewriter $rewriter,
    ?Traversable<EditableSyntax> $parents = null,
  ): EditableSyntax {
    $parents = $parents === null ? vec[] : vec($parents);
    $child_parents = $parents;
    $child_parents[] = $this;
    $question = $this->_question->rewrite($rewriter, $child_parents);
    $type = $this->_type->rewrite($rewriter, $child_parents);
    if ($question === $this->question() && $type === $this->type()) {
      $node = $this;
    } else {
      $node = new self($question, $type);
    }
    return $rewriter($node, $parents);
  }

  public function question(): EditableSyntax {
    return $this->_question;
  }

  public function with_question(EditableSyntax $value): this {
    return new self($value, $this->_type);
  }

  public function type(): EditableSyntax {
    return $this->_type;
  }

  public function with_type(EditableSyntax $value): this {
    return new self($this->_question, $value);
  }
}

final class SoftTypeSpecifier extends EditableSyntax {

  private EditableSyntax $_at;
  private EditableSyntax $_type;

  public function __construct(EditableSyntax $at, EditableSyntax $type) {
    parent::__construct('soft_type_specifier');
    $this->_at = $at;
    $this->_type = $type;
  }

  public static function from_json(
    array<string, mixed> $json,
    int $position,
    string $source,
  ): this {
    $at = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['soft_at'],
      $position,
      $source,
    );
    $position += $at->width();
    $type = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['soft_type'],
      $position,
      $source,
    );
    $position += $type->width();
    return new self($at, $type);
  }

  public function children(): KeyedTraversable<string, EditableSyntax> {
    yield 'at' => $this->_at;
    yield 'type' => $this->_type;
  }

  public function rewrite(
    self::TRewriter $rewriter,
    ?Traversable<EditableSyntax> $parents = null,
  ): EditableSyntax {
    $parents = $parents === null ? vec[] : vec($parents);
    $child_parents = $parents;
    $child_parents[] = $this;
    $at = $this->_at->rewrite($rewriter, $child_parents);
    $type = $this->_type->rewrite($rewriter, $child_parents);
    if ($at === $this->at() && $type === $this->type()) {
      $node = $this;
    } else {
      $node = new self($at, $type);
    }
    return $rewriter($node, $parents);
  }

  public function at(): EditableSyntax {
    return $this->_at;
  }

  public function with_at(EditableSyntax $value): this {
    return new self($value, $this->_type);
  }

  public function type(): EditableSyntax {
    return $this->_type;
  }

  public function with_type(EditableSyntax $value): this {
    return new self($this->_at, $value);
  }
}

final class TypeArguments extends EditableSyntax {

  private EditableSyntax $_left_angle;
  private EditableSyntax $_types;
  private EditableSyntax $_right_angle;

  public function __construct(
    EditableSyntax $left_angle,
    EditableSyntax $types,
    EditableSyntax $right_angle,
  ) {
    parent::__construct('type_arguments');
    $this->_left_angle = $left_angle;
    $this->_types = $types;
    $this->_right_angle = $right_angle;
  }

  public static function from_json(
    array<string, mixed> $json,
    int $position,
    string $source,
  ): this {
    $left_angle = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['type_arguments_left_angle'],
      $position,
      $source,
    );
    $position += $left_angle->width();
    $types = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['type_arguments_types'],
      $position,
      $source,
    );
    $position += $types->width();
    $right_angle = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['type_arguments_right_angle'],
      $position,
      $source,
    );
    $position += $right_angle->width();
    return new self($left_angle, $types, $right_angle);
  }

  public function children(): KeyedTraversable<string, EditableSyntax> {
    yield 'left_angle' => $this->_left_angle;
    yield 'types' => $this->_types;
    yield 'right_angle' => $this->_right_angle;
  }

  public function rewrite(
    self::TRewriter $rewriter,
    ?Traversable<EditableSyntax> $parents = null,
  ): EditableSyntax {
    $parents = $parents === null ? vec[] : vec($parents);
    $child_parents = $parents;
    $child_parents[] = $this;
    $left_angle = $this->_left_angle->rewrite($rewriter, $child_parents);
    $types = $this->_types->rewrite($rewriter, $child_parents);
    $right_angle = $this->_right_angle->rewrite($rewriter, $child_parents);
    if (
      $left_angle === $this->left_angle() &&
      $types === $this->types() &&
      $right_angle === $this->right_angle()
    ) {
      $node = $this;
    } else {
      $node = new self($left_angle, $types, $right_angle);
    }
    return $rewriter($node, $parents);
  }

  public function left_angle(): EditableSyntax {
    return $this->_left_angle;
  }

  public function with_left_angle(EditableSyntax $value): this {
    return new self($value, $this->_types, $this->_right_angle);
  }

  public function types(): EditableSyntax {
    return $this->_types;
  }

  public function with_types(EditableSyntax $value): this {
    return new self($this->_left_angle, $value, $this->_right_angle);
  }

  public function right_angle(): EditableSyntax {
    return $this->_right_angle;
  }

  public function with_right_angle(EditableSyntax $value): this {
    return new self($this->_left_angle, $this->_types, $value);
  }
}

final class TypeParameters extends EditableSyntax {

  private EditableSyntax $_left_angle;
  private EditableSyntax $_parameters;
  private EditableSyntax $_right_angle;

  public function __construct(
    EditableSyntax $left_angle,
    EditableSyntax $parameters,
    EditableSyntax $right_angle,
  ) {
    parent::__construct('type_parameters');
    $this->_left_angle = $left_angle;
    $this->_parameters = $parameters;
    $this->_right_angle = $right_angle;
  }

  public static function from_json(
    array<string, mixed> $json,
    int $position,
    string $source,
  ): this {
    $left_angle = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['type_parameters_left_angle'],
      $position,
      $source,
    );
    $position += $left_angle->width();
    $parameters = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['type_parameters_parameters'],
      $position,
      $source,
    );
    $position += $parameters->width();
    $right_angle = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['type_parameters_right_angle'],
      $position,
      $source,
    );
    $position += $right_angle->width();
    return new self($left_angle, $parameters, $right_angle);
  }

  public function children(): KeyedTraversable<string, EditableSyntax> {
    yield 'left_angle' => $this->_left_angle;
    yield 'parameters' => $this->_parameters;
    yield 'right_angle' => $this->_right_angle;
  }

  public function rewrite(
    self::TRewriter $rewriter,
    ?Traversable<EditableSyntax> $parents = null,
  ): EditableSyntax {
    $parents = $parents === null ? vec[] : vec($parents);
    $child_parents = $parents;
    $child_parents[] = $this;
    $left_angle = $this->_left_angle->rewrite($rewriter, $child_parents);
    $parameters = $this->_parameters->rewrite($rewriter, $child_parents);
    $right_angle = $this->_right_angle->rewrite($rewriter, $child_parents);
    if (
      $left_angle === $this->left_angle() &&
      $parameters === $this->parameters() &&
      $right_angle === $this->right_angle()
    ) {
      $node = $this;
    } else {
      $node = new self($left_angle, $parameters, $right_angle);
    }
    return $rewriter($node, $parents);
  }

  public function left_angle(): EditableSyntax {
    return $this->_left_angle;
  }

  public function with_left_angle(EditableSyntax $value): this {
    return new self($value, $this->_parameters, $this->_right_angle);
  }

  public function parameters(): EditableSyntax {
    return $this->_parameters;
  }

  public function with_parameters(EditableSyntax $value): this {
    return new self($this->_left_angle, $value, $this->_right_angle);
  }

  public function right_angle(): EditableSyntax {
    return $this->_right_angle;
  }

  public function with_right_angle(EditableSyntax $value): this {
    return new self($this->_left_angle, $this->_parameters, $value);
  }
}

final class TupleTypeSpecifier extends EditableSyntax {

  private EditableSyntax $_left_paren;
  private EditableSyntax $_types;
  private EditableSyntax $_right_paren;

  public function __construct(
    EditableSyntax $left_paren,
    EditableSyntax $types,
    EditableSyntax $right_paren,
  ) {
    parent::__construct('tuple_type_specifier');
    $this->_left_paren = $left_paren;
    $this->_types = $types;
    $this->_right_paren = $right_paren;
  }

  public static function from_json(
    array<string, mixed> $json,
    int $position,
    string $source,
  ): this {
    $left_paren = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['tuple_left_paren'],
      $position,
      $source,
    );
    $position += $left_paren->width();
    $types = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['tuple_types'],
      $position,
      $source,
    );
    $position += $types->width();
    $right_paren = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['tuple_right_paren'],
      $position,
      $source,
    );
    $position += $right_paren->width();
    return new self($left_paren, $types, $right_paren);
  }

  public function children(): KeyedTraversable<string, EditableSyntax> {
    yield 'left_paren' => $this->_left_paren;
    yield 'types' => $this->_types;
    yield 'right_paren' => $this->_right_paren;
  }

  public function rewrite(
    self::TRewriter $rewriter,
    ?Traversable<EditableSyntax> $parents = null,
  ): EditableSyntax {
    $parents = $parents === null ? vec[] : vec($parents);
    $child_parents = $parents;
    $child_parents[] = $this;
    $left_paren = $this->_left_paren->rewrite($rewriter, $child_parents);
    $types = $this->_types->rewrite($rewriter, $child_parents);
    $right_paren = $this->_right_paren->rewrite($rewriter, $child_parents);
    if (
      $left_paren === $this->left_paren() &&
      $types === $this->types() &&
      $right_paren === $this->right_paren()
    ) {
      $node = $this;
    } else {
      $node = new self($left_paren, $types, $right_paren);
    }
    return $rewriter($node, $parents);
  }

  public function left_paren(): EditableSyntax {
    return $this->_left_paren;
  }

  public function with_left_paren(EditableSyntax $value): this {
    return new self($value, $this->_types, $this->_right_paren);
  }

  public function types(): EditableSyntax {
    return $this->_types;
  }

  public function with_types(EditableSyntax $value): this {
    return new self($this->_left_paren, $value, $this->_right_paren);
  }

  public function right_paren(): EditableSyntax {
    return $this->_right_paren;
  }

  public function with_right_paren(EditableSyntax $value): this {
    return new self($this->_left_paren, $this->_types, $value);
  }
}

final class ErrorSyntax extends EditableSyntax {

  private EditableSyntax $_error;

  public function __construct(EditableSyntax $error) {
    parent::__construct('error');
    $this->_error = $error;
  }

  public static function from_json(
    array<string, mixed> $json,
    int $position,
    string $source,
  ): this {
    $error = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['error_error'],
      $position,
      $source,
    );
    $position += $error->width();
    return new self($error);
  }

  public function children(): KeyedTraversable<string, EditableSyntax> {
    yield 'error' => $this->_error;
  }

  public function rewrite(
    self::TRewriter $rewriter,
    ?Traversable<EditableSyntax> $parents = null,
  ): EditableSyntax {
    $parents = $parents === null ? vec[] : vec($parents);
    $child_parents = $parents;
    $child_parents[] = $this;
    $error = $this->_error->rewrite($rewriter, $child_parents);
    if ($error === $this->error()) {
      $node = $this;
    } else {
      $node = new self($error);
    }
    return $rewriter($node, $parents);
  }

  public function error(): EditableSyntax {
    return $this->_error;
  }

  public function with_error(EditableSyntax $value): this {
    return new self($value);
  }
}

final class ListItem extends EditableSyntax {

  private EditableSyntax $_item;
  private EditableSyntax $_separator;

  public function __construct(EditableSyntax $item, EditableSyntax $separator) {
    parent::__construct('list_item');
    $this->_item = $item;
    $this->_separator = $separator;
  }

  public static function from_json(
    array<string, mixed> $json,
    int $position,
    string $source,
  ): this {
    $item = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['list_item'],
      $position,
      $source,
    );
    $position += $item->width();
    $separator = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['list_separator'],
      $position,
      $source,
    );
    $position += $separator->width();
    return new self($item, $separator);
  }

  public function children(): KeyedTraversable<string, EditableSyntax> {
    yield 'item' => $this->_item;
    yield 'separator' => $this->_separator;
  }

  public function rewrite(
    self::TRewriter $rewriter,
    ?Traversable<EditableSyntax> $parents = null,
  ): EditableSyntax {
    $parents = $parents === null ? vec[] : vec($parents);
    $child_parents = $parents;
    $child_parents[] = $this;
    $item = $this->_item->rewrite($rewriter, $child_parents);
    $separator = $this->_separator->rewrite($rewriter, $child_parents);
    if ($item === $this->item() && $separator === $this->separator()) {
      $node = $this;
    } else {
      $node = new self($item, $separator);
    }
    return $rewriter($node, $parents);
  }

  public function item(): EditableSyntax {
    return $this->_item;
  }

  public function with_item(EditableSyntax $value): this {
    return new self($value, $this->_separator);
  }

  public function separator(): EditableSyntax {
    return $this->_separator;
  }

  public function with_separator(EditableSyntax $value): this {
    return new self($this->_item, $value);
  }
}
