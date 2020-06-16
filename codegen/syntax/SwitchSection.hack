/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<5332b1a0ec124e2084c8c4f28f86d3e4>>
 */
namespace Facebook\HHAST;
use namespace Facebook\TypeAssert;
use namespace HH\Lib\Dict;

<<__ConsistentConstruct>>
final class SwitchSection extends Node {

  const string SYNTAX_KIND = 'switch_section';

  private NodeList<ISwitchLabel> $_labels;
  private ?NodeList<IStatement> $_statements;
  private ?SwitchFallthrough $_fallthrough;

  public function __construct(
    NodeList<ISwitchLabel> $labels,
    ?NodeList<IStatement> $statements,
    ?SwitchFallthrough $fallthrough,
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
    $labels = $labels as nonnull;
    $offset += $labels->getWidth();
    $statements = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['switch_section_statements'] ?? dict['kind' => 'missing'],
      $file,
      $offset,
      $source,
      'NodeList<IStatement>',
    );
    $offset += $statements?->getWidth() ?? 0;
    $fallthrough = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['switch_section_fallthrough'] ?? dict['kind' => 'missing'],
      $file,
      $offset,
      $source,
      'SwitchFallthrough',
    );
    $offset += $fallthrough?->getWidth() ?? 0;
    $source_ref = shape(
      'file' => $file,
      'source' => $source,
      'offset' => $initial_offset,
      'width' => $offset - $initial_offset,
    );
    return new static(
      /* HH_IGNORE_ERROR[4110] */ $labels,
      /* HH_IGNORE_ERROR[4110] */ $statements,
      /* HH_IGNORE_ERROR[4110] */ $fallthrough,
      $source_ref,
    );
  }

  <<__Override>>
  public function getChildren(): dict<string, Node> {
    return dict[
      'labels' => $this->_labels,
      'statements' => $this->_statements,
      'fallthrough' => $this->_fallthrough,
    ]
      |> Dict\filter_nulls($$);
  }

  <<__Override>>
  public function rewriteChildren<Tret as ?Node>(
    (function(Node, vec<Node>): Tret) $rewriter,
    vec<Node> $parents = vec[],
  ): this {
    $parents[] = $this;
    $labels = $rewriter($this->_labels, $parents);
    $statements = $this->_statements === null
      ? null
      : $rewriter($this->_statements, $parents);
    $fallthrough = $this->_fallthrough === null
      ? null
      : $rewriter($this->_fallthrough, $parents);
    if (
      $labels === $this->_labels &&
      $statements === $this->_statements &&
      $fallthrough === $this->_fallthrough
    ) {
      return $this;
    }
    return new static(
      /* HH_FIXME[4110] use `as` */ $labels,
      /* HH_FIXME[4110] use `as` */ $statements,
      /* HH_FIXME[4110] use `as` */ $fallthrough,
    );
  }

  public function getLabelsUNTYPED(): ?Node {
    return $this->_labels;
  }

  public function withLabels(NodeList<ISwitchLabel> $value): this {
    if ($value === $this->_labels) {
      return $this;
    }
    return new static($value, $this->_statements, $this->_fallthrough);
  }

  public function hasLabels(): bool {
    return $this->_labels !== null;
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

  public function getStatementsUNTYPED(): ?Node {
    return $this->_statements;
  }

  public function withStatements(?NodeList<IStatement> $value): this {
    if ($value === $this->_statements) {
      return $this;
    }
    return new static($this->_labels, $value, $this->_fallthrough);
  }

  public function hasStatements(): bool {
    return $this->_statements !== null;
  }

  /**
   * @return NodeList<BreakStatement> | NodeList<IStatement> |
   * NodeList<DoStatement> | NodeList<EchoStatement> |
   * NodeList<ExpressionStatement> | NodeList<ForeachStatement> |
   * NodeList<GotoStatement> | NodeList<IfStatement> |
   * NodeList<ReturnStatement> | NodeList<ThrowStatement> | null
   */
  public function getStatements(): ?NodeList<IStatement> {
    return $this->_statements;
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

  public function getFallthroughUNTYPED(): ?Node {
    return $this->_fallthrough;
  }

  public function withFallthrough(?SwitchFallthrough $value): this {
    if ($value === $this->_fallthrough) {
      return $this;
    }
    return new static($this->_labels, $this->_statements, $value);
  }

  public function hasFallthrough(): bool {
    return $this->_fallthrough !== null;
  }

  /**
   * @return null | SwitchFallthrough
   */
  public function getFallthrough(): ?SwitchFallthrough {
    return $this->_fallthrough;
  }

  /**
   * @return SwitchFallthrough
   */
  public function getFallthroughx(): SwitchFallthrough {
    return TypeAssert\not_null($this->getFallthrough());
  }
}
