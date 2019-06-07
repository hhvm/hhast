/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<6acdfecd5ca5cbc1b73973ff210ae23c>>
 */
namespace Facebook\HHAST;
use namespace Facebook\TypeAssert;

<<__ConsistentConstruct>>
final class SwitchSection extends Node {

  const string SYNTAX_KIND = 'switch_section';

  private Node $_labels;
  private Node $_statements;
  private Node $_fallthrough;

  public function __construct(
    Node $labels,
    Node $statements,
    Node $fallthrough,
    ?__Private\SourceRef $source_ref = null,
  ) {
    $this->_labels = $labels;
    $this->_statements = $statements;
    $this->_fallthrough = $fallthrough;
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
    $labels = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['switch_section_labels'],
      $file,
      $offset,
      $source,
      'NodeList<ISwitchLabel>',
    );
    $offset += $labels->getWidth();
    $statements = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['switch_section_statements'],
      $file,
      $offset,
      $source,
      'NodeList<IStatement>',
    );
    $offset += $statements->getWidth();
    $fallthrough = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['switch_section_fallthrough'],
      $file,
      $offset,
      $source,
      'SwitchFallthrough',
    );
    $offset += $fallthrough->getWidth();
    $source_ref = shape(
      'file' => $file,
      'source' => $source,
      'offset' => $initial_offset,
      'width' => $offset - $initial_offset,
    );
    return new static($labels, $statements, $fallthrough, $source_ref);
  }

  <<__Override>>
  public function getChildren(): dict<string, Node> {
    return dict[
      'labels' => $this->_labels,
      'statements' => $this->_statements,
      'fallthrough' => $this->_fallthrough,
    ];
  }

  <<__Override>>
  public function rewriteChildren(
    self::TRewriter $rewriter,
    vec<Node> $parents = vec[],
  ): this {
    $parents[] = $this;
    $labels = $rewriter($this->_labels, $parents);
    $statements = $rewriter($this->_statements, $parents);
    $fallthrough = $rewriter($this->_fallthrough, $parents);
    if (
      $labels === $this->_labels &&
      $statements === $this->_statements &&
      $fallthrough === $this->_fallthrough
    ) {
      return $this;
    }
    return new static($labels, $statements, $fallthrough);
  }

  public function getLabelsUNTYPED(): Node {
    return $this->_labels;
  }

  public function withLabels(Node $value): this {
    if ($value === $this->_labels) {
      return $this;
    }
    return new static($value, $this->_statements, $this->_fallthrough);
  }

  public function hasLabels(): bool {
    return !$this->_labels->isMissing();
  }

  /**
   * @return NodeList<CaseLabel> | NodeList<ISwitchLabel> |
   * NodeList<DefaultLabel>
   */
  public function getLabels(): NodeList<ISwitchLabel> {
    return TypeAssert\instance_of(NodeList::class, $this->_labels);
  }

  /**
   * @return NodeList<CaseLabel> | NodeList<ISwitchLabel> |
   * NodeList<DefaultLabel>
   */
  public function getLabelsx(): NodeList<ISwitchLabel> {
    return $this->getLabels();
  }

  public function getStatementsUNTYPED(): Node {
    return $this->_statements;
  }

  public function withStatements(Node $value): this {
    if ($value === $this->_statements) {
      return $this;
    }
    return new static($this->_labels, $value, $this->_fallthrough);
  }

  public function hasStatements(): bool {
    return !$this->_statements->isMissing();
  }

  /**
   * @return NodeList<BreakStatement> | NodeList<IStatement> |
   * NodeList<DoStatement> | NodeList<EchoStatement> |
   * NodeList<ExpressionStatement> | NodeList<ForeachStatement> |
   * NodeList<GotoStatement> | NodeList<IfStatement> |
   * NodeList<ReturnStatement> | NodeList<ThrowStatement> | null
   */
  public function getStatements(): ?NodeList<IStatement> {
    if ($this->_statements->isMissing()) {
      return null;
    }
    return TypeAssert\instance_of(NodeList::class, $this->_statements);
  }

  /**
   * @return NodeList<BreakStatement> | NodeList<IStatement> |
   * NodeList<DoStatement> | NodeList<EchoStatement> |
   * NodeList<ExpressionStatement> | NodeList<ForeachStatement> |
   * NodeList<GotoStatement> | NodeList<IfStatement> |
   * NodeList<ReturnStatement> | NodeList<ThrowStatement>
   */
  public function getStatementsx(): NodeList<IStatement> {
    return TypeAssert\not_null($this->getStatements());
  }

  public function getFallthroughUNTYPED(): Node {
    return $this->_fallthrough;
  }

  public function withFallthrough(Node $value): this {
    if ($value === $this->_fallthrough) {
      return $this;
    }
    return new static($this->_labels, $this->_statements, $value);
  }

  public function hasFallthrough(): bool {
    return !$this->_fallthrough->isMissing();
  }

  /**
   * @return null | SwitchFallthrough
   */
  public function getFallthrough(): ?SwitchFallthrough {
    if ($this->_fallthrough->isMissing()) {
      return null;
    }
    return TypeAssert\instance_of(
      SwitchFallthrough::class,
      $this->_fallthrough,
    );
  }

  /**
   * @return SwitchFallthrough
   */
  public function getFallthroughx(): SwitchFallthrough {
    return TypeAssert\not_null($this->getFallthrough());
  }
}
