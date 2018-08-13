<?hh // strict
/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<e79fd07bc3914a7043f3fc3b687a2204>>
 */
namespace Facebook\HHAST;
use namespace Facebook\TypeAssert;

<<__ConsistentConstruct>>
final class VectorIntrinsicExpression extends EditableNode {

  private EditableNode $_keyword;
  private EditableNode $_explicit_type;
  private EditableNode $_left_bracket;
  private EditableNode $_members;
  private EditableNode $_right_bracket;

  public function __construct(
    EditableNode $keyword,
    EditableNode $explicit_type,
    EditableNode $left_bracket,
    EditableNode $members,
    EditableNode $right_bracket,
  ) {
    parent::__construct('vector_intrinsic_expression');
    $this->_keyword = $keyword;
    $this->_explicit_type = $explicit_type;
    $this->_left_bracket = $left_bracket;
    $this->_members = $members;
    $this->_right_bracket = $right_bracket;
  }

  <<__Override>>
  public static function fromJSON(
    dict<string, mixed> $json,
    string $file,
    int $offset,
    string $source,
  ): this {
    $keyword = EditableNode::fromJSON(
      /* UNSAFE_EXPR */ $json['vector_intrinsic_keyword'],
      $file,
      $offset,
      $source,
    );
    $offset += $keyword->getWidth();
    $explicit_type = EditableNode::fromJSON(
      /* UNSAFE_EXPR */ $json['vector_intrinsic_explicit_type'],
      $file,
      $offset,
      $source,
    );
    $offset += $explicit_type->getWidth();
    $left_bracket = EditableNode::fromJSON(
      /* UNSAFE_EXPR */ $json['vector_intrinsic_left_bracket'],
      $file,
      $offset,
      $source,
    );
    $offset += $left_bracket->getWidth();
    $members = EditableNode::fromJSON(
      /* UNSAFE_EXPR */ $json['vector_intrinsic_members'],
      $file,
      $offset,
      $source,
    );
    $offset += $members->getWidth();
    $right_bracket = EditableNode::fromJSON(
      /* UNSAFE_EXPR */ $json['vector_intrinsic_right_bracket'],
      $file,
      $offset,
      $source,
    );
    $offset += $right_bracket->getWidth();
    return new static(
      $keyword,
      $explicit_type,
      $left_bracket,
      $members,
      $right_bracket,
    );
  }

  <<__Override>>
  public function getChildren(): dict<string, EditableNode> {
    return dict[
      'keyword' => $this->_keyword,
      'explicit_type' => $this->_explicit_type,
      'left_bracket' => $this->_left_bracket,
      'members' => $this->_members,
      'right_bracket' => $this->_right_bracket,
    ];
  }

  <<__Override>>
  public function rewriteDescendants(
    self::TRewriter $rewriter,
    ?vec<EditableNode> $parents = null,
  ): this {
    $parents = $parents === null ? vec[] : vec($parents);
    $parents[] = $this;
    $keyword = $this->_keyword->rewrite($rewriter, $parents);
    $explicit_type = $this->_explicit_type->rewrite($rewriter, $parents);
    $left_bracket = $this->_left_bracket->rewrite($rewriter, $parents);
    $members = $this->_members->rewrite($rewriter, $parents);
    $right_bracket = $this->_right_bracket->rewrite($rewriter, $parents);
    if (
      $keyword === $this->_keyword &&
      $explicit_type === $this->_explicit_type &&
      $left_bracket === $this->_left_bracket &&
      $members === $this->_members &&
      $right_bracket === $this->_right_bracket
    ) {
      return $this;
    }
    return new static(
      $keyword,
      $explicit_type,
      $left_bracket,
      $members,
      $right_bracket,
    );
  }

  public function getKeywordUNTYPED(): EditableNode {
    return $this->_keyword;
  }

  public function withKeyword(EditableNode $value): this {
    if ($value === $this->_keyword) {
      return $this;
    }
    return new static(
      $value,
      $this->_explicit_type,
      $this->_left_bracket,
      $this->_members,
      $this->_right_bracket,
    );
  }

  public function hasKeyword(): bool {
    return !$this->_keyword->isMissing();
  }

  /**
   * @returns VecToken
   */
  public function getKeyword(): VecToken {
    return TypeAssert\instance_of(VecToken::class, $this->_keyword);
  }

  /**
   * @returns VecToken
   */
  public function getKeywordx(): VecToken {
    return $this->getKeyword();
  }

  public function getExplicitTypeUNTYPED(): EditableNode {
    return $this->_explicit_type;
  }

  public function withExplicitType(EditableNode $value): this {
    if ($value === $this->_explicit_type) {
      return $this;
    }
    return new static(
      $this->_keyword,
      $value,
      $this->_left_bracket,
      $this->_members,
      $this->_right_bracket,
    );
  }

  public function hasExplicitType(): bool {
    return !$this->_explicit_type->isMissing();
  }

  /**
   * @returns Missing
   */
  public function getExplicitType(): ?EditableNode {
    if ($this->_explicit_type->isMissing()) {
      return null;
    }
    return TypeAssert\instance_of(EditableNode::class, $this->_explicit_type);
  }

  /**
   * @returns
   */
  public function getExplicitTypex(): EditableNode {
    return TypeAssert\instance_of(EditableNode::class, $this->_explicit_type);
  }

  public function getLeftBracketUNTYPED(): EditableNode {
    return $this->_left_bracket;
  }

  public function withLeftBracket(EditableNode $value): this {
    if ($value === $this->_left_bracket) {
      return $this;
    }
    return new static(
      $this->_keyword,
      $this->_explicit_type,
      $value,
      $this->_members,
      $this->_right_bracket,
    );
  }

  public function hasLeftBracket(): bool {
    return !$this->_left_bracket->isMissing();
  }

  /**
   * @returns LeftBracketToken
   */
  public function getLeftBracket(): LeftBracketToken {
    return
      TypeAssert\instance_of(LeftBracketToken::class, $this->_left_bracket);
  }

  /**
   * @returns LeftBracketToken
   */
  public function getLeftBracketx(): LeftBracketToken {
    return $this->getLeftBracket();
  }

  public function getMembersUNTYPED(): EditableNode {
    return $this->_members;
  }

  public function withMembers(EditableNode $value): this {
    if ($value === $this->_members) {
      return $this;
    }
    return new static(
      $this->_keyword,
      $this->_explicit_type,
      $this->_left_bracket,
      $value,
      $this->_right_bracket,
    );
  }

  public function hasMembers(): bool {
    return !$this->_members->isMissing();
  }

  /**
   * @returns EditableList<EditableNode> |
   * EditableList<CollectionLiteralExpression> |
   * EditableList<ConditionalExpression> |
   * EditableList<DictionaryIntrinsicExpression> |
   * EditableList<FunctionCallExpression> |
   * EditableList<KeysetIntrinsicExpression> | EditableList<LiteralExpression>
   * | EditableList<ObjectCreationExpression> |
   * EditableList<ScopeResolutionExpression> | EditableList<ShapeExpression> |
   * EditableList<NameToken> | EditableList<TupleExpression> |
   * EditableList<VariableExpression> | EditableList<VectorIntrinsicExpression>
   * | EditableList<XHPExpression> | Missing
   */
  public function getMembers(): ?EditableList<EditableNode> {
    if ($this->_members->isMissing()) {
      return null;
    }
    return TypeAssert\instance_of(EditableList::class, $this->_members);
  }

  /**
   * @returns EditableList<EditableNode> |
   * EditableList<CollectionLiteralExpression> |
   * EditableList<ConditionalExpression> |
   * EditableList<DictionaryIntrinsicExpression> |
   * EditableList<FunctionCallExpression> |
   * EditableList<KeysetIntrinsicExpression> | EditableList<LiteralExpression>
   * | EditableList<ObjectCreationExpression> |
   * EditableList<ScopeResolutionExpression> | EditableList<ShapeExpression> |
   * EditableList<NameToken> | EditableList<TupleExpression> |
   * EditableList<VariableExpression> | EditableList<VectorIntrinsicExpression>
   * | EditableList<XHPExpression>
   */
  public function getMembersx(): EditableList<EditableNode> {
    return TypeAssert\instance_of(EditableList::class, $this->_members);
  }

  public function getRightBracketUNTYPED(): EditableNode {
    return $this->_right_bracket;
  }

  public function withRightBracket(EditableNode $value): this {
    if ($value === $this->_right_bracket) {
      return $this;
    }
    return new static(
      $this->_keyword,
      $this->_explicit_type,
      $this->_left_bracket,
      $this->_members,
      $value,
    );
  }

  public function hasRightBracket(): bool {
    return !$this->_right_bracket->isMissing();
  }

  /**
   * @returns RightBracketToken
   */
  public function getRightBracket(): RightBracketToken {
    return
      TypeAssert\instance_of(RightBracketToken::class, $this->_right_bracket);
  }

  /**
   * @returns RightBracketToken
   */
  public function getRightBracketx(): RightBracketToken {
    return $this->getRightBracket();
  }
}
