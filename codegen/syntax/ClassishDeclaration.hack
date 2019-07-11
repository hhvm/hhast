/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<d243e1fd785bc844e8d78dc99cc18648>>
 */
namespace Facebook\HHAST;
use namespace Facebook\TypeAssert;
use namespace HH\Lib\Dict;

<<__ConsistentConstruct>>
abstract class ClassishDeclarationGeneratedBase
  extends Node
  implements IHasAttributeSpec {

  const string SYNTAX_KIND = 'classish_declaration';

  private ?AttributeSpecification $_attribute;
  private ?NodeList<Token> $_modifiers;
  private Token $_keyword;
  private Token $_name;
  private ?TypeParameters $_type_parameters;
  private ?ExtendsToken $_extends_keyword;
  private ?NodeList<ListItem<ISimpleCreationSpecifier>> $_extends_list;
  private ?ImplementsToken $_implements_keyword;
  private ?NodeList<ListItem<ISimpleCreationSpecifier>> $_implements_list;
  private ClassishBody $_body;

  public function __construct(
    ?AttributeSpecification $attribute,
    ?NodeList<Token> $modifiers,
    Token $keyword,
    Token $name,
    ?TypeParameters $type_parameters,
    ?ExtendsToken $extends_keyword,
    ?NodeList<ListItem<ISimpleCreationSpecifier>> $extends_list,
    ?ImplementsToken $implements_keyword,
    ?NodeList<ListItem<ISimpleCreationSpecifier>> $implements_list,
    ClassishBody $body,
    ?__Private\SourceRef $source_ref = null,
  ) {
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
    parent::__construct($source_ref);
  }

  <<__Override>>
  public static function fromJSON(
    dict<string, mixed> $json,
    string $file,
    int $initial_offset,
    string $source,
    string $_type_hint,
  ): this {
    $offset = $initial_offset;
    $attribute = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['classish_attribute'],
      $file,
      $offset,
      $source,
      'AttributeSpecification',
    );
    $offset += $attribute?->getWidth() ?? 0;
    $modifiers = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['classish_modifiers'],
      $file,
      $offset,
      $source,
      'NodeList<Token>',
    );
    $offset += $modifiers?->getWidth() ?? 0;
    $keyword = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['classish_keyword'],
      $file,
      $offset,
      $source,
      'Token',
    );
    $keyword = $keyword as nonnull;
    $offset += $keyword->getWidth();
    $name = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['classish_name'],
      $file,
      $offset,
      $source,
      'Token',
    );
    $name = $name as nonnull;
    $offset += $name->getWidth();
    $type_parameters = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['classish_type_parameters'],
      $file,
      $offset,
      $source,
      'TypeParameters',
    );
    $offset += $type_parameters?->getWidth() ?? 0;
    $extends_keyword = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['classish_extends_keyword'],
      $file,
      $offset,
      $source,
      'ExtendsToken',
    );
    $offset += $extends_keyword?->getWidth() ?? 0;
    $extends_list = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['classish_extends_list'],
      $file,
      $offset,
      $source,
      'NodeList<ListItem<ISimpleCreationSpecifier>>',
    );
    $offset += $extends_list?->getWidth() ?? 0;
    $implements_keyword = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['classish_implements_keyword'],
      $file,
      $offset,
      $source,
      'ImplementsToken',
    );
    $offset += $implements_keyword?->getWidth() ?? 0;
    $implements_list = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['classish_implements_list'],
      $file,
      $offset,
      $source,
      'NodeList<ListItem<ISimpleCreationSpecifier>>',
    );
    $offset += $implements_list?->getWidth() ?? 0;
    $body = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['classish_body'],
      $file,
      $offset,
      $source,
      'ClassishBody',
    );
    $body = $body as nonnull;
    $offset += $body->getWidth();
    $source_ref = shape(
      'file' => $file,
      'source' => $source,
      'offset' => $initial_offset,
      'width' => $offset - $initial_offset,
    );
    return new static(
      /* HH_IGNORE_ERROR[4110] */ $attribute,
      /* HH_IGNORE_ERROR[4110] */ $modifiers,
      /* HH_IGNORE_ERROR[4110] */ $keyword,
      /* HH_IGNORE_ERROR[4110] */ $name,
      /* HH_IGNORE_ERROR[4110] */ $type_parameters,
      /* HH_IGNORE_ERROR[4110] */ $extends_keyword,
      /* HH_IGNORE_ERROR[4110] */ $extends_list,
      /* HH_IGNORE_ERROR[4110] */ $implements_keyword,
      /* HH_IGNORE_ERROR[4110] */ $implements_list,
      /* HH_IGNORE_ERROR[4110] */ $body,
      $source_ref,
    );
  }

  <<__Override>>
  public function getChildren(): dict<string, Node> {
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
    ]
      |> Dict\filter_nulls($$);
  }

  <<__Override>>
  public function rewriteChildren<Tret as ?Node>(
    (function(Node, vec<Node>): Tret) $rewriter,
    vec<Node> $parents = vec[],
  ): this {
    $parents[] = $this;
    $attribute = $this->_attribute === null
      ? null
      : $rewriter($this->_attribute, $parents);
    $modifiers = $this->_modifiers === null
      ? null
      : $rewriter($this->_modifiers, $parents);
    $keyword = $rewriter($this->_keyword, $parents);
    $name = $rewriter($this->_name, $parents);
    $type_parameters = $this->_type_parameters === null
      ? null
      : $rewriter($this->_type_parameters, $parents);
    $extends_keyword = $this->_extends_keyword === null
      ? null
      : $rewriter($this->_extends_keyword, $parents);
    $extends_list = $this->_extends_list === null
      ? null
      : $rewriter($this->_extends_list, $parents);
    $implements_keyword = $this->_implements_keyword === null
      ? null
      : $rewriter($this->_implements_keyword, $parents);
    $implements_list = $this->_implements_list === null
      ? null
      : $rewriter($this->_implements_list, $parents);
    $body = $rewriter($this->_body, $parents);
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
      /* HH_FIXME[4110] use `as` */ $attribute,
      /* HH_FIXME[4110] use `as` */ $modifiers,
      /* HH_FIXME[4110] use `as` */ $keyword,
      /* HH_FIXME[4110] use `as` */ $name,
      /* HH_FIXME[4110] use `as` */ $type_parameters,
      /* HH_FIXME[4110] use `as` */ $extends_keyword,
      /* HH_FIXME[4110] use `as` */ $extends_list,
      /* HH_FIXME[4110] use `as` */ $implements_keyword,
      /* HH_FIXME[4110] use `as` */ $implements_list,
      /* HH_FIXME[4110] use `as` */ $body,
    );
  }

  public function getAttributeUNTYPED(): ?Node {
    return $this->_attribute;
  }

  public function withAttribute(?AttributeSpecification $value): this {
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
    return $this->_attribute !== null;
  }

  /**
   * @return AttributeSpecification | null
   */
  public function getAttribute(): ?AttributeSpecification {
    return $this->_attribute;
  }

  /**
   * @return AttributeSpecification
   */
  public function getAttributex(): AttributeSpecification {
    return TypeAssert\not_null($this->getAttribute());
  }

  public function getModifiersUNTYPED(): ?Node {
    return $this->_modifiers;
  }

  public function withModifiers(?NodeList<Token> $value): this {
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
    return $this->_modifiers !== null;
  }

  /**
   * @return NodeList<AbstractToken> | NodeList<Token> | NodeList<FinalToken> |
   * null
   */
  public function getModifiers(): ?NodeList<Token> {
    return $this->_modifiers;
  }

  /**
   * @return NodeList<AbstractToken> | NodeList<Token> | NodeList<FinalToken>
   */
  public function getModifiersx(): NodeList<Token> {
    return TypeAssert\not_null($this->getModifiers());
  }

  public function getKeywordUNTYPED(): ?Node {
    return $this->_keyword;
  }

  public function withKeyword(Token $value): this {
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
    return $this->_keyword !== null;
  }

  /**
   * @return ClassToken | InterfaceToken | TraitToken
   */
  public function getKeyword(): Token {
    return TypeAssert\instance_of(Token::class, $this->_keyword);
  }

  /**
   * @return ClassToken | InterfaceToken | TraitToken
   */
  public function getKeywordx(): Token {
    return $this->getKeyword();
  }

  public function getNameUNTYPED(): ?Node {
    return $this->_name;
  }

  public function withName(Token $value): this {
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
    return $this->_name !== null;
  }

  /**
   * @return XHPClassNameToken | NameToken
   */
  public function getName(): Token {
    return TypeAssert\instance_of(Token::class, $this->_name);
  }

  /**
   * @return XHPClassNameToken | NameToken
   */
  public function getNamex(): Token {
    return $this->getName();
  }

  public function getTypeParametersUNTYPED(): ?Node {
    return $this->_type_parameters;
  }

  public function withTypeParameters(?TypeParameters $value): this {
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
    return $this->_type_parameters !== null;
  }

  /**
   * @return null | TypeParameters
   */
  public function getTypeParameters(): ?TypeParameters {
    return $this->_type_parameters;
  }

  /**
   * @return TypeParameters
   */
  public function getTypeParametersx(): TypeParameters {
    return TypeAssert\not_null($this->getTypeParameters());
  }

  public function getExtendsKeywordUNTYPED(): ?Node {
    return $this->_extends_keyword;
  }

  public function withExtendsKeyword(?ExtendsToken $value): this {
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
    return $this->_extends_keyword !== null;
  }

  /**
   * @return null | ExtendsToken
   */
  public function getExtendsKeyword(): ?ExtendsToken {
    return $this->_extends_keyword;
  }

  /**
   * @return ExtendsToken
   */
  public function getExtendsKeywordx(): ExtendsToken {
    return TypeAssert\not_null($this->getExtendsKeyword());
  }

  public function getExtendsListUNTYPED(): ?Node {
    return $this->_extends_list;
  }

  public function withExtendsList(
    ?NodeList<ListItem<ISimpleCreationSpecifier>> $value,
  ): this {
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
    return $this->_extends_list !== null;
  }

  /**
   * @return NodeList<ListItem<GenericTypeSpecifier>> |
   * NodeList<ListItem<ISimpleCreationSpecifier>> |
   * NodeList<ListItem<SimpleTypeSpecifier>> | null
   */
  public function getExtendsList(
  ): ?NodeList<ListItem<ISimpleCreationSpecifier>> {
    return $this->_extends_list;
  }

  /**
   * @return NodeList<ListItem<GenericTypeSpecifier>> |
   * NodeList<ListItem<ISimpleCreationSpecifier>> |
   * NodeList<ListItem<SimpleTypeSpecifier>>
   */
  public function getExtendsListx(
  ): NodeList<ListItem<ISimpleCreationSpecifier>> {
    return TypeAssert\not_null($this->getExtendsList());
  }

  public function getImplementsKeywordUNTYPED(): ?Node {
    return $this->_implements_keyword;
  }

  public function withImplementsKeyword(?ImplementsToken $value): this {
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
    return $this->_implements_keyword !== null;
  }

  /**
   * @return null | ImplementsToken
   */
  public function getImplementsKeyword(): ?ImplementsToken {
    return $this->_implements_keyword;
  }

  /**
   * @return ImplementsToken
   */
  public function getImplementsKeywordx(): ImplementsToken {
    return TypeAssert\not_null($this->getImplementsKeyword());
  }

  public function getImplementsListUNTYPED(): ?Node {
    return $this->_implements_list;
  }

  public function withImplementsList(
    ?NodeList<ListItem<ISimpleCreationSpecifier>> $value,
  ): this {
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
    return $this->_implements_list !== null;
  }

  /**
   * @return NodeList<ListItem<GenericTypeSpecifier>> |
   * NodeList<ListItem<ISimpleCreationSpecifier>> |
   * NodeList<ListItem<SimpleTypeSpecifier>> | null
   */
  public function getImplementsList(
  ): ?NodeList<ListItem<ISimpleCreationSpecifier>> {
    return $this->_implements_list;
  }

  /**
   * @return NodeList<ListItem<GenericTypeSpecifier>> |
   * NodeList<ListItem<ISimpleCreationSpecifier>> |
   * NodeList<ListItem<SimpleTypeSpecifier>>
   */
  public function getImplementsListx(
  ): NodeList<ListItem<ISimpleCreationSpecifier>> {
    return TypeAssert\not_null($this->getImplementsList());
  }

  public function getBodyUNTYPED(): ?Node {
    return $this->_body;
  }

  public function withBody(ClassishBody $value): this {
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
    return $this->_body !== null;
  }

  /**
   * @return ClassishBody
   */
  public function getBody(): ClassishBody {
    return TypeAssert\instance_of(ClassishBody::class, $this->_body);
  }

  /**
   * @return ClassishBody
   */
  public function getBodyx(): ClassishBody {
    return $this->getBody();
  }
}
