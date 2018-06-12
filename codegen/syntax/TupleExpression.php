<?hh // strict
/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<5a0ff74be979f5032b1ae511c819f153>>
 */
namespace Facebook\HHAST;
use namespace Facebook\TypeAssert;

<<__ConsistentConstruct>>
final class TupleExpression extends EditableNode {

  private EditableNode $_keyword;
  private EditableNode $_left_paren;
  private EditableNode $_items;
  private EditableNode $_right_paren;

  public function __construct(
    EditableNode $keyword,
    EditableNode $left_paren,
    EditableNode $items,
    EditableNode $right_paren,
  ) {
    parent::__construct('tuple_expression');
    $this->_keyword = $keyword;
    $this->_left_paren = $left_paren;
    $this->_items = $items;
    $this->_right_paren = $right_paren;
  }

  <<__Override>>
  public static function fromJSON(
    dict<string, mixed> $json,
    string $file,
    int $offset,
    string $source,
  ): this {
    $keyword = EditableNode::fromJSON(
      /* UNSAFE_EXPR */ $json['tuple_expression_keyword'],
      $file,
      $offset,
      $source,
    );
    $offset += $keyword->getWidth();
    $left_paren = EditableNode::fromJSON(
      /* UNSAFE_EXPR */ $json['tuple_expression_left_paren'],
      $file,
      $offset,
      $source,
    );
    $offset += $left_paren->getWidth();
    $items = EditableNode::fromJSON(
      /* UNSAFE_EXPR */ $json['tuple_expression_items'],
      $file,
      $offset,
      $source,
    );
    $offset += $items->getWidth();
    $right_paren = EditableNode::fromJSON(
      /* UNSAFE_EXPR */ $json['tuple_expression_right_paren'],
      $file,
      $offset,
      $source,
    );
    $offset += $right_paren->getWidth();
    return new static($keyword, $left_paren, $items, $right_paren);
  }

  <<__Override>>
  public function getChildren(): dict<string, EditableNode> {
    return dict[
      'keyword' => $this->_keyword,
      'left_paren' => $this->_left_paren,
      'items' => $this->_items,
      'right_paren' => $this->_right_paren,
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
    $left_paren = $this->_left_paren->rewrite($rewriter, $parents);
    $items = $this->_items->rewrite($rewriter, $parents);
    $right_paren = $this->_right_paren->rewrite($rewriter, $parents);
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

  public function getKeywordUNTYPED(): EditableNode {
    return $this->_keyword;
  }

  public function withKeyword(EditableNode $value): this {
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
   * @returns TupleToken
   */
  public function getKeyword(): TupleToken {
    return TypeAssert\instance_of(TupleToken::class, $this->_keyword);
  }

  /**
   * @returns TupleToken
   */
  public function getKeywordx(): TupleToken {
    return $this->getKeyword();
  }

  public function getLeftParenUNTYPED(): EditableNode {
    return $this->_left_paren;
  }

  public function withLeftParen(EditableNode $value): this {
    if ($value === $this->_left_paren) {
      return $this;
    }
    return
      new static($this->_keyword, $value, $this->_items, $this->_right_paren);
  }

  public function hasLeftParen(): bool {
    return !$this->_left_paren->isMissing();
  }

  /**
   * @returns LeftParenToken
   */
  public function getLeftParen(): LeftParenToken {
    return TypeAssert\instance_of(LeftParenToken::class, $this->_left_paren);
  }

  /**
   * @returns LeftParenToken
   */
  public function getLeftParenx(): LeftParenToken {
    return $this->getLeftParen();
  }

  public function getItemsUNTYPED(): EditableNode {
    return $this->_items;
  }

  public function withItems(EditableNode $value): this {
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
   * @returns EditableList | Missing
   */
  public function getItems(): ?EditableList {
    if ($this->_items->isMissing()) {
      return null;
    }
    return TypeAssert\instance_of(EditableList::class, $this->_items);
  }

  /**
   * @returns EditableList
   */
  public function getItemsx(): EditableList {
    return TypeAssert\instance_of(EditableList::class, $this->_items);
  }

  public function getRightParenUNTYPED(): EditableNode {
    return $this->_right_paren;
  }

  public function withRightParen(EditableNode $value): this {
    if ($value === $this->_right_paren) {
      return $this;
    }
    return
      new static($this->_keyword, $this->_left_paren, $this->_items, $value);
  }

  public function hasRightParen(): bool {
    return !$this->_right_paren->isMissing();
  }

  /**
   * @returns RightParenToken
   */
  public function getRightParen(): RightParenToken {
    return TypeAssert\instance_of(RightParenToken::class, $this->_right_paren);
  }

  /**
   * @returns RightParenToken
   */
  public function getRightParenx(): RightParenToken {
    return $this->getRightParen();
  }
}
