<?hh // strict
/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<30c83cc9eb68ecdf52c6425ea4e80397>>
 */
namespace Facebook\HHAST;
use namespace Facebook\TypeAssert;

<<__ConsistentConstruct>>
final class EmptyExpression extends EditableNode {

  private EditableNode $_keyword;
  private EditableNode $_left_paren;
  private EditableNode $_argument;
  private EditableNode $_right_paren;

  public function __construct(
    EditableNode $keyword,
    EditableNode $left_paren,
    EditableNode $argument,
    EditableNode $right_paren,
  ) {
    parent::__construct('empty_expression');
    $this->_keyword = $keyword;
    $this->_left_paren = $left_paren;
    $this->_argument = $argument;
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
      /* UNSAFE_EXPR */ $json['empty_keyword'],
      $file,
      $offset,
      $source,
    );
    $offset += $keyword->getWidth();
    $left_paren = EditableNode::fromJSON(
      /* UNSAFE_EXPR */ $json['empty_left_paren'],
      $file,
      $offset,
      $source,
    );
    $offset += $left_paren->getWidth();
    $argument = EditableNode::fromJSON(
      /* UNSAFE_EXPR */ $json['empty_argument'],
      $file,
      $offset,
      $source,
    );
    $offset += $argument->getWidth();
    $right_paren = EditableNode::fromJSON(
      /* UNSAFE_EXPR */ $json['empty_right_paren'],
      $file,
      $offset,
      $source,
    );
    $offset += $right_paren->getWidth();
    return new static($keyword, $left_paren, $argument, $right_paren);
  }

  <<__Override>>
  public function getChildren(): dict<string, EditableNode> {
    return dict[
      'keyword' => $this->_keyword,
      'left_paren' => $this->_left_paren,
      'argument' => $this->_argument,
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
    $argument = $this->_argument->rewrite($rewriter, $parents);
    $right_paren = $this->_right_paren->rewrite($rewriter, $parents);
    if (
      $keyword === $this->_keyword &&
      $left_paren === $this->_left_paren &&
      $argument === $this->_argument &&
      $right_paren === $this->_right_paren
    ) {
      return $this;
    }
    return new static($keyword, $left_paren, $argument, $right_paren);
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
      $this->_argument,
      $this->_right_paren,
    );
  }

  public function hasKeyword(): bool {
    return !$this->_keyword->isMissing();
  }

  /**
   * @returns EmptyToken
   */
  public function getKeyword(): EmptyToken {
    return TypeAssert\instance_of(EmptyToken::class, $this->_keyword);
  }

  /**
   * @returns EmptyToken
   */
  public function getKeywordx(): EmptyToken {
    return $this->getKeyword();
  }

  public function getLeftParenUNTYPED(): EditableNode {
    return $this->_left_paren;
  }

  public function withLeftParen(EditableNode $value): this {
    if ($value === $this->_left_paren) {
      return $this;
    }
    return new static(
      $this->_keyword,
      $value,
      $this->_argument,
      $this->_right_paren,
    );
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

  public function getArgumentUNTYPED(): EditableNode {
    return $this->_argument;
  }

  public function withArgument(EditableNode $value): this {
    if ($value === $this->_argument) {
      return $this;
    }
    return new static(
      $this->_keyword,
      $this->_left_paren,
      $value,
      $this->_right_paren,
    );
  }

  public function hasArgument(): bool {
    return !$this->_argument->isMissing();
  }

  /**
   * @returns ArrayCreationExpression | ArrayIntrinsicExpression |
   * BinaryExpression | CollectionLiteralExpression | FunctionCallExpression |
   * LiteralExpression | MemberSelectionExpression | ObjectCreationExpression |
   * ParenthesizedExpression | PrefixUnaryExpression |
   * SafeMemberSelectionExpression | ScopeResolutionExpression |
   * SubscriptExpression | VariableExpression | XHPExpression
   */
  public function getArgument(): EditableNode {
    return TypeAssert\instance_of(EditableNode::class, $this->_argument);
  }

  /**
   * @returns ArrayCreationExpression | ArrayIntrinsicExpression |
   * BinaryExpression | CollectionLiteralExpression | FunctionCallExpression |
   * LiteralExpression | MemberSelectionExpression | ObjectCreationExpression |
   * ParenthesizedExpression | PrefixUnaryExpression |
   * SafeMemberSelectionExpression | ScopeResolutionExpression |
   * SubscriptExpression | VariableExpression | XHPExpression
   */
  public function getArgumentx(): EditableNode {
    return $this->getArgument();
  }

  public function getRightParenUNTYPED(): EditableNode {
    return $this->_right_paren;
  }

  public function withRightParen(EditableNode $value): this {
    if ($value === $this->_right_paren) {
      return $this;
    }
    return
      new static($this->_keyword, $this->_left_paren, $this->_argument, $value);
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
