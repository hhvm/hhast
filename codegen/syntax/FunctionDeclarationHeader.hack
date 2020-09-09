/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<d6a81c573dd54d6f4dc7b912ff6216a0>>
 */
namespace Facebook\HHAST;
use namespace Facebook\TypeAssert;
use namespace HH\Lib\Dict;

<<__ConsistentConstruct>>
final class FunctionDeclarationHeader extends Node {

  const string SYNTAX_KIND = 'function_declaration_header';

  private ?NodeList<Token> $_modifiers;
  private FunctionToken $_keyword;
  private Token $_name;
  private ?TypeParameters $_type_parameter_list;
  private LeftParenToken $_left_paren;
  private ?NodeList<ListItem<IParameter>> $_parameter_list;
  private RightParenToken $_right_paren;
  private ?Node $_capability_provisional;
  private ?ColonToken $_colon;
  private ?ITypeSpecifier $_type;
  private ?WhereClause $_where_clause;

  public function __construct(
    ?NodeList<Token> $modifiers,
    FunctionToken $keyword,
    Token $name,
    ?TypeParameters $type_parameter_list,
    LeftParenToken $left_paren,
    ?NodeList<ListItem<IParameter>> $parameter_list,
    RightParenToken $right_paren,
    ?Node $capability_provisional,
    ?ColonToken $colon,
    ?ITypeSpecifier $type,
    ?WhereClause $where_clause,
    ?__Private\SourceRef $source_ref = null,
  ) {
    $this->_modifiers = $modifiers;
    $this->_keyword = $keyword;
    $this->_name = $name;
    $this->_type_parameter_list = $type_parameter_list;
    $this->_left_paren = $left_paren;
    $this->_parameter_list = $parameter_list;
    $this->_right_paren = $right_paren;
    $this->_capability_provisional = $capability_provisional;
    $this->_colon = $colon;
    $this->_type = $type;
    $this->_where_clause = $where_clause;
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
    $modifiers = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['function_modifiers'] ?? dict['kind' => 'missing'],
      $file,
      $offset,
      $source,
      'NodeList<Token>',
    );
    $offset += $modifiers?->getWidth() ?? 0;
    $keyword = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['function_keyword'],
      $file,
      $offset,
      $source,
      'FunctionToken',
    );
    $keyword = $keyword as nonnull;
    $offset += $keyword->getWidth();
    $name = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['function_name'],
      $file,
      $offset,
      $source,
      'Token',
    );
    $name = $name as nonnull;
    $offset += $name->getWidth();
    $type_parameter_list = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['function_type_parameter_list'] ?? dict['kind' => 'missing'],
      $file,
      $offset,
      $source,
      'TypeParameters',
    );
    $offset += $type_parameter_list?->getWidth() ?? 0;
    $left_paren = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['function_left_paren'],
      $file,
      $offset,
      $source,
      'LeftParenToken',
    );
    $left_paren = $left_paren as nonnull;
    $offset += $left_paren->getWidth();
    $parameter_list = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['function_parameter_list'] ?? dict['kind' => 'missing'],
      $file,
      $offset,
      $source,
      'NodeList<ListItem<IParameter>>',
    );
    $offset += $parameter_list?->getWidth() ?? 0;
    $right_paren = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['function_right_paren'],
      $file,
      $offset,
      $source,
      'RightParenToken',
    );
    $right_paren = $right_paren as nonnull;
    $offset += $right_paren->getWidth();
    $capability_provisional = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['function_capability_provisional'] ?? dict['kind' => 'missing'],
      $file,
      $offset,
      $source,
      'Node',
    );
    $offset += $capability_provisional?->getWidth() ?? 0;
    $colon = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['function_colon'] ?? dict['kind' => 'missing'],
      $file,
      $offset,
      $source,
      'ColonToken',
    );
    $offset += $colon?->getWidth() ?? 0;
    $type = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['function_type'] ?? dict['kind' => 'missing'],
      $file,
      $offset,
      $source,
      'ITypeSpecifier',
    );
    $offset += $type?->getWidth() ?? 0;
    $where_clause = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['function_where_clause'] ?? dict['kind' => 'missing'],
      $file,
      $offset,
      $source,
      'WhereClause',
    );
    $offset += $where_clause?->getWidth() ?? 0;
    $source_ref = shape(
      'file' => $file,
      'source' => $source,
      'offset' => $initial_offset,
      'width' => $offset - $initial_offset,
    );
    return new static(
      /* HH_IGNORE_ERROR[4110] */ $modifiers,
      /* HH_IGNORE_ERROR[4110] */ $keyword,
      /* HH_IGNORE_ERROR[4110] */ $name,
      /* HH_IGNORE_ERROR[4110] */ $type_parameter_list,
      /* HH_IGNORE_ERROR[4110] */ $left_paren,
      /* HH_IGNORE_ERROR[4110] */ $parameter_list,
      /* HH_IGNORE_ERROR[4110] */ $right_paren,
      /* HH_IGNORE_ERROR[4110] */ $capability_provisional,
      /* HH_IGNORE_ERROR[4110] */ $colon,
      /* HH_IGNORE_ERROR[4110] */ $type,
      /* HH_IGNORE_ERROR[4110] */ $where_clause,
      $source_ref,
    );
  }

  <<__Override>>
  public function getChildren(): dict<string, Node> {
    return dict[
      'modifiers' => $this->_modifiers,
      'keyword' => $this->_keyword,
      'name' => $this->_name,
      'type_parameter_list' => $this->_type_parameter_list,
      'left_paren' => $this->_left_paren,
      'parameter_list' => $this->_parameter_list,
      'right_paren' => $this->_right_paren,
      'capability_provisional' => $this->_capability_provisional,
      'colon' => $this->_colon,
      'type' => $this->_type,
      'where_clause' => $this->_where_clause,
    ]
      |> Dict\filter_nulls($$);
  }

  <<__Override>>
  public function rewriteChildren<Tret as ?Node>(
    (function(Node, vec<Node>): Tret) $rewriter,
    vec<Node> $parents = vec[],
  ): this {
    $parents[] = $this;
    $modifiers = $this->_modifiers === null
      ? null
      : $rewriter($this->_modifiers, $parents);
    $keyword = $rewriter($this->_keyword, $parents);
    $name = $rewriter($this->_name, $parents);
    $type_parameter_list = $this->_type_parameter_list === null
      ? null
      : $rewriter($this->_type_parameter_list, $parents);
    $left_paren = $rewriter($this->_left_paren, $parents);
    $parameter_list = $this->_parameter_list === null
      ? null
      : $rewriter($this->_parameter_list, $parents);
    $right_paren = $rewriter($this->_right_paren, $parents);
    $capability_provisional = $this->_capability_provisional === null
      ? null
      : $rewriter($this->_capability_provisional, $parents);
    $colon = $this->_colon === null ? null : $rewriter($this->_colon, $parents);
    $type = $this->_type === null ? null : $rewriter($this->_type, $parents);
    $where_clause = $this->_where_clause === null
      ? null
      : $rewriter($this->_where_clause, $parents);
    if (
      $modifiers === $this->_modifiers &&
      $keyword === $this->_keyword &&
      $name === $this->_name &&
      $type_parameter_list === $this->_type_parameter_list &&
      $left_paren === $this->_left_paren &&
      $parameter_list === $this->_parameter_list &&
      $right_paren === $this->_right_paren &&
      $capability_provisional === $this->_capability_provisional &&
      $colon === $this->_colon &&
      $type === $this->_type &&
      $where_clause === $this->_where_clause
    ) {
      return $this;
    }
    return new static(
      /* HH_FIXME[4110] use `as` */ $modifiers,
      /* HH_FIXME[4110] use `as` */ $keyword,
      /* HH_FIXME[4110] use `as` */ $name,
      /* HH_FIXME[4110] use `as` */ $type_parameter_list,
      /* HH_FIXME[4110] use `as` */ $left_paren,
      /* HH_FIXME[4110] use `as` */ $parameter_list,
      /* HH_FIXME[4110] use `as` */ $right_paren,
      /* HH_FIXME[4110] use `as` */ $capability_provisional,
      /* HH_FIXME[4110] use `as` */ $colon,
      /* HH_FIXME[4110] use `as` */ $type,
      /* HH_FIXME[4110] use `as` */ $where_clause,
    );
  }

  public function getModifiersUNTYPED(): ?Node {
    return $this->_modifiers;
  }

  public function withModifiers(?NodeList<Token> $value): this {
    if ($value === $this->_modifiers) {
      return $this;
    }
    return new static(
      $value,
      $this->_keyword,
      $this->_name,
      $this->_type_parameter_list,
      $this->_left_paren,
      $this->_parameter_list,
      $this->_right_paren,
      $this->_capability_provisional,
      $this->_colon,
      $this->_type,
      $this->_where_clause,
    );
  }

  public function hasModifiers(): bool {
    return $this->_modifiers !== null;
  }

  /**
   * @return NodeList<AbstractToken> | NodeList<Token> | NodeList<AsyncToken> |
   * NodeList<FinalToken> | NodeList<PrivateToken> | NodeList<ProtectedToken> |
   * NodeList<PublicToken> | NodeList<StaticToken> | null
   */
  public function getModifiers(): ?NodeList<Token> {
    return $this->_modifiers;
  }

  /**
   * @return NodeList<AbstractToken> | NodeList<Token> | NodeList<AsyncToken> |
   * NodeList<FinalToken> | NodeList<PrivateToken> | NodeList<ProtectedToken> |
   * NodeList<PublicToken> | NodeList<StaticToken>
   */
  public function getModifiersx(): NodeList<Token> {
    return TypeAssert\not_null($this->getModifiers());
  }

  public function getKeywordUNTYPED(): ?Node {
    return $this->_keyword;
  }

  public function withKeyword(FunctionToken $value): this {
    if ($value === $this->_keyword) {
      return $this;
    }
    return new static(
      $this->_modifiers,
      $value,
      $this->_name,
      $this->_type_parameter_list,
      $this->_left_paren,
      $this->_parameter_list,
      $this->_right_paren,
      $this->_capability_provisional,
      $this->_colon,
      $this->_type,
      $this->_where_clause,
    );
  }

  public function hasKeyword(): bool {
    return $this->_keyword !== null;
  }

  /**
   * @return FunctionToken
   */
  public function getKeyword(): FunctionToken {
    return TypeAssert\instance_of(FunctionToken::class, $this->_keyword);
  }

  /**
   * @return FunctionToken
   */
  public function getKeywordx(): FunctionToken {
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
      $this->_modifiers,
      $this->_keyword,
      $value,
      $this->_type_parameter_list,
      $this->_left_paren,
      $this->_parameter_list,
      $this->_right_paren,
      $this->_capability_provisional,
      $this->_colon,
      $this->_type,
      $this->_where_clause,
    );
  }

  public function hasName(): bool {
    return $this->_name !== null;
  }

  /**
   * @return ConstructToken | NameToken
   */
  public function getName(): Token {
    return TypeAssert\instance_of(Token::class, $this->_name);
  }

  /**
   * @return ConstructToken | NameToken
   */
  public function getNamex(): Token {
    return $this->getName();
  }

  public function getTypeParameterListUNTYPED(): ?Node {
    return $this->_type_parameter_list;
  }

  public function withTypeParameterList(?TypeParameters $value): this {
    if ($value === $this->_type_parameter_list) {
      return $this;
    }
    return new static(
      $this->_modifiers,
      $this->_keyword,
      $this->_name,
      $value,
      $this->_left_paren,
      $this->_parameter_list,
      $this->_right_paren,
      $this->_capability_provisional,
      $this->_colon,
      $this->_type,
      $this->_where_clause,
    );
  }

  public function hasTypeParameterList(): bool {
    return $this->_type_parameter_list !== null;
  }

  /**
   * @return null | TypeParameters
   */
  public function getTypeParameterList(): ?TypeParameters {
    return $this->_type_parameter_list;
  }

  /**
   * @return TypeParameters
   */
  public function getTypeParameterListx(): TypeParameters {
    return TypeAssert\not_null($this->getTypeParameterList());
  }

  public function getLeftParenUNTYPED(): ?Node {
    return $this->_left_paren;
  }

  public function withLeftParen(LeftParenToken $value): this {
    if ($value === $this->_left_paren) {
      return $this;
    }
    return new static(
      $this->_modifiers,
      $this->_keyword,
      $this->_name,
      $this->_type_parameter_list,
      $value,
      $this->_parameter_list,
      $this->_right_paren,
      $this->_capability_provisional,
      $this->_colon,
      $this->_type,
      $this->_where_clause,
    );
  }

  public function hasLeftParen(): bool {
    return $this->_left_paren !== null;
  }

  /**
   * @return LeftParenToken
   */
  public function getLeftParen(): LeftParenToken {
    return TypeAssert\instance_of(LeftParenToken::class, $this->_left_paren);
  }

  /**
   * @return LeftParenToken
   */
  public function getLeftParenx(): LeftParenToken {
    return $this->getLeftParen();
  }

  public function getParameterListUNTYPED(): ?Node {
    return $this->_parameter_list;
  }

  public function withParameterList(
    ?NodeList<ListItem<IParameter>> $value,
  ): this {
    if ($value === $this->_parameter_list) {
      return $this;
    }
    return new static(
      $this->_modifiers,
      $this->_keyword,
      $this->_name,
      $this->_type_parameter_list,
      $this->_left_paren,
      $value,
      $this->_right_paren,
      $this->_capability_provisional,
      $this->_colon,
      $this->_type,
      $this->_where_clause,
    );
  }

  public function hasParameterList(): bool {
    return $this->_parameter_list !== null;
  }

  /**
   * @return NodeList<ListItem<ParameterDeclaration>> |
   * NodeList<ListItem<IParameter>> | null
   */
  public function getParameterList(): ?NodeList<ListItem<IParameter>> {
    return $this->_parameter_list;
  }

  /**
   * @return NodeList<ListItem<ParameterDeclaration>> |
   * NodeList<ListItem<IParameter>>
   */
  public function getParameterListx(): NodeList<ListItem<IParameter>> {
    return TypeAssert\not_null($this->getParameterList());
  }

  public function getRightParenUNTYPED(): ?Node {
    return $this->_right_paren;
  }

  public function withRightParen(RightParenToken $value): this {
    if ($value === $this->_right_paren) {
      return $this;
    }
    return new static(
      $this->_modifiers,
      $this->_keyword,
      $this->_name,
      $this->_type_parameter_list,
      $this->_left_paren,
      $this->_parameter_list,
      $value,
      $this->_capability_provisional,
      $this->_colon,
      $this->_type,
      $this->_where_clause,
    );
  }

  public function hasRightParen(): bool {
    return $this->_right_paren !== null;
  }

  /**
   * @return RightParenToken
   */
  public function getRightParen(): RightParenToken {
    return TypeAssert\instance_of(RightParenToken::class, $this->_right_paren);
  }

  /**
   * @return RightParenToken
   */
  public function getRightParenx(): RightParenToken {
    return $this->getRightParen();
  }

  public function getCapabilityProvisionalUNTYPED(): ?Node {
    return $this->_capability_provisional;
  }

  public function withCapabilityProvisional(?Node $value): this {
    if ($value === $this->_capability_provisional) {
      return $this;
    }
    return new static(
      $this->_modifiers,
      $this->_keyword,
      $this->_name,
      $this->_type_parameter_list,
      $this->_left_paren,
      $this->_parameter_list,
      $this->_right_paren,
      $value,
      $this->_colon,
      $this->_type,
      $this->_where_clause,
    );
  }

  public function hasCapabilityProvisional(): bool {
    return $this->_capability_provisional !== null;
  }

  /**
   * @return null
   */
  public function getCapabilityProvisional(): ?Node {
    return $this->_capability_provisional;
  }

  /**
   * @return
   */
  public function getCapabilityProvisionalx(): Node {
    return TypeAssert\not_null($this->getCapabilityProvisional());
  }

  public function getColonUNTYPED(): ?Node {
    return $this->_colon;
  }

  public function withColon(?ColonToken $value): this {
    if ($value === $this->_colon) {
      return $this;
    }
    return new static(
      $this->_modifiers,
      $this->_keyword,
      $this->_name,
      $this->_type_parameter_list,
      $this->_left_paren,
      $this->_parameter_list,
      $this->_right_paren,
      $this->_capability_provisional,
      $value,
      $this->_type,
      $this->_where_clause,
    );
  }

  public function hasColon(): bool {
    return $this->_colon !== null;
  }

  /**
   * @return null | ColonToken
   */
  public function getColon(): ?ColonToken {
    return $this->_colon;
  }

  /**
   * @return ColonToken
   */
  public function getColonx(): ColonToken {
    return TypeAssert\not_null($this->getColon());
  }

  public function getTypeUNTYPED(): ?Node {
    return $this->_type;
  }

  public function withType(?ITypeSpecifier $value): this {
    if ($value === $this->_type) {
      return $this;
    }
    return new static(
      $this->_modifiers,
      $this->_keyword,
      $this->_name,
      $this->_type_parameter_list,
      $this->_left_paren,
      $this->_parameter_list,
      $this->_right_paren,
      $this->_capability_provisional,
      $this->_colon,
      $value,
      $this->_where_clause,
    );
  }

  public function hasType(): bool {
    return $this->_type !== null;
  }

  /**
   * @return AttributizedSpecifier | ClassnameTypeSpecifier |
   * ClosureTypeSpecifier | DarrayTypeSpecifier | DictionaryTypeSpecifier |
   * GenericTypeSpecifier | KeysetTypeSpecifier | LikeTypeSpecifier | null |
   * NullableTypeSpecifier | ShapeTypeSpecifier | SimpleTypeSpecifier |
   * NoreturnToken | TupleTypeSpecifier | TypeConstant | VarrayTypeSpecifier |
   * VectorTypeSpecifier
   */
  public function getType(): ?ITypeSpecifier {
    return $this->_type;
  }

  /**
   * @return AttributizedSpecifier | ClassnameTypeSpecifier |
   * ClosureTypeSpecifier | DarrayTypeSpecifier | DictionaryTypeSpecifier |
   * GenericTypeSpecifier | KeysetTypeSpecifier | LikeTypeSpecifier |
   * NullableTypeSpecifier | ShapeTypeSpecifier | SimpleTypeSpecifier |
   * NoreturnToken | TupleTypeSpecifier | TypeConstant | VarrayTypeSpecifier |
   * VectorTypeSpecifier
   */
  public function getTypex(): ITypeSpecifier {
    return TypeAssert\not_null($this->getType());
  }

  public function getWhereClauseUNTYPED(): ?Node {
    return $this->_where_clause;
  }

  public function withWhereClause(?WhereClause $value): this {
    if ($value === $this->_where_clause) {
      return $this;
    }
    return new static(
      $this->_modifiers,
      $this->_keyword,
      $this->_name,
      $this->_type_parameter_list,
      $this->_left_paren,
      $this->_parameter_list,
      $this->_right_paren,
      $this->_capability_provisional,
      $this->_colon,
      $this->_type,
      $value,
    );
  }

  public function hasWhereClause(): bool {
    return $this->_where_clause !== null;
  }

  /**
   * @return null | WhereClause
   */
  public function getWhereClause(): ?WhereClause {
    return $this->_where_clause;
  }

  /**
   * @return WhereClause
   */
  public function getWhereClausex(): WhereClause {
    return TypeAssert\not_null($this->getWhereClause());
  }
}
