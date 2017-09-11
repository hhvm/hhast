<?hh
/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<c368e833a4c72cdc03e2e2b1a59e3d92>>
 */
namespace Facebook\HHAST;
use type Facebook\TypeAssert\TypeAssert;

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

  public static function from_json(
    array<string, mixed> $json,
    int $position,
    string $source,
  ): this {
    $async = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['awaitable_async'],
      $position,
      $source,
    );
    $position += $async->width();
    $coroutine = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['awaitable_coroutine'],
      $position,
      $source,
    );
    $position += $coroutine->width();
    $compound_statement = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['awaitable_compound_statement'],
      $position,
      $source,
    );
    $position += $compound_statement->width();
    return new self($async, $coroutine, $compound_statement);
  }

  public function children(): KeyedTraversable<string, EditableSyntax> {
    yield 'async' => $this->_async;
    yield 'coroutine' => $this->_coroutine;
    yield 'compound_statement' => $this->_compound_statement;
  }

  public function rewrite_children(
    self::TRewriter $rewriter,
    ?Traversable<EditableSyntax> $parents = null,
  ): this {
    $parents = $parents === null ? vec[] : vec($parents);
    $parents[] = $this;
    $async = $this->_async->rewrite($rewriter, $parents);
    $coroutine = $this->_coroutine->rewrite($rewriter, $parents);
    $compound_statement = $this->_compound_statement->rewrite($rewriter, $parents);
    if (
      $async === $this->_async &&
      $coroutine === $this->_coroutine &&
      $compound_statement === $this->_compound_statement
    ) {
      return $this;
    }
    return new self($async, $coroutine, $compound_statement);
  }

  public function async(): AsyncToken {
    return $this->asyncx();
  }

  public function asyncx(): AsyncToken {
    return TypeAssert::isInstanceOf(AsyncToken::class, $this->_async);
  }

  public function raw_async(): EditableSyntax {
    return $this->_async;
  }

  public function with_async(EditableSyntax $value): this {
    if ($value === $this->_async) {
      return $this;
    }
    return new self($value, $this->_coroutine, $this->_compound_statement);
  }

  public function coroutine(): EditableSyntax {
    return $this->coroutinex();
  }

  public function coroutinex(): EditableSyntax {
    return TypeAssert::isInstanceOf(EditableSyntax::class, $this->_coroutine);
  }

  public function raw_coroutine(): EditableSyntax {
    return $this->_coroutine;
  }

  public function with_coroutine(EditableSyntax $value): this {
    if ($value === $this->_coroutine) {
      return $this;
    }
    return new self($this->_async, $value, $this->_compound_statement);
  }

  public function compound_statement(): CompoundStatement {
    return $this->compound_statementx();
  }

  public function compound_statementx(): CompoundStatement {
    return TypeAssert::isInstanceOf(CompoundStatement::class, $this->_compound_statement);
  }

  public function raw_compound_statement(): EditableSyntax {
    return $this->_compound_statement;
  }

  public function with_compound_statement(EditableSyntax $value): this {
    if ($value === $this->_compound_statement) {
      return $this;
    }
    return new self($this->_async, $this->_coroutine, $value);
  }
}
