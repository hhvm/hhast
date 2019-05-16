/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<fcf00111a1f1a8bee8030983f97dc2ca>>
 */
namespace Facebook\HHAST;
use namespace Facebook\TypeAssert;

<<__ConsistentConstruct>>
final class SimpleInitializer extends EditableNode {

  const string SYNTAX_KIND = 'simple_initializer';

  private EditableNode $_equal;
  private EditableNode $_value;

  public function __construct(
    EditableNode $equal,
    EditableNode $value,
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
    $equal = EditableNode::fromJSON(
      /* UNSAFE_EXPR */ $json['simple_initializer_equal'],
      $file,
      $offset,
      $source,
    );
    $offset += $equal->getWidth();
    $value = EditableNode::fromJSON(
      /* UNSAFE_EXPR */ $json['simple_initializer_value'],
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
  public function getChildren(): dict<string, EditableNode> {
    return dict[
      'equal' => $this->_equal,
      'value' => $this->_value,
    ];
  }

  <<__Override>>
  public function rewriteChildren(
    self::TRewriter $rewriter,
    vec<EditableNode> $parents = vec[],
  ): this {
    $parents[] = $this;
    $equal = $rewriter($this->_equal, $parents);
    $value = $rewriter($this->_value, $parents);
    if ($equal === $this->_equal && $value === $this->_value) {
      return $this;
    }
    return new static($equal, $value);
  }

  public function getEqualUNTYPED(): EditableNode {
    return $this->_equal;
  }

  public function withEqual(EditableNode $value): this {
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

  public function getValueUNTYPED(): EditableNode {
    return $this->_value;
  }

  public function withValue(EditableNode $value): this {
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
