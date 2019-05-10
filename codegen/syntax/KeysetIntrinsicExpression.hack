/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<99a30961b40a0ceba073b648ba80ab1f>>
 */
namespace Facebook\HHAST;
use namespace Facebook\TypeAssert;

<<__ConsistentConstruct>>
final class KeysetIntrinsicExpression
  extends EditableNode
  implements IHackArray, IContainer, ILambdaBody, IExpression {

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
    ?__Private\SourceRef $source_ref = null,
  ) {
    $this->_keyword = $keyword;
    $this->_explicit_type = $explicit_type;
    $this->_left_bracket = $left_bracket;
    $this->_members = $members;
    $this->_right_bracket = $right_bracket;
    parent::__construct('keyset_intrinsic_expression', $source_ref);
  }

  <<__Override>>
  public static function fromJSON(
    dict<string, mixed> $json,
    string $file,
    int $initial_offset,
    string $source,
  ): this {
    $offset = $initial_offset;
    $keyword = EditableNode::fromJSON(
      /* UNSAFE_EXPR */ $json['keyset_intrinsic_keyword'],
      $file,
      $offset,
      $source,
    );
    $offset += $keyword->getWidth();
    $explicit_type = EditableNode::fromJSON(
      /* UNSAFE_EXPR */ $json['keyset_intrinsic_explicit_type'],
      $file,
      $offset,
      $source,
    );
    $offset += $explicit_type->getWidth();
    $left_bracket = EditableNode::fromJSON(
      /* UNSAFE_EXPR */ $json['keyset_intrinsic_left_bracket'],
      $file,
      $offset,
      $source,
    );
    $offset += $left_bracket->getWidth();
    $members = EditableNode::fromJSON(
      /* UNSAFE_EXPR */ $json['keyset_intrinsic_members'],
      $file,
      $offset,
      $source,
    );
    $offset += $members->getWidth();
    $right_bracket = EditableNode::fromJSON(
      /* UNSAFE_EXPR */ $json['keyset_intrinsic_right_bracket'],
      $file,
      $offset,
      $source,
    );
    $offset += $right_bracket->getWidth();
    $source_ref = shape(
      'file' => $file,
      'source' => $source,
      'offset' => $initial_offset,
      'width' => $offset - $initial_offset,
    );
    return new static(
      $keyword,
      $explicit_type,
      $left_bracket,
      $members,
      $right_bracket,
      $source_ref,
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
  public function rewriteChildren(
    self::TRewriter $rewriter,
    vec<EditableNode> $parents = vec[],
  ): this {
    $parents[] = $this;
    $keyword = $rewriter($this->_keyword, $parents);
    $explicit_type = $rewriter($this->_explicit_type, $parents);
    $left_bracket = $rewriter($this->_left_bracket, $parents);
    $members = $rewriter($this->_members, $parents);
    $right_bracket = $rewriter($this->_right_bracket, $parents);
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
   * @return KeysetToken
   */
  public function getKeyword(): KeysetToken {
    return TypeAssert\instance_of(KeysetToken::class, $this->_keyword);
  }

  /**
   * @return KeysetToken
   */
  public function getKeywordx(): KeysetToken {
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
   * @return null | TypeArguments
   */
  public function getExplicitType(): ?TypeArguments {
    if ($this->_explicit_type->isMissing()) {
      return null;
    }
    return TypeAssert\instance_of(TypeArguments::class, $this->_explicit_type);
  }

  /**
   * @return TypeArguments
   */
  public function getExplicitTypex(): TypeArguments {
    return TypeAssert\not_null($this->getExplicitType());
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
   * @return LeftBracketToken
   */
  public function getLeftBracket(): LeftBracketToken {
    return TypeAssert\instance_of(
      LeftBracketToken::class,
      $this->_left_bracket,
    );
  }

  /**
   * @return LeftBracketToken
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
   * @return EditableList<IExpression> | EditableList<ConditionalExpression> |
   * EditableList<FunctionCallExpression> | EditableList<LiteralExpression> |
   * EditableList<ScopeResolutionExpression> | EditableList<NameToken> | null
   */
  public function getMembers(): ?EditableList<IExpression> {
    if ($this->_members->isMissing()) {
      return null;
    }
    return TypeAssert\instance_of(EditableList::class, $this->_members);
  }

  /**
   * @return EditableList<IExpression> | EditableList<ConditionalExpression> |
   * EditableList<FunctionCallExpression> | EditableList<LiteralExpression> |
   * EditableList<ScopeResolutionExpression> | EditableList<NameToken>
   */
  public function getMembersx(): EditableList<IExpression> {
    return TypeAssert\not_null($this->getMembers());
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
   * @return RightBracketToken
   */
  public function getRightBracket(): RightBracketToken {
    return TypeAssert\instance_of(
      RightBracketToken::class,
      $this->_right_bracket,
    );
  }

  /**
   * @return RightBracketToken
   */
  public function getRightBracketx(): RightBracketToken {
    return $this->getRightBracket();
  }
}
