<?hh // strict
/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<720ca3675df4f326d97be936c4854d9b>>
 */
namespace Facebook\HHAST;
use namespace Facebook\TypeAssert;

<<__ConsistentConstruct>>
final class AwaitableCreationExpression extends EditableNode {

  private EditableNode $_async;
  private EditableNode $_coroutine;
  private EditableNode $_compound_statement;

  public function __construct(
    EditableNode $async,
    EditableNode $coroutine,
    EditableNode $compound_statement,
  ) {
    parent::__construct('awaitable_creation_expression');
    $this->_async = $async;
    $this->_coroutine = $coroutine;
    $this->_compound_statement = $compound_statement;
  }

  <<__Override>>
  public static function fromJSON(
    dict<string, mixed> $json,
    string $file,
    int $offset,
    string $source,
  ): this {
    $async = EditableNode::fromJSON(
      /* UNSAFE_EXPR */ $json['awaitable_async'],
      $file,
      $offset,
      $source,
    );
    $offset += $async->getWidth();
    $coroutine = EditableNode::fromJSON(
      /* UNSAFE_EXPR */ $json['awaitable_coroutine'],
      $file,
      $offset,
      $source,
    );
    $offset += $coroutine->getWidth();
    $compound_statement = EditableNode::fromJSON(
      /* UNSAFE_EXPR */ $json['awaitable_compound_statement'],
      $file,
      $offset,
      $source,
    );
    $offset += $compound_statement->getWidth();
    return new static($async, $coroutine, $compound_statement);
  }

  <<__Override>>
  public function getChildren(): dict<string, EditableNode> {
    return dict[
      'async' => $this->_async,
      'coroutine' => $this->_coroutine,
      'compound_statement' => $this->_compound_statement,
    ];
  }

  <<__Override>>
  public function rewriteDescendants(
    self::TRewriter $rewriter,
    ?vec<EditableNode> $parents = null,
  ): this {
    $parents = $parents === null ? vec[] : vec($parents);
    $parents[] = $this;
    $async = $this->_async->rewrite($rewriter, $parents);
    $coroutine = $this->_coroutine->rewrite($rewriter, $parents);
    $compound_statement =
      $this->_compound_statement->rewrite($rewriter, $parents);
    if (
      $async === $this->_async &&
      $coroutine === $this->_coroutine &&
      $compound_statement === $this->_compound_statement
    ) {
      return $this;
    }
    return new static($async, $coroutine, $compound_statement);
  }

  public function getAsyncUNTYPED(): EditableNode {
    return $this->_async;
  }

  public function withAsync(EditableNode $value): this {
    if ($value === $this->_async) {
      return $this;
    }
    return new static($value, $this->_coroutine, $this->_compound_statement);
  }

  public function hasAsync(): bool {
    return !$this->_async->isMissing();
  }

  /**
   * @returns AsyncToken
   */
  public function getAsync(): AsyncToken {
    return TypeAssert\instance_of(AsyncToken::class, $this->_async);
  }

  public function getCoroutineUNTYPED(): EditableNode {
    return $this->_coroutine;
  }

  public function withCoroutine(EditableNode $value): this {
    if ($value === $this->_coroutine) {
      return $this;
    }
    return new static($this->_async, $value, $this->_compound_statement);
  }

  public function hasCoroutine(): bool {
    return !$this->_coroutine->isMissing();
  }

  /**
   * @returns Missing
   */
  public function getCoroutine(): EditableNode {
    return TypeAssert\instance_of(EditableNode::class, $this->_coroutine);
  }

  public function getCompoundStatementUNTYPED(): EditableNode {
    return $this->_compound_statement;
  }

  public function withCompoundStatement(EditableNode $value): this {
    if ($value === $this->_compound_statement) {
      return $this;
    }
    return new static($this->_async, $this->_coroutine, $value);
  }

  public function hasCompoundStatement(): bool {
    return !$this->_compound_statement->isMissing();
  }

  /**
   * @returns CompoundStatement
   */
  public function getCompoundStatement(): CompoundStatement {
    return TypeAssert\instance_of(
      CompoundStatement::class,
      $this->_compound_statement,
    );
  }
}
