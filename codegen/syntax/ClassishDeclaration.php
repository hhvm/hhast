<?hh // strict
/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<2e629903ab173a747663bcb57fffe7c0>>
 */
namespace Facebook\HHAST;
use namespace Facebook\TypeAssert;

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

  <<__Override>>
  public static function fromJSON(
    dict<string, mixed> $json,
    int $position,
    string $source,
  ): this {
    $attribute = EditableSyntax::fromJSON(
      /* UNSAFE_EXPR */ $json['classish_attribute'],
      $position,
      $source,
    );
    $position += $attribute->getWidth();
    $modifiers = EditableSyntax::fromJSON(
      /* UNSAFE_EXPR */ $json['classish_modifiers'],
      $position,
      $source,
    );
    $position += $modifiers->getWidth();
    $keyword = EditableSyntax::fromJSON(
      /* UNSAFE_EXPR */ $json['classish_keyword'],
      $position,
      $source,
    );
    $position += $keyword->getWidth();
    $name = EditableSyntax::fromJSON(
      /* UNSAFE_EXPR */ $json['classish_name'],
      $position,
      $source,
    );
    $position += $name->getWidth();
    $type_parameters = EditableSyntax::fromJSON(
      /* UNSAFE_EXPR */ $json['classish_type_parameters'],
      $position,
      $source,
    );
    $position += $type_parameters->getWidth();
    $extends_keyword = EditableSyntax::fromJSON(
      /* UNSAFE_EXPR */ $json['classish_extends_keyword'],
      $position,
      $source,
    );
    $position += $extends_keyword->getWidth();
    $extends_list = EditableSyntax::fromJSON(
      /* UNSAFE_EXPR */ $json['classish_extends_list'],
      $position,
      $source,
    );
    $position += $extends_list->getWidth();
    $implements_keyword = EditableSyntax::fromJSON(
      /* UNSAFE_EXPR */ $json['classish_implements_keyword'],
      $position,
      $source,
    );
    $position += $implements_keyword->getWidth();
    $implements_list = EditableSyntax::fromJSON(
      /* UNSAFE_EXPR */ $json['classish_implements_list'],
      $position,
      $source,
    );
    $position += $implements_list->getWidth();
    $body = EditableSyntax::fromJSON(
      /* UNSAFE_EXPR */ $json['classish_body'],
      $position,
      $source,
    );
    $position += $body->getWidth();
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

  <<__Override>>
  public function getChildren(): KeyedTraversable<string, EditableSyntax> {
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

  <<__Override>>
  public function rewriteDescendants(
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
    $implements_keyword =
      $this->_implements_keyword->rewrite($rewriter, $parents);
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

  public function getAttributeUNTYPED(): EditableSyntax {
    return $this->_attribute;
  }

  public function withAttribute(EditableSyntax $value): this {
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

  public function hasAttribute(): bool {
    return !$this->_attribute->isMissing();
  }

  /**
   * @returns Missing | AttributeSpecification
   */
  public function getAttribute(): ?AttributeSpecification {
    if ($this->_attribute->isMissing()) {
      return null;
    }
    return
      TypeAssert\instance_of(AttributeSpecification::class, $this->_attribute);
  }

  /**
   * @returns AttributeSpecification
   */
  public function getAttributex(): AttributeSpecification {
    return
      TypeAssert\instance_of(AttributeSpecification::class, $this->_attribute);
  }

  public function getModifiersUNTYPED(): EditableSyntax {
    return $this->_modifiers;
  }

  public function withModifiers(EditableSyntax $value): this {
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

  public function hasModifiers(): bool {
    return !$this->_modifiers->isMissing();
  }

  /**
   * @returns Missing | EditableList
   */
  public function getModifiers(): ?EditableList {
    if ($this->_modifiers->isMissing()) {
      return null;
    }
    return TypeAssert\instance_of(EditableList::class, $this->_modifiers);
  }

  /**
   * @returns EditableList
   */
  public function getModifiersx(): EditableList {
    return TypeAssert\instance_of(EditableList::class, $this->_modifiers);
  }

  public function getKeywordUNTYPED(): EditableSyntax {
    return $this->_keyword;
  }

  public function withKeyword(EditableSyntax $value): this {
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

  public function hasKeyword(): bool {
    return !$this->_keyword->isMissing();
  }

  /**
   * @returns ClassToken | TraitToken | InterfaceToken | Missing
   */
  public function getKeyword(): ?EditableToken {
    if ($this->_keyword->isMissing()) {
      return null;
    }
    return TypeAssert\instance_of(EditableToken::class, $this->_keyword);
  }

  /**
   * @returns ClassToken | TraitToken | InterfaceToken
   */
  public function getKeywordx(): EditableToken {
    return TypeAssert\instance_of(EditableToken::class, $this->_keyword);
  }

  public function getNameUNTYPED(): EditableSyntax {
    return $this->_name;
  }

  public function withName(EditableSyntax $value): this {
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

  public function hasName(): bool {
    return !$this->_name->isMissing();
  }

  /**
   * @returns NameToken | XHPClassNameToken
   */
  public function getName(): EditableToken {
    return TypeAssert\instance_of(EditableToken::class, $this->_name);
  }

  public function getTypeParametersUNTYPED(): EditableSyntax {
    return $this->_type_parameters;
  }

  public function withTypeParameters(EditableSyntax $value): this {
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

  public function hasTypeParameters(): bool {
    return !$this->_type_parameters->isMissing();
  }

  /**
   * @returns Missing | TypeParameters
   */
  public function getTypeParameters(): ?TypeParameters {
    if ($this->_type_parameters->isMissing()) {
      return null;
    }
    return
      TypeAssert\instance_of(TypeParameters::class, $this->_type_parameters);
  }

  /**
   * @returns TypeParameters
   */
  public function getTypeParametersx(): TypeParameters {
    return
      TypeAssert\instance_of(TypeParameters::class, $this->_type_parameters);
  }

  public function getExtendsKeywordUNTYPED(): EditableSyntax {
    return $this->_extends_keyword;
  }

  public function withExtendsKeyword(EditableSyntax $value): this {
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

  public function hasExtendsKeyword(): bool {
    return !$this->_extends_keyword->isMissing();
  }

  /**
   * @returns Missing | ExtendsToken
   */
  public function getExtendsKeyword(): ?ExtendsToken {
    if ($this->_extends_keyword->isMissing()) {
      return null;
    }
    return TypeAssert\instance_of(ExtendsToken::class, $this->_extends_keyword);
  }

  /**
   * @returns ExtendsToken
   */
  public function getExtendsKeywordx(): ExtendsToken {
    return TypeAssert\instance_of(ExtendsToken::class, $this->_extends_keyword);
  }

  public function getExtendsListUNTYPED(): EditableSyntax {
    return $this->_extends_list;
  }

  public function withExtendsList(EditableSyntax $value): this {
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

  public function hasExtendsList(): bool {
    return !$this->_extends_list->isMissing();
  }

  /**
   * @returns Missing | EditableList
   */
  public function getExtendsList(): ?EditableList {
    if ($this->_extends_list->isMissing()) {
      return null;
    }
    return TypeAssert\instance_of(EditableList::class, $this->_extends_list);
  }

  /**
   * @returns EditableList
   */
  public function getExtendsListx(): EditableList {
    return TypeAssert\instance_of(EditableList::class, $this->_extends_list);
  }

  public function getImplementsKeywordUNTYPED(): EditableSyntax {
    return $this->_implements_keyword;
  }

  public function withImplementsKeyword(EditableSyntax $value): this {
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

  public function hasImplementsKeyword(): bool {
    return !$this->_implements_keyword->isMissing();
  }

  /**
   * @returns Missing | ImplementsToken
   */
  public function getImplementsKeyword(): ?ImplementsToken {
    if ($this->_implements_keyword->isMissing()) {
      return null;
    }
    return TypeAssert\instance_of(
      ImplementsToken::class,
      $this->_implements_keyword,
    );
  }

  /**
   * @returns ImplementsToken
   */
  public function getImplementsKeywordx(): ImplementsToken {
    return TypeAssert\instance_of(
      ImplementsToken::class,
      $this->_implements_keyword,
    );
  }

  public function getImplementsListUNTYPED(): EditableSyntax {
    return $this->_implements_list;
  }

  public function withImplementsList(EditableSyntax $value): this {
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

  public function hasImplementsList(): bool {
    return !$this->_implements_list->isMissing();
  }

  /**
   * @returns Missing | EditableList
   */
  public function getImplementsList(): ?EditableList {
    if ($this->_implements_list->isMissing()) {
      return null;
    }
    return TypeAssert\instance_of(EditableList::class, $this->_implements_list);
  }

  /**
   * @returns EditableList
   */
  public function getImplementsListx(): EditableList {
    return TypeAssert\instance_of(EditableList::class, $this->_implements_list);
  }

  public function getBodyUNTYPED(): EditableSyntax {
    return $this->_body;
  }

  public function withBody(EditableSyntax $value): this {
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

  public function hasBody(): bool {
    return !$this->_body->isMissing();
  }

  /**
   * @returns ClassishBody
   */
  public function getBody(): ClassishBody {
    return TypeAssert\instance_of(ClassishBody::class, $this->_body);
  }
}
