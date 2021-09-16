/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<8e8f5e2f7e5a8754a38fb8701f29c143>>
 */
namespace Facebook\HHAST;
use namespace Facebook\TypeAssert;
use namespace HH\Lib\Dict;

<<__ConsistentConstruct>>
final class UpcastExpression extends Node implements ILambdaBody, IExpression {

  const string SYNTAX_KIND = 'upcast_expression';

  private ?Node $_left_operand;
  private ?Node $_operator;
  private ?Node $_right_operand;

  public function __construct(
    ?Node $left_operand,
    ?Node $operator,
    ?Node $right_operand,
    ?__Private\SourceRef $source_ref = null,
  ) {
    $this->_left_operand = $left_operand;
    $this->_operator = $operator;
    $this->_right_operand = $right_operand;
    parent::__construct($source_ref);
  }

  <<__Override>>
  public static function fromJSON(
    dict<arraykey, mixed> $json,
    string $file,
    int $initial_offset,
    string $source,
    string $_type_hint,
  ): this {
    $offset = $initial_offset;
    $left_operand = Node::fromJSON(
      ($json['upcast_left_operand'] ?? dict['kind' => 'missing']) as dict<_, _>,
      $file,
      $offset,
      $source,
      'Node',
    );
    $offset += $left_operand?->getWidth() ?? 0;
    $operator = Node::fromJSON(
      ($json['upcast_operator'] ?? dict['kind' => 'missing']) as dict<_, _>,
      $file,
      $offset,
      $source,
      'Node',
    );
    $offset += $operator?->getWidth() ?? 0;
    $right_operand = Node::fromJSON(
      ($json['upcast_right_operand'] ?? dict['kind' => 'missing'])
        as dict<_, _>,
      $file,
      $offset,
      $source,
      'Node',
    );
    $offset += $right_operand?->getWidth() ?? 0;
    $source_ref = shape(
      'file' => $file,
      'source' => $source,
      'offset' => $initial_offset,
      'width' => $offset - $initial_offset,
    );
    return new static(
      /* HH_IGNORE_ERROR[4110] */ $left_operand,
      /* HH_IGNORE_ERROR[4110] */ $operator,
      /* HH_IGNORE_ERROR[4110] */ $right_operand,
      $source_ref,
    );
  }

  <<__Override>>
  public function getChildren(): dict<string, Node> {
    return dict[
      'left_operand' => $this->_left_operand,
      'operator' => $this->_operator,
      'right_operand' => $this->_right_operand,
    ]
      |> Dict\filter_nulls($$);
  }

  <<__Override>>
  public function rewriteChildren<Tret as ?Node>(
    (function(Node, vec<Node>): Tret) $rewriter,
    vec<Node> $parents = vec[],
  ): this {
    $parents[] = $this;
    $left_operand = $this->_left_operand === null
      ? null
      : $rewriter($this->_left_operand, $parents);
    $operator =
      $this->_operator === null ? null : $rewriter($this->_operator, $parents);
    $right_operand = $this->_right_operand === null
      ? null
      : $rewriter($this->_right_operand, $parents);
    if (
      $left_operand === $this->_left_operand &&
      $operator === $this->_operator &&
      $right_operand === $this->_right_operand
    ) {
      return $this;
    }
    return new static(
      $left_operand as ?Node,
      $operator as ?Node,
      $right_operand as ?Node,
    );
  }

  public function getLeftOperandUNTYPED(): ?Node {
    return $this->_left_operand;
  }

  public function withLeftOperand(?Node $value): this {
    if ($value === $this->_left_operand) {
      return $this;
    }
    return new static($value, $this->_operator, $this->_right_operand);
  }

  public function hasLeftOperand(): bool {
    return $this->_left_operand !== null;
  }

  /**
   * @return unknown
   */
  public function getLeftOperand(): ?Node {
    return $this->_left_operand;
  }

  /**
   * @return unknown
   */
  public function getLeftOperandx(): Node {
    return TypeAssert\not_null($this->getLeftOperand());
  }

  public function getOperatorUNTYPED(): ?Node {
    return $this->_operator;
  }

  public function withOperator(?Node $value): this {
    if ($value === $this->_operator) {
      return $this;
    }
    return new static($this->_left_operand, $value, $this->_right_operand);
  }

  public function hasOperator(): bool {
    return $this->_operator !== null;
  }

  /**
   * @return unknown
   */
  public function getOperator(): ?Node {
    return $this->_operator;
  }

  /**
   * @return unknown
   */
  public function getOperatorx(): Node {
    return TypeAssert\not_null($this->getOperator());
  }

  public function getRightOperandUNTYPED(): ?Node {
    return $this->_right_operand;
  }

  public function withRightOperand(?Node $value): this {
    if ($value === $this->_right_operand) {
      return $this;
    }
    return new static($this->_left_operand, $this->_operator, $value);
  }

  public function hasRightOperand(): bool {
    return $this->_right_operand !== null;
  }

  /**
   * @return unknown
   */
  public function getRightOperand(): ?Node {
    return $this->_right_operand;
  }

  /**
   * @return unknown
   */
  public function getRightOperandx(): Node {
    return TypeAssert\not_null($this->getRightOperand());
  }
}
