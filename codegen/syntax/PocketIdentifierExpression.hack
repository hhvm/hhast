/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<cd1319b6281581e2a3ef01eff67e690c>>
 */
namespace Facebook\HHAST;
use namespace Facebook\TypeAssert;

<<__ConsistentConstruct>>
final class PocketIdentifierExpression
  extends EditableNode
  implements ILambdaBody, IExpression {

  const string SYNTAX_KIND = 'PocketIdentifierExpression';

  private EditableNode $_qualifier;
  private EditableNode $_pu_operator;
  private EditableNode $_field;
  private EditableNode $_operator;
  private EditableNode $_name;

  public function __construct(
    EditableNode $qualifier,
    EditableNode $pu_operator,
    EditableNode $field,
    EditableNode $operator,
    EditableNode $name,
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
  ): this {
    $offset = $initial_offset;
    $qualifier = EditableNode::fromJSON(
      /* UNSAFE_EXPR */ $json['pocket_identifier_qualifier'],
      $file,
      $offset,
      $source,
    );
    $offset += $qualifier->getWidth();
    $pu_operator = EditableNode::fromJSON(
      /* UNSAFE_EXPR */ $json['pocket_identifier_pu_operator'],
      $file,
      $offset,
      $source,
    );
    $offset += $pu_operator->getWidth();
    $field = EditableNode::fromJSON(
      /* UNSAFE_EXPR */ $json['pocket_identifier_field'],
      $file,
      $offset,
      $source,
    );
    $offset += $field->getWidth();
    $operator = EditableNode::fromJSON(
      /* UNSAFE_EXPR */ $json['pocket_identifier_operator'],
      $file,
      $offset,
      $source,
    );
    $offset += $operator->getWidth();
    $name = EditableNode::fromJSON(
      /* UNSAFE_EXPR */ $json['pocket_identifier_name'],
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
  public function getChildren(): dict<string, EditableNode> {
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
    vec<EditableNode> $parents = vec[],
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

  public function getQualifierUNTYPED(): EditableNode {
    return $this->_qualifier;
  }

  public function withQualifier(EditableNode $value): this {
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
  public function getQualifier(): EditableNode {
    return $this->_qualifier;
  }

  /**
   * @return unknown
   */
  public function getQualifierx(): EditableNode {
    return $this->getQualifier();
  }

  public function getPuOperatorUNTYPED(): EditableNode {
    return $this->_pu_operator;
  }

  public function withPuOperator(EditableNode $value): this {
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
  public function getPuOperator(): EditableNode {
    return $this->_pu_operator;
  }

  /**
   * @return unknown
   */
  public function getPuOperatorx(): EditableNode {
    return $this->getPuOperator();
  }

  public function getFieldUNTYPED(): EditableNode {
    return $this->_field;
  }

  public function withField(EditableNode $value): this {
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
  public function getField(): EditableNode {
    return $this->_field;
  }

  /**
   * @return unknown
   */
  public function getFieldx(): EditableNode {
    return $this->getField();
  }

  public function getOperatorUNTYPED(): EditableNode {
    return $this->_operator;
  }

  public function withOperator(EditableNode $value): this {
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
