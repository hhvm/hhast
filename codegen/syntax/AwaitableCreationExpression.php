<?hh
/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<73be4fc8e51b8d63fde32b464f0fdeba>>
 */
namespace Facebook\HHAST;
use namespace Facebook\TypeAssert;

final class AwaitableCreationExpression extends EditableSyntax {

  private EditableSyntax $_async;
  private EditableSyntax $_coroutine;
  private EditableSyntax $_compound_statement;

  public function __construct(
    EditableSyntax $async,
    EditableSyntax $coroutine,
    EditableSyntax $compound_statement,
  ) {
    parent::__construct('awaitable_creation_expression');
    $this->_async = $async;
    $this->_coroutine = $coroutine;
    $this->_compound_statement = $compound_statement;
  }

  <<__Override>>
  public static function fromJSON(
    dict<string, mixed> $json,
    int $position,
    string $source,
  ): this {
    $async = EditableSyntax::fromJSON(
      /* UNSAFE_EXPR */ $json['awaitable_async'],
      $position,
      $source,
    );
    $position += $async->getWidth();
    $coroutine = EditableSyntax::fromJSON(
      /* UNSAFE_EXPR */ $json['awaitable_coroutine'],
      $position,
      $source,
    );
    $position += $coroutine->getWidth();
    $compound_statement = EditableSyntax::fromJSON(
      /* UNSAFE_EXPR */ $json['awaitable_compound_statement'],
      $position,
      $source,
    );
    $position += $compound_statement->getWidth();
    return new self($async, $coroutine, $compound_statement);
  }

  <<__Override>>
  public function getChildren(): KeyedTraversable<string, EditableSyntax> {
    yield 'async' => $this->_async;
    yield 'coroutine' => $this->_coroutine;
    yield 'compound_statement' => $this->_compound_statement;
  }

  <<__Override>>
  public function rewriteDescendants(
    self::TRewriter $rewriter,
    ?Traversable<EditableSyntax> $parents = null,
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
    return new self($async, $coroutine, $compound_statement);
  }

  public function getAsyncUNTYPED(): EditableSyntax {
    return $this->_async;
  }

  public function withAsync(EditableSyntax $value): this {
    if ($value === $this->_async) {
      return $this;
    }
    return new self($value, $this->_coroutine, $this->_compound_statement);
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

  public function getCoroutineUNTYPED(): EditableSyntax {
    return $this->_coroutine;
  }

  public function withCoroutine(EditableSyntax $value): this {
    if ($value === $this->_coroutine) {
      return $this;
    }
    return new self($this->_async, $value, $this->_compound_statement);
  }

  public function hasCoroutine(): bool {
    return !$this->_coroutine->isMissing();
  }

  /**
   * @returns Missing
   */
  public function getCoroutine(): EditableSyntax {
    return TypeAssert\instance_of(EditableSyntax::class, $this->_coroutine);
  }

  public function getCompoundStatementUNTYPED(): EditableSyntax {
    return $this->_compound_statement;
  }

  public function withCompoundStatement(EditableSyntax $value): this {
    if ($value === $this->_compound_statement) {
      return $this;
    }
    return new self($this->_async, $this->_coroutine, $value);
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
