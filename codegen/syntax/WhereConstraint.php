<?hh
/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<9001c0294b6ed3c9a819d4b7c9f1f615>>
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

  public static function from_json(
    array<string, mixed> $json,
    int $position,
    string $source,
  ): this {
    $left_type = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['where_constraint_left_type'],
      $position,
      $source,
    );
    $position += $left_type->width();
    $operator = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['where_constraint_operator'],
      $position,
      $source,
    );
    $position += $operator->width();
    $right_type = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['where_constraint_right_type'],
      $position,
      $source,
    );
    $position += $right_type->width();
    return new self($left_type, $operator, $right_type);
  }

  public function children(): KeyedTraversable<string, EditableSyntax> {
    yield 'left_type' => $this->_left_type;
    yield 'operator' => $this->_operator;
    yield 'right_type' => $this->_right_type;
  }

  public function rewrite(
    self::TRewriter $rewriter,
    ?Traversable<EditableSyntax> $parents = null,
  ): EditableSyntax {
    $parents = $parents === null ? vec[] : vec($parents);
    $child_parents = $parents;
    $child_parents[] = $this;
    $left_type = $this->_left_type->rewrite($rewriter, $child_parents);
    $operator = $this->_operator->rewrite($rewriter, $child_parents);
    $right_type = $this->_right_type->rewrite($rewriter, $child_parents);
    if (
      $left_type === $this->_left_type &&
      $operator === $this->_operator &&
      $right_type === $this->_right_type
    ) {
      $node = $this;
    } else {
      $node = new self($left_type, $operator, $right_type);
    }
    return $rewriter($node, $parents);
  }

  public function left_type(): EditableSyntax {
    return $this->left_typex();
  }

  public function left_typex(): EditableSyntax {
    return TypeAssert::isInstanceOf(EditableSyntax::class, $this->_left_type);
  }

  public function raw_left_type(): EditableSyntax {
    return $this->_left_type;
  }

  public function with_left_type(EditableSyntax $value): this {
    return new self($value, $this->_operator, $this->_right_type);
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
    return new self($this->_left_type, $value, $this->_right_type);
  }

  public function right_type(): EditableSyntax {
    return $this->right_typex();
  }

  public function right_typex(): EditableSyntax {
    return TypeAssert::isInstanceOf(EditableSyntax::class, $this->_right_type);
  }

  public function raw_right_type(): EditableSyntax {
    return $this->_right_type;
  }

  public function with_right_type(EditableSyntax $value): this {
    return new self($this->_left_type, $this->_operator, $value);
  }
}
