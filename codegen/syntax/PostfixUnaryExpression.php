<?hh
/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<b13616c39fc68535249bbc5323442fd7>>
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

  <<__Override>>
  public static function fromJSON(
    array<string, mixed> $json,
    int $position,
    string $source,
  ): this {
    $operand = EditableSyntax::fromJSON(
      /* UNSAFE_EXPR */ $json['postfix_unary_operand'],
      $position,
      $source,
    );
    $position += $operand->getWidth();
    $operator = EditableSyntax::fromJSON(
      /* UNSAFE_EXPR */ $json['postfix_unary_operator'],
      $position,
      $source,
    );
    $position += $operator->getWidth();
    return new self($operand, $operator);
  }

  <<__Override>>
  public function getChildren(): KeyedTraversable<string, EditableSyntax> {
    yield 'operand' => $this->_operand;
    yield 'operator' => $this->_operator;
  }

  <<__Override>>
  public function rewriteDescendants(
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

  public function getOperandUNTYPED(): EditableSyntax {
    return $this->_operand;
  }

  public function withOperand(EditableSyntax $value): this {
    if ($value === $this->_operand) {
      return $this;
    }
    return new self($value, $this->_operator);
  }

  public function hasOperand(): bool {
    return !$this->_operand->isMissing();
  }

  public function getOperand(): EditableSyntax {
    return TypeAssert::isInstanceOf(EditableSyntax::class, $this->_operand);
  }

  public function getOperatorUNTYPED(): EditableSyntax {
    return $this->_operator;
  }

  public function withOperator(EditableSyntax $value): this {
    if ($value === $this->_operator) {
      return $this;
    }
    return new self($this->_operand, $value);
  }

  public function hasOperator(): bool {
    return !$this->_operator->isMissing();
  }

  public function getOperator(): EditableSyntax {
    return TypeAssert::isInstanceOf(EditableSyntax::class, $this->_operator);
  }
}
