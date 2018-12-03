<?hh // strict
/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<c68a721cac7c0652fecc000b12104323>>
 */
namespace Facebook\HHAST;
use namespace Facebook\TypeAssert;

<<__ConsistentConstruct>>
final class FieldInitializer extends EditableNode {

  private EditableNode $_name;
  private EditableNode $_arrow;
  private EditableNode $_value;

  public function __construct(
    EditableNode $name,
    EditableNode $arrow,
    EditableNode $value,
  ) {
    parent::__construct('field_initializer');
    $this->_name = $name;
    $this->_arrow = $arrow;
    $this->_value = $value;
  }

  <<__Override>>
  public static function fromJSON(
    dict<string, mixed> $json,
    string $file,
    int $offset,
    string $source,
  ): this {
    $name = EditableNode::fromJSON(
      /* UNSAFE_EXPR */ $json['field_initializer_name'],
      $file,
      $offset,
      $source,
    );
    $offset += $name->getWidth();
    $arrow = EditableNode::fromJSON(
      /* UNSAFE_EXPR */ $json['field_initializer_arrow'],
      $file,
      $offset,
      $source,
    );
    $offset += $arrow->getWidth();
    $value = EditableNode::fromJSON(
      /* UNSAFE_EXPR */ $json['field_initializer_value'],
      $file,
      $offset,
      $source,
    );
    $offset += $value->getWidth();
    return new static($name, $arrow, $value);
  }

  <<__Override>>
  public function getChildren(): dict<string, EditableNode> {
    return dict[
      'name' => $this->_name,
      'arrow' => $this->_arrow,
      'value' => $this->_value,
    ];
  }

  <<__Override>>
  public function rewriteDescendants(
    self::TRewriter $rewriter,
    ?vec<EditableNode> $parents = null,
  ): this {
    $parents = $parents === null ? vec[] : vec($parents);
    $parents[] = $this;
    $name = $this->_name->rewrite($rewriter, $parents);
    $arrow = $this->_arrow->rewrite($rewriter, $parents);
    $value = $this->_value->rewrite($rewriter, $parents);
    if (
      $name === $this->_name &&
      $arrow === $this->_arrow &&
      $value === $this->_value
    ) {
      return $this;
    }
    return new static($name, $arrow, $value);
  }

  public function getNameUNTYPED(): EditableNode {
    return $this->_name;
  }

  public function withName(EditableNode $value): this {
    if ($value === $this->_name) {
      return $this;
    }
    return new static($value, $this->_arrow, $this->_value);
  }

  public function hasName(): bool {
    return !$this->_name->isMissing();
  }

  /**
   * @return LiteralExpression | ScopeResolutionExpression | QuestionToken |
   * VariableExpression
   */
  public function getName(): EditableNode {
    return TypeAssert\instance_of(EditableNode::class, $this->_name);
  }

  /**
   * @return LiteralExpression | ScopeResolutionExpression | QuestionToken |
   * VariableExpression
   */
  public function getNamex(): EditableNode {
    return $this->getName();
  }

  public function getArrowUNTYPED(): EditableNode {
    return $this->_arrow;
  }

  public function withArrow(EditableNode $value): this {
    if ($value === $this->_arrow) {
      return $this;
    }
    return new static($this->_name, $value, $this->_value);
  }

  public function hasArrow(): bool {
    return !$this->_arrow->isMissing();
  }

  /**
   * @return EqualGreaterThanToken
   */
  public function getArrow(): EqualGreaterThanToken {
    return TypeAssert\instance_of(EqualGreaterThanToken::class, $this->_arrow);
  }

  /**
   * @return EqualGreaterThanToken
   */
  public function getArrowx(): EqualGreaterThanToken {
    return $this->getArrow();
  }

  public function getValueUNTYPED(): EditableNode {
    return $this->_value;
  }

  public function withValue(EditableNode $value): this {
    if ($value === $this->_value) {
      return $this;
    }
    return new static($this->_name, $this->_arrow, $value);
  }

  public function hasValue(): bool {
    return !$this->_value->isMissing();
  }

  /**
   * @return ArrayIntrinsicExpression | BinaryExpression | LambdaExpression |
   * LiteralExpression | ObjectCreationExpression | ScopeResolutionExpression |
   * SubscriptExpression | NameToken | VariableExpression |
   * VectorIntrinsicExpression
   */
  public function getValue(): EditableNode {
    return TypeAssert\instance_of(EditableNode::class, $this->_value);
  }

  /**
   * @return ArrayIntrinsicExpression | BinaryExpression | LambdaExpression |
   * LiteralExpression | ObjectCreationExpression | ScopeResolutionExpression |
   * SubscriptExpression | NameToken | VariableExpression |
   * VectorIntrinsicExpression
   */
  public function getValuex(): EditableNode {
    return $this->getValue();
  }
}
