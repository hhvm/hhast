<?hh // strict
/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<e9c447e2cbb61c6fbe20a5bd51615038>>
 */
namespace Facebook\HHAST;
use namespace Facebook\TypeAssert;

final class SwitchSection extends EditableSyntax {

  private EditableSyntax $_labels;
  private EditableSyntax $_statements;
  private EditableSyntax $_fallthrough;

  public function __construct(
    EditableSyntax $labels,
    EditableSyntax $statements,
    EditableSyntax $fallthrough,
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
    $labels = EditableSyntax::fromJSON(
      /* UNSAFE_EXPR */ $json['switch_section_labels'],
      $position,
      $source,
    );
    $position += $labels->getWidth();
    $statements = EditableSyntax::fromJSON(
      /* UNSAFE_EXPR */ $json['switch_section_statements'],
      $position,
      $source,
    );
    $position += $statements->getWidth();
    $fallthrough = EditableSyntax::fromJSON(
      /* UNSAFE_EXPR */ $json['switch_section_fallthrough'],
      $position,
      $source,
    );
    $position += $fallthrough->getWidth();
    return new self($labels, $statements, $fallthrough);
  }

  <<__Override>>
  public function getChildren(): KeyedTraversable<string, EditableSyntax> {
    yield 'labels' => $this->_labels;
    yield 'statements' => $this->_statements;
    yield 'fallthrough' => $this->_fallthrough;
  }

  <<__Override>>
  public function rewriteDescendants(
    self::TRewriter $rewriter,
    ?Traversable<EditableSyntax> $parents = null,
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

  public function getLabelsUNTYPED(): EditableSyntax {
    return $this->_labels;
  }

  public function withLabels(EditableSyntax $value): this {
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

  public function getStatementsUNTYPED(): EditableSyntax {
    return $this->_statements;
  }

  public function withStatements(EditableSyntax $value): this {
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

  public function getFallthroughUNTYPED(): EditableSyntax {
    return $this->_fallthrough;
  }

  public function withFallthrough(EditableSyntax $value): this {
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
  public function getFallthrough(): EditableSyntax {
    return TypeAssert\instance_of(EditableSyntax::class, $this->_fallthrough);
  }
}
