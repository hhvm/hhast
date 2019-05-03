/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<5c7a786773fc55bf5946c51700157e59>>
 */
namespace Facebook\HHAST;
use namespace Facebook\TypeAssert;

<<__ConsistentConstruct>>
final class EmbeddedMemberSelectionExpression
  extends EditableNode
  implements IExpression {

  private EditableNode $_object;
  private EditableNode $_operator;
  private EditableNode $_name;

  public function __construct(
    EditableNode $object,
    EditableNode $operator,
    EditableNode $name,
    ?__Private\SourceRef $source_ref = null,
  ) {
    $this->_object = $object;
    $this->_operator = $operator;
    $this->_name = $name;
    parent::__construct('embedded_member_selection_expression', $source_ref);
  }

  <<__Override>>
  public static function fromJSON(
    dict<string, mixed> $json,
    string $file,
    int $initial_offset,
    string $source,
  ): this {
    $offset = $initial_offset;
    $object = EditableNode::fromJSON(
      /* UNSAFE_EXPR */ $json['embedded_member_object'],
      $file,
      $offset,
      $source,
    );
    $offset += $object->getWidth();
    $operator = EditableNode::fromJSON(
      /* UNSAFE_EXPR */ $json['embedded_member_operator'],
      $file,
      $offset,
      $source,
    );
    $offset += $operator->getWidth();
    $name = EditableNode::fromJSON(
      /* UNSAFE_EXPR */ $json['embedded_member_name'],
      $file,
      $offset,
      $source,
    );
    $offset += $name->getWidth();
    $source_ref = shape(
      'file' => $file,
      'source' => $source,
      'offset' => $initial_offset,
      'width' => $offset - $initial_offset,
    );
    return new static($object, $operator, $name, $source_ref);
  }

  <<__Override>>
  public function getChildren(): dict<string, EditableNode> {
    return dict[
      'object' => $this->_object,
      'operator' => $this->_operator,
      'name' => $this->_name,
    ];
  }

  <<__Override>>
  public function rewriteChildren(
    self::TRewriter $rewriter,
    vec<EditableNode> $parents = vec[],
  ): this {
    $parents[] = $this;
    $object = $rewriter($this->_object, $parents);
    $operator = $rewriter($this->_operator, $parents);
    $name = $rewriter($this->_name, $parents);
    if (
      $object === $this->_object &&
      $operator === $this->_operator &&
      $name === $this->_name
    ) {
      return $this;
    }
    return new static($object, $operator, $name);
  }

  public function getObjectUNTYPED(): EditableNode {
    return $this->_object;
  }

  public function withObject(EditableNode $value): this {
    if ($value === $this->_object) {
      return $this;
    }
    return new static($value, $this->_operator, $this->_name);
  }

  public function hasObject(): bool {
    return !$this->_object->isMissing();
  }

  /**
   * @return unknown
   */
  public function getObject(): EditableNode {
    return $this->_object;
  }

  /**
   * @return unknown
   */
  public function getObjectx(): EditableNode {
    return $this->getObject();
  }

  public function getOperatorUNTYPED(): EditableNode {
    return $this->_operator;
  }

  public function withOperator(EditableNode $value): this {
    if ($value === $this->_operator) {
      return $this;
    }
    return new static($this->_object, $value, $this->_name);
  }

  public function hasOperator(): bool {
    return !$this->_operator->isMissing();
  }

  /**
   * @return unknown
   */
  public function getOperator(): EditableNode {
    return $this->_operator;
  }

  /**
   * @return unknown
   */
  public function getOperatorx(): EditableNode {
    return $this->getOperator();
  }

  public function getNameUNTYPED(): EditableNode {
    return $this->_name;
  }

  public function withName(EditableNode $value): this {
    if ($value === $this->_name) {
      return $this;
    }
    return new static($this->_object, $this->_operator, $value);
  }

  public function hasName(): bool {
    return !$this->_name->isMissing();
  }

  /**
   * @return unknown
   */
  public function getName(): EditableNode {
    return $this->_name;
  }

  /**
   * @return unknown
   */
  public function getNamex(): EditableNode {
    return $this->getName();
  }
}
