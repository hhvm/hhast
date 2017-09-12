<?hh
/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<f62e0593bcdf923439c1301dd0c3f529>>
 */
namespace Facebook\HHAST;
use type Facebook\TypeAssert\TypeAssert;

final class EmbeddedMemberSelectionExpression extends EditableSyntax {

  private EditableSyntax $_object;
  private EditableSyntax $_operator;
  private EditableSyntax $_name;

  public function __construct(
    EditableSyntax $object,
    EditableSyntax $operator,
    EditableSyntax $name,
  ) {
    parent::__construct('embedded_member_selection_expression');
    $this->_object = $object;
    $this->_operator = $operator;
    $this->_name = $name;
  }

  <<__Override>>
  public static function from_json(
    array<string, mixed> $json,
    int $position,
    string $source,
  ): this {
    $object = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['embedded_member_object'],
      $position,
      $source,
    );
    $position += $object->getWidth();
    $operator = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['embedded_member_operator'],
      $position,
      $source,
    );
    $position += $operator->getWidth();
    $name = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['embedded_member_name'],
      $position,
      $source,
    );
    $position += $name->getWidth();
    return new self($object, $operator, $name);
  }

  <<__Override>>
  public function getChildren(): KeyedTraversable<string, EditableSyntax> {
    yield 'object' => $this->_object;
    yield 'operator' => $this->_operator;
    yield 'name' => $this->_name;
  }

  <<__Override>>
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

  public function getObjectUNTYPED(): EditableSyntax {
    return $this->_object;
  }

  public function withObject(EditableSyntax $value): this {
    if ($value === $this->_object) {
      return $this;
    }
    return new self($value, $this->_operator, $this->_name);
  }

  public function hasObject(): bool {
    return !$this->_object->isMissing();
  }

  public function getObject(): EditableSyntax {
    return TypeAssert::isInstanceOf(EditableSyntax::class, $this->_object);
  }

  public function getOperatorUNTYPED(): EditableSyntax {
    return $this->_operator;
  }

  public function withOperator(EditableSyntax $value): this {
    if ($value === $this->_operator) {
      return $this;
    }
    return new self($this->_object, $value, $this->_name);
  }

  public function hasOperator(): bool {
    return !$this->_operator->isMissing();
  }

  public function getOperator(): EditableSyntax {
    return TypeAssert::isInstanceOf(EditableSyntax::class, $this->_operator);
  }

  public function getNameUNTYPED(): EditableSyntax {
    return $this->_name;
  }

  public function withName(EditableSyntax $value): this {
    if ($value === $this->_name) {
      return $this;
    }
    return new self($this->_object, $this->_operator, $value);
  }

  public function hasName(): bool {
    return !$this->_name->isMissing();
  }

  public function getName(): EditableSyntax {
    return TypeAssert::isInstanceOf(EditableSyntax::class, $this->_name);
  }
}
