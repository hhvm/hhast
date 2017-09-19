<?hh // strict
/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<7fd98cc3efad38e7bfa21c164cdc4ab5>>
 */
namespace Facebook\HHAST;
use namespace Facebook\TypeAssert;

final class SimpleInitializer extends EditableNode {

  private EditableNode $_equal;
  private EditableNode $_value;

  public function __construct(EditableNode $equal, EditableNode $value) {
    parent::__construct('simple_initializer');
    $this->_equal = $equal;
    $this->_value = $value;
  }

  <<__Override>>
  public static function fromJSON(
    dict<string, mixed> $json,
    int $position,
    string $source,
  ): this {
    $equal = EditableNode::fromJSON(
      /* UNSAFE_EXPR */ $json['simple_initializer_equal'],
      $position,
      $source,
    );
    $position += $equal->getWidth();
    $value = EditableNode::fromJSON(
      /* UNSAFE_EXPR */ $json['simple_initializer_value'],
      $position,
      $source,
    );
    $position += $value->getWidth();
    return new self($equal, $value);
  }

  <<__Override>>
  public function getChildren(): KeyedTraversable<string, EditableNode> {
    yield 'equal' => $this->_equal;
    yield 'value' => $this->_value;
  }

  <<__Override>>
  public function rewriteDescendants(
    self::TRewriter $rewriter,
    ?Traversable<EditableNode> $parents = null,
  ): this {
    $parents = $parents === null ? vec[] : vec($parents);
    $parents[] = $this;
    $equal = $this->_equal->rewrite($rewriter, $parents);
    $value = $this->_value->rewrite($rewriter, $parents);
    if ($equal === $this->_equal && $value === $this->_value) {
      return $this;
    }
    return new self($equal, $value);
  }

  public function getEqualUNTYPED(): EditableNode {
    return $this->_equal;
  }

  public function withEqual(EditableNode $value): this {
    if ($value === $this->_equal) {
      return $this;
    }
    return new self($value, $this->_value);
  }

  public function hasEqual(): bool {
    return !$this->_equal->isMissing();
  }

  /**
   * @returns EqualToken
   */
  public function getEqual(): EqualToken {
    return TypeAssert\instance_of(EqualToken::class, $this->_equal);
  }

  public function getValueUNTYPED(): EditableNode {
    return $this->_value;
  }

  public function withValue(EditableNode $value): this {
    if ($value === $this->_value) {
      return $this;
    }
    return new self($this->_equal, $value);
  }

  public function hasValue(): bool {
    return !$this->_value->isMissing();
  }

  /**
   * @returns LiteralExpression | ArrayIntrinsicExpression | BinaryExpression |
   * ArrayCreationExpression | ScopeResolutionExpression |
   * VectorIntrinsicExpression | DictionaryIntrinsicExpression |
   * KeysetIntrinsicExpression | QualifiedNameExpression |
   * CollectionLiteralExpression | PrefixUnaryExpression | ShapeExpression |
   * ConditionalExpression | VarrayIntrinsicExpression |
   * DarrayIntrinsicExpression | FunctionCallExpression |
   * ParenthesizedExpression | TupleExpression
   */
  public function getValue(): EditableNode {
    return TypeAssert\instance_of(EditableNode::class, $this->_value);
  }
}
