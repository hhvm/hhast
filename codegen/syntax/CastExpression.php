<?hh
/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<c4184b2ff573da844313a3a231f2c4d8>>
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

  <<__Override>>
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

  <<__Override>>
  public function children(): KeyedTraversable<string, EditableSyntax> {
    yield 'left_paren' => $this->_left_paren;
    yield 'type' => $this->_type;
    yield 'right_paren' => $this->_right_paren;
    yield 'operand' => $this->_operand;
  }

  <<__Override>>
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

  public function getLeftParenUNTYPED(): EditableSyntax {
    return $this->_left_paren;
  }

  public function withLeftParen(EditableSyntax $value): this {
    if ($value === $this->_left_paren) {
      return $this;
    }
    return new self($value, $this->_type, $this->_right_paren, $this->_operand);
  }

  public function hasLeftParen(): bool {
    return !$this->_left_paren->is_missing();
  }

  public function getLeftParen(): LeftParenToken {
    return TypeAssert::isInstanceOf(LeftParenToken::class, $this->_left_paren);
  }

  public function getTypeUNTYPED(): EditableSyntax {
    return $this->_type;
  }

  public function withType(EditableSyntax $value): this {
    if ($value === $this->_type) {
      return $this;
    }
    return new self($this->_left_paren, $value, $this->_right_paren, $this->_operand);
  }

  public function hasType(): bool {
    return !$this->_type->is_missing();
  }

  public function getType(): EditableSyntax {
    return TypeAssert::isInstanceOf(EditableSyntax::class, $this->_type);
  }

  public function getRightParenUNTYPED(): EditableSyntax {
    return $this->_right_paren;
  }

  public function withRightParen(EditableSyntax $value): this {
    if ($value === $this->_right_paren) {
      return $this;
    }
    return new self($this->_left_paren, $this->_type, $value, $this->_operand);
  }

  public function hasRightParen(): bool {
    return !$this->_right_paren->is_missing();
  }

  public function getRightParen(): RightParenToken {
    return TypeAssert::isInstanceOf(RightParenToken::class, $this->_right_paren);
  }

  public function getOperandUNTYPED(): EditableSyntax {
    return $this->_operand;
  }

  public function withOperand(EditableSyntax $value): this {
    if ($value === $this->_operand) {
      return $this;
    }
    return new self($this->_left_paren, $this->_type, $this->_right_paren, $value);
  }

  public function hasOperand(): bool {
    return !$this->_operand->is_missing();
  }

  public function getOperand(): EditableSyntax {
    return TypeAssert::isInstanceOf(EditableSyntax::class, $this->_operand);
  }
}
