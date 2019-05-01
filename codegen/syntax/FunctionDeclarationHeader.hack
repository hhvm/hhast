/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<8f8cbca8273c4b6722eb15d11303624f>>
 */
namespace Facebook\HHAST;
use namespace Facebook\TypeAssert;

<<__ConsistentConstruct>>
final class FunctionDeclarationHeader extends EditableNode {

  private EditableNode $_modifiers;
  private EditableNode $_keyword;
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
    EditableNode $name,
    EditableNode $type_parameter_list,
    EditableNode $left_paren,
    EditableNode $parameter_list,
    EditableNode $right_paren,
    EditableNode $colon,
    EditableNode $type,
    EditableNode $where_clause,
    ?__Private\SourceRef $source_ref = null,
  ) {
    $this->_modifiers = $modifiers;
    $this->_keyword = $keyword;
    $this->_name = $name;
    $this->_type_parameter_list = $type_parameter_list;
    $this->_left_paren = $left_paren;
    $this->_parameter_list = $parameter_list;
    $this->_right_paren = $right_paren;
    $this->_colon = $colon;
    $this->_type = $type;
    $this->_where_clause = $where_clause;
    parent::__construct('function_declaration_header', $source_ref);
  }

  <<__Override>>
  public static function fromJSON(
    dict<string, mixed> $json,
    string $file,
    int $initial_offset,
    string $source,
  ): this {
    $offset = $initial_offset;
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
    $source_ref = shape(
      'file' => $file,
      'source' => $source,
      'offset' => $initial_offset,
      'width' => $offset - $initial_offset,
    );
    return new static(
      $modifiers,
      $keyword,
      $name,
      $type_parameter_list,
      $left_paren,
      $parameter_list,
      $right_paren,
      $colon,
      $type,
      $where_clause,
      $source_ref,
    );
  }

  <<__Override>>
  public function getChildren(): dict<string, EditableNode> {
    return dict[
      'modifiers' => $this->_modifiers,
      'keyword' => $this->_keyword,
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
  public function rewriteChildren(
    self::TRewriter $rewriter,
    vec<EditableNode> $parents = vec[],
  ): this {
    $parents[] = $this;
    $modifiers = $rewriter($this->_modifiers, $parents);
    $keyword = $rewriter($this->_keyword, $parents);
    $name = $rewriter($this->_name, $parents);
    $type_parameter_list = $rewriter($this->_type_parameter_list, $parents);
    $left_paren = $rewriter($this->_left_paren, $parents);
    $parameter_list = $rewriter($this->_parameter_list, $parents);
    $right_paren = $rewriter($this->_right_paren, $parents);
    $colon = $rewriter($this->_colon, $parents);
    $type = $rewriter($this->_type, $parents);
    $where_clause = $rewriter($this->_where_clause, $parents);
    if (
      $modifiers === $this->_modifiers &&
      $keyword === $this->_keyword &&
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
    return new static(
      $modifiers,
      $keyword,
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
    return new static(
      $value,
      $this->_keyword,
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
   * @return EditableList<EditableNode> | null
   */
  public function getModifiers(): ?EditableList<EditableNode> {
    if ($this->_modifiers->isMissing()) {
      return null;
    }
    return TypeAssert\instance_of(EditableList::class, $this->_modifiers);
  }

  /**
   * @return EditableList<EditableNode>
   */
  public function getModifiersx(): EditableList<EditableNode> {
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
      $this->_modifiers,
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

  public function hasKeyword(): bool {
    return !$this->_keyword->isMissing();
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

  public function getNameUNTYPED(): EditableNode {
    return $this->_name;
  }

  public function withName(EditableNode $value): this {
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
      $this->_colon,
      $this->_type,
      $this->_where_clause,
    );
  }

  public function hasName(): bool {
    return !$this->_name->isMissing();
  }

  /**
   * @return ConstructToken | DestructToken | NameToken
   */
  public function getName(): EditableToken {
    return TypeAssert\instance_of(EditableToken::class, $this->_name);
  }

  /**
   * @return ConstructToken | DestructToken | NameToken
   */
  public function getNamex(): EditableToken {
    return $this->getName();
  }

  public function getTypeParameterListUNTYPED(): EditableNode {
    return $this->_type_parameter_list;
  }

  public function withTypeParameterList(EditableNode $value): this {
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
      $this->_colon,
      $this->_type,
      $this->_where_clause,
    );
  }

  public function hasTypeParameterList(): bool {
    return !$this->_type_parameter_list->isMissing();
  }

  /**
   * @return null | TypeParameters
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
   * @return TypeParameters
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
    return new static(
      $this->_modifiers,
      $this->_keyword,
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

  public function getParameterListUNTYPED(): EditableNode {
    return $this->_parameter_list;
  }

  public function withParameterList(EditableNode $value): this {
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
      $this->_colon,
      $this->_type,
      $this->_where_clause,
    );
  }

  public function hasParameterList(): bool {
    return !$this->_parameter_list->isMissing();
  }

  /**
   * @return EditableList<ParameterDeclaration> | EditableList<EditableNode> |
   * EditableList<VariadicParameter> | null
   */
  public function getParameterList(): ?EditableList<EditableNode> {
    if ($this->_parameter_list->isMissing()) {
      return null;
    }
    return TypeAssert\instance_of(EditableList::class, $this->_parameter_list);
  }

  /**
   * @return EditableList<ParameterDeclaration> | EditableList<EditableNode> |
   * EditableList<VariadicParameter>
   */
  public function getParameterListx(): EditableList<EditableNode> {
    return TypeAssert\instance_of(EditableList::class, $this->_parameter_list);
  }

  public function getRightParenUNTYPED(): EditableNode {
    return $this->_right_paren;
  }

  public function withRightParen(EditableNode $value): this {
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
      $this->_colon,
      $this->_type,
      $this->_where_clause,
    );
  }

  public function hasRightParen(): bool {
    return !$this->_right_paren->isMissing();
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

  public function getColonUNTYPED(): EditableNode {
    return $this->_colon;
  }

  public function withColon(EditableNode $value): this {
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
      $value,
      $this->_type,
      $this->_where_clause,
    );
  }

  public function hasColon(): bool {
    return !$this->_colon->isMissing();
  }

  /**
   * @return null | ColonToken
   */
  public function getColon(): ?ColonToken {
    if ($this->_colon->isMissing()) {
      return null;
    }
    return TypeAssert\instance_of(ColonToken::class, $this->_colon);
  }

  /**
   * @return ColonToken
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
    return new static(
      $this->_modifiers,
      $this->_keyword,
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
   * @return ClassnameTypeSpecifier | ClosureTypeSpecifier |
   * DarrayTypeSpecifier | DictionaryTypeSpecifier | GenericTypeSpecifier |
   * KeysetTypeSpecifier | LikeTypeSpecifier | MapArrayTypeSpecifier | null |
   * NullableTypeSpecifier | ShapeTypeSpecifier | SimpleTypeSpecifier |
   * SoftTypeSpecifier | NoreturnToken | TupleTypeSpecifier | TypeConstant |
   * VarrayTypeSpecifier | VectorArrayTypeSpecifier | VectorTypeSpecifier
   */
  public function getType(): ?EditableNode {
    if ($this->_type->isMissing()) {
      return null;
    }
    return TypeAssert\instance_of(EditableNode::class, $this->_type);
  }

  /**
   * @return ClassnameTypeSpecifier | ClosureTypeSpecifier |
   * DarrayTypeSpecifier | DictionaryTypeSpecifier | GenericTypeSpecifier |
   * KeysetTypeSpecifier | LikeTypeSpecifier | MapArrayTypeSpecifier |
   * NullableTypeSpecifier | ShapeTypeSpecifier | SimpleTypeSpecifier |
   * SoftTypeSpecifier | NoreturnToken | TupleTypeSpecifier | TypeConstant |
   * VarrayTypeSpecifier | VectorArrayTypeSpecifier | VectorTypeSpecifier
   */
  public function getTypex(): EditableNode {
    return TypeAssert\instance_of(EditableNode::class, $this->_type);
  }

  public function getWhereClauseUNTYPED(): EditableNode {
    return $this->_where_clause;
  }

  public function withWhereClause(EditableNode $value): this {
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
      $this->_colon,
      $this->_type,
      $value,
    );
  }

  public function hasWhereClause(): bool {
    return !$this->_where_clause->isMissing();
  }

  /**
   * @return null | WhereClause
   */
  public function getWhereClause(): ?WhereClause {
    if ($this->_where_clause->isMissing()) {
      return null;
    }
    return TypeAssert\instance_of(WhereClause::class, $this->_where_clause);
  }

  /**
   * @return WhereClause
   */
  public function getWhereClausex(): WhereClause {
    return TypeAssert\instance_of(WhereClause::class, $this->_where_clause);
  }
}
