/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<0a59e0f91b7cfe7f8dafe46adc655c85>>
 */
namespace Facebook\HHAST;
use namespace Facebook\TypeAssert;
use namespace HH\Lib\Dict;
/* HHAST_IGNORE_ALL[5607] 5607 is ignored because of false positives when comparing a generic to a typed value */
/* HHAST_IGNORE_ALL[5624] HHAST_IGNORE_ALL[5639] 5624 and 5639 are ignored because they insist on using co(tra)variant generics. Could this break external consumers? */

<<__ConsistentConstruct>>
final class SimpleInitializer extends Node {

  const string SYNTAX_KIND = 'simple_initializer';

  private EqualToken $_equal;
  private IExpression $_value;

  public function __construct(
    EqualToken $equal,
    IExpression $value,
    ?__Private\SourceRef $source_ref = null,
  ) {
    $this->_equal = $equal;
    $this->_value = $value;
    parent::__construct($source_ref);
  }

  <<__Override>>
  public static function fromJSON(
    dict<arraykey, mixed> $json,
    string $file,
    int $initial_offset,
    string $source,
    string $_type_hint,
  ): this {
    $offset = $initial_offset;
    $equal = Node::fromJSON(
      ($json['simple_initializer_equal']) as dict<_, _>,
      $file,
      $offset,
      $source,
      'EqualToken',
    );
    $equal = $equal as nonnull;
    $offset += $equal->getWidth();
    $value = Node::fromJSON(
      ($json['simple_initializer_value']) as dict<_, _>,
      $file,
      $offset,
      $source,
      'IExpression',
    );
    $value = $value as nonnull;
    $offset += $value->getWidth();
    $source_ref = shape(
      'file' => $file,
      'source' => $source,
      'offset' => $initial_offset,
      'width' => $offset - $initial_offset,
    );
    return new static(
      /* HH_IGNORE_ERROR[4110] */ $equal,
      /* HH_IGNORE_ERROR[4110] */ $value,
      $source_ref,
    );
  }

  <<__Override>>
  public function getChildren(): dict<string, Node> {
    return dict[
      'equal' => $this->_equal,
      'value' => $this->_value,
    ]
      |> Dict\filter_nulls($$);
  }

  <<__Override>>
  public function rewriteChildren<Tret as ?Node>(
    (function(Node, vec<Node>): Tret) $rewriter,
    vec<Node> $parents = vec[],
  ): this {
    $parents[] = $this;
    $equal = $rewriter($this->_equal, $parents);
    $value = $rewriter($this->_value, $parents);
    if ($equal === $this->_equal && $value === $this->_value) {
      return $this;
    }
    return new static($equal as EqualToken, $value as IExpression);
  }

  public function getEqualUNTYPED(): ?Node {
    return $this->_equal;
  }

  public function withEqual(EqualToken $value): this {
    if ($value === $this->_equal) {
      return $this;
    }
    return new static($value, $this->_value);
  }

  public function hasEqual(): bool {
    return true;
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

  public function getValueUNTYPED(): ?Node {
    return $this->_value;
  }

  public function withValue(IExpression $value): this {
    if ($value === $this->_value) {
      return $this;
    }
    return new static($this->_equal, $value);
  }

  public function hasValue(): bool {
    return true;
  }

  /**
   * @return AsExpression | BinaryExpression | CollectionLiteralExpression |
   * ConditionalExpression | DarrayIntrinsicExpression |
   * DictionaryIntrinsicExpression | EnumClassLabelExpression |
   * FunctionCallExpression | FunctionPointerExpression |
   * KeysetIntrinsicExpression | LambdaExpression | LiteralExpression |
   * ObjectCreationExpression | ParenthesizedExpression | PrefixUnaryExpression
   * | QualifiedName | ScopeResolutionExpression | ShapeExpression | NameToken
   * | TupleExpression | VariableExpression | VarrayIntrinsicExpression |
   * VectorIntrinsicExpression | XHPExpression
   */
  public function getValue(): IExpression {
    return TypeAssert\instance_of(IExpression::class, $this->_value);
  }

  /**
   * @return AsExpression | BinaryExpression | CollectionLiteralExpression |
   * ConditionalExpression | DarrayIntrinsicExpression |
   * DictionaryIntrinsicExpression | EnumClassLabelExpression |
   * FunctionCallExpression | FunctionPointerExpression |
   * KeysetIntrinsicExpression | LambdaExpression | LiteralExpression |
   * ObjectCreationExpression | ParenthesizedExpression | PrefixUnaryExpression
   * | QualifiedName | ScopeResolutionExpression | ShapeExpression | NameToken
   * | TupleExpression | VariableExpression | VarrayIntrinsicExpression |
   * VectorIntrinsicExpression | XHPExpression
   */
  public function getValuex(): IExpression {
    return $this->getValue();
  }
}
