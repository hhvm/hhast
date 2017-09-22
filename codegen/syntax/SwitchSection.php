<?hh // strict
/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<3046102f1c2b28421e96da892d3a9e81>>
 */
namespace Facebook\HHAST;
use namespace Facebook\TypeAssert;

final class SwitchSection extends EditableNode {

  private EditableNode $_labels;
  private EditableNode $_statements;
  private EditableNode $_fallthrough;

  public function __construct(
    EditableNode $labels,
    EditableNode $statements,
    EditableNode $fallthrough,
  ) {
    parent::__construct('switch_section');
    $this->_labels = $labels;
    $this->_statements = $statements;
    $this->_fallthrough = $fallthrough;
  }

  <<__Override>>
  public static function fromJSON(
    dict<string, mixed> $json,
    int $position,
    string $source,
  ): this {
    $labels = EditableNode::fromJSON(
      /* UNSAFE_EXPR */ $json['switch_section_labels'],
      $position,
      $source,
    );
    $position += $labels->getWidth();
    $statements = EditableNode::fromJSON(
      /* UNSAFE_EXPR */ $json['switch_section_statements'],
      $position,
      $source,
    );
    $position += $statements->getWidth();
    $fallthrough = EditableNode::fromJSON(
      /* UNSAFE_EXPR */ $json['switch_section_fallthrough'],
      $position,
      $source,
    );
    $position += $fallthrough->getWidth();
    return new self($labels, $statements, $fallthrough);
  }

  <<__Override>>
  public function getChildren(): KeyedTraversable<string, EditableNode> {
    return dict[
      'labels' => $this->_labels,
      'statements' => $this->_statements,
      'fallthrough' => $this->_fallthrough,
    ];
  }

  <<__Override>>
  public function rewriteDescendants(
    self::TRewriter $rewriter,
    ?Traversable<EditableNode> $parents = null,
  ): this {
    $parents = $parents === null ? vec[] : vec($parents);
    $parents[] = $this;
    $labels = $this->_labels->rewrite($rewriter, $parents);
    $statements = $this->_statements->rewrite($rewriter, $parents);
    $fallthrough = $this->_fallthrough->rewrite($rewriter, $parents);
    if (
      $labels === $this->_labels &&
      $statements === $this->_statements &&
      $fallthrough === $this->_fallthrough
    ) {
      return $this;
    }
    return new self($labels, $statements, $fallthrough);
  }

  public function getLabelsUNTYPED(): EditableNode {
    return $this->_labels;
  }

  public function withLabels(EditableNode $value): this {
    if ($value === $this->_labels) {
      return $this;
    }
    return new self($value, $this->_statements, $this->_fallthrough);
  }

  public function hasLabels(): bool {
    return !$this->_labels->isMissing();
  }

  /**
   * @returns EditableList | Missing
   */
  public function getLabels(): ?EditableList {
    if ($this->_labels->isMissing()) {
      return null;
    }
    return TypeAssert\instance_of(EditableList::class, $this->_labels);
  }

  /**
   * @returns EditableList
   */
  public function getLabelsx(): EditableList {
    return TypeAssert\instance_of(EditableList::class, $this->_labels);
  }

  public function getStatementsUNTYPED(): EditableNode {
    return $this->_statements;
  }

  public function withStatements(EditableNode $value): this {
    if ($value === $this->_statements) {
      return $this;
    }
    return new self($this->_labels, $value, $this->_fallthrough);
  }

  public function hasStatements(): bool {
    return !$this->_statements->isMissing();
  }

  /**
   * @returns EditableList | Missing
   */
  public function getStatements(): ?EditableList {
    if ($this->_statements->isMissing()) {
      return null;
    }
    return TypeAssert\instance_of(EditableList::class, $this->_statements);
  }

  /**
   * @returns EditableList
   */
  public function getStatementsx(): EditableList {
    return TypeAssert\instance_of(EditableList::class, $this->_statements);
  }

  public function getFallthroughUNTYPED(): EditableNode {
    return $this->_fallthrough;
  }

  public function withFallthrough(EditableNode $value): this {
    if ($value === $this->_fallthrough) {
      return $this;
    }
    return new self($this->_labels, $this->_statements, $value);
  }

  public function hasFallthrough(): bool {
    return !$this->_fallthrough->isMissing();
  }

  /**
   * @returns Missing
   */
  public function getFallthrough(): EditableNode {
    return TypeAssert\instance_of(EditableNode::class, $this->_fallthrough);
  }
}
