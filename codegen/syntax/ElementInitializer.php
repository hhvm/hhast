<?hh // strict
/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<df5559d353cd7251d215d44f79bcb073>>
 */
namespace Facebook\HHAST;
use namespace Facebook\TypeAssert;

<<__ConsistentConstruct>>
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
    return new static($key, $arrow, $value);
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
    return new static($key, $arrow, $value);
  }

  public function getKeyUNTYPED(): EditableNode {
    return $this->_key;
  }

  public function withKey(EditableNode $value): this {
    if ($value === $this->_key) {
      return $this;
    }
    return new static($value, $this->_arrow, $this->_value);
  }

  public function hasKey(): bool {
    return !$this->_key->isMissing();
  }

  /**
   * @return AnonymousFunction | ArrayCreationExpression |
   * ArrayIntrinsicExpression | BinaryExpression | CastExpression |
   * CollectionLiteralExpression | DictionaryIntrinsicExpression |
   * FunctionCallExpression | KeysetIntrinsicExpression | LiteralExpression |
   * ObjectCreationExpression | ParenthesizedExpression | PrefixUnaryExpression
   * | QualifiedName | ScopeResolutionExpression | NameToken |
   * VariableExpression | VectorIntrinsicExpression
   */
  public function getKey(): EditableNode {
    return TypeAssert\instance_of(EditableNode::class, $this->_key);
  }

  /**
   * @return AnonymousFunction | ArrayCreationExpression |
   * ArrayIntrinsicExpression | BinaryExpression | CastExpression |
   * CollectionLiteralExpression | DictionaryIntrinsicExpression |
   * FunctionCallExpression | KeysetIntrinsicExpression | LiteralExpression |
   * ObjectCreationExpression | ParenthesizedExpression | PrefixUnaryExpression
   * | QualifiedName | ScopeResolutionExpression | NameToken |
   * VariableExpression | VectorIntrinsicExpression
   */
  public function getKeyx(): EditableNode {
    return $this->getKey();
  }

  public function getArrowUNTYPED(): EditableNode {
    return $this->_arrow;
  }

  public function withArrow(EditableNode $value): this {
    if ($value === $this->_arrow) {
      return $this;
    }
    return new static($this->_key, $value, $this->_value);
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
    return new static($this->_key, $this->_arrow, $value);
  }

  public function hasValue(): bool {
    return !$this->_value->isMissing();
  }

  /**
   * @return AnonymousFunction | ArrayCreationExpression |
   * ArrayIntrinsicExpression | BinaryExpression | CastExpression |
   * CollectionLiteralExpression | ConditionalExpression |
   * DarrayIntrinsicExpression | DictionaryIntrinsicExpression |
   * FunctionCallExpression | IssetExpression | KeysetIntrinsicExpression |
   * LiteralExpression | MemberSelectionExpression | ObjectCreationExpression |
   * ParenthesizedExpression | PrefixUnaryExpression | QualifiedName |
   * ScopeResolutionExpression | SubscriptExpression | NameToken |
   * TupleExpression | VariableExpression | VarrayIntrinsicExpression |
   * VectorIntrinsicExpression
   */
  public function getValue(): EditableNode {
    return TypeAssert\instance_of(EditableNode::class, $this->_value);
  }

  /**
   * @return AnonymousFunction | ArrayCreationExpression |
   * ArrayIntrinsicExpression | BinaryExpression | CastExpression |
   * CollectionLiteralExpression | ConditionalExpression |
   * DarrayIntrinsicExpression | DictionaryIntrinsicExpression |
   * FunctionCallExpression | IssetExpression | KeysetIntrinsicExpression |
   * LiteralExpression | MemberSelectionExpression | ObjectCreationExpression |
   * ParenthesizedExpression | PrefixUnaryExpression | QualifiedName |
   * ScopeResolutionExpression | SubscriptExpression | NameToken |
   * TupleExpression | VariableExpression | VarrayIntrinsicExpression |
   * VectorIntrinsicExpression
   */
  public function getValuex(): EditableNode {
    return $this->getValue();
  }
}
