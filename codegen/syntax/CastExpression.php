<?hh
/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<1b35a41927127124dfd21875f887d6d9>>
 */
namespace Facebook\HHAST;
use type Facebook\TypeAssert\TypeAssert;

final class CastExpression extends EditableSyntax {

  private EditableSyntax $_left_paren;
  private EditableSyntax $_type;
  private EditableSyntax $_right_paren;
  private EditableSyntax $_operand;

  public function __construct(
    EditableSyntax $left_paren,
    EditableSyntax $type,
    EditableSyntax $right_paren,
    EditableSyntax $operand,
  ) {
    parent::__construct('cast_expression');
    $this->_left_paren = $left_paren;
    $this->_type = $type;
    $this->_right_paren = $right_paren;
    $this->_operand = $operand;
  }

  public static function from_json(
    array<string, mixed> $json,
    int $position,
    string $source,
  ): this {
    $left_paren = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['cast_left_paren'],
      $position,
      $source,
    );
    $position += $left_paren->width();
    $type = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['cast_type'],
      $position,
      $source,
    );
    $position += $type->width();
    $right_paren = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['cast_right_paren'],
      $position,
      $source,
    );
    $position += $right_paren->width();
    $operand = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['cast_operand'],
      $position,
      $source,
    );
    $position += $operand->width();
    return new self($left_paren, $type, $right_paren, $operand);
  }

  public function children(): KeyedTraversable<string, EditableSyntax> {
    yield 'left_paren' => $this->_left_paren;
    yield 'type' => $this->_type;
    yield 'right_paren' => $this->_right_paren;
    yield 'operand' => $this->_operand;
  }

  public function rewrite_children(
    self::TRewriter $rewriter,
    ?Traversable<EditableSyntax> $parents = null,
  ): this {
    $parents = $parents === null ? vec[] : vec($parents);
    $parents[] = $this;
    $left_paren = $this->_left_paren->rewrite($rewriter, $parents);
    $type = $this->_type->rewrite($rewriter, $parents);
    $right_paren = $this->_right_paren->rewrite($rewriter, $parents);
    $operand = $this->_operand->rewrite($rewriter, $parents);
    if (
      $left_paren === $this->_left_paren &&
      $type === $this->_type &&
      $right_paren === $this->_right_paren &&
      $operand === $this->_operand
    ) {
      return $this;
    }
    return new self($left_paren, $type, $right_paren, $operand);
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
    return new self($value, $this->_type, $this->_right_paren, $this->_operand);
  }

  public function type(): EditableSyntax {
    return $this->typex();
  }

  public function typex(): EditableSyntax {
    return TypeAssert::isInstanceOf(EditableSyntax::class, $this->_type);
  }

  public function raw_type(): EditableSyntax {
    return $this->_type;
  }

  public function with_type(EditableSyntax $value): this {
    return new self($this->_left_paren, $value, $this->_right_paren, $this->_operand);
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
    return new self($this->_left_paren, $this->_type, $value, $this->_operand);
  }

  public function operand(): EditableSyntax {
    return $this->operandx();
  }

  public function operandx(): EditableSyntax {
    return TypeAssert::isInstanceOf(EditableSyntax::class, $this->_operand);
  }

  public function raw_operand(): EditableSyntax {
    return $this->_operand;
  }

  public function with_operand(EditableSyntax $value): this {
    return new self($this->_left_paren, $this->_type, $this->_right_paren, $value);
  }
}
