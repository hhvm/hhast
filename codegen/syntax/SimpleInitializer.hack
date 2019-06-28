/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<df1b6c90174faab815c6d8df9ca1106d>>
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
    string $_type_hint,
  ): this {
    $offset = $initial_offset;
    $equal = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['simple_initializer_equal'],
      $file,
      $offset,
      $source,
      'EqualToken',
    );
    $offset += $equal->getWidth();
    $value = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['simple_initializer_value'],
      $file,
      $offset,
      $source,
      'IExpression',
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

  public function withEqual(EqualToken $value): this {
    if ($value === $this->_equal) {
      return $this;
    }
    return new static($value ?? Missing(), $this->_value);
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

  public function withValue(IExpression $value): this {
    if ($value === $this->_value) {
      return $this;
    }
    return new static($this->_equal, $value ?? Missing());
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
  public function getValue(): IExpression {
    return TypeAssert\instance_of(IExpression::class, $this->_value);
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
