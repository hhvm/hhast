<?hh
/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<0ecf241f5cccc2bd4fe9a4d49503923e>>
 */
namespace Facebook\HHAST;
use type Facebook\TypeAssert\TypeAssert;

final class SafeMemberSelectionExpression extends EditableSyntax {

  private EditableSyntax $_object;
  private EditableSyntax $_operator;
  private EditableSyntax $_name;

  public function __construct(
    EditableSyntax $object,
    EditableSyntax $operator,
    EditableSyntax $name,
  ) {
    parent::__construct('safe_member_selection_expression');
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
      /* UNSAFE_EXPR */ $json['safe_member_object'],
      $position,
      $source,
    );
    $position += $object->width();
    $operator = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['safe_member_operator'],
      $position,
      $source,
    );
    $position += $operator->width();
    $name = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['safe_member_name'],
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

  public function rewrite(
    self::TRewriter $rewriter,
    ?Traversable<EditableSyntax> $parents = null,
  ): EditableSyntax {
    $parents = $parents === null ? vec[] : vec($parents);
    $child_parents = $parents;
    $child_parents[] = $this;
    $object = $this->_object->rewrite($rewriter, $child_parents);
    $operator = $this->_operator->rewrite($rewriter, $child_parents);
    $name = $this->_name->rewrite($rewriter, $child_parents);
    if (
      $object === $this->_object &&
      $operator === $this->_operator &&
      $name === $this->_name
    ) {
      $node = $this;
    } else {
      $node = new self($object, $operator, $name);
    }
    return $rewriter($node, $parents);
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
    return new self($value, $this->_operator, $this->_name);
  }

  public function operator(): QuestionMinusGreaterThanToken {
    return $this->operatorx();
  }

  public function operatorx(): QuestionMinusGreaterThanToken {
    return TypeAssert::isInstanceOf(
      QuestionMinusGreaterThanToken::class,
      $this->_operator,
    );
  }

  public function raw_operator(): EditableSyntax {
    return $this->_operator;
  }

  public function with_operator(EditableSyntax $value): this {
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
    return new self($this->_object, $this->_operator, $value);
  }
}
