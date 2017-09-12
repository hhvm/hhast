<?hh
/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<d3331e94b1585bf5b1c7b35268fc8116>>
 */
namespace Facebook\HHAST;
use type Facebook\TypeAssert\TypeAssert;

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
  public static function from_json(
    array<string, mixed> $json,
    int $position,
    string $source,
  ): this {
    $keyword = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['empty_keyword'],
      $position,
      $source,
    );
    $position += $keyword->width();
    $left_paren = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['empty_left_paren'],
      $position,
      $source,
    );
    $position += $left_paren->width();
    $argument = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['empty_argument'],
      $position,
      $source,
    );
    $position += $argument->width();
    $right_paren = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['empty_right_paren'],
      $position,
      $source,
    );
    $position += $right_paren->width();
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
  public function rewrite_children(
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
    return new self($value, $this->_left_paren, $this->_argument, $this->_right_paren);
  }

  public function hasKeyword(): bool {
    return !$this->_keyword->is_missing();
  }

  public function getKeyword(): EmptyToken {
    return TypeAssert::isInstanceOf(EmptyToken::class, $this->_keyword);
  }

  public function getLeftParenUNTYPED(): EditableSyntax {
    return $this->_left_paren;
  }

  public function withLeftParen(EditableSyntax $value): this {
    if ($value === $this->_left_paren) {
      return $this;
    }
    return new self($this->_keyword, $value, $this->_argument, $this->_right_paren);
  }

  public function hasLeftParen(): bool {
    return !$this->_left_paren->is_missing();
  }

  public function getLeftParen(): LeftParenToken {
    return TypeAssert::isInstanceOf(LeftParenToken::class, $this->_left_paren);
  }

  public function getArgumentUNTYPED(): EditableSyntax {
    return $this->_argument;
  }

  public function withArgument(EditableSyntax $value): this {
    if ($value === $this->_argument) {
      return $this;
    }
    return new self($this->_keyword, $this->_left_paren, $value, $this->_right_paren);
  }

  public function hasArgument(): bool {
    return !$this->_argument->is_missing();
  }

  public function getArgument(): EditableSyntax {
    return TypeAssert::isInstanceOf(EditableSyntax::class, $this->_argument);
  }

  public function getRightParenUNTYPED(): EditableSyntax {
    return $this->_right_paren;
  }

  public function withRightParen(EditableSyntax $value): this {
    if ($value === $this->_right_paren) {
      return $this;
    }
    return new self($this->_keyword, $this->_left_paren, $this->_argument, $value);
  }

  public function hasRightParen(): bool {
    return !$this->_right_paren->is_missing();
  }

  public function getRightParen(): RightParenToken {
    return TypeAssert::isInstanceOf(RightParenToken::class, $this->_right_paren);
  }
}
