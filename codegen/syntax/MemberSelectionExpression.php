<?hh
/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<a9edb4ab7e3b8b3745c9ff4ffa99d5e7>>
 */
namespace Facebook\HHAST;
use type Facebook\TypeAssert\TypeAssert;

final class MemberSelectionExpression extends EditableSyntax {

  private EditableSyntax $_object;
  private EditableSyntax $_operator;
  private EditableSyntax $_name;

  public function __construct(
    EditableSyntax $object,
    EditableSyntax $operator,
    EditableSyntax $name,
  ) {
    parent::__construct('member_selection_expression');
    $this->_object = $object;
    $this->_operator = $operator;
    $this->_name = $name;
  }

  public static function from_json(
    array<string, mixed> $json,
    int $position,
    string $source,
  ): this {
    $object = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['member_object'],
      $position,
      $source,
    );
    $position += $object->width();
    $operator = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['member_operator'],
      $position,
      $source,
    );
    $position += $operator->width();
    $name = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['member_name'],
      $position,
      $source,
    );
    $position += $name->width();
    return new self($object, $operator, $name);
  }

  public function children(): KeyedTraversable<string, EditableSyntax> {
    yield 'object' => $this->_object;
    yield 'operator' => $this->_operator;
    yield 'name' => $this->_name;
  }

  public function rewrite_children(
    self::TRewriter $rewriter,
    ?Traversable<EditableSyntax> $parents = null,
  ): this {
    $parents = $parents === null ? vec[] : vec($parents);
    $parents[] = $this;
    $object = $this->_object->rewrite($rewriter, $parents);
    $operator = $this->_operator->rewrite($rewriter, $parents);
    $name = $this->_name->rewrite($rewriter, $parents);
    if (
      $object === $this->_object &&
      $operator === $this->_operator &&
      $name === $this->_name
    ) {
      return $this;
    }
    return new self($object, $operator, $name);
  }

  public function object(): EditableSyntax {
    return $this->objectx();
  }

  public function objectx(): EditableSyntax {
    return TypeAssert::isInstanceOf(EditableSyntax::class, $this->_object);
  }

  public function raw_object(): EditableSyntax {
    return $this->_object;
  }

  public function with_object(EditableSyntax $value): this {
    if ($value === $this->_object) {
      return $this;
    }
    return new self($value, $this->_operator, $this->_name);
  }

  public function operator(): MinusGreaterThanToken {
    return $this->operatorx();
  }

  public function operatorx(): MinusGreaterThanToken {
    return TypeAssert::isInstanceOf(MinusGreaterThanToken::class, $this->_operator);
  }

  public function raw_operator(): EditableSyntax {
    return $this->_operator;
  }

  public function with_operator(EditableSyntax $value): this {
    if ($value === $this->_operator) {
      return $this;
    }
    return new self($this->_object, $value, $this->_name);
  }

  public function name(): EditableSyntax {
    return $this->namex();
  }

  public function namex(): EditableSyntax {
    return TypeAssert::isInstanceOf(EditableSyntax::class, $this->_name);
  }

  public function raw_name(): EditableSyntax {
    return $this->_name;
  }

  public function with_name(EditableSyntax $value): this {
    if ($value === $this->_name) {
      return $this;
    }
    return new self($this->_object, $this->_operator, $value);
  }
}
