<?hh
/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<f94f5e7e805596e02935dc024648e003>>
 */
namespace Facebook\HHAST;
use namespace Facebook\TypeAssert;

final class EmptyExpression extends EditableSyntax {

  private EditableSyntax $_keyword;
  private EditableSyntax $_left_paren;
  private EditableSyntax $_argument;
  private EditableSyntax $_right_paren;

  public function __construct(
    EditableSyntax $keyword,
    EditableSyntax $left_paren,
    EditableSyntax $argument,
    EditableSyntax $right_paren,
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
    int $position,
    string $source,
  ): this {
    $keyword = EditableSyntax::fromJSON(
      /* UNSAFE_EXPR */ $json['empty_keyword'],
      $position,
      $source,
    );
    $position += $keyword->getWidth();
    $left_paren = EditableSyntax::fromJSON(
      /* UNSAFE_EXPR */ $json['empty_left_paren'],
      $position,
      $source,
    );
    $position += $left_paren->getWidth();
    $argument = EditableSyntax::fromJSON(
      /* UNSAFE_EXPR */ $json['empty_argument'],
      $position,
      $source,
    );
    $position += $argument->getWidth();
    $right_paren = EditableSyntax::fromJSON(
      /* UNSAFE_EXPR */ $json['empty_right_paren'],
      $position,
      $source,
    );
    $position += $right_paren->getWidth();
    return new self($keyword, $left_paren, $argument, $right_paren);
  }

  <<__Override>>
  public function getChildren(): KeyedTraversable<string, EditableSyntax> {
    yield 'keyword' => $this->_keyword;
    yield 'left_paren' => $this->_left_paren;
    yield 'argument' => $this->_argument;
    yield 'right_paren' => $this->_right_paren;
  }

  <<__Override>>
  public function rewriteDescendants(
    self::TRewriter $rewriter,
    ?Traversable<EditableSyntax> $parents = null,
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
    return new self($keyword, $left_paren, $argument, $right_paren);
  }

  public function getKeywordUNTYPED(): EditableSyntax {
    return $this->_keyword;
  }

  public function withKeyword(EditableSyntax $value): this {
    if ($value === $this->_keyword) {
      return $this;
    }
    return new self(
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

  public function getLeftParenUNTYPED(): EditableSyntax {
    return $this->_left_paren;
  }

  public function withLeftParen(EditableSyntax $value): this {
    if ($value === $this->_left_paren) {
      return $this;
    }
    return
      new self($this->_keyword, $value, $this->_argument, $this->_right_paren);
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

  public function getArgumentUNTYPED(): EditableSyntax {
    return $this->_argument;
  }

  public function withArgument(EditableSyntax $value): this {
    if ($value === $this->_argument) {
      return $this;
    }
    return new self(
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
   * @returns MemberSelectionExpression | VariableExpression |
   * SubscriptExpression | ScopeResolutionExpression | PrefixUnaryExpression |
   * FunctionCallExpression | SafeMemberSelectionExpression |
   * ArrayIntrinsicExpression | BinaryExpression | ParenthesizedExpression |
   * ObjectCreationExpression | CollectionLiteralExpression | XHPExpression |
   * ArrayCreationExpression | LiteralExpression
   */
  public function getArgument(): EditableSyntax {
    return TypeAssert\instance_of(EditableSyntax::class, $this->_argument);
  }

  public function getRightParenUNTYPED(): EditableSyntax {
    return $this->_right_paren;
  }

  public function withRightParen(EditableSyntax $value): this {
    if ($value === $this->_right_paren) {
      return $this;
    }
    return
      new self($this->_keyword, $this->_left_paren, $this->_argument, $value);
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
}
