<?hh
/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<5c04cf7deb897b1b8b3aa1fdbecd85b5>>
 */
namespace Facebook\HHAST;
use type Facebook\TypeAssert\TypeAssert;

final class PostfixUnaryExpression extends EditableSyntax {

  private EditableSyntax $_operand;
  private EditableSyntax $_operator;

  public function __construct(
    EditableSyntax $operand,
    EditableSyntax $operator,
  ) {
    parent::__construct('postfix_unary_expression');
    $this->_operand = $operand;
    $this->_operator = $operator;
  }

  public static function from_json(
    array<string, mixed> $json,
    int $position,
    string $source,
  ): this {
    $operand = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['postfix_unary_operand'],
      $position,
      $source,
    );
    $position += $operand->width();
    $operator = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['postfix_unary_operator'],
      $position,
      $source,
    );
    $position += $operator->width();
    return new self($operand, $operator);
  }

  public function children(): KeyedTraversable<string, EditableSyntax> {
    yield 'operand' => $this->_operand;
    yield 'operator' => $this->_operator;
  }

  public function rewrite_children(
    self::TRewriter $rewriter,
    ?Traversable<EditableSyntax> $parents = null,
  ): this {
    $parents = $parents === null ? vec[] : vec($parents);
    $parents[] = $this;
    $operand = $this->_operand->rewrite($rewriter, $parents);
    $operator = $this->_operator->rewrite($rewriter, $parents);
    if (
      $operand === $this->_operand &&
      $operator === $this->_operator
    ) {
      return $this;
    }
    return new self($operand, $operator);
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
    if ($value === $this->_operand) {
      return $this;
    }
    return new self($value, $this->_operator);
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
    if ($value === $this->_operator) {
      return $this;
    }
    return new self($this->_operand, $value);
  }
}
