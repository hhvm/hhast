/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<312df398508be483895327bf29cc52b4>>
 */
namespace Facebook\HHAST;
use namespace Facebook\TypeAssert;
use namespace HH\Lib\Dict;
/* HHAST_IGNORE_ALL[5607] 5607 is ignored because of false positives when comparing a generic to a typed value */
/* HHAST_IGNORE_ALL[5624] HHAST_IGNORE_ALL[5639] 5624 and 5639 are ignored because they insist on using co(tra)variant generics. Could this break external consumers? */

<<__ConsistentConstruct>>
final class TupleExpression extends Node implements ILambdaBody, IExpression {

  const string SYNTAX_KIND = 'tuple_expression';

  private TupleToken $_keyword;
  private LeftParenToken $_left_paren;
  private ?NodeList<ListItem<IExpression>> $_items;
  private RightParenToken $_right_paren;

  public function __construct(
    TupleToken $keyword,
    LeftParenToken $left_paren,
    ?NodeList<ListItem<IExpression>> $items,
    RightParenToken $right_paren,
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
    dict<arraykey, mixed> $json,
    string $file,
    int $initial_offset,
    string $source,
    string $_type_hint,
  ): this {
    $offset = $initial_offset;
    $keyword = Node::fromJSON(
      ($json['tuple_expression_keyword']) as dict<_, _>,
      $file,
      $offset,
      $source,
      'TupleToken',
    );
    $keyword = $keyword as nonnull;
    $offset += $keyword->getWidth();
    $left_paren = Node::fromJSON(
      ($json['tuple_expression_left_paren']) as dict<_, _>,
      $file,
      $offset,
      $source,
      'LeftParenToken',
    );
    $left_paren = $left_paren as nonnull;
    $offset += $left_paren->getWidth();
    $items = Node::fromJSON(
      ($json['tuple_expression_items'] ?? dict['kind' => 'missing'])
        as dict<_, _>,
      $file,
      $offset,
      $source,
      'NodeList<ListItem<IExpression>>',
    );
    $offset += $items?->getWidth() ?? 0;
    $right_paren = Node::fromJSON(
      ($json['tuple_expression_right_paren']) as dict<_, _>,
      $file,
      $offset,
      $source,
      'RightParenToken',
    );
    $right_paren = $right_paren as nonnull;
    $offset += $right_paren->getWidth();
    $source_ref = shape(
      'file' => $file,
      'source' => $source,
      'offset' => $initial_offset,
      'width' => $offset - $initial_offset,
    );
    return new static(
      $keyword as TupleToken,
      $left_paren as LeftParenToken,
      \HH\FIXME\UNSAFE_CAST<?NodeList<Node>, ?NodeList<ListItem<IExpression>>>(
        $items as ?NodeList<_>,
        'Open for sound approaches that are not O(n).',
      ),
      $right_paren as RightParenToken,
      $source_ref,
    );
  }

  <<__Override>>
  public function getChildren(): dict<string, Node> {
    return dict[
      'keyword' => $this->_keyword,
      'left_paren' => $this->_left_paren,
      'items' => $this->_items,
      'right_paren' => $this->_right_paren,
    ]
      |> Dict\filter_nulls($$);
  }

  <<__Override>>
  public function rewriteChildren<Tret as ?Node>(
    (function(Node, vec<Node>): Tret) $rewriter,
    vec<Node> $parents = vec[],
  ): this {
    $parents[] = $this;
    $keyword = $rewriter($this->_keyword, $parents);
    $left_paren = $rewriter($this->_left_paren, $parents);
    $items = $this->_items === null ? null : $rewriter($this->_items, $parents);
    $right_paren = $rewriter($this->_right_paren, $parents);
    if (
      $keyword === $this->_keyword &&
      $left_paren === $this->_left_paren &&
      $items === $this->_items &&
      $right_paren === $this->_right_paren
    ) {
      return $this;
    }
    return new static(
      $keyword as TupleToken,
      $left_paren as LeftParenToken,
      \HH\FIXME\UNSAFE_CAST<?NodeList<Node>, ?NodeList<ListItem<IExpression>>>(
        $items as ?NodeList<_>,
        'Open for sound approaches that are not O(n).',
      ),
      $right_paren as RightParenToken,
    );
  }

  public function getKeywordUNTYPED(): ?Node {
    return $this->_keyword;
  }

  public function withKeyword(TupleToken $value): this {
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
    return true;
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

  public function getLeftParenUNTYPED(): ?Node {
    return $this->_left_paren;
  }

  public function withLeftParen(LeftParenToken $value): this {
    if ($value === $this->_left_paren) {
      return $this;
    }
    return
      new static($this->_keyword, $value, $this->_items, $this->_right_paren);
  }

  public function hasLeftParen(): bool {
    return true;
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

  public function getItemsUNTYPED(): ?Node {
    return $this->_items;
  }

  public function withItems(?NodeList<ListItem<IExpression>> $value): this {
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
    return $this->_items !== null;
  }

  /**
   * @return NodeList<ListItem<BinaryExpression>> |
   * NodeList<ListItem<CastExpression>> | NodeList<ListItem<IContainer>> |
   * NodeList<ListItem<IExpression>> |
   * NodeList<ListItem<DarrayIntrinsicExpression>> |
   * NodeList<ListItem<FunctionCallExpression>> |
   * NodeList<ListItem<LiteralExpression>> |
   * NodeList<ListItem<MemberSelectionExpression>> |
   * NodeList<ListItem<ObjectCreationExpression>> |
   * NodeList<ListItem<SubscriptExpression>> |
   * NodeList<ListItem<VariableExpression>> |
   * NodeList<ListItem<VarrayIntrinsicExpression>> |
   * NodeList<ListItem<VectorIntrinsicExpression>> | null
   */
  public function getItems(): ?NodeList<ListItem<IExpression>> {
    return $this->_items;
  }

  /**
   * @return NodeList<ListItem<BinaryExpression>> |
   * NodeList<ListItem<CastExpression>> | NodeList<ListItem<IContainer>> |
   * NodeList<ListItem<IExpression>> |
   * NodeList<ListItem<DarrayIntrinsicExpression>> |
   * NodeList<ListItem<FunctionCallExpression>> |
   * NodeList<ListItem<LiteralExpression>> |
   * NodeList<ListItem<MemberSelectionExpression>> |
   * NodeList<ListItem<ObjectCreationExpression>> |
   * NodeList<ListItem<SubscriptExpression>> |
   * NodeList<ListItem<VariableExpression>> |
   * NodeList<ListItem<VarrayIntrinsicExpression>> |
   * NodeList<ListItem<VectorIntrinsicExpression>>
   */
  public function getItemsx(): NodeList<ListItem<IExpression>> {
    return TypeAssert\not_null($this->getItems());
  }

  public function getRightParenUNTYPED(): ?Node {
    return $this->_right_paren;
  }

  public function withRightParen(RightParenToken $value): this {
    if ($value === $this->_right_paren) {
      return $this;
    }
    return
      new static($this->_keyword, $this->_left_paren, $this->_items, $value);
  }

  public function hasRightParen(): bool {
    return true;
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
