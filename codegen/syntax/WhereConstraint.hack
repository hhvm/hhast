/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<67a4e3852ba9bf4d96f6bf7ae0c9821b>>
 */
namespace Facebook\HHAST;
use namespace Facebook\TypeAssert;

<<__ConsistentConstruct>>
final class WhereConstraint extends EditableNode {

  private EditableNode $_left_type;
  private EditableNode $_operator;
  private EditableNode $_right_type;

  public function __construct(
    EditableNode $left_type,
    EditableNode $operator,
    EditableNode $right_type,
    ?__Private\SourceRef $source_ref = null,
  ) {
    $this->_left_type = $left_type;
    $this->_operator = $operator;
    $this->_right_type = $right_type;
    parent::__construct('where_constraint', $source_ref);
  }

  <<__Override>>
  public static function fromJSON(
    dict<string, mixed> $json,
    string $file,
    int $initial_offset,
    string $source,
  ): this {
    $offset = $initial_offset;
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
    $source_ref = shape(
      'file' => $file,
      'source' => $source,
      'offset' => $initial_offset,
      'width' => $offset - $initial_offset,
    );
    return new static($left_type, $operator, $right_type, $source_ref);
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
  public function rewriteChildren(
    self::TRewriter $rewriter,
    vec<EditableNode> $parents = vec[],
  ): this {
    $parents[] = $this;
    $left_type = $rewriter($this->_left_type, $parents);
    $operator = $rewriter($this->_operator, $parents);
    $right_type = $rewriter($this->_right_type, $parents);
    if (
      $left_type === $this->_left_type &&
      $operator === $this->_operator &&
      $right_type === $this->_right_type
    ) {
      return $this;
    }
    return new static($left_type, $operator, $right_type);
  }

  public function getLeftTypeUNTYPED(): EditableNode {
    return $this->_left_type;
  }

  public function withLeftType(EditableNode $value): this {
    if ($value === $this->_left_type) {
      return $this;
    }
    return new static($value, $this->_operator, $this->_right_type);
  }

  public function hasLeftType(): bool {
    return !$this->_left_type->isMissing();
  }

  /**
   * @return GenericTypeSpecifier | SimpleTypeSpecifier | TypeConstant |
   * VectorTypeSpecifier
   */
  public function getLeftType(): EditableNode {
    return TypeAssert\instance_of(EditableNode::class, $this->_left_type);
  }

  /**
   * @return GenericTypeSpecifier | SimpleTypeSpecifier | TypeConstant |
   * VectorTypeSpecifier
   */
  public function getLeftTypex(): EditableNode {
    return $this->getLeftType();
  }

  public function getOperatorUNTYPED(): EditableNode {
    return $this->_operator;
  }

  public function withOperator(EditableNode $value): this {
    if ($value === $this->_operator) {
      return $this;
    }
    return new static($this->_left_type, $value, $this->_right_type);
  }

  public function hasOperator(): bool {
    return !$this->_operator->isMissing();
  }

  /**
   * @return EqualToken | AsToken | SuperToken
   */
  public function getOperator(): EditableToken {
    return TypeAssert\instance_of(EditableToken::class, $this->_operator);
  }

  /**
   * @return EqualToken | AsToken | SuperToken
   */
  public function getOperatorx(): EditableToken {
    return $this->getOperator();
  }

  public function getRightTypeUNTYPED(): EditableNode {
    return $this->_right_type;
  }

  public function withRightType(EditableNode $value): this {
    if ($value === $this->_right_type) {
      return $this;
    }
    return new static($this->_left_type, $this->_operator, $value);
  }

  public function hasRightType(): bool {
    return !$this->_right_type->isMissing();
  }

  /**
   * @return GenericTypeSpecifier | NullableTypeSpecifier | SimpleTypeSpecifier
   * | TypeConstant | VectorTypeSpecifier
   */
  public function getRightType(): EditableNode {
    return TypeAssert\instance_of(EditableNode::class, $this->_right_type);
  }

  /**
   * @return GenericTypeSpecifier | NullableTypeSpecifier | SimpleTypeSpecifier
   * | TypeConstant | VectorTypeSpecifier
   */
  public function getRightTypex(): EditableNode {
    return $this->getRightType();
  }
}
