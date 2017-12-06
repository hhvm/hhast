<?hh // strict
/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<484cb2c4d2575825f21cfdf850c48a1f>>
 */
namespace Facebook\HHAST;
use namespace Facebook\TypeAssert;

final class ElementInitializer extends EditableNode {

  private EditableNode $_key;
  private EditableNode $_arrow;
  private EditableNode $_value;

  public function __construct(
    EditableNode $key,
    EditableNode $arrow,
    EditableNode $value,
  ) {
    parent::__construct('element_initializer');
    $this->_key = $key;
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
    $key = EditableNode::fromJSON(
      /* UNSAFE_EXPR */ $json['element_key'],
      $file,
      $offset,
      $source,
    );
    $offset += $key->getWidth();
    $arrow = EditableNode::fromJSON(
      /* UNSAFE_EXPR */ $json['element_arrow'],
      $file,
      $offset,
      $source,
    );
    $offset += $arrow->getWidth();
    $value = EditableNode::fromJSON(
      /* UNSAFE_EXPR */ $json['element_value'],
      $file,
      $offset,
      $source,
    );
    $offset += $value->getWidth();
    return new self($key, $arrow, $value);
  }

  <<__Override>>
  public function getChildren(): dict<string, EditableNode> {
    return dict[
      'key' => $this->_key,
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
    $key = $this->_key->rewrite($rewriter, $parents);
    $arrow = $this->_arrow->rewrite($rewriter, $parents);
    $value = $this->_value->rewrite($rewriter, $parents);
    if (
      $key === $this->_key &&
      $arrow === $this->_arrow &&
      $value === $this->_value
    ) {
      return $this;
    }
    return new self($key, $arrow, $value);
  }

  public function getKeyUNTYPED(): EditableNode {
    return $this->_key;
  }

  public function withKey(EditableNode $value): this {
    if ($value === $this->_key) {
      return $this;
    }
    return new self($value, $this->_arrow, $this->_value);
  }

  public function hasKey(): bool {
    return !$this->_key->isMissing();
  }

  /**
   * @returns LiteralExpression | QualifiedNameExpression |
   * ScopeResolutionExpression | VariableExpression | ArrayIntrinsicExpression
   * | ObjectCreationExpression | VectorIntrinsicExpression |
   * DictionaryIntrinsicExpression | KeysetIntrinsicExpression |
   * CollectionLiteralExpression | PrefixUnaryExpression |
   * FunctionCallExpression | BinaryExpression | ParenthesizedExpression |
   * ArrayCreationExpression | CastExpression | AnonymousFunction
   */
  public function getKey(): EditableNode {
    return TypeAssert\instance_of(EditableNode::class, $this->_key);
  }

  public function getArrowUNTYPED(): EditableNode {
    return $this->_arrow;
  }

  public function withArrow(EditableNode $value): this {
    if ($value === $this->_arrow) {
      return $this;
    }
    return new self($this->_key, $value, $this->_value);
  }

  public function hasArrow(): bool {
    return !$this->_arrow->isMissing();
  }

  /**
   * @returns EqualGreaterThanToken
   */
  public function getArrow(): EqualGreaterThanToken {
    return TypeAssert\instance_of(EqualGreaterThanToken::class, $this->_arrow);
  }

  public function getValueUNTYPED(): EditableNode {
    return $this->_value;
  }

  public function withValue(EditableNode $value): this {
    if ($value === $this->_value) {
      return $this;
    }
    return new self($this->_key, $this->_arrow, $value);
  }

  public function hasValue(): bool {
    return !$this->_value->isMissing();
  }

  /**
   * @returns LiteralExpression | ObjectCreationExpression |
   * PrefixUnaryExpression | CastExpression | QualifiedNameExpression |
   * VariableExpression | ScopeResolutionExpression |
   * DictionaryIntrinsicExpression | ArrayCreationExpression |
   * VectorIntrinsicExpression | KeysetIntrinsicExpression |
   * ConditionalExpression | FunctionCallExpression | BinaryExpression |
   * ArrayIntrinsicExpression | MemberSelectionExpression |
   * ParenthesizedExpression | CollectionLiteralExpression | AnonymousFunction
   * | DarrayIntrinsicExpression | VarrayIntrinsicExpression |
   * SubscriptExpression | IssetExpression | TupleExpression
   */
  public function getValue(): EditableNode {
    return TypeAssert\instance_of(EditableNode::class, $this->_value);
  }
}
