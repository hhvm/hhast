/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<5358a9029d9a329f0606337a541bbd11>>
 */
namespace Facebook\HHAST;
use namespace Facebook\TypeAssert;

<<__ConsistentConstruct>>
final class CompoundStatement extends Node implements ILambdaBody, IStatement {

  const string SYNTAX_KIND = 'compound_statement';

  private Node $_left_brace;
  private Node $_statements;
  private Node $_right_brace;

  public function __construct(
    Node $left_brace,
    Node $statements,
    Node $right_brace,
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
    $offset += $left_brace->getWidth();
    $statements = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['compound_statements'],
      $file,
      $offset,
      $source,
      'NodeList<IStatement>',
    );
    $offset += $statements->getWidth();
    $right_brace = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['compound_right_brace'],
      $file,
      $offset,
      $source,
      'RightBraceToken',
    );
    $offset += $right_brace->getWidth();
    $source_ref = shape(
      'file' => $file,
      'source' => $source,
      'offset' => $initial_offset,
      'width' => $offset - $initial_offset,
    );
    return new static($left_brace, $statements, $right_brace, $source_ref);
  }

  <<__Override>>
  public function getChildren(): dict<string, Node> {
    return dict[
      'left_brace' => $this->_left_brace,
      'statements' => $this->_statements,
      'right_brace' => $this->_right_brace,
    ];
  }

  <<__Override>>
  public function rewriteChildren(
    self::TRewriter $rewriter,
    vec<Node> $parents = vec[],
  ): this {
    $parents[] = $this;
    $left_brace = $rewriter($this->_left_brace, $parents);
    $statements = $rewriter($this->_statements, $parents);
    $right_brace = $rewriter($this->_right_brace, $parents);
    if (
      $left_brace === $this->_left_brace &&
      $statements === $this->_statements &&
      $right_brace === $this->_right_brace
    ) {
      return $this;
    }
    return new static($left_brace, $statements, $right_brace);
  }

  public function getLeftBraceUNTYPED(): Node {
    return $this->_left_brace;
  }

  public function withLeftBrace(LeftBraceToken $value): this {
    if ($value === $this->_left_brace) {
      return $this;
    }
    return new static(
      $value ?? Missing(),
      $this->_statements,
      $this->_right_brace,
    );
  }

  public function hasLeftBrace(): bool {
    return !$this->_left_brace->isMissing();
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

  public function getStatementsUNTYPED(): Node {
    return $this->_statements;
  }

  public function withStatements(?NodeList<IStatement> $value): this {
    if ($value === $this->_statements) {
      return $this;
    }
    return new static(
      $this->_left_brace,
      $value ?? Missing(),
      $this->_right_brace,
    );
  }

  public function hasStatements(): bool {
    return !$this->_statements->isMissing();
  }

  /**
   * @return NodeList<IStatement> | NodeList<BreakStatement> |
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
    if ($this->_statements->isMissing()) {
      return null;
    }
    return TypeAssert\instance_of(NodeList::class, $this->_statements);
  }

  /**
   * @return NodeList<IStatement> | NodeList<BreakStatement> |
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

  public function getRightBraceUNTYPED(): Node {
    return $this->_right_brace;
  }

  public function withRightBrace(RightBraceToken $value): this {
    if ($value === $this->_right_brace) {
      return $this;
    }
    return new static(
      $this->_left_brace,
      $this->_statements,
      $value ?? Missing(),
    );
  }

  public function hasRightBrace(): bool {
    return !$this->_right_brace->isMissing();
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
