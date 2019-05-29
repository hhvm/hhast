/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<4ccf49eb9f9d317d2385939821cd9df1>>
 */
namespace Facebook\HHAST;
use namespace Facebook\TypeAssert;

<<__ConsistentConstruct>>
final class SimpleInitializer extends Node {

  const string SYNTAX_KIND = 'simple_initializer';

  private Node $_equal;
  private Node $_value;

  public function __construct(
    Node $equal,
    Node $value,
    ?__Private\SourceRef $source_ref = null,
  ) {
    $this->_equal = $equal;
    $this->_value = $value;
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
    $equal = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['simple_initializer_equal'],
      $file,
      $offset,
      $source,
    );
    $offset += $equal->getWidth();
    $value = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['simple_initializer_value'],
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
    return new static($equal, $value, $source_ref);
  }

  <<__Override>>
  public function getChildren(): dict<string, Node> {
    return dict[
      'equal' => $this->_equal,
      'value' => $this->_value,
    ];
  }

  <<__Override>>
  public function rewriteChildren(
    self::TRewriter $rewriter,
    vec<Node> $parents = vec[],
  ): this {
    $parents[] = $this;
    $equal = $rewriter($this->_equal, $parents);
    $value = $rewriter($this->_value, $parents);
    if ($equal === $this->_equal && $value === $this->_value) {
      return $this;
    }
    return new static($equal, $value);
  }

  public function getEqualUNTYPED(): Node {
    return $this->_equal;
  }

  public function withEqual(Node $value): this {
    if ($value === $this->_equal) {
      return $this;
    }
    return new static($value, $this->_value);
  }

  public function hasEqual(): bool {
    return !$this->_equal->isMissing();
  }

  /**
   * @return EqualToken
   */
  public function getEqual(): EqualToken {
    return TypeAssert\instance_of(EqualToken::class, $this->_equal);
  }

  /**
   * @return EqualToken
   */
  public function getEqualx(): EqualToken {
    return $this->getEqual();
  }

  public function getValueUNTYPED(): Node {
    return $this->_value;
  }

  public function withValue(Node $value): this {
    if ($value === $this->_value) {
      return $this;
    }
    return new static($this->_equal, $value);
  }

  public function hasValue(): bool {
    return !$this->_value->isMissing();
  }

  /**
   * @return ArrayCreationExpression | ArrayIntrinsicExpression |
   * BinaryExpression | CollectionLiteralExpression | ConditionalExpression |
   * DarrayIntrinsicExpression | DictionaryIntrinsicExpression |
   * FunctionCallExpression | KeysetIntrinsicExpression | LambdaExpression |
   * LiteralExpression | ParenthesizedExpression | PrefixUnaryExpression |
   * QualifiedName | ScopeResolutionExpression | ShapeExpression | NameToken |
   * TupleExpression | VarrayIntrinsicExpression | VectorIntrinsicExpression |
   * XHPExpression
   */
  <<__Memoize>>
  public function getValue(): IExpression {
    return __Private\Wrap\wrap_IExpression($this->_value);
  }

  /**
   * @return ArrayCreationExpression | ArrayIntrinsicExpression |
   * BinaryExpression | CollectionLiteralExpression | ConditionalExpression |
   * DarrayIntrinsicExpression | DictionaryIntrinsicExpression |
   * FunctionCallExpression | KeysetIntrinsicExpression | LambdaExpression |
   * LiteralExpression | ParenthesizedExpression | PrefixUnaryExpression |
   * QualifiedName | ScopeResolutionExpression | ShapeExpression | NameToken |
   * TupleExpression | VarrayIntrinsicExpression | VectorIntrinsicExpression |
   * XHPExpression
   */
  public function getValuex(): IExpression {
    return $this->getValue();
  }
}
