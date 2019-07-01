/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<9af510d5ab48c8d142a15ac9df4f985a>>
 */
namespace Facebook\HHAST;
use namespace Facebook\TypeAssert;

<<__ConsistentConstruct>>
abstract class ClassishDeclarationGeneratedBase
  extends Node
  implements IHasAttributeSpec {

  const string SYNTAX_KIND = 'classish_declaration';

  private Node $_attribute;
  private Node $_modifiers;
  private Node $_keyword;
  private Node $_name;
  private Node $_type_parameters;
  private Node $_extends_keyword;
  private Node $_extends_list;
  private Node $_implements_keyword;
  private Node $_implements_list;
  private Node $_where_clause;
  private Node $_body;

  public function __construct(
    Node $attribute,
    Node $modifiers,
    Node $keyword,
    Node $name,
    Node $type_parameters,
    Node $extends_keyword,
    Node $extends_list,
    Node $implements_keyword,
    Node $implements_list,
    Node $where_clause,
    Node $body,
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
    $this->_where_clause = $where_clause;
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
    $offset += $attribute->getWidth();
    $modifiers = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['classish_modifiers'],
      $file,
      $offset,
      $source,
      'NodeList<Token>',
    );
    $offset += $modifiers->getWidth();
    $keyword = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['classish_keyword'],
      $file,
      $offset,
      $source,
      'Token',
    );
    $offset += $keyword->getWidth();
    $name = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['classish_name'],
      $file,
      $offset,
      $source,
      'Token',
    );
    $offset += $name->getWidth();
    $type_parameters = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['classish_type_parameters'],
      $file,
      $offset,
      $source,
      'TypeParameters',
    );
    $offset += $type_parameters->getWidth();
    $extends_keyword = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['classish_extends_keyword'],
      $file,
      $offset,
      $source,
      'ExtendsToken',
    );
    $offset += $extends_keyword->getWidth();
    $extends_list = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['classish_extends_list'],
      $file,
      $offset,
      $source,
      'NodeList<ListItem<ISimpleCreationSpecifier>>',
    );
    $offset += $extends_list->getWidth();
    $implements_keyword = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['classish_implements_keyword'],
      $file,
      $offset,
      $source,
      'ImplementsToken',
    );
    $offset += $implements_keyword->getWidth();
    $implements_list = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['classish_implements_list'],
      $file,
      $offset,
      $source,
      'NodeList<ListItem<ISimpleCreationSpecifier>>',
    );
    $offset += $implements_list->getWidth();
    $where_clause = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['classish_where_clause'],
      $file,
      $offset,
      $source,
      'Node',
    );
    $offset += $where_clause->getWidth();
    $body = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['classish_body'],
      $file,
      $offset,
      $source,
      'ClassishBody',
    );
    $offset += $body->getWidth();
    $source_ref = shape(
      'file' => $file,
      'source' => $source,
      'offset' => $initial_offset,
      'width' => $offset - $initial_offset,
    );
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
      $where_clause,
      $body,
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
      'where_clause' => $this->_where_clause,
      'body' => $this->_body,
    ];
  }

  <<__Override>>
  public function rewriteChildren(
    self::TRewriter $rewriter,
    vec<Node> $parents = vec[],
  ): this {
    $parents[] = $this;
    $attribute = $rewriter($this->_attribute, $parents);
    $modifiers = $rewriter($this->_modifiers, $parents);
    $keyword = $rewriter($this->_keyword, $parents);
    $name = $rewriter($this->_name, $parents);
    $type_parameters = $rewriter($this->_type_parameters, $parents);
    $extends_keyword = $rewriter($this->_extends_keyword, $parents);
    $extends_list = $rewriter($this->_extends_list, $parents);
    $implements_keyword = $rewriter($this->_implements_keyword, $parents);
    $implements_list = $rewriter($this->_implements_list, $parents);
    $where_clause = $rewriter($this->_where_clause, $parents);
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
      $where_clause === $this->_where_clause &&
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
      $where_clause,
      $body,
    );
  }

  public function getAttributeUNTYPED(): Node {
    return $this->_attribute;
  }

  public function withAttribute(Node $value): this {
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
      $this->_where_clause,
      $this->_body,
    );
  }

  public function hasAttribute(): bool {
    return !$this->_attribute->isMissing();
  }

  /**
   * @return AttributeSpecification | null
   */
  public function getAttribute(): ?AttributeSpecification {
    if ($this->_attribute->isMissing()) {
      return null;
    }
    return TypeAssert\instance_of(
      AttributeSpecification::class,
      $this->_attribute,
    );
  }

  /**
   * @return AttributeSpecification
   */
  public function getAttributex(): AttributeSpecification {
    return TypeAssert\not_null($this->getAttribute());
  }

  public function getModifiersUNTYPED(): Node {
    return $this->_modifiers;
  }

  public function withModifiers(Node $value): this {
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
      $this->_where_clause,
      $this->_body,
    );
  }

  public function hasModifiers(): bool {
    return !$this->_modifiers->isMissing();
  }

  /**
   * @return NodeList<AbstractToken> | NodeList<Token> | NodeList<FinalToken> |
   * null
   */
  public function getModifiers(): ?NodeList<Token> {
    if ($this->_modifiers->isMissing()) {
      return null;
    }
    return TypeAssert\instance_of(NodeList::class, $this->_modifiers);
  }

  /**
   * @return NodeList<AbstractToken> | NodeList<Token> | NodeList<FinalToken>
   */
  public function getModifiersx(): NodeList<Token> {
    return TypeAssert\not_null($this->getModifiers());
  }

  public function getKeywordUNTYPED(): Node {
    return $this->_keyword;
  }

  public function withKeyword(Node $value): this {
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
      $this->_where_clause,
      $this->_body,
    );
  }

  public function hasKeyword(): bool {
    return !$this->_keyword->isMissing();
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

  public function getNameUNTYPED(): Node {
    return $this->_name;
  }

  public function withName(Node $value): this {
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
      $this->_where_clause,
      $this->_body,
    );
  }

  public function hasName(): bool {
    return !$this->_name->isMissing();
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

  public function getTypeParametersUNTYPED(): Node {
    return $this->_type_parameters;
  }

  public function withTypeParameters(Node $value): this {
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
      $this->_where_clause,
      $this->_body,
    );
  }

  public function hasTypeParameters(): bool {
    return !$this->_type_parameters->isMissing();
  }

  /**
   * @return null | TypeParameters
   */
  public function getTypeParameters(): ?TypeParameters {
    if ($this->_type_parameters->isMissing()) {
      return null;
    }
    return TypeAssert\instance_of(
      TypeParameters::class,
      $this->_type_parameters,
    );
  }

  /**
   * @return TypeParameters
   */
  public function getTypeParametersx(): TypeParameters {
    return TypeAssert\not_null($this->getTypeParameters());
  }

  public function getExtendsKeywordUNTYPED(): Node {
    return $this->_extends_keyword;
  }

  public function withExtendsKeyword(Node $value): this {
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
      $this->_where_clause,
      $this->_body,
    );
  }

  public function hasExtendsKeyword(): bool {
    return !$this->_extends_keyword->isMissing();
  }

  /**
   * @return null | ExtendsToken
   */
  public function getExtendsKeyword(): ?ExtendsToken {
    if ($this->_extends_keyword->isMissing()) {
      return null;
    }
    return TypeAssert\instance_of(ExtendsToken::class, $this->_extends_keyword);
  }

  /**
   * @return ExtendsToken
   */
  public function getExtendsKeywordx(): ExtendsToken {
    return TypeAssert\not_null($this->getExtendsKeyword());
  }

  public function getExtendsListUNTYPED(): Node {
    return $this->_extends_list;
  }

  public function withExtendsList(Node $value): this {
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
      $this->_where_clause,
      $this->_body,
    );
  }

  public function hasExtendsList(): bool {
    return !$this->_extends_list->isMissing();
  }

  /**
   * @return NodeList<ListItem<GenericTypeSpecifier>> |
   * NodeList<ListItem<ISimpleCreationSpecifier>> |
   * NodeList<ListItem<SimpleTypeSpecifier>> | null
   */
  public function getExtendsList(
  ): ?NodeList<ListItem<ISimpleCreationSpecifier>> {
    if ($this->_extends_list->isMissing()) {
      return null;
    }
    return TypeAssert\instance_of(NodeList::class, $this->_extends_list);
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

  public function getImplementsKeywordUNTYPED(): Node {
    return $this->_implements_keyword;
  }

  public function withImplementsKeyword(Node $value): this {
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
      $this->_where_clause,
      $this->_body,
    );
  }

  public function hasImplementsKeyword(): bool {
    return !$this->_implements_keyword->isMissing();
  }

  /**
   * @return null | ImplementsToken
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
   * @return ImplementsToken
   */
  public function getImplementsKeywordx(): ImplementsToken {
    return TypeAssert\not_null($this->getImplementsKeyword());
  }

  public function getImplementsListUNTYPED(): Node {
    return $this->_implements_list;
  }

  public function withImplementsList(Node $value): this {
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
      $this->_where_clause,
      $this->_body,
    );
  }

  public function hasImplementsList(): bool {
    return !$this->_implements_list->isMissing();
  }

  /**
   * @return NodeList<ListItem<GenericTypeSpecifier>> |
   * NodeList<ListItem<ISimpleCreationSpecifier>> |
   * NodeList<ListItem<SimpleTypeSpecifier>> | null
   */
  public function getImplementsList(
  ): ?NodeList<ListItem<ISimpleCreationSpecifier>> {
    if ($this->_implements_list->isMissing()) {
      return null;
    }
    return TypeAssert\instance_of(NodeList::class, $this->_implements_list);
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

  public function getWhereClauseUNTYPED(): Node {
    return $this->_where_clause;
  }

  public function withWhereClause(Node $value): this {
    if ($value === $this->_where_clause) {
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
      $this->_body,
    );
  }

  public function hasWhereClause(): bool {
    return !$this->_where_clause->isMissing();
  }

  /**
   * @return null
   */
  public function getWhereClause(): ?Node {
    if ($this->_where_clause->isMissing()) {
      return null;
    }
    return $this->_where_clause;
  }

  /**
   * @return
   */
  public function getWhereClausex(): Node {
    return TypeAssert\not_null($this->getWhereClause());
  }

  public function getBodyUNTYPED(): Node {
    return $this->_body;
  }

  public function withBody(Node $value): this {
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
      $this->_where_clause,
      $value,
    );
  }

  public function hasBody(): bool {
    return !$this->_body->isMissing();
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
