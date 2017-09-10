<?hh
/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<4968aa9363e10bc641f0015941671801>>
 */
namespace Facebook\HHAST;
use type Facebook\TypeAssert\TypeAssert;

final class PrefixUnaryExpression extends EditableSyntax {

  private EditableSyntax $_operator;
  private EditableSyntax $_operand;

  public function __construct(
    EditableSyntax $operator,
    EditableSyntax $operand,
  ) {
    parent::__construct('prefix_unary_expression');
    $this->_operator = $operator;
    $this->_operand = $operand;
  }

  public static function from_json(
    array<string, mixed> $json,
    int $position,
    string $source,
  ): this {
    $operator = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['prefix_unary_operator'],
      $position,
      $source,
    );
    $position += $operator->width();
    $operand = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['prefix_unary_operand'],
      $position,
      $source,
    );
    $position += $operand->width();
    return new self($operator, $operand);
  }

  public function children(): KeyedTraversable<string, EditableSyntax> {
    yield 'operator' => $this->_operator;
    yield 'operand' => $this->_operand;
  }

  public function rewrite(
    self::TRewriter $rewriter,
    ?Traversable<EditableSyntax> $parents = null,
  ): EditableSyntax {
    $parents = $parents === null ? vec[] : vec($parents);
    $child_parents = $parents;
    $child_parents[] = $this;
    $operator = $this->_operator->rewrite($rewriter, $child_parents);
    $operand = $this->_operand->rewrite($rewriter, $child_parents);
    if ($operator === $this->_operator && $operand === $this->_operand) {
      $node = $this;
    } else {
      $node = new self($operator, $operand);
    }
    return $rewriter($node, $parents);
  }

  public function operator(): EditableSyntax {
    return $this->operatorx();
  }

  public function operatorx(): EditableSyntax {
    return TypeAssert::isInstanceOf(EditableSyntax::class, $this->_operator);
  }

  public function raw_operator(): EditableSyntax {
    return $this->_operator;
  }

  public function with_operator(EditableSyntax $value): this {
    return new self($value, $this->_operand);
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
    return new self($this->_operator, $value);
  }
}
