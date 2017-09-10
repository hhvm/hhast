<?hh
/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<2a1c3ead83f7201b89a8253b5012c434>>
 */
namespace Facebook\HHAST;
use type Facebook\TypeAssert\TypeAssert;

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

  public static function from_json(
    array<string, mixed> $json,
    int $position,
    string $source,
  ): this {
    $labels = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['switch_section_labels'],
      $position,
      $source,
    );
    $position += $labels->width();
    $statements = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['switch_section_statements'],
      $position,
      $source,
    );
    $position += $statements->width();
    $fallthrough = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['switch_section_fallthrough'],
      $position,
      $source,
    );
    $position += $fallthrough->width();
    return new self($labels, $statements, $fallthrough);
  }

  public function children(): KeyedTraversable<string, EditableSyntax> {
    yield 'labels' => $this->_labels;
    yield 'statements' => $this->_statements;
    yield 'fallthrough' => $this->_fallthrough;
  }

  public function rewrite_children(
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

  public function labels(): ?EditableList {
    return $this->_labels->is_missing() ? null : TypeAssert::isInstanceOf(EditableList::class, $this->_labels);
  }

  public function labelsx(): EditableList {
    return TypeAssert::isInstanceOf(EditableList::class, $this->_labels);
  }

  public function raw_labels(): EditableSyntax {
    return $this->_labels;
  }

  public function with_labels(EditableSyntax $value): this {
    return new self($value, $this->_statements, $this->_fallthrough);
  }

  public function statements(): ?EditableList {
    return $this->_statements->is_missing() ? null : TypeAssert::isInstanceOf(EditableList::class, $this->_statements);
  }

  public function statementsx(): EditableList {
    return TypeAssert::isInstanceOf(EditableList::class, $this->_statements);
  }

  public function raw_statements(): EditableSyntax {
    return $this->_statements;
  }

  public function with_statements(EditableSyntax $value): this {
    return new self($this->_labels, $value, $this->_fallthrough);
  }

  public function fallthrough(): EditableSyntax {
    return $this->fallthroughx();
  }

  public function fallthroughx(): EditableSyntax {
    return TypeAssert::isInstanceOf(EditableSyntax::class, $this->_fallthrough);
  }

  public function raw_fallthrough(): EditableSyntax {
    return $this->_fallthrough;
  }

  public function with_fallthrough(EditableSyntax $value): this {
    return new self($this->_labels, $this->_statements, $value);
  }
}
