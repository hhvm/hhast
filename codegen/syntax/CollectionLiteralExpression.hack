/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<4b46dc6c1c3a7daa76f87a0d9fe0daf5>>
 */
namespace Facebook\HHAST;
use namespace Facebook\TypeAssert;

<<__ConsistentConstruct>>
final class CollectionLiteralExpression
  extends EditableNode
  implements IContainer, ILambdaBody, IExpression {

  const string SYNTAX_KIND = 'collection_literal_expression';

  private EditableNode $_name;
  private EditableNode $_left_brace;
  private EditableNode $_initializers;
  private EditableNode $_right_brace;

  public function __construct(
    EditableNode $name,
    EditableNode $left_brace,
    EditableNode $initializers,
    EditableNode $right_brace,
    ?__Private\SourceRef $source_ref = null,
  ) {
    $this->_name = $name;
    $this->_left_brace = $left_brace;
    $this->_initializers = $initializers;
    $this->_right_brace = $right_brace;
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
    $name = EditableNode::fromJSON(
      /* HH_FIXME[4110] */ $json['collection_literal_name'],
      $file,
      $offset,
      $source,
    );
    $offset += $name->getWidth();
    $left_brace = EditableNode::fromJSON(
      /* HH_FIXME[4110] */ $json['collection_literal_left_brace'],
      $file,
      $offset,
      $source,
    );
    $offset += $left_brace->getWidth();
    $initializers = EditableNode::fromJSON(
      /* HH_FIXME[4110] */ $json['collection_literal_initializers'],
      $file,
      $offset,
      $source,
    );
    $offset += $initializers->getWidth();
    $right_brace = EditableNode::fromJSON(
      /* HH_FIXME[4110] */ $json['collection_literal_right_brace'],
      $file,
      $offset,
      $source,
    );
    $offset += $right_brace->getWidth();
    $source_ref = shape(
      'file' => $file,
      'source' => $source,
      'offset' => $initial_offset,
      'width' => $offset - $initial_offset,
    );
    return new static(
      $name,
      $left_brace,
      $initializers,
      $right_brace,
      $source_ref,
    );
  }

  <<__Override>>
  public function getChildren(): dict<string, EditableNode> {
    return dict[
      'name' => $this->_name,
      'left_brace' => $this->_left_brace,
      'initializers' => $this->_initializers,
      'right_brace' => $this->_right_brace,
    ];
  }

  <<__Override>>
  public function rewriteChildren(
    self::TRewriter $rewriter,
    vec<EditableNode> $parents = vec[],
  ): this {
    $parents[] = $this;
    $name = $rewriter($this->_name, $parents);
    $left_brace = $rewriter($this->_left_brace, $parents);
    $initializers = $rewriter($this->_initializers, $parents);
    $right_brace = $rewriter($this->_right_brace, $parents);
    if (
      $name === $this->_name &&
      $left_brace === $this->_left_brace &&
      $initializers === $this->_initializers &&
      $right_brace === $this->_right_brace
    ) {
      return $this;
    }
    return new static($name, $left_brace, $initializers, $right_brace);
  }

  public function getNameUNTYPED(): EditableNode {
    return $this->_name;
  }

  public function withName(EditableNode $value): this {
    if ($value === $this->_name) {
      return $this;
    }
    return new static(
      $value,
      $this->_left_brace,
      $this->_initializers,
      $this->_right_brace,
    );
  }

  public function hasName(): bool {
    return !$this->_name->isMissing();
  }

  /**
   * @return GenericTypeSpecifier | SimpleTypeSpecifier
   */
  public function getName(): ISimpleCreationSpecifier {
    return TypeAssert\instance_of(
      ISimpleCreationSpecifier::class,
      $this->_name,
    );
  }

  /**
   * @return GenericTypeSpecifier | SimpleTypeSpecifier
   */
  public function getNamex(): ISimpleCreationSpecifier {
    return $this->getName();
  }

  public function getLeftBraceUNTYPED(): EditableNode {
    return $this->_left_brace;
  }

  public function withLeftBrace(EditableNode $value): this {
    if ($value === $this->_left_brace) {
      return $this;
    }
    return new static(
      $this->_name,
      $value,
      $this->_initializers,
      $this->_right_brace,
    );
  }

  public function hasLeftBrace(): bool {
    return !$this->_left_brace->isMissing();
  }

  /**
   * @return LeftBraceToken
   */
  public function getLeftBrace(): LeftBraceToken {
    return TypeAssert\instance_of(LeftBraceToken::class, $this->_left_brace);
  }

  /**
   * @return LeftBraceToken
   */
  public function getLeftBracex(): LeftBraceToken {
    return $this->getLeftBrace();
  }

  public function getInitializersUNTYPED(): EditableNode {
    return $this->_initializers;
  }

  public function withInitializers(EditableNode $value): this {
    if ($value === $this->_initializers) {
      return $this;
    }
    return new static(
      $this->_name,
      $this->_left_brace,
      $value,
      $this->_right_brace,
    );
  }

  public function hasInitializers(): bool {
    return !$this->_initializers->isMissing();
  }

  /**
   * @return EditableList<AnonymousFunction> |
   * EditableList<ArrayCreationExpression> |
   * EditableList<ArrayIntrinsicExpression> | EditableList<IContainer> |
   * EditableList<IExpression> | EditableList<CastExpression> |
   * EditableList<CollectionLiteralExpression> |
   * EditableList<ElementInitializer> | EditableList<FunctionCallExpression> |
   * EditableList<LambdaExpression> | EditableList<LiteralExpression> |
   * EditableList<ObjectCreationExpression> |
   * EditableList<ScopeResolutionExpression> | EditableList<ShapeExpression> |
   * EditableList<SubscriptExpression> | EditableList<NameToken> |
   * EditableList<TupleExpression> | EditableList<VariableExpression> |
   * EditableList<VarrayIntrinsicExpression> | null
   */
  public function getInitializers(): ?EditableList<EditableNode> {
    if ($this->_initializers->isMissing()) {
      return null;
    }
    return TypeAssert\instance_of(EditableList::class, $this->_initializers);
  }

  /**
   * @return EditableList<AnonymousFunction> |
   * EditableList<ArrayCreationExpression> |
   * EditableList<ArrayIntrinsicExpression> | EditableList<IContainer> |
   * EditableList<IExpression> | EditableList<CastExpression> |
   * EditableList<CollectionLiteralExpression> |
   * EditableList<ElementInitializer> | EditableList<FunctionCallExpression> |
   * EditableList<LambdaExpression> | EditableList<LiteralExpression> |
   * EditableList<ObjectCreationExpression> |
   * EditableList<ScopeResolutionExpression> | EditableList<ShapeExpression> |
   * EditableList<SubscriptExpression> | EditableList<NameToken> |
   * EditableList<TupleExpression> | EditableList<VariableExpression> |
   * EditableList<VarrayIntrinsicExpression>
   */
  public function getInitializersx(): EditableList<EditableNode> {
    return TypeAssert\not_null($this->getInitializers());
  }

  public function getRightBraceUNTYPED(): EditableNode {
    return $this->_right_brace;
  }

  public function withRightBrace(EditableNode $value): this {
    if ($value === $this->_right_brace) {
      return $this;
    }
    return new static(
      $this->_name,
      $this->_left_brace,
      $this->_initializers,
      $value,
    );
  }

  public function hasRightBrace(): bool {
    return !$this->_right_brace->isMissing();
  }

  /**
   * @return RightBraceToken
   */
  public function getRightBrace(): RightBraceToken {
    return TypeAssert\instance_of(RightBraceToken::class, $this->_right_brace);
  }

  /**
   * @return RightBraceToken
   */
  public function getRightBracex(): RightBraceToken {
    return $this->getRightBrace();
  }
}
