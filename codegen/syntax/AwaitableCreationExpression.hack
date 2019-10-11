/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<8c86391b9c2903a287e9df3a30a1ee91>>
 */
namespace Facebook\HHAST;
use namespace Facebook\TypeAssert;
use namespace HH\Lib\Dict;

<<__ConsistentConstruct>>
abstract class AwaitableCreationExpressionGeneratedBase
  extends Node
  implements IHasFunctionBody, ILambdaBody, IHasAttributeSpec, IExpression {

  const string SYNTAX_KIND = 'awaitable_creation_expression';

  private ?OldAttributeSpecification $_attribute_spec;
  private AsyncToken $_async;
  private ?Node $_coroutine;
  private CompoundStatement $_compound_statement;

  public function __construct(
    ?OldAttributeSpecification $attribute_spec,
    AsyncToken $async,
    ?Node $coroutine,
    CompoundStatement $compound_statement,
    ?__Private\SourceRef $source_ref = null,
  ) {
    $this->_attribute_spec = $attribute_spec;
    $this->_async = $async;
    $this->_coroutine = $coroutine;
    $this->_compound_statement = $compound_statement;
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
    $attribute_spec = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['awaitable_attribute_spec'] ??
        dict['kind' => 'missing'],
      $file,
      $offset,
      $source,
      'OldAttributeSpecification',
    );
    $offset += $attribute_spec?->getWidth() ?? 0;
    $async = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['awaitable_async'],
      $file,
      $offset,
      $source,
      'AsyncToken',
    );
    $async = $async as nonnull;
    $offset += $async->getWidth();
    $coroutine = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['awaitable_coroutine'] ??
        dict['kind' => 'missing'],
      $file,
      $offset,
      $source,
      'Node',
    );
    $offset += $coroutine?->getWidth() ?? 0;
    $compound_statement = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['awaitable_compound_statement'],
      $file,
      $offset,
      $source,
      'CompoundStatement',
    );
    $compound_statement = $compound_statement as nonnull;
    $offset += $compound_statement->getWidth();
    $source_ref = shape(
      'file' => $file,
      'source' => $source,
      'offset' => $initial_offset,
      'width' => $offset - $initial_offset,
    );
    return new static(
      /* HH_IGNORE_ERROR[4110] */ $attribute_spec,
      /* HH_IGNORE_ERROR[4110] */ $async,
      /* HH_IGNORE_ERROR[4110] */ $coroutine,
      /* HH_IGNORE_ERROR[4110] */ $compound_statement,
      $source_ref,
    );
  }

  <<__Override>>
  public function getChildren(): dict<string, Node> {
    return dict[
      'attribute_spec' => $this->_attribute_spec,
      'async' => $this->_async,
      'coroutine' => $this->_coroutine,
      'compound_statement' => $this->_compound_statement,
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
    $async = $rewriter($this->_async, $parents);
    $coroutine = $this->_coroutine === null
      ? null
      : $rewriter($this->_coroutine, $parents);
    $compound_statement = $rewriter($this->_compound_statement, $parents);
    if (
      $attribute_spec === $this->_attribute_spec &&
      $async === $this->_async &&
      $coroutine === $this->_coroutine &&
      $compound_statement === $this->_compound_statement
    ) {
      return $this;
    }
    return new static(
      /* HH_FIXME[4110] use `as` */ $attribute_spec,
      /* HH_FIXME[4110] use `as` */ $async,
      /* HH_FIXME[4110] use `as` */ $coroutine,
      /* HH_FIXME[4110] use `as` */ $compound_statement,
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
      $this->_coroutine,
      $this->_compound_statement,
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

  public function withAsync(AsyncToken $value): this {
    if ($value === $this->_async) {
      return $this;
    }
    return new static(
      $this->_attribute_spec,
      $value,
      $this->_coroutine,
      $this->_compound_statement,
    );
  }

  public function hasAsync(): bool {
    return $this->_async !== null;
  }

  /**
   * @return AsyncToken
   */
  public function getAsync(): AsyncToken {
    return TypeAssert\instance_of(AsyncToken::class, $this->_async);
  }

  /**
   * @return AsyncToken
   */
  public function getAsyncx(): AsyncToken {
    return $this->getAsync();
  }

  public function getCoroutineUNTYPED(): ?Node {
    return $this->_coroutine;
  }

  public function withCoroutine(?Node $value): this {
    if ($value === $this->_coroutine) {
      return $this;
    }
    return new static(
      $this->_attribute_spec,
      $this->_async,
      $value,
      $this->_compound_statement,
    );
  }

  public function hasCoroutine(): bool {
    return $this->_coroutine !== null;
  }

  /**
   * @return null
   */
  public function getCoroutine(): ?Node {
    return $this->_coroutine;
  }

  /**
   * @return
   */
  public function getCoroutinex(): Node {
    return TypeAssert\not_null($this->getCoroutine());
  }

  public function getCompoundStatementUNTYPED(): ?Node {
    return $this->_compound_statement;
  }

  public function withCompoundStatement(CompoundStatement $value): this {
    if ($value === $this->_compound_statement) {
      return $this;
    }
    return new static(
      $this->_attribute_spec,
      $this->_async,
      $this->_coroutine,
      $value,
    );
  }

  public function hasCompoundStatement(): bool {
    return $this->_compound_statement !== null;
  }

  /**
   * @return CompoundStatement
   */
  public function getCompoundStatement(): CompoundStatement {
    return TypeAssert\instance_of(
      CompoundStatement::class,
      $this->_compound_statement,
    );
  }

  /**
   * @return CompoundStatement
   */
  public function getCompoundStatementx(): CompoundStatement {
    return $this->getCompoundStatement();
  }
}
