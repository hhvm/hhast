/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx>>
 */
namespace Facebook\HHAST;
use namespace Facebook\TypeAssert;
use namespace HH\Lib\Dict;
/* HHAST_IGNORE_ALL[5607] 5607 is ignored because of false positives when comparing a generic to a typed value */
/* HHAST_IGNORE_ALL[5624] HHAST_IGNORE_ALL[5639] 5624 and 5639 are ignored because they insist on using co(tra)variant generics. Could this break external consumers? */

<<__ConsistentConstruct>>
final class LambdaExpression
  extends Node
  implements IHasFunctionBody, ILambdaBody, IHasAttributeSpec, IExpression {

  const string SYNTAX_KIND = 'lambda_expression';

  private ?OldAttributeSpecification $_attribute_spec;
  private ?AsyncToken $_async;
  private Node $_signature;
  private EqualEqualGreaterThanToken $_arrow;
  private ILambdaBody $_body;

  public function __construct(
    ?OldAttributeSpecification $attribute_spec,
    ?AsyncToken $async,
    Node $signature,
    EqualEqualGreaterThanToken $arrow,
    ILambdaBody $body,
    ?__Private\SourceRef $source_ref = null,
  ) {
    $this->_attribute_spec = $attribute_spec;
    $this->_async = $async;
    $this->_signature = $signature;
    $this->_arrow = $arrow;
    $this->_body = $body;
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
    $attribute_spec = Node::fromJSON(
      ($json['lambda_attribute_spec'] ?? dict['kind' => 'missing'])
        as dict<_, _>,
      $file,
      $offset,
      $source,
      'OldAttributeSpecification',
    );
    $offset += $attribute_spec?->getWidth() ?? 0;
    $async = Node::fromJSON(
      ($json['lambda_async'] ?? dict['kind' => 'missing']) as dict<_, _>,
      $file,
      $offset,
      $source,
      'AsyncToken',
    );
    $offset += $async?->getWidth() ?? 0;
    $signature = Node::fromJSON(
      ($json['lambda_signature']) as dict<_, _>,
      $file,
      $offset,
      $source,
      'Node',
    );
    $signature = $signature as nonnull;
    $offset += $signature->getWidth();
    $arrow = Node::fromJSON(
      ($json['lambda_arrow']) as dict<_, _>,
      $file,
      $offset,
      $source,
      'EqualEqualGreaterThanToken',
    );
    $arrow = $arrow as nonnull;
    $offset += $arrow->getWidth();
    $body = Node::fromJSON(
      ($json['lambda_body']) as dict<_, _>,
      $file,
      $offset,
      $source,
      'ILambdaBody',
    );
    $body = $body as nonnull;
    $offset += $body->getWidth();
    $source_ref = shape(
      'file' => $file,
      'source' => $source,
      'offset' => $initial_offset,
      'width' => $offset - $initial_offset,
    );
    return new static(
      $attribute_spec as ?OldAttributeSpecification,
      $async as ?AsyncToken,
      $signature,
      $arrow as EqualEqualGreaterThanToken,
      $body as ILambdaBody,
      $source_ref,
    );
  }

  <<__Override>>
  public function getChildren(): dict<string, Node> {
    return dict[
      'attribute_spec' => $this->_attribute_spec,
      'async' => $this->_async,
      'signature' => $this->_signature,
      'arrow' => $this->_arrow,
      'body' => $this->_body,
    ]
      |> Dict\filter_nulls($$);
  }

  <<__Override>>
  public function rewriteChildren<Tret as ?Node>(
    (function(Node, vec<Node>): Tret) $rewriter,
    vec<Node> $parents = vec[],
  ): this {
    $parents[] = $this;
    $attribute_spec = $this->_attribute_spec === null
      ? null
      : $rewriter($this->_attribute_spec, $parents);
    $async = $this->_async === null ? null : $rewriter($this->_async, $parents);
    $signature = $rewriter($this->_signature, $parents);
    $arrow = $rewriter($this->_arrow, $parents);
    $body = $rewriter($this->_body, $parents);
    if (
      $attribute_spec === $this->_attribute_spec &&
      $async === $this->_async &&
      $signature === $this->_signature &&
      $arrow === $this->_arrow &&
      $body === $this->_body
    ) {
      return $this;
    }
    return new static(
      $attribute_spec as ?OldAttributeSpecification,
      $async as ?AsyncToken,
      $signature as Node,
      $arrow as EqualEqualGreaterThanToken,
      $body as ILambdaBody,
    );
  }

  public function getAttributeSpecUNTYPED(): ?Node {
    return $this->_attribute_spec;
  }

  public function withAttributeSpec(?OldAttributeSpecification $value): this {
    if ($value === $this->_attribute_spec) {
      return $this;
    }
    return new static(
      $value,
      $this->_async,
      $this->_signature,
      $this->_arrow,
      $this->_body,
    );
  }

  public function hasAttributeSpec(): bool {
    return $this->_attribute_spec !== null;
  }

  /**
   * @return null | OldAttributeSpecification
   */
  public function getAttributeSpec(): ?OldAttributeSpecification {
    return $this->_attribute_spec;
  }

  /**
   * @return OldAttributeSpecification
   */
  public function getAttributeSpecx(): OldAttributeSpecification {
    return TypeAssert\not_null($this->getAttributeSpec());
  }

  public function getAsyncUNTYPED(): ?Node {
    return $this->_async;
  }

  public function withAsync(?AsyncToken $value): this {
    if ($value === $this->_async) {
      return $this;
    }
    return new static(
      $this->_attribute_spec,
      $value,
      $this->_signature,
      $this->_arrow,
      $this->_body,
    );
  }

  public function hasAsync(): bool {
    return $this->_async !== null;
  }

  /**
   * @return null | AsyncToken
   */
  public function getAsync(): ?AsyncToken {
    return $this->_async;
  }

  /**
   * @return AsyncToken
   */
  public function getAsyncx(): AsyncToken {
    return TypeAssert\not_null($this->getAsync());
  }

  public function getSignatureUNTYPED(): ?Node {
    return $this->_signature;
  }

  public function withSignature(Node $value): this {
    if ($value === $this->_signature) {
      return $this;
    }
    return new static(
      $this->_attribute_spec,
      $this->_async,
      $value,
      $this->_arrow,
      $this->_body,
    );
  }

  public function hasSignature(): bool {
    return true;
  }

  /**
   * @return LambdaSignature | VariableToken
   */
  public function getSignature(): Node {
    return $this->_signature;
  }

  /**
   * @return LambdaSignature | VariableToken
   */
  public function getSignaturex(): Node {
    return $this->getSignature();
  }

  public function getArrowUNTYPED(): ?Node {
    return $this->_arrow;
  }

  public function withArrow(EqualEqualGreaterThanToken $value): this {
    if ($value === $this->_arrow) {
      return $this;
    }
    return new static(
      $this->_attribute_spec,
      $this->_async,
      $this->_signature,
      $value,
      $this->_body,
    );
  }

  public function hasArrow(): bool {
    return true;
  }

  /**
   * @return EqualEqualGreaterThanToken
   */
  public function getArrow(): EqualEqualGreaterThanToken {
    return
      TypeAssert\instance_of(EqualEqualGreaterThanToken::class, $this->_arrow);
  }

  /**
   * @return EqualEqualGreaterThanToken
   */
  public function getArrowx(): EqualEqualGreaterThanToken {
    return $this->getArrow();
  }

  public function getBodyUNTYPED(): ?Node {
    return $this->_body;
  }

  public function withBody(ILambdaBody $value): this {
    if ($value === $this->_body) {
      return $this;
    }
    return new static(
      $this->_attribute_spec,
      $this->_async,
      $this->_signature,
      $this->_arrow,
      $value,
    );
  }

  public function hasBody(): bool {
    return true;
  }

  /**
   * @return AnonymousFunction | AsExpression | BinaryExpression |
   * CastExpression | CollectionLiteralExpression | CompoundStatement |
   * ConditionalExpression | DictionaryIntrinsicExpression |
   * FunctionCallExpression | IsExpression | KeysetIntrinsicExpression |
   * LambdaExpression | LiteralExpression | MemberSelectionExpression |
   * NullableAsExpression | ObjectCreationExpression | ParenthesizedExpression
   * | PostfixUnaryExpression | PrefixUnaryExpression | QualifiedName |
   * ScopeResolutionExpression | ShapeExpression | SubscriptExpression |
   * NameToken | VariableExpression | VarrayIntrinsicExpression |
   * VectorIntrinsicExpression
   */
  public function getBody(): ILambdaBody {
    return TypeAssert\instance_of(ILambdaBody::class, $this->_body);
  }

  /**
   * @return AnonymousFunction | AsExpression | BinaryExpression |
   * CastExpression | CollectionLiteralExpression | CompoundStatement |
   * ConditionalExpression | DictionaryIntrinsicExpression |
   * FunctionCallExpression | IsExpression | KeysetIntrinsicExpression |
   * LambdaExpression | LiteralExpression | MemberSelectionExpression |
   * NullableAsExpression | ObjectCreationExpression | ParenthesizedExpression
   * | PostfixUnaryExpression | PrefixUnaryExpression | QualifiedName |
   * ScopeResolutionExpression | ShapeExpression | SubscriptExpression |
   * NameToken | VariableExpression | VarrayIntrinsicExpression |
   * VectorIntrinsicExpression
   */
  public function getBodyx(): ILambdaBody {
    return $this->getBody();
  }
}
