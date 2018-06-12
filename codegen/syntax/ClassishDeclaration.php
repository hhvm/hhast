<?hh // strict
/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<aacc19a02f718f9debd29967252ab4da>>
 */
namespace Facebook\HHAST;
use namespace Facebook\TypeAssert;

<<__ConsistentConstruct>>
final class ClassishDeclaration extends EditableNode {

  private EditableNode $_attribute;
  private EditableNode $_modifiers;
  private EditableNode $_keyword;
  private EditableNode $_name;
  private EditableNode $_type_parameters;
  private EditableNode $_extends_keyword;
  private EditableNode $_extends_list;
  private EditableNode $_implements_keyword;
  private EditableNode $_implements_list;
  private EditableNode $_body;

  public function __construct(
    EditableNode $attribute,
    EditableNode $modifiers,
    EditableNode $keyword,
    EditableNode $name,
    EditableNode $type_parameters,
    EditableNode $extends_keyword,
    EditableNode $extends_list,
    EditableNode $implements_keyword,
    EditableNode $implements_list,
    EditableNode $body,
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
    string $file,
    int $offset,
    string $source,
  ): this {
    $attribute = EditableNode::fromJSON(
      /* UNSAFE_EXPR */ $json['classish_attribute'],
      $file,
      $offset,
      $source,
    );
    $offset += $attribute->getWidth();
    $modifiers = EditableNode::fromJSON(
      /* UNSAFE_EXPR */ $json['classish_modifiers'],
      $file,
      $offset,
      $source,
    );
    $offset += $modifiers->getWidth();
    $keyword = EditableNode::fromJSON(
      /* UNSAFE_EXPR */ $json['classish_keyword'],
      $file,
      $offset,
      $source,
    );
    $offset += $keyword->getWidth();
    $name = EditableNode::fromJSON(
      /* UNSAFE_EXPR */ $json['classish_name'],
      $file,
      $offset,
      $source,
    );
    $offset += $name->getWidth();
    $type_parameters = EditableNode::fromJSON(
      /* UNSAFE_EXPR */ $json['classish_type_parameters'],
      $file,
      $offset,
      $source,
    );
    $offset += $type_parameters->getWidth();
    $extends_keyword = EditableNode::fromJSON(
      /* UNSAFE_EXPR */ $json['classish_extends_keyword'],
      $file,
      $offset,
      $source,
    );
    $offset += $extends_keyword->getWidth();
    $extends_list = EditableNode::fromJSON(
      /* UNSAFE_EXPR */ $json['classish_extends_list'],
      $file,
      $offset,
      $source,
    );
    $offset += $extends_list->getWidth();
    $implements_keyword = EditableNode::fromJSON(
      /* UNSAFE_EXPR */ $json['classish_implements_keyword'],
      $file,
      $offset,
      $source,
    );
    $offset += $implements_keyword->getWidth();
    $implements_list = EditableNode::fromJSON(
      /* UNSAFE_EXPR */ $json['classish_implements_list'],
      $file,
      $offset,
      $source,
    );
    $offset += $implements_list->getWidth();
    $body = EditableNode::fromJSON(
      /* UNSAFE_EXPR */ $json['classish_body'],
      $file,
      $offset,
      $source,
    );
    $offset += $body->getWidth();
    return new static(
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
  public function getChildren(): dict<string, EditableNode> {
    return dict[
      'attribute' => $this->_attribute,
      'modifiers' => $this->_modifiers,
      'keyword' => $this->_keyword,
      'name' => $this->_name,
      'type_parameters' => $this->_type_parameters,
      'extends_keyword' => $this->_extends_keyword,
      'extends_list' => $this->_extends_list,
      'implements_keyword' => $this->_implements_keyword,
      'implements_list' => $this->_implements_list,
      'body' => $this->_body,
    ];
  }

  <<__Override>>
  public function rewriteDescendants(
    self::TRewriter $rewriter,
    ?vec<EditableNode> $parents = null,
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
    return new static(
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

  public function getAttributeUNTYPED(): EditableNode {
    return $this->_attribute;
  }

  public function withAttribute(EditableNode $value): this {
    if ($value === $this->_attribute) {
      return $this;
    }
    return new static(
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
   * @returns AttributeSpecification | Missing
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

  public function getModifiersUNTYPED(): EditableNode {
    return $this->_modifiers;
  }

  public function withModifiers(EditableNode $value): this {
    if ($value === $this->_modifiers) {
      return $this;
    }
    return new static(
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
   * @returns EditableList | Missing
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

  public function getKeywordUNTYPED(): EditableNode {
    return $this->_keyword;
  }

  public function withKeyword(EditableNode $value): this {
    if ($value === $this->_keyword) {
      return $this;
    }
    return new static(
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
   * @returns ClassToken | InterfaceToken | TraitToken
   */
  public function getKeyword(): EditableToken {
    return TypeAssert\instance_of(EditableToken::class, $this->_keyword);
  }

  /**
   * @returns ClassToken | InterfaceToken | TraitToken
   */
  public function getKeywordx(): EditableToken {
    return $this->getKeyword();
  }

  public function getNameUNTYPED(): EditableNode {
    return $this->_name;
  }

  public function withName(EditableNode $value): this {
    if ($value === $this->_name) {
      return $this;
    }
    return new static(
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
   * @returns XHPClassNameToken | NameToken
   */
  public function getName(): EditableToken {
    return TypeAssert\instance_of(EditableToken::class, $this->_name);
  }

  /**
   * @returns XHPClassNameToken | NameToken
   */
  public function getNamex(): EditableToken {
    return $this->getName();
  }

  public function getTypeParametersUNTYPED(): EditableNode {
    return $this->_type_parameters;
  }

  public function withTypeParameters(EditableNode $value): this {
    if ($value === $this->_type_parameters) {
      return $this;
    }
    return new static(
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

  public function getExtendsKeywordUNTYPED(): EditableNode {
    return $this->_extends_keyword;
  }

  public function withExtendsKeyword(EditableNode $value): this {
    if ($value === $this->_extends_keyword) {
      return $this;
    }
    return new static(
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

  public function getExtendsListUNTYPED(): EditableNode {
    return $this->_extends_list;
  }

  public function withExtendsList(EditableNode $value): this {
    if ($value === $this->_extends_list) {
      return $this;
    }
    return new static(
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
   * @returns EditableList | Missing
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

  public function getImplementsKeywordUNTYPED(): EditableNode {
    return $this->_implements_keyword;
  }

  public function withImplementsKeyword(EditableNode $value): this {
    if ($value === $this->_implements_keyword) {
      return $this;
    }
    return new static(
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

  public function getImplementsListUNTYPED(): EditableNode {
    return $this->_implements_list;
  }

  public function withImplementsList(EditableNode $value): this {
    if ($value === $this->_implements_list) {
      return $this;
    }
    return new static(
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
   * @returns EditableList | Missing
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

  public function getBodyUNTYPED(): EditableNode {
    return $this->_body;
  }

  public function withBody(EditableNode $value): this {
    if ($value === $this->_body) {
      return $this;
    }
    return new static(
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

  /**
   * @returns ClassishBody
   */
  public function getBodyx(): ClassishBody {
    return $this->getBody();
  }
}
