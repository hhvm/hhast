<?hh
/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<995aa11cae4e84a4d387aba0025f7ca3>>
 */
namespace Facebook\HHAST;
use type Facebook\TypeAssert\TypeAssert;

final class EvalExpression extends EditableSyntax {

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
    parent::__construct('eval_expression');
    $this->_keyword = $keyword;
    $this->_left_paren = $left_paren;
    $this->_argument = $argument;
    $this->_right_paren = $right_paren;
  }

  public static function from_json(
    array<string, mixed> $json,
    int $position,
    string $source,
  ): this {
    $keyword = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['eval_keyword'],
      $position,
      $source,
    );
    $position += $keyword->width();
    $left_paren = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['eval_left_paren'],
      $position,
      $source,
    );
    $position += $left_paren->width();
    $argument = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['eval_argument'],
      $position,
      $source,
    );
    $position += $argument->width();
    $right_paren = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['eval_right_paren'],
      $position,
      $source,
    );
    $position += $right_paren->width();
    return new self($keyword, $left_paren, $argument, $right_paren);
  }

  public function children(): KeyedTraversable<string, EditableSyntax> {
    yield 'keyword' => $this->_keyword;
    yield 'left_paren' => $this->_left_paren;
    yield 'argument' => $this->_argument;
    yield 'right_paren' => $this->_right_paren;
  }

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

  public function keyword(): EvalToken {
    return $this->keywordx();
  }

  public function keywordx(): EvalToken {
    return TypeAssert::isInstanceOf(EvalToken::class, $this->_keyword);
  }

  public function raw_keyword(): EditableSyntax {
    return $this->_keyword;
  }

  public function with_keyword(EditableSyntax $value): this {
    return new self($value, $this->_left_paren, $this->_argument, $this->_right_paren);
  }

  public function left_paren(): LeftParenToken {
    return $this->left_parenx();
  }

  public function left_parenx(): LeftParenToken {
    return TypeAssert::isInstanceOf(LeftParenToken::class, $this->_left_paren);
  }

  public function raw_left_paren(): EditableSyntax {
    return $this->_left_paren;
  }

  public function with_left_paren(EditableSyntax $value): this {
    return new self($this->_keyword, $value, $this->_argument, $this->_right_paren);
  }

  public function argument(): EditableSyntax {
    return $this->argumentx();
  }

  public function argumentx(): EditableSyntax {
    return TypeAssert::isInstanceOf(EditableSyntax::class, $this->_argument);
  }

  public function raw_argument(): EditableSyntax {
    return $this->_argument;
  }

  public function with_argument(EditableSyntax $value): this {
    return new self($this->_keyword, $this->_left_paren, $value, $this->_right_paren);
  }

  public function right_paren(): RightParenToken {
    return $this->right_parenx();
  }

  public function right_parenx(): RightParenToken {
    return TypeAssert::isInstanceOf(RightParenToken::class, $this->_right_paren);
  }

  public function raw_right_paren(): EditableSyntax {
    return $this->_right_paren;
  }

  public function with_right_paren(EditableSyntax $value): this {
    return new self($this->_keyword, $this->_left_paren, $this->_argument, $value);
  }
}
