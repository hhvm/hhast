/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<25b2929eeb3bf33f72b55df096e9d8ae>>
 */
namespace Facebook\HHAST;
use namespace Facebook\TypeAssert;

<<__ConsistentConstruct>>
final class SwitchSection extends EditableNode {

  private EditableNode $_labels;
  private EditableNode $_statements;
  private EditableNode $_fallthrough;

  public function __construct(
    EditableNode $labels,
    EditableNode $statements,
    EditableNode $fallthrough,
    ?__Private\SourceRef $source_ref = null,
  ) {
    $this->_labels = $labels;
    $this->_statements = $statements;
    $this->_fallthrough = $fallthrough;
    parent::__construct('switch_section', $source_ref);
  }

  <<__Override>>
  public static function fromJSON(
    dict<string, mixed> $json,
    string $file,
    int $initial_offset,
    string $source,
  ): this {
    $offset = $initial_offset;
    $labels = EditableNode::fromJSON(
      /* UNSAFE_EXPR */ $json['switch_section_labels'],
      $file,
      $offset,
      $source,
    );
    $offset += $labels->getWidth();
    $statements = EditableNode::fromJSON(
      /* UNSAFE_EXPR */ $json['switch_section_statements'],
      $file,
      $offset,
      $source,
    );
    $offset += $statements->getWidth();
    $fallthrough = EditableNode::fromJSON(
      /* UNSAFE_EXPR */ $json['switch_section_fallthrough'],
      $file,
      $offset,
      $source,
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
  public function getChildren(): dict<string, EditableNode> {
    return dict[
      'labels' => $this->_labels,
      'statements' => $this->_statements,
      'fallthrough' => $this->_fallthrough,
    ];
  }

  <<__Override>>
  public function rewriteChildren(
    self::TRewriter $rewriter,
    vec<EditableNode> $parents = vec[],
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

  public function getLabelsUNTYPED(): EditableNode {
    return $this->_labels;
  }

  public function withLabels(EditableNode $value): this {
    if ($value === $this->_labels) {
      return $this;
    }
    return new static($value, $this->_statements, $this->_fallthrough);
  }

  public function hasLabels(): bool {
    return !$this->_labels->isMissing();
  }

  /**
   * @return EditableList<EditableNode>
   */
  public function getLabels(): EditableList<EditableNode> {
    return TypeAssert\instance_of(EditableList::class, $this->_labels);
  }

  /**
   * @return EditableList<EditableNode>
   */
  public function getLabelsx(): EditableList<EditableNode> {
    return $this->getLabels();
  }

  public function getStatementsUNTYPED(): EditableNode {
    return $this->_statements;
  }

  public function withStatements(EditableNode $value): this {
    if ($value === $this->_statements) {
      return $this;
    }
    return new static($this->_labels, $value, $this->_fallthrough);
  }

  public function hasStatements(): bool {
    return !$this->_statements->isMissing();
  }

  /**
   * @return EditableList<EditableNode> | null
   */
  public function getStatements(): ?EditableList<EditableNode> {
    if ($this->_statements->isMissing()) {
      return null;
    }
    return TypeAssert\instance_of(EditableList::class, $this->_statements);
  }

  /**
   * @return EditableList<EditableNode>
   */
  public function getStatementsx(): EditableList<EditableNode> {
    return TypeAssert\instance_of(EditableList::class, $this->_statements);
  }

  public function getFallthroughUNTYPED(): EditableNode {
    return $this->_fallthrough;
  }

  public function withFallthrough(EditableNode $value): this {
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
    return TypeAssert\instance_of(
      SwitchFallthrough::class,
      $this->_fallthrough,
    );
  }
}
