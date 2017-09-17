<?hh // strict
/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<11128f5cb4c84a728254ac0d2d88aa37>>
 */
namespace Facebook\HHAST;
use namespace Facebook\TypeAssert;

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
    dict<string, mixed> $json,
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
    if ($operand === $this->_operand && $operator === $this->_operator) {
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

  /**
   * @returns VariableExpression | PrefixUnaryExpression | SubscriptExpression
   * | MemberSelectionExpression | ScopeResolutionExpression
   */
  public function getOperand(): EditableSyntax {
    return TypeAssert\instance_of(EditableSyntax::class, $this->_operand);
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

  /**
   * @returns PlusPlusToken | MinusMinusToken
   */
  public function getOperator(): EditableToken {
    return TypeAssert\instance_of(EditableToken::class, $this->_operator);
  }
}
