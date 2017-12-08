<?hh // strict
/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<eb729411d86abed25cac07175d80e0df>>
 */
namespace Facebook\HHAST;
use namespace Facebook\TypeAssert;

final class WhereConstraint extends EditableNode {

  private EditableNode $_left_type;
  private EditableNode $_operator;
  private EditableNode $_right_type;

  public function __construct(
    EditableNode $left_type,
    EditableNode $operator,
    EditableNode $right_type,
  ) {
    parent::__construct('where_constraint');
    $this->_left_type = $left_type;
    $this->_operator = $operator;
    $this->_right_type = $right_type;
  }

  <<__Override>>
  public static function fromJSON(
    dict<string, mixed> $json,
    string $file,
    int $offset,
    string $source,
  ): this {
    $left_type = EditableNode::fromJSON(
      /* UNSAFE_EXPR */ $json['where_constraint_left_type'],
      $file,
      $offset,
      $source,
    );
    $offset += $left_type->getWidth();
    $operator = EditableNode::fromJSON(
      /* UNSAFE_EXPR */ $json['where_constraint_operator'],
      $file,
      $offset,
      $source,
    );
    $offset += $operator->getWidth();
    $right_type = EditableNode::fromJSON(
      /* UNSAFE_EXPR */ $json['where_constraint_right_type'],
      $file,
      $offset,
      $source,
    );
    $offset += $right_type->getWidth();
    return new self($left_type, $operator, $right_type);
  }

  <<__Override>>
  public function getChildren(): dict<string, EditableNode> {
    return dict[
      'left_type' => $this->_left_type,
      'operator' => $this->_operator,
      'right_type' => $this->_right_type,
    ];
  }

  <<__Override>>
  public function rewriteDescendants(
    self::TRewriter $rewriter,
    ?vec<EditableNode> $parents = null,
  ): this {
    $parents = $parents === null ? vec[] : vec($parents);
    $parents[] = $this;
    $left_type = $this->_left_type->rewrite($rewriter, $parents);
    $operator = $this->_operator->rewrite($rewriter, $parents);
    $right_type = $this->_right_type->rewrite($rewriter, $parents);
    if (
      $left_type === $this->_left_type &&
      $operator === $this->_operator &&
      $right_type === $this->_right_type
    ) {
      return $this;
    }
    return new self($left_type, $operator, $right_type);
  }

  public function getLeftTypeUNTYPED(): EditableNode {
    return $this->_left_type;
  }

  public function withLeftType(EditableNode $value): this {
    if ($value === $this->_left_type) {
      return $this;
    }
    return new self($value, $this->_operator, $this->_right_type);
  }

  public function hasLeftType(): bool {
    return !$this->_left_type->isMissing();
  }

  /**
   * @returns SimpleTypeSpecifier | GenericTypeSpecifier
   */
  public function getLeftType(): EditableNode {
    return TypeAssert\instance_of(EditableNode::class, $this->_left_type);
  }

  public function getOperatorUNTYPED(): EditableNode {
    return $this->_operator;
  }

  public function withOperator(EditableNode $value): this {
    if ($value === $this->_operator) {
      return $this;
    }
    return new self($this->_left_type, $value, $this->_right_type);
  }

  public function hasOperator(): bool {
    return !$this->_operator->isMissing();
  }

  /**
   * @returns EqualToken | SuperToken | AsToken | Missing
   */
  public function getOperator(): ?EditableToken {
    if ($this->_operator->isMissing()) {
      return null;
    }
    return TypeAssert\instance_of(EditableToken::class, $this->_operator);
  }

  /**
   * @returns EqualToken | SuperToken | AsToken
   */
  public function getOperatorx(): EditableToken {
    return TypeAssert\instance_of(EditableToken::class, $this->_operator);
  }

  public function getRightTypeUNTYPED(): EditableNode {
    return $this->_right_type;
  }

  public function withRightType(EditableNode $value): this {
    if ($value === $this->_right_type) {
      return $this;
    }
    return new self($this->_left_type, $this->_operator, $value);
  }

  public function hasRightType(): bool {
    return !$this->_right_type->isMissing();
  }

  /**
   * @returns SimpleTypeSpecifier | NullableTypeSpecifier | GenericTypeSpecifier
   */
  public function getRightType(): EditableNode {
    return TypeAssert\instance_of(EditableNode::class, $this->_right_type);
  }
}
