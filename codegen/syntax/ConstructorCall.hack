/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<67c87ee3259a0811b970516ebad0df0d>>
 */
namespace Facebook\HHAST;
use namespace Facebook\TypeAssert;

<<__ConsistentConstruct>>
final class ConstructorCall extends EditableNode {

  const string SYNTAX_KIND = 'constructor_call';

  private EditableNode $_type;
  private EditableNode $_left_paren;
  private EditableNode $_argument_list;
  private EditableNode $_right_paren;

  public function __construct(
    EditableNode $type,
    EditableNode $left_paren,
    EditableNode $argument_list,
    EditableNode $right_paren,
    ?__Private\SourceRef $source_ref = null,
  ) {
    $this->_type = $type;
    $this->_left_paren = $left_paren;
    $this->_argument_list = $argument_list;
    $this->_right_paren = $right_paren;
    parent::__construct($source_ref);
  }

  <<__Override>>
  public static function fromJSON(
    dict<string, mixed> $json,
    string $file,
    int $initial_offset,
    string $source,
  ): this {
    $offset = $initial_offset;
    $type = EditableNode::fromJSON(
      /* HH_FIXME[4110] */ $json['constructor_call_type'],
      $file,
      $offset,
      $source,
    );
    $offset += $type->getWidth();
    $left_paren = EditableNode::fromJSON(
      /* HH_FIXME[4110] */ $json['constructor_call_left_paren'],
      $file,
      $offset,
      $source,
    );
    $offset += $left_paren->getWidth();
    $argument_list = EditableNode::fromJSON(
      /* HH_FIXME[4110] */ $json['constructor_call_argument_list'],
      $file,
      $offset,
      $source,
    );
    $offset += $argument_list->getWidth();
    $right_paren = EditableNode::fromJSON(
      /* HH_FIXME[4110] */ $json['constructor_call_right_paren'],
      $file,
      $offset,
      $source,
    );
    $offset += $right_paren->getWidth();
    $source_ref = shape(
      'file' => $file,
      'source' => $source,
      'offset' => $initial_offset,
      'width' => $offset - $initial_offset,
    );
    return new static(
      $type,
      $left_paren,
      $argument_list,
      $right_paren,
      $source_ref,
    );
  }

  <<__Override>>
  public function getChildren(): dict<string, EditableNode> {
    return dict[
      'type' => $this->_type,
      'left_paren' => $this->_left_paren,
      'argument_list' => $this->_argument_list,
      'right_paren' => $this->_right_paren,
    ];
  }

  <<__Override>>
  public function rewriteChildren(
    self::TRewriter $rewriter,
    vec<EditableNode> $parents = vec[],
  ): this {
    $parents[] = $this;
    $type = $rewriter($this->_type, $parents);
    $left_paren = $rewriter($this->_left_paren, $parents);
    $argument_list = $rewriter($this->_argument_list, $parents);
    $right_paren = $rewriter($this->_right_paren, $parents);
    if (
      $type === $this->_type &&
      $left_paren === $this->_left_paren &&
      $argument_list === $this->_argument_list &&
      $right_paren === $this->_right_paren
    ) {
      return $this;
    }
    return new static($type, $left_paren, $argument_list, $right_paren);
  }

  public function getTypeUNTYPED(): EditableNode {
    return $this->_type;
  }

  public function withType(EditableNode $value): this {
    if ($value === $this->_type) {
      return $this;
    }
    return new static(
      $value,
      $this->_left_paren,
      $this->_argument_list,
      $this->_right_paren,
    );
  }

  public function hasType(): bool {
    return !$this->_type->isMissing();
  }

  /**
   * @return GenericTypeSpecifier | MemberSelectionExpression |
   * ParenthesizedExpression | QualifiedName | ScopeResolutionExpression |
   * SimpleTypeSpecifier | SubscriptExpression | NameToken | ParentToken |
   * SelfToken | StaticToken | VariableExpression
   */
  public function getType(): EditableNode {
    return $this->_type;
  }

  /**
   * @return GenericTypeSpecifier | MemberSelectionExpression |
   * ParenthesizedExpression | QualifiedName | ScopeResolutionExpression |
   * SimpleTypeSpecifier | SubscriptExpression | NameToken | ParentToken |
   * SelfToken | StaticToken | VariableExpression
   */
  public function getTypex(): EditableNode {
    return $this->getType();
  }

  public function getLeftParenUNTYPED(): EditableNode {
    return $this->_left_paren;
  }

  public function withLeftParen(EditableNode $value): this {
    if ($value === $this->_left_paren) {
      return $this;
    }
    return new static(
      $this->_type,
      $value,
      $this->_argument_list,
      $this->_right_paren,
    );
  }

  public function hasLeftParen(): bool {
    return !$this->_left_paren->isMissing();
  }

  /**
   * @return null | LeftParenToken
   */
  public function getLeftParen(): ?LeftParenToken {
    if ($this->_left_paren->isMissing()) {
      return null;
    }
    return TypeAssert\instance_of(LeftParenToken::class, $this->_left_paren);
  }

  /**
   * @return LeftParenToken
   */
  public function getLeftParenx(): LeftParenToken {
    return TypeAssert\not_null($this->getLeftParen());
  }

  public function getArgumentListUNTYPED(): EditableNode {
    return $this->_argument_list;
  }

  public function withArgumentList(EditableNode $value): this {
    if ($value === $this->_argument_list) {
      return $this;
    }
    return new static(
      $this->_type,
      $this->_left_paren,
      $value,
      $this->_right_paren,
    );
  }

  public function hasArgumentList(): bool {
    return !$this->_argument_list->isMissing();
  }

  /**
   * @return EditableList<AnonymousFunction> | EditableList<IExpression> |
   * EditableList<ArrayCreationExpression> |
   * EditableList<ArrayIntrinsicExpression> | EditableList<BinaryExpression> |
   * EditableList<CastExpression> | EditableList<CollectionLiteralExpression> |
   * EditableList<ConditionalExpression> |
   * EditableList<DarrayIntrinsicExpression> |
   * EditableList<DecoratedExpression> |
   * EditableList<DictionaryIntrinsicExpression> |
   * EditableList<FunctionCallExpression> | EditableList<LambdaExpression> |
   * EditableList<LiteralExpression> | EditableList<MemberSelectionExpression>
   * | EditableList<ObjectCreationExpression> |
   * EditableList<ParenthesizedExpression> |
   * EditableList<PipeVariableExpression> | EditableList<PrefixUnaryExpression>
   * | EditableList<ScopeResolutionExpression> | EditableList<ShapeExpression>
   * | EditableList<SubscriptExpression> | EditableList<NameToken> |
   * EditableList<TupleExpression> | EditableList<VariableExpression> |
   * EditableList<VarrayIntrinsicExpression> |
   * EditableList<VectorIntrinsicExpression> | null
   */
  public function getArgumentList(): ?EditableList<IExpression> {
    if ($this->_argument_list->isMissing()) {
      return null;
    }
    return TypeAssert\instance_of(EditableList::class, $this->_argument_list);
  }

  /**
   * @return EditableList<AnonymousFunction> | EditableList<IExpression> |
   * EditableList<ArrayCreationExpression> |
   * EditableList<ArrayIntrinsicExpression> | EditableList<BinaryExpression> |
   * EditableList<CastExpression> | EditableList<CollectionLiteralExpression> |
   * EditableList<ConditionalExpression> |
   * EditableList<DarrayIntrinsicExpression> |
   * EditableList<DecoratedExpression> |
   * EditableList<DictionaryIntrinsicExpression> |
   * EditableList<FunctionCallExpression> | EditableList<LambdaExpression> |
   * EditableList<LiteralExpression> | EditableList<MemberSelectionExpression>
   * | EditableList<ObjectCreationExpression> |
   * EditableList<ParenthesizedExpression> |
   * EditableList<PipeVariableExpression> | EditableList<PrefixUnaryExpression>
   * | EditableList<ScopeResolutionExpression> | EditableList<ShapeExpression>
   * | EditableList<SubscriptExpression> | EditableList<NameToken> |
   * EditableList<TupleExpression> | EditableList<VariableExpression> |
   * EditableList<VarrayIntrinsicExpression> |
   * EditableList<VectorIntrinsicExpression>
   */
  public function getArgumentListx(): EditableList<IExpression> {
    return TypeAssert\not_null($this->getArgumentList());
  }

  public function getRightParenUNTYPED(): EditableNode {
    return $this->_right_paren;
  }

  public function withRightParen(EditableNode $value): this {
    if ($value === $this->_right_paren) {
      return $this;
    }
    return new static(
      $this->_type,
      $this->_left_paren,
      $this->_argument_list,
      $value,
    );
  }

  public function hasRightParen(): bool {
    return !$this->_right_paren->isMissing();
  }

  /**
   * @return null | RightParenToken
   */
  public function getRightParen(): ?RightParenToken {
    if ($this->_right_paren->isMissing()) {
      return null;
    }
    return TypeAssert\instance_of(RightParenToken::class, $this->_right_paren);
  }

  /**
   * @return RightParenToken
   */
  public function getRightParenx(): RightParenToken {
    return TypeAssert\not_null($this->getRightParen());
  }
}
