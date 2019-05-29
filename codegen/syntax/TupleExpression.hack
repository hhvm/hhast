/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<e783f4d8d350447267849c2c1f32bb34>>
 */
namespace Facebook\HHAST;
use namespace Facebook\TypeAssert;

<<__ConsistentConstruct>>
final class TupleExpression extends Node implements ILambdaBody, IExpression {

  const string SYNTAX_KIND = 'tuple_expression';

  private Node $_keyword;
  private Node $_left_paren;
  private Node $_items;
  private Node $_right_paren;

  public function __construct(
    Node $keyword,
    Node $left_paren,
    Node $items,
    Node $right_paren,
    ?__Private\SourceRef $source_ref = null,
  ) {
    $this->_keyword = $keyword;
    $this->_left_paren = $left_paren;
    $this->_items = $items;
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
    $keyword = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['tuple_expression_keyword'],
      $file,
      $offset,
      $source,
    );
    $offset += $keyword->getWidth();
    $left_paren = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['tuple_expression_left_paren'],
      $file,
      $offset,
      $source,
    );
    $offset += $left_paren->getWidth();
    $items = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['tuple_expression_items'],
      $file,
      $offset,
      $source,
    );
    $offset += $items->getWidth();
    $right_paren = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['tuple_expression_right_paren'],
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
    return new static($keyword, $left_paren, $items, $right_paren, $source_ref);
  }

  <<__Override>>
  public function getChildren(): dict<string, Node> {
    return dict[
      'keyword' => $this->_keyword,
      'left_paren' => $this->_left_paren,
      'items' => $this->_items,
      'right_paren' => $this->_right_paren,
    ];
  }

  <<__Override>>
  public function rewriteChildren(
    self::TRewriter $rewriter,
    vec<Node> $parents = vec[],
  ): this {
    $parents[] = $this;
    $keyword = $rewriter($this->_keyword, $parents);
    $left_paren = $rewriter($this->_left_paren, $parents);
    $items = $rewriter($this->_items, $parents);
    $right_paren = $rewriter($this->_right_paren, $parents);
    if (
      $keyword === $this->_keyword &&
      $left_paren === $this->_left_paren &&
      $items === $this->_items &&
      $right_paren === $this->_right_paren
    ) {
      return $this;
    }
    return new static($keyword, $left_paren, $items, $right_paren);
  }

  public function getKeywordUNTYPED(): Node {
    return $this->_keyword;
  }

  public function withKeyword(Node $value): this {
    if ($value === $this->_keyword) {
      return $this;
    }
    return new static(
      $value,
      $this->_left_paren,
      $this->_items,
      $this->_right_paren,
    );
  }

  public function hasKeyword(): bool {
    return !$this->_keyword->isMissing();
  }

  /**
   * @return TupleToken
   */
  public function getKeyword(): TupleToken {
    return TypeAssert\instance_of(TupleToken::class, $this->_keyword);
  }

  /**
   * @return TupleToken
   */
  public function getKeywordx(): TupleToken {
    return $this->getKeyword();
  }

  public function getLeftParenUNTYPED(): Node {
    return $this->_left_paren;
  }

  public function withLeftParen(Node $value): this {
    if ($value === $this->_left_paren) {
      return $this;
    }
    return new static(
      $this->_keyword,
      $value,
      $this->_items,
      $this->_right_paren,
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

  public function getItemsUNTYPED(): Node {
    return $this->_items;
  }

  public function withItems(Node $value): this {
    if ($value === $this->_items) {
      return $this;
    }
    return new static(
      $this->_keyword,
      $this->_left_paren,
      $value,
      $this->_right_paren,
    );
  }

  public function hasItems(): bool {
    return !$this->_items->isMissing();
  }

  /**
   * @return NodeList<ArrayCreationExpression> | NodeList<IContainer> |
   * NodeList<IExpression> | NodeList<BinaryExpression> |
   * NodeList<CastExpression> | NodeList<DarrayIntrinsicExpression> |
   * NodeList<FunctionCallExpression> | NodeList<LiteralExpression> |
   * NodeList<ObjectCreationExpression> | NodeList<SubscriptExpression> |
   * NodeList<VariableExpression> | NodeList<VarrayIntrinsicExpression> |
   * NodeList<VectorIntrinsicExpression> | null
   */
  public function getItems(): ?NodeList<IExpression> {
    if ($this->_items->isMissing()) {
      return null;
    }
    return TypeAssert\instance_of(NodeList::class, $this->_items);
  }

  /**
   * @return NodeList<ArrayCreationExpression> | NodeList<IContainer> |
   * NodeList<IExpression> | NodeList<BinaryExpression> |
   * NodeList<CastExpression> | NodeList<DarrayIntrinsicExpression> |
   * NodeList<FunctionCallExpression> | NodeList<LiteralExpression> |
   * NodeList<ObjectCreationExpression> | NodeList<SubscriptExpression> |
   * NodeList<VariableExpression> | NodeList<VarrayIntrinsicExpression> |
   * NodeList<VectorIntrinsicExpression>
   */
  public function getItemsx(): NodeList<IExpression> {
    return TypeAssert\not_null($this->getItems());
  }

  public function getRightParenUNTYPED(): Node {
    return $this->_right_paren;
  }

  public function withRightParen(Node $value): this {
    if ($value === $this->_right_paren) {
      return $this;
    }
    return new static(
      $this->_keyword,
      $this->_left_paren,
      $this->_items,
      $value,
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
}
