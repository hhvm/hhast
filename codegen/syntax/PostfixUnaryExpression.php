<?hh
/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<0f95fbf53f6bc76de0693deadc93198e>>
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

  public function rewrite(
    self::TRewriter $rewriter,
    ?Traversable<EditableSyntax> $parents = null,
  ): EditableSyntax {
    $parents = $parents === null ? vec[] : vec($parents);
    $child_parents = $parents;
    $child_parents[] = $this;
    $operand = $this->_operand->rewrite($rewriter, $child_parents);
    $operator = $this->_operator->rewrite($rewriter, $child_parents);
    if ($operand === $this->_operand && $operator === $this->_operator) {
      $node = $this;
    } else {
      $node = new self($operand, $operator);
    }
    return $rewriter($node, $parents);
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
    return new self($this->_operand, $value);
  }
}
