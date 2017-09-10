<?hh
/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<0e5dd4eabe62a87fe9f3adcd41785261>>
 */
namespace Facebook\HHAST;
use type Facebook\TypeAssert\TypeAssert;

final class InstanceofExpression extends EditableSyntax {

  private EditableSyntax $_left_operand;
  private EditableSyntax $_operator;
  private EditableSyntax $_right_operand;

  public function __construct(
    EditableSyntax $left_operand,
    EditableSyntax $operator,
    EditableSyntax $right_operand,
  ) {
    parent::__construct('instanceof_expression');
    $this->_left_operand = $left_operand;
    $this->_operator = $operator;
    $this->_right_operand = $right_operand;
  }

  public static function from_json(
    array<string, mixed> $json,
    int $position,
    string $source,
  ): this {
    $left_operand = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['instanceof_left_operand'],
      $position,
      $source,
    );
    $position += $left_operand->width();
    $operator = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['instanceof_operator'],
      $position,
      $source,
    );
    $position += $operator->width();
    $right_operand = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['instanceof_right_operand'],
      $position,
      $source,
    );
    $position += $right_operand->width();
    return new self($left_operand, $operator, $right_operand);
  }

  public function children(): KeyedTraversable<string, EditableSyntax> {
    yield 'left_operand' => $this->_left_operand;
    yield 'operator' => $this->_operator;
    yield 'right_operand' => $this->_right_operand;
  }

  public function rewrite(
    self::TRewriter $rewriter,
    ?Traversable<EditableSyntax> $parents = null,
  ): EditableSyntax {
    $parents = $parents === null ? vec[] : vec($parents);
    $child_parents = $parents;
    $child_parents[] = $this;
    $left_operand = $this->_left_operand->rewrite($rewriter, $child_parents);
    $operator = $this->_operator->rewrite($rewriter, $child_parents);
    $right_operand = $this->_right_operand->rewrite($rewriter, $child_parents);
    if (
      $left_operand === $this->_left_operand &&
      $operator === $this->_operator &&
      $right_operand === $this->_right_operand
    ) {
      $node = $this;
    } else {
      $node = new self($left_operand, $operator, $right_operand);
    }
    return $rewriter($node, $parents);
  }

  public function left_operand(): EditableSyntax {
    return $this->left_operandx();
  }

  public function left_operandx(): EditableSyntax {
    return
      TypeAssert::isInstanceOf(EditableSyntax::class, $this->_left_operand);
  }

  public function raw_left_operand(): EditableSyntax {
    return $this->_left_operand;
  }

  public function with_left_operand(EditableSyntax $value): this {
    return new self($value, $this->_operator, $this->_right_operand);
  }

  public function operator(): InstanceofToken {
    return $this->operatorx();
  }

  public function operatorx(): InstanceofToken {
    return TypeAssert::isInstanceOf(InstanceofToken::class, $this->_operator);
  }

  public function raw_operator(): EditableSyntax {
    return $this->_operator;
  }

  public function with_operator(EditableSyntax $value): this {
    return new self($this->_left_operand, $value, $this->_right_operand);
  }

  public function right_operand(): EditableSyntax {
    return $this->right_operandx();
  }

  public function right_operandx(): EditableSyntax {
    return
      TypeAssert::isInstanceOf(EditableSyntax::class, $this->_right_operand);
  }

  public function raw_right_operand(): EditableSyntax {
    return $this->_right_operand;
  }

  public function with_right_operand(EditableSyntax $value): this {
    return new self($this->_left_operand, $this->_operator, $value);
  }
}
