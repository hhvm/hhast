/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<696383a3a591816a13f84f28bb1452f8>>
 */
namespace Facebook\HHAST;
use namespace Facebook\TypeAssert;

<<__ConsistentConstruct>>
final class EmbeddedMemberSelectionExpression
  extends Node
  implements ILambdaBody, IExpression {

  const string SYNTAX_KIND = 'embedded_member_selection_expression';

  private Node $_object;
  private Node $_operator;
  private Node $_name;

  public function __construct(
    Node $object,
    Node $operator,
    Node $name,
    ?__Private\SourceRef $source_ref = null,
  ) {
    $this->_object = $object;
    $this->_operator = $operator;
    $this->_name = $name;
    parent::__construct($source_ref);
  }

  <<__Override>>
  public static function fromJSON(
    dict<string, mixed> $json,
    string $file,
    int $initial_offset,
    string $source,
    string $_type_hint,
  ): this {
    $offset = $initial_offset;
    $object = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['embedded_member_object'],
      $file,
      $offset,
      $source,
      'Node',
    );
    $offset += $object->getWidth();
    $operator = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['embedded_member_operator'],
      $file,
      $offset,
      $source,
      'Node',
    );
    $offset += $operator->getWidth();
    $name = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['embedded_member_name'],
      $file,
      $offset,
      $source,
      'Node',
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
  public function getChildren(): dict<string, Node> {
    return dict[
      'object' => $this->_object,
      'operator' => $this->_operator,
      'name' => $this->_name,
    ];
  }

  <<__Override>>
  public function rewriteChildren(
    self::TRewriter $rewriter,
    vec<Node> $parents = vec[],
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

  public function getObjectUNTYPED(): Node {
    return $this->_object;
  }

  public function withObject(Node $value): this {
    if ($value === $this->_object) {
      return $this;
    }
    return new static($value ?? Missing(), $this->_operator, $this->_name);
  }

  public function hasObject(): bool {
    return !$this->_object->isMissing();
  }

  /**
   * @return unknown
   */
  public function getObject(): Node {
    return $this->_object;
  }

  /**
   * @return unknown
   */
  public function getObjectx(): Node {
    return $this->getObject();
  }

  public function getOperatorUNTYPED(): Node {
    return $this->_operator;
  }

  public function withOperator(Node $value): this {
    if ($value === $this->_operator) {
      return $this;
    }
    return new static($this->_object, $value ?? Missing(), $this->_name);
  }

  public function hasOperator(): bool {
    return !$this->_operator->isMissing();
  }

  /**
   * @return unknown
   */
  public function getOperator(): Node {
    return $this->_operator;
  }

  /**
   * @return unknown
   */
  public function getOperatorx(): Node {
    return $this->getOperator();
  }

  public function getNameUNTYPED(): Node {
    return $this->_name;
  }

  public function withName(Node $value): this {
    if ($value === $this->_name) {
      return $this;
    }
    return new static($this->_object, $this->_operator, $value ?? Missing());
  }

  public function hasName(): bool {
    return !$this->_name->isMissing();
  }

  /**
   * @return unknown
   */
  public function getName(): Node {
    return $this->_name;
  }

  /**
   * @return unknown
   */
  public function getNamex(): Node {
    return $this->getName();
  }
}
