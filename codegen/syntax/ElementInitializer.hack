/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<4fcf688cfe9e38b233931aa0bcabbe6e>>
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
    ?__Private\SourceRef $source_ref = null,
  ) {
    $this->_key = $key;
    $this->_arrow = $arrow;
    $this->_value = $value;
    parent::__construct('element_initializer', $source_ref);
  }

  <<__Override>>
  public static function fromJSON(
    dict<string, mixed> $json,
    string $file,
    int $initial_offset,
    string $source,
  ): this {
    $offset = $initial_offset;
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
    $source_ref = shape(
      'file' => $file,
      'source' => $source,
      'offset' => $initial_offset,
      'width' => $offset - $initial_offset,
    );
    return new static($key, $arrow, $value, $source_ref);
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
  public function rewriteChildren(
    self::TRewriter $rewriter,
    vec<EditableNode> $parents = vec[],
  ): this {
    $parents[] = $this;
    $key = $rewriter($this->_key, $parents);
    $arrow = $rewriter($this->_arrow, $parents);
    $value = $rewriter($this->_value, $parents);
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
   * FunctionCallExpression | LiteralExpression | ObjectCreationExpression |
   * ParenthesizedExpression | PrefixUnaryExpression | QualifiedName |
   * ScopeResolutionExpression | SubscriptExpression | NameToken |
   * VariableExpression
   */
  <<__Memoize>>
  public function getKey(): IExpression {
    return __Private\Wrap\wrap_IExpression($this->_key);
  }

  /**
   * @return AnonymousFunction | ArrayCreationExpression |
   * ArrayIntrinsicExpression | BinaryExpression | CastExpression |
   * FunctionCallExpression | LiteralExpression | ObjectCreationExpression |
   * ParenthesizedExpression | PrefixUnaryExpression | QualifiedName |
   * ScopeResolutionExpression | SubscriptExpression | NameToken |
   * VariableExpression
   */
  public function getKeyx(): IExpression {
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
   * LambdaExpression | LiteralExpression | MemberSelectionExpression |
   * ObjectCreationExpression | ParenthesizedExpression | PrefixUnaryExpression
   * | QualifiedName | ScopeResolutionExpression | SubscriptExpression |
   * NameToken | TupleExpression | VariableExpression |
   * VarrayIntrinsicExpression | VectorIntrinsicExpression
   */
  <<__Memoize>>
  public function getValue(): IExpression {
    return __Private\Wrap\wrap_IExpression($this->_value);
  }

  /**
   * @return AnonymousFunction | ArrayCreationExpression |
   * ArrayIntrinsicExpression | BinaryExpression | CastExpression |
   * CollectionLiteralExpression | ConditionalExpression |
   * DarrayIntrinsicExpression | DictionaryIntrinsicExpression |
   * FunctionCallExpression | IssetExpression | KeysetIntrinsicExpression |
   * LambdaExpression | LiteralExpression | MemberSelectionExpression |
   * ObjectCreationExpression | ParenthesizedExpression | PrefixUnaryExpression
   * | QualifiedName | ScopeResolutionExpression | SubscriptExpression |
   * NameToken | TupleExpression | VariableExpression |
   * VarrayIntrinsicExpression | VectorIntrinsicExpression
   */
  public function getValuex(): IExpression {
    return $this->getValue();
  }
}
