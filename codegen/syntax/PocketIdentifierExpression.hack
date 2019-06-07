/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<78723bfec8a76d76953b335a1575cae8>>
 */
namespace Facebook\HHAST;
use namespace Facebook\TypeAssert;

<<__ConsistentConstruct>>
final class PocketIdentifierExpression
  extends Node
  implements ILambdaBody, IExpression {

  const string SYNTAX_KIND = 'pocket_identifier_expression';

  private Node $_qualifier;
  private Node $_pu_operator;
  private Node $_field;
  private Node $_operator;
  private Node $_name;

  public function __construct(
    Node $qualifier,
    Node $pu_operator,
    Node $field,
    Node $operator,
    Node $name,
    ?__Private\SourceRef $source_ref = null,
  ) {
    $this->_qualifier = $qualifier;
    $this->_pu_operator = $pu_operator;
    $this->_field = $field;
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
    $qualifier = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['pocket_identifier_qualifier'],
      $file,
      $offset,
      $source,
      'Node',
    );
    $offset += $qualifier->getWidth();
    $pu_operator = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['pocket_identifier_pu_operator'],
      $file,
      $offset,
      $source,
      'Node',
    );
    $offset += $pu_operator->getWidth();
    $field = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['pocket_identifier_field'],
      $file,
      $offset,
      $source,
      'Node',
    );
    $offset += $field->getWidth();
    $operator = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['pocket_identifier_operator'],
      $file,
      $offset,
      $source,
      'Node',
    );
    $offset += $operator->getWidth();
    $name = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['pocket_identifier_name'],
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
    return new static(
      $qualifier,
      $pu_operator,
      $field,
      $operator,
      $name,
      $source_ref,
    );
  }

  <<__Override>>
  public function getChildren(): dict<string, Node> {
    return dict[
      'qualifier' => $this->_qualifier,
      'pu_operator' => $this->_pu_operator,
      'field' => $this->_field,
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
    $qualifier = $rewriter($this->_qualifier, $parents);
    $pu_operator = $rewriter($this->_pu_operator, $parents);
    $field = $rewriter($this->_field, $parents);
    $operator = $rewriter($this->_operator, $parents);
    $name = $rewriter($this->_name, $parents);
    if (
      $qualifier === $this->_qualifier &&
      $pu_operator === $this->_pu_operator &&
      $field === $this->_field &&
      $operator === $this->_operator &&
      $name === $this->_name
    ) {
      return $this;
    }
    return new static($qualifier, $pu_operator, $field, $operator, $name);
  }

  public function getQualifierUNTYPED(): Node {
    return $this->_qualifier;
  }

  public function withQualifier(Node $value): this {
    if ($value === $this->_qualifier) {
      return $this;
    }
    return new static(
      $value,
      $this->_pu_operator,
      $this->_field,
      $this->_operator,
      $this->_name,
    );
  }

  public function hasQualifier(): bool {
    return !$this->_qualifier->isMissing();
  }

  /**
   * @return unknown
   */
  public function getQualifier(): Node {
    return $this->_qualifier;
  }

  /**
   * @return unknown
   */
  public function getQualifierx(): Node {
    return $this->getQualifier();
  }

  public function getPuOperatorUNTYPED(): Node {
    return $this->_pu_operator;
  }

  public function withPuOperator(Node $value): this {
    if ($value === $this->_pu_operator) {
      return $this;
    }
    return new static(
      $this->_qualifier,
      $value,
      $this->_field,
      $this->_operator,
      $this->_name,
    );
  }

  public function hasPuOperator(): bool {
    return !$this->_pu_operator->isMissing();
  }

  /**
   * @return unknown
   */
  public function getPuOperator(): Node {
    return $this->_pu_operator;
  }

  /**
   * @return unknown
   */
  public function getPuOperatorx(): Node {
    return $this->getPuOperator();
  }

  public function getFieldUNTYPED(): Node {
    return $this->_field;
  }

  public function withField(Node $value): this {
    if ($value === $this->_field) {
      return $this;
    }
    return new static(
      $this->_qualifier,
      $this->_pu_operator,
      $value,
      $this->_operator,
      $this->_name,
    );
  }

  public function hasField(): bool {
    return !$this->_field->isMissing();
  }

  /**
   * @return unknown
   */
  public function getField(): Node {
    return $this->_field;
  }

  /**
   * @return unknown
   */
  public function getFieldx(): Node {
    return $this->getField();
  }

  public function getOperatorUNTYPED(): Node {
    return $this->_operator;
  }

  public function withOperator(Node $value): this {
    if ($value === $this->_operator) {
      return $this;
    }
    return new static(
      $this->_qualifier,
      $this->_pu_operator,
      $this->_field,
      $value,
      $this->_name,
    );
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
    return new static(
      $this->_qualifier,
      $this->_pu_operator,
      $this->_field,
      $this->_operator,
      $value,
    );
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
