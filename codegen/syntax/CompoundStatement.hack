/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<1276ef92eb3c308d6ecb7668f269f61f>>
 */
namespace Facebook\HHAST;
use namespace Facebook\TypeAssert;
use namespace HH\Lib\Dict;

<<__ConsistentConstruct>>
final class CompoundStatement extends Node implements ILambdaBody, IStatement {

  const string SYNTAX_KIND = 'compound_statement';

  private LeftBraceToken $_left_brace;
  private ?NodeList<IStatement> $_statements;
  private RightBraceToken $_right_brace;

  public function __construct(
    LeftBraceToken $left_brace,
    ?NodeList<IStatement> $statements,
    RightBraceToken $right_brace,
    ?__Private\SourceRef $source_ref = null,
  ) {
    $this->_left_brace = $left_brace;
    $this->_statements = $statements;
    $this->_right_brace = $right_brace;
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
    $left_brace = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['compound_left_brace'],
      $file,
      $offset,
      $source,
      'LeftBraceToken',
    );
    $left_brace = $left_brace as nonnull;
    $offset += $left_brace->getWidth();
    $statements = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['compound_statements'] ?? dict['kind' => 'missing'],
      $file,
      $offset,
      $source,
      'NodeList<IStatement>',
    );
    $offset += $statements?->getWidth() ?? 0;
    $right_brace = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['compound_right_brace'],
      $file,
      $offset,
      $source,
      'RightBraceToken',
    );
    $right_brace = $right_brace as nonnull;
    $offset += $right_brace->getWidth();
    $source_ref = shape(
      'file' => $file,
      'source' => $source,
      'offset' => $initial_offset,
      'width' => $offset - $initial_offset,
    );
    return new static(
      /* HH_IGNORE_ERROR[4110] */ $left_brace,
      /* HH_IGNORE_ERROR[4110] */ $statements,
      /* HH_IGNORE_ERROR[4110] */ $right_brace,
      $source_ref,
    );
  }

  <<__Override>>
  public function getChildren(): dict<string, Node> {
    return dict[
      'left_brace' => $this->_left_brace,
      'statements' => $this->_statements,
      'right_brace' => $this->_right_brace,
    ]
      |> Dict\filter_nulls($$);
  }

  <<__Override>>
  public function rewriteChildren<Tret as ?Node>(
    (function(Node, vec<Node>): Tret) $rewriter,
    vec<Node> $parents = vec[],
  ): this {
    $parents[] = $this;
    $left_brace = $rewriter($this->_left_brace, $parents);
    $statements = $this->_statements === null
      ? null
      : $rewriter($this->_statements, $parents);
    $right_brace = $rewriter($this->_right_brace, $parents);
    if (
      $left_brace === $this->_left_brace &&
      $statements === $this->_statements &&
      $right_brace === $this->_right_brace
    ) {
      return $this;
    }
    return new static(
      /* HH_FIXME[4110] use `as` */ $left_brace,
      /* HH_FIXME[4110] use `as` */ $statements,
      /* HH_FIXME[4110] use `as` */ $right_brace,
    );
  }

  public function getLeftBraceUNTYPED(): ?Node {
    return $this->_left_brace;
  }

  public function withLeftBrace(LeftBraceToken $value): this {
    if ($value === $this->_left_brace) {
      return $this;
    }
    return new static($value, $this->_statements, $this->_right_brace);
  }

  public function hasLeftBrace(): bool {
    return $this->_left_brace !== null;
  }

  /**
   * @return LeftBraceToken
   */
  public function getLeftBrace(): LeftBraceToken {
    return TypeAssert\instance_of(LeftBraceToken::class, $this->_left_brace);
  }

  /**
   * @return LeftBraceToken
   */
  public function getLeftBracex(): LeftBraceToken {
    return $this->getLeftBrace();
  }

  public function getStatementsUNTYPED(): ?Node {
    return $this->_statements;
  }

  public function withStatements(?NodeList<IStatement> $value): this {
    if ($value === $this->_statements) {
      return $this;
    }
    return new static($this->_left_brace, $value, $this->_right_brace);
  }

  public function hasStatements(): bool {
    return $this->_statements !== null;
  }

  /**
   * @return NodeList<BreakStatement> | NodeList<IStatement> |
   * NodeList<CompoundStatement> | NodeList<ConcurrentStatement> |
   * NodeList<ContinueStatement> | NodeList<DoStatement> |
   * NodeList<ILoopStatement> | NodeList<EchoStatement> |
   * NodeList<ExpressionStatement> | NodeList<ForStatement> |
   * NodeList<IControlFlowStatement> | NodeList<ForeachStatement> |
   * NodeList<GotoLabel> | NodeList<GotoStatement> | NodeList<IfStatement> |
   * NodeList<ReturnStatement> | NodeList<SwitchStatement> |
   * NodeList<ThrowStatement> | NodeList<TryStatement> |
   * NodeList<UnsetStatement> | NodeList<UsingStatementBlockScoped> |
   * NodeList<UsingStatementFunctionScoped> | NodeList<WhileStatement> | null
   */
  public function getStatements(): ?NodeList<IStatement> {
    return $this->_statements;
  }

  /**
   * @return NodeList<BreakStatement> | NodeList<IStatement> |
   * NodeList<CompoundStatement> | NodeList<ConcurrentStatement> |
   * NodeList<ContinueStatement> | NodeList<DoStatement> |
   * NodeList<ILoopStatement> | NodeList<EchoStatement> |
   * NodeList<ExpressionStatement> | NodeList<ForStatement> |
   * NodeList<IControlFlowStatement> | NodeList<ForeachStatement> |
   * NodeList<GotoLabel> | NodeList<GotoStatement> | NodeList<IfStatement> |
   * NodeList<ReturnStatement> | NodeList<SwitchStatement> |
   * NodeList<ThrowStatement> | NodeList<TryStatement> |
   * NodeList<UnsetStatement> | NodeList<UsingStatementBlockScoped> |
   * NodeList<UsingStatementFunctionScoped> | NodeList<WhileStatement>
   */
  public function getStatementsx(): NodeList<IStatement> {
    return TypeAssert\not_null($this->getStatements());
  }

  public function getRightBraceUNTYPED(): ?Node {
    return $this->_right_brace;
  }

  public function withRightBrace(RightBraceToken $value): this {
    if ($value === $this->_right_brace) {
      return $this;
    }
    return new static($this->_left_brace, $this->_statements, $value);
  }

  public function hasRightBrace(): bool {
    return $this->_right_brace !== null;
  }

  /**
   * @return RightBraceToken
   */
  public function getRightBrace(): RightBraceToken {
    return TypeAssert\instance_of(RightBraceToken::class, $this->_right_brace);
  }

  /**
   * @return RightBraceToken
   */
  public function getRightBracex(): RightBraceToken {
    return $this->getRightBrace();
  }
}
