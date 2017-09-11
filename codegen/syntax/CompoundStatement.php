<?hh
/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<7125dafeaa6ce2963c18d944dcc49059>>
 */
namespace Facebook\HHAST;
use type Facebook\TypeAssert\TypeAssert;

final class CompoundStatement extends EditableSyntax {

  private EditableSyntax $_left_brace;
  private EditableSyntax $_statements;
  private EditableSyntax $_right_brace;

  public function __construct(
    EditableSyntax $left_brace,
    EditableSyntax $statements,
    EditableSyntax $right_brace,
  ) {
    parent::__construct('compound_statement');
    $this->_left_brace = $left_brace;
    $this->_statements = $statements;
    $this->_right_brace = $right_brace;
  }

  public static function from_json(
    array<string, mixed> $json,
    int $position,
    string $source,
  ): this {
    $left_brace = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['compound_left_brace'],
      $position,
      $source,
    );
    $position += $left_brace->width();
    $statements = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['compound_statements'],
      $position,
      $source,
    );
    $position += $statements->width();
    $right_brace = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['compound_right_brace'],
      $position,
      $source,
    );
    $position += $right_brace->width();
    return new self($left_brace, $statements, $right_brace);
  }

  public function children(): KeyedTraversable<string, EditableSyntax> {
    yield 'left_brace' => $this->_left_brace;
    yield 'statements' => $this->_statements;
    yield 'right_brace' => $this->_right_brace;
  }

  public function rewrite_children(
    self::TRewriter $rewriter,
    ?Traversable<EditableSyntax> $parents = null,
  ): this {
    $parents = $parents === null ? vec[] : vec($parents);
    $parents[] = $this;
    $left_brace = $this->_left_brace->rewrite($rewriter, $parents);
    $statements = $this->_statements->rewrite($rewriter, $parents);
    $right_brace = $this->_right_brace->rewrite($rewriter, $parents);
    if (
      $left_brace === $this->_left_brace &&
      $statements === $this->_statements &&
      $right_brace === $this->_right_brace
    ) {
      return $this;
    }
    return new self($left_brace, $statements, $right_brace);
  }

  public function left_brace(): ?LeftBraceToken {
    return $this->_left_brace->is_missing() ? null : TypeAssert::isInstanceOf(LeftBraceToken::class, $this->_left_brace);
  }

  public function left_bracex(): LeftBraceToken {
    return TypeAssert::isInstanceOf(LeftBraceToken::class, $this->_left_brace);
  }

  public function raw_left_brace(): EditableSyntax {
    return $this->_left_brace;
  }

  public function with_left_brace(EditableSyntax $value): this {
    if ($value === $this->_left_brace) {
      return $this;
    }
    return new self($value, $this->_statements, $this->_right_brace);
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
    if ($value === $this->_statements) {
      return $this;
    }
    return new self($this->_left_brace, $value, $this->_right_brace);
  }

  public function right_brace(): ?RightBraceToken {
    return $this->_right_brace->is_missing() ? null : TypeAssert::isInstanceOf(RightBraceToken::class, $this->_right_brace);
  }

  public function right_bracex(): RightBraceToken {
    return TypeAssert::isInstanceOf(RightBraceToken::class, $this->_right_brace);
  }

  public function raw_right_brace(): EditableSyntax {
    return $this->_right_brace;
  }

  public function with_right_brace(EditableSyntax $value): this {
    if ($value === $this->_right_brace) {
      return $this;
    }
    return new self($this->_left_brace, $this->_statements, $value);
  }
}
