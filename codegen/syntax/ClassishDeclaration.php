<?hh
/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<db9b425ab68642792b58eb8961896028>>
 */
namespace Facebook\HHAST;
use type Facebook\TypeAssert\TypeAssert;

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

  public function rewrite_children(
    self::TRewriter $rewriter,
    ?Traversable<EditableSyntax> $parents = null,
  ): this {
    $parents = $parents === null ? vec[] : vec($parents);
    $parents[] = $this;
    $attribute = $this->_attribute->rewrite($rewriter, $parents);
    $modifiers = $this->_modifiers->rewrite($rewriter, $parents);
    $keyword = $this->_keyword->rewrite($rewriter, $parents);
    $name = $this->_name->rewrite($rewriter, $parents);
    $type_parameters = $this->_type_parameters->rewrite($rewriter, $parents);
    $extends_keyword = $this->_extends_keyword->rewrite($rewriter, $parents);
    $extends_list = $this->_extends_list->rewrite($rewriter, $parents);
    $implements_keyword = $this->_implements_keyword->rewrite($rewriter, $parents);
    $implements_list = $this->_implements_list->rewrite($rewriter, $parents);
    $body = $this->_body->rewrite($rewriter, $parents);
    if (
      $attribute === $this->_attribute &&
      $modifiers === $this->_modifiers &&
      $keyword === $this->_keyword &&
      $name === $this->_name &&
      $type_parameters === $this->_type_parameters &&
      $extends_keyword === $this->_extends_keyword &&
      $extends_list === $this->_extends_list &&
      $implements_keyword === $this->_implements_keyword &&
      $implements_list === $this->_implements_list &&
      $body === $this->_body
    ) {
      return $this;
    }
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

  public function raw_attribute(): EditableSyntax {
    return $this->_attribute;
  }

  public function with_attribute(EditableSyntax $value): this {
    if ($value === $this->_attribute) {
      return $this;
    }
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

  public function attribute(): ?AttributeSpecification {
    if ($this->_attribute->is_missing()) {
      return null;
    }
    return TypeAssert::isInstanceOf(AttributeSpecification::class, $this->_attribute);
  }

  public function attributex(): AttributeSpecification {
    return TypeAssert::isInstanceOf(AttributeSpecification::class, $this->_attribute);
  }

  public function raw_modifiers(): EditableSyntax {
    return $this->_modifiers;
  }

  public function with_modifiers(EditableSyntax $value): this {
    if ($value === $this->_modifiers) {
      return $this;
    }
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

  public function modifiers(): ?EditableList {
    if ($this->_modifiers->is_missing()) {
      return null;
    }
    return TypeAssert::isInstanceOf(EditableList::class, $this->_modifiers);
  }

  public function modifiersx(): EditableList {
    return TypeAssert::isInstanceOf(EditableList::class, $this->_modifiers);
  }

  public function raw_keyword(): EditableSyntax {
    return $this->_keyword;
  }

  public function with_keyword(EditableSyntax $value): this {
    if ($value === $this->_keyword) {
      return $this;
    }
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

  public function keyword(): EditableSyntax {
    return TypeAssert::isInstanceOf(EditableSyntax::class, $this->_keyword);
  }

  public function raw_name(): EditableSyntax {
    return $this->_name;
  }

  public function with_name(EditableSyntax $value): this {
    if ($value === $this->_name) {
      return $this;
    }
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

  public function name(): EditableSyntax {
    return TypeAssert::isInstanceOf(EditableSyntax::class, $this->_name);
  }

  public function raw_type_parameters(): EditableSyntax {
    return $this->_type_parameters;
  }

  public function with_type_parameters(EditableSyntax $value): this {
    if ($value === $this->_type_parameters) {
      return $this;
    }
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

  public function type_parameters(): ?TypeParameters {
    if ($this->_type_parameters->is_missing()) {
      return null;
    }
    return TypeAssert::isInstanceOf(TypeParameters::class, $this->_type_parameters);
  }

  public function type_parametersx(): TypeParameters {
    return TypeAssert::isInstanceOf(TypeParameters::class, $this->_type_parameters);
  }

  public function raw_extends_keyword(): EditableSyntax {
    return $this->_extends_keyword;
  }

  public function with_extends_keyword(EditableSyntax $value): this {
    if ($value === $this->_extends_keyword) {
      return $this;
    }
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

  public function extends_keyword(): ?ExtendsToken {
    if ($this->_extends_keyword->is_missing()) {
      return null;
    }
    return TypeAssert::isInstanceOf(ExtendsToken::class, $this->_extends_keyword);
  }

  public function extends_keywordx(): ExtendsToken {
    return TypeAssert::isInstanceOf(ExtendsToken::class, $this->_extends_keyword);
  }

  public function raw_extends_list(): EditableSyntax {
    return $this->_extends_list;
  }

  public function with_extends_list(EditableSyntax $value): this {
    if ($value === $this->_extends_list) {
      return $this;
    }
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

  public function extends_list(): ?EditableList {
    if ($this->_extends_list->is_missing()) {
      return null;
    }
    return TypeAssert::isInstanceOf(EditableList::class, $this->_extends_list);
  }

  public function extends_listx(): EditableList {
    return TypeAssert::isInstanceOf(EditableList::class, $this->_extends_list);
  }

  public function raw_implements_keyword(): EditableSyntax {
    return $this->_implements_keyword;
  }

  public function with_implements_keyword(EditableSyntax $value): this {
    if ($value === $this->_implements_keyword) {
      return $this;
    }
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

  public function implements_keyword(): ?ImplementsToken {
    if ($this->_implements_keyword->is_missing()) {
      return null;
    }
    return TypeAssert::isInstanceOf(ImplementsToken::class, $this->_implements_keyword);
  }

  public function implements_keywordx(): ImplementsToken {
    return TypeAssert::isInstanceOf(ImplementsToken::class, $this->_implements_keyword);
  }

  public function raw_implements_list(): EditableSyntax {
    return $this->_implements_list;
  }

  public function with_implements_list(EditableSyntax $value): this {
    if ($value === $this->_implements_list) {
      return $this;
    }
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

  public function implements_list(): ?EditableList {
    if ($this->_implements_list->is_missing()) {
      return null;
    }
    return TypeAssert::isInstanceOf(EditableList::class, $this->_implements_list);
  }

  public function implements_listx(): EditableList {
    return TypeAssert::isInstanceOf(EditableList::class, $this->_implements_list);
  }

  public function raw_body(): EditableSyntax {
    return $this->_body;
  }

  public function with_body(EditableSyntax $value): this {
    if ($value === $this->_body) {
      return $this;
    }
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

  public function body(): ClassishBody {
    return TypeAssert::isInstanceOf(ClassishBody::class, $this->_body);
  }
}
