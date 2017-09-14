<?hh
/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<285cd8e7a24966331d2f41a56598c626>>
 */
namespace Facebook\HHAST;
use type Facebook\TypeAssert\TypeAssert;

final class WhereConstraint extends EditableSyntax {

  private EditableSyntax $_left_type;
  private EditableSyntax $_operator;
  private EditableSyntax $_right_type;

  public function __construct(
    EditableSyntax $left_type,
    EditableSyntax $operator,
    EditableSyntax $right_type,
  ) {
    parent::__construct('where_constraint');
    $this->_left_type = $left_type;
    $this->_operator = $operator;
    $this->_right_type = $right_type;
  }

  <<__Override>>
  public static function fromJSON(
    dict<string, mixed> $json,
    int $position,
    string $source,
  ): this {
    $left_type = EditableSyntax::fromJSON(
      /* UNSAFE_EXPR */ $json['where_constraint_left_type'],
      $position,
      $source,
    );
    $position += $left_type->getWidth();
    $operator = EditableSyntax::fromJSON(
      /* UNSAFE_EXPR */ $json['where_constraint_operator'],
      $position,
      $source,
    );
    $position += $operator->getWidth();
    $right_type = EditableSyntax::fromJSON(
      /* UNSAFE_EXPR */ $json['where_constraint_right_type'],
      $position,
      $source,
    );
    $position += $right_type->getWidth();
    return new self($left_type, $operator, $right_type);
  }

  <<__Override>>
  public function getChildren(): KeyedTraversable<string, EditableSyntax> {
    yield 'left_type' => $this->_left_type;
    yield 'operator' => $this->_operator;
    yield 'right_type' => $this->_right_type;
  }

  <<__Override>>
  public function rewriteDescendants(
    self::TRewriter $rewriter,
    ?Traversable<EditableSyntax> $parents = null,
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

  public function getLeftTypeUNTYPED(): EditableSyntax {
    return $this->_left_type;
  }

  public function withLeftType(EditableSyntax $value): this {
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
  public function getLeftType(): EditableSyntax {
    return TypeAssert::isInstanceOf(EditableSyntax::class, $this->_left_type);
  }

  public function getOperatorUNTYPED(): EditableSyntax {
    return $this->_operator;
  }

  public function withOperator(EditableSyntax $value): this {
    if ($value === $this->_operator) {
      return $this;
    }
    return new self($this->_left_type, $value, $this->_right_type);
  }

  public function hasOperator(): bool {
    return !$this->_operator->isMissing();
  }

  /**
   * @returns EqualToken | SuperToken | AsToken
   */
  public function getOperator(): EditableToken {
    return TypeAssert::isInstanceOf(EditableToken::class, $this->_operator);
  }

  public function getRightTypeUNTYPED(): EditableSyntax {
    return $this->_right_type;
  }

  public function withRightType(EditableSyntax $value): this {
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
  public function getRightType(): EditableSyntax {
    return TypeAssert::isInstanceOf(EditableSyntax::class, $this->_right_type);
  }
}
