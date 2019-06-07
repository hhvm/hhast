/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<878bf8d7184554d6ad473da32bb0ee0e>>
 */
namespace Facebook\HHAST;
use namespace Facebook\TypeAssert;

<<__ConsistentConstruct>>
abstract class AwaitableCreationExpressionGeneratedBase
  extends Node
  implements IHasFunctionBody, ILambdaBody, IHasAttributeSpec, IExpression {

  const string SYNTAX_KIND = 'awaitable_creation_expression';

  private Node $_attribute_spec;
  private Node $_async;
  private Node $_coroutine;
  private Node $_compound_statement;

  public function __construct(
    Node $attribute_spec,
    Node $async,
    Node $coroutine,
    Node $compound_statement,
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
      /* HH_FIXME[4110] */ $json['awaitable_attribute_spec'],
      $file,
      $offset,
      $source,
      'AttributeSpecification',
    );
    $offset += $attribute_spec->getWidth();
    $async = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['awaitable_async'],
      $file,
      $offset,
      $source,
      'AsyncToken',
    );
    $offset += $async->getWidth();
    $coroutine = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['awaitable_coroutine'],
      $file,
      $offset,
      $source,
      'Node',
    );
    $offset += $coroutine->getWidth();
    $compound_statement = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['awaitable_compound_statement'],
      $file,
      $offset,
      $source,
      'CompoundStatement',
    );
    $offset += $compound_statement->getWidth();
    $source_ref = shape(
      'file' => $file,
      'source' => $source,
      'offset' => $initial_offset,
      'width' => $offset - $initial_offset,
    );
    return new static(
      $attribute_spec,
      $async,
      $coroutine,
      $compound_statement,
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
    ];
  }

  <<__Override>>
  public function rewriteChildren(
    self::TRewriter $rewriter,
    vec<Node> $parents = vec[],
  ): this {
    $parents[] = $this;
    $attribute_spec = $rewriter($this->_attribute_spec, $parents);
    $async = $rewriter($this->_async, $parents);
    $coroutine = $rewriter($this->_coroutine, $parents);
    $compound_statement = $rewriter($this->_compound_statement, $parents);
    if (
      $attribute_spec === $this->_attribute_spec &&
      $async === $this->_async &&
      $coroutine === $this->_coroutine &&
      $compound_statement === $this->_compound_statement
    ) {
      return $this;
    }
    return new static($attribute_spec, $async, $coroutine, $compound_statement);
  }

  public function getAttributeSpecUNTYPED(): Node {
    return $this->_attribute_spec;
  }

  public function withAttributeSpec(Node $value): this {
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
    return !$this->_attribute_spec->isMissing();
  }

  /**
   * @return AttributeSpecification | null
   */
  public function getAttributeSpec(): ?AttributeSpecification {
    if ($this->_attribute_spec->isMissing()) {
      return null;
    }
    return TypeAssert\instance_of(
      AttributeSpecification::class,
      $this->_attribute_spec,
    );
  }

  /**
   * @return AttributeSpecification
   */
  public function getAttributeSpecx(): AttributeSpecification {
    return TypeAssert\not_null($this->getAttributeSpec());
  }

  public function getAsyncUNTYPED(): Node {
    return $this->_async;
  }

  public function withAsync(Node $value): this {
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
    return !$this->_async->isMissing();
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

  public function getCoroutineUNTYPED(): Node {
    return $this->_coroutine;
  }

  public function withCoroutine(Node $value): this {
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
    return !$this->_coroutine->isMissing();
  }

  /**
   * @return null
   */
  public function getCoroutine(): ?Node {
    if ($this->_coroutine->isMissing()) {
      return null;
    }
    return $this->_coroutine;
  }

  /**
   * @return
   */
  public function getCoroutinex(): Node {
    return TypeAssert\not_null($this->getCoroutine());
  }

  public function getCompoundStatementUNTYPED(): Node {
    return $this->_compound_statement;
  }

  public function withCompoundStatement(Node $value): this {
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
    return !$this->_compound_statement->isMissing();
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
