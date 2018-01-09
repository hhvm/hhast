<?hh // strict
/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<884d1dacb11c8e8b51c2f2310e964dea>>
 */
namespace Facebook\HHAST;
use namespace Facebook\TypeAssert;

final class FunctionDeclarationHeader extends EditableNode {

  private EditableNode $_modifiers;
  private EditableNode $_keyword;
  private EditableNode $_ampersand;
  private EditableNode $_name;
  private EditableNode $_type_parameter_list;
  private EditableNode $_left_paren;
  private EditableNode $_parameter_list;
  private EditableNode $_right_paren;
  private EditableNode $_colon;
  private EditableNode $_type;
  private EditableNode $_where_clause;

  public function __construct(
    EditableNode $modifiers,
    EditableNode $keyword,
    EditableNode $ampersand,
    EditableNode $name,
    EditableNode $type_parameter_list,
    EditableNode $left_paren,
    EditableNode $parameter_list,
    EditableNode $right_paren,
    EditableNode $colon,
    EditableNode $type,
    EditableNode $where_clause,
  ) {
    parent::__construct('function_declaration_header');
    $this->_modifiers = $modifiers;
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

  <<__Override>>
  public static function fromJSON(
    dict<string, mixed> $json,
    string $file,
    int $offset,
    string $source,
  ): this {
    $modifiers = EditableNode::fromJSON(
      /* UNSAFE_EXPR */ $json['function_modifiers'],
      $file,
      $offset,
      $source,
    );
    $offset += $modifiers->getWidth();
    $keyword = EditableNode::fromJSON(
      /* UNSAFE_EXPR */ $json['function_keyword'],
      $file,
      $offset,
      $source,
    );
    $offset += $keyword->getWidth();
    $ampersand = EditableNode::fromJSON(
      /* UNSAFE_EXPR */ $json['function_ampersand'],
      $file,
      $offset,
      $source,
    );
    $offset += $ampersand->getWidth();
    $name = EditableNode::fromJSON(
      /* UNSAFE_EXPR */ $json['function_name'],
      $file,
      $offset,
      $source,
    );
    $offset += $name->getWidth();
    $type_parameter_list = EditableNode::fromJSON(
      /* UNSAFE_EXPR */ $json['function_type_parameter_list'],
      $file,
      $offset,
      $source,
    );
    $offset += $type_parameter_list->getWidth();
    $left_paren = EditableNode::fromJSON(
      /* UNSAFE_EXPR */ $json['function_left_paren'],
      $file,
      $offset,
      $source,
    );
    $offset += $left_paren->getWidth();
    $parameter_list = EditableNode::fromJSON(
      /* UNSAFE_EXPR */ $json['function_parameter_list'],
      $file,
      $offset,
      $source,
    );
    $offset += $parameter_list->getWidth();
    $right_paren = EditableNode::fromJSON(
      /* UNSAFE_EXPR */ $json['function_right_paren'],
      $file,
      $offset,
      $source,
    );
    $offset += $right_paren->getWidth();
    $colon = EditableNode::fromJSON(
      /* UNSAFE_EXPR */ $json['function_colon'],
      $file,
      $offset,
      $source,
    );
    $offset += $colon->getWidth();
    $type = EditableNode::fromJSON(
      /* UNSAFE_EXPR */ $json['function_type'],
      $file,
      $offset,
      $source,
    );
    $offset += $type->getWidth();
    $where_clause = EditableNode::fromJSON(
      /* UNSAFE_EXPR */ $json['function_where_clause'],
      $file,
      $offset,
      $source,
    );
    $offset += $where_clause->getWidth();
    return new self(
      $modifiers,
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

  <<__Override>>
  public function getChildren(): dict<string, EditableNode> {
    return dict[
      'modifiers' => $this->_modifiers,
      'keyword' => $this->_keyword,
      'ampersand' => $this->_ampersand,
      'name' => $this->_name,
      'type_parameter_list' => $this->_type_parameter_list,
      'left_paren' => $this->_left_paren,
      'parameter_list' => $this->_parameter_list,
      'right_paren' => $this->_right_paren,
      'colon' => $this->_colon,
      'type' => $this->_type,
      'where_clause' => $this->_where_clause,
    ];
  }

  <<__Override>>
  public function rewriteDescendants(
    self::TRewriter $rewriter,
    ?vec<EditableNode> $parents = null,
  ): this {
    $parents = $parents === null ? vec[] : vec($parents);
    $parents[] = $this;
    $modifiers = $this->_modifiers->rewrite($rewriter, $parents);
    $keyword = $this->_keyword->rewrite($rewriter, $parents);
    $ampersand = $this->_ampersand->rewrite($rewriter, $parents);
    $name = $this->_name->rewrite($rewriter, $parents);
    $type_parameter_list =
      $this->_type_parameter_list->rewrite($rewriter, $parents);
    $left_paren = $this->_left_paren->rewrite($rewriter, $parents);
    $parameter_list = $this->_parameter_list->rewrite($rewriter, $parents);
    $right_paren = $this->_right_paren->rewrite($rewriter, $parents);
    $colon = $this->_colon->rewrite($rewriter, $parents);
    $type = $this->_type->rewrite($rewriter, $parents);
    $where_clause = $this->_where_clause->rewrite($rewriter, $parents);
    if (
      $modifiers === $this->_modifiers &&
      $keyword === $this->_keyword &&
      $ampersand === $this->_ampersand &&
      $name === $this->_name &&
      $type_parameter_list === $this->_type_parameter_list &&
      $left_paren === $this->_left_paren &&
      $parameter_list === $this->_parameter_list &&
      $right_paren === $this->_right_paren &&
      $colon === $this->_colon &&
      $type === $this->_type &&
      $where_clause === $this->_where_clause
    ) {
      return $this;
    }
    return new self(
      $modifiers,
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

  public function getModifiersUNTYPED(): EditableNode {
    return $this->_modifiers;
  }

  public function withModifiers(EditableNode $value): this {
    if ($value === $this->_modifiers) {
      return $this;
    }
    return new self(
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
    return new self(
      $this->_modifiers,
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

  public function hasKeyword(): bool {
    return !$this->_keyword->isMissing();
  }

  /**
   * @returns FunctionToken | Missing
   */
  public function getKeyword(): ?FunctionToken {
    if ($this->_keyword->isMissing()) {
      return null;
    }
    return TypeAssert\instance_of(FunctionToken::class, $this->_keyword);
  }

  /**
   * @returns FunctionToken
   */
  public function getKeywordx(): FunctionToken {
    return TypeAssert\instance_of(FunctionToken::class, $this->_keyword);
  }

  public function getAmpersandUNTYPED(): EditableNode {
    return $this->_ampersand;
  }

  public function withAmpersand(EditableNode $value): this {
    if ($value === $this->_ampersand) {
      return $this;
    }
    return new self(
      $this->_modifiers,
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

  public function hasAmpersand(): bool {
    return !$this->_ampersand->isMissing();
  }

  /**
   * @returns Missing | AmpersandToken
   */
  public function getAmpersand(): ?AmpersandToken {
    if ($this->_ampersand->isMissing()) {
      return null;
    }
    return TypeAssert\instance_of(AmpersandToken::class, $this->_ampersand);
  }

  /**
   * @returns AmpersandToken
   */
  public function getAmpersandx(): AmpersandToken {
    return TypeAssert\instance_of(AmpersandToken::class, $this->_ampersand);
  }

  public function getNameUNTYPED(): EditableNode {
    return $this->_name;
  }

  public function withName(EditableNode $value): this {
    if ($value === $this->_name) {
      return $this;
    }
    return new self(
      $this->_modifiers,
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

  public function hasName(): bool {
    return !$this->_name->isMissing();
  }

  /**
   * @returns NameToken | ConstructToken | DestructToken
   */
  public function getName(): EditableToken {
    return TypeAssert\instance_of(EditableToken::class, $this->_name);
  }

  public function getTypeParameterListUNTYPED(): EditableNode {
    return $this->_type_parameter_list;
  }

  public function withTypeParameterList(EditableNode $value): this {
    if ($value === $this->_type_parameter_list) {
      return $this;
    }
    return new self(
      $this->_modifiers,
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

  public function hasTypeParameterList(): bool {
    return !$this->_type_parameter_list->isMissing();
  }

  /**
   * @returns Missing | TypeParameters
   */
  public function getTypeParameterList(): ?TypeParameters {
    if ($this->_type_parameter_list->isMissing()) {
      return null;
    }
    return TypeAssert\instance_of(
      TypeParameters::class,
      $this->_type_parameter_list,
    );
  }

  /**
   * @returns TypeParameters
   */
  public function getTypeParameterListx(): TypeParameters {
    return TypeAssert\instance_of(
      TypeParameters::class,
      $this->_type_parameter_list,
    );
  }

  public function getLeftParenUNTYPED(): EditableNode {
    return $this->_left_paren;
  }

  public function withLeftParen(EditableNode $value): this {
    if ($value === $this->_left_paren) {
      return $this;
    }
    return new self(
      $this->_modifiers,
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

  public function hasLeftParen(): bool {
    return !$this->_left_paren->isMissing();
  }

  /**
   * @returns LeftParenToken | Missing
   */
  public function getLeftParen(): ?LeftParenToken {
    if ($this->_left_paren->isMissing()) {
      return null;
    }
    return TypeAssert\instance_of(LeftParenToken::class, $this->_left_paren);
  }

  /**
   * @returns LeftParenToken
   */
  public function getLeftParenx(): LeftParenToken {
    return TypeAssert\instance_of(LeftParenToken::class, $this->_left_paren);
  }

  public function getParameterListUNTYPED(): EditableNode {
    return $this->_parameter_list;
  }

  public function withParameterList(EditableNode $value): this {
    if ($value === $this->_parameter_list) {
      return $this;
    }
    return new self(
      $this->_modifiers,
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

  public function hasParameterList(): bool {
    return !$this->_parameter_list->isMissing();
  }

  /**
   * @returns Missing | EditableList
   */
  public function getParameterList(): ?EditableList {
    if ($this->_parameter_list->isMissing()) {
      return null;
    }
    return TypeAssert\instance_of(EditableList::class, $this->_parameter_list);
  }

  /**
   * @returns EditableList
   */
  public function getParameterListx(): EditableList {
    return TypeAssert\instance_of(EditableList::class, $this->_parameter_list);
  }

  public function getRightParenUNTYPED(): EditableNode {
    return $this->_right_paren;
  }

  public function withRightParen(EditableNode $value): this {
    if ($value === $this->_right_paren) {
      return $this;
    }
    return new self(
      $this->_modifiers,
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

  public function hasRightParen(): bool {
    return !$this->_right_paren->isMissing();
  }

  /**
   * @returns RightParenToken | Missing
   */
  public function getRightParen(): ?RightParenToken {
    if ($this->_right_paren->isMissing()) {
      return null;
    }
    return TypeAssert\instance_of(RightParenToken::class, $this->_right_paren);
  }

  /**
   * @returns RightParenToken
   */
  public function getRightParenx(): RightParenToken {
    return TypeAssert\instance_of(RightParenToken::class, $this->_right_paren);
  }

  public function getColonUNTYPED(): EditableNode {
    return $this->_colon;
  }

  public function withColon(EditableNode $value): this {
    if ($value === $this->_colon) {
      return $this;
    }
    return new self(
      $this->_modifiers,
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

  public function hasColon(): bool {
    return !$this->_colon->isMissing();
  }

  /**
   * @returns Missing | ColonToken
   */
  public function getColon(): ?ColonToken {
    if ($this->_colon->isMissing()) {
      return null;
    }
    return TypeAssert\instance_of(ColonToken::class, $this->_colon);
  }

  /**
   * @returns ColonToken
   */
  public function getColonx(): ColonToken {
    return TypeAssert\instance_of(ColonToken::class, $this->_colon);
  }

  public function getTypeUNTYPED(): EditableNode {
    return $this->_type;
  }

  public function withType(EditableNode $value): this {
    if ($value === $this->_type) {
      return $this;
    }
    return new self(
      $this->_modifiers,
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

  public function hasType(): bool {
    return !$this->_type->isMissing();
  }

  /**
   * @returns Missing | SimpleTypeSpecifier | ShapeTypeSpecifier |
   * ClosureTypeSpecifier | GenericTypeSpecifier | SoftTypeSpecifier |
   * TupleTypeSpecifier | VectorTypeSpecifier | NullableTypeSpecifier |
   * MapArrayTypeSpecifier | DictionaryTypeSpecifier | KeysetTypeSpecifier |
   * VarrayTypeSpecifier | DarrayTypeSpecifier | VectorArrayTypeSpecifier |
   * NoreturnToken | TypeConstant | ClassnameTypeSpecifier
   */
  public function getType(): EditableNode {
    return TypeAssert\instance_of(EditableNode::class, $this->_type);
  }

  public function getWhereClauseUNTYPED(): EditableNode {
    return $this->_where_clause;
  }

  public function withWhereClause(EditableNode $value): this {
    if ($value === $this->_where_clause) {
      return $this;
    }
    return new self(
      $this->_modifiers,
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

  public function hasWhereClause(): bool {
    return !$this->_where_clause->isMissing();
  }

  /**
   * @returns Missing | WhereClause
   */
  public function getWhereClause(): ?WhereClause {
    if ($this->_where_clause->isMissing()) {
      return null;
    }
    return TypeAssert\instance_of(WhereClause::class, $this->_where_clause);
  }

  /**
   * @returns WhereClause
   */
  public function getWhereClausex(): WhereClause {
    return TypeAssert\instance_of(WhereClause::class, $this->_where_clause);
  }
}
