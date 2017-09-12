<?hh
/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<8f69de783f76f94142928d8e3e0b8857>>
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

  <<__Override>>
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

  <<__Override>>
  public function getChildren(): KeyedTraversable<string, EditableSyntax> {
    yield 'operator' => $this->_operator;
    yield 'operand' => $this->_operand;
  }

  <<__Override>>
  public function rewrite_children(
    self::TRewriter $rewriter,
    ?Traversable<EditableSyntax> $parents = null,
  ): this {
    $parents = $parents === null ? vec[] : vec($parents);
    $parents[] = $this;
    $operator = $this->_operator->rewrite($rewriter, $parents);
    $operand = $this->_operand->rewrite($rewriter, $parents);
    if (
      $operator === $this->_operator &&
      $operand === $this->_operand
    ) {
      return $this;
    }
    return new self($operator, $operand);
  }

  public function getOperatorUNTYPED(): EditableSyntax {
    return $this->_operator;
  }

  public function withOperator(EditableSyntax $value): this {
    if ($value === $this->_operator) {
      return $this;
    }
    return new self($value, $this->_operand);
  }

  public function hasOperator(): bool {
    return !$this->_operator->is_missing();
  }

  public function getOperator(): EditableSyntax {
    return TypeAssert::isInstanceOf(EditableSyntax::class, $this->_operator);
  }

  public function getOperandUNTYPED(): EditableSyntax {
    return $this->_operand;
  }

  public function withOperand(EditableSyntax $value): this {
    if ($value === $this->_operand) {
      return $this;
    }
    return new self($this->_operator, $value);
  }

  public function hasOperand(): bool {
    return !$this->_operand->is_missing();
  }

  public function getOperand(): EditableSyntax {
    return TypeAssert::isInstanceOf(EditableSyntax::class, $this->_operand);
  }
}
