<?hh
/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<f5afa08e69baca38f59bb743d7df7e46>>
 */
namespace Facebook\HHAST;
use type Facebook\TypeAssert\TypeAssert;

final class TraitUseConflictResolution extends EditableSyntax {

  private EditableSyntax $_keyword;
  private EditableSyntax $_names;
  private EditableSyntax $_left_brace;
  private EditableSyntax $_clauses;
  private EditableSyntax $_right_brace;

  public function __construct(
    EditableSyntax $keyword,
    EditableSyntax $names,
    EditableSyntax $left_brace,
    EditableSyntax $clauses,
    EditableSyntax $right_brace,
  ) {
    parent::__construct('trait_use_conflict_resolution');
    $this->_keyword = $keyword;
    $this->_names = $names;
    $this->_left_brace = $left_brace;
    $this->_clauses = $clauses;
    $this->_right_brace = $right_brace;
  }

  public static function from_json(
    array<string, mixed> $json,
    int $position,
    string $source,
  ): this {
    $keyword = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['trait_use_conflict_resolution_keyword'],
      $position,
      $source,
    );
    $position += $keyword->width();
    $names = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['trait_use_conflict_resolution_names'],
      $position,
      $source,
    );
    $position += $names->width();
    $left_brace = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['trait_use_conflict_resolution_left_brace'],
      $position,
      $source,
    );
    $position += $left_brace->width();
    $clauses = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['trait_use_conflict_resolution_clauses'],
      $position,
      $source,
    );
    $position += $clauses->width();
    $right_brace = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['trait_use_conflict_resolution_right_brace'],
      $position,
      $source,
    );
    $position += $right_brace->width();
    return new self($keyword, $names, $left_brace, $clauses, $right_brace);
  }

  public function children(): KeyedTraversable<string, EditableSyntax> {
    yield 'keyword' => $this->_keyword;
    yield 'names' => $this->_names;
    yield 'left_brace' => $this->_left_brace;
    yield 'clauses' => $this->_clauses;
    yield 'right_brace' => $this->_right_brace;
  }

  public function rewrite(
    self::TRewriter $rewriter,
    ?Traversable<EditableSyntax> $parents = null,
  ): EditableSyntax {
    $parents = $parents === null ? vec[] : vec($parents);
    $child_parents = $parents;
    $child_parents[] = $this;
    $keyword = $this->_keyword->rewrite($rewriter, $child_parents);
    $names = $this->_names->rewrite($rewriter, $child_parents);
    $left_brace = $this->_left_brace->rewrite($rewriter, $child_parents);
    $clauses = $this->_clauses->rewrite($rewriter, $child_parents);
    $right_brace = $this->_right_brace->rewrite($rewriter, $child_parents);
    if (
      $keyword === $this->_keyword &&
      $names === $this->_names &&
      $left_brace === $this->_left_brace &&
      $clauses === $this->_clauses &&
      $right_brace === $this->_right_brace
    ) {
      $node = $this;
    } else {
      $node = new self($keyword, $names, $left_brace, $clauses, $right_brace);
    }
    return $rewriter($node, $parents);
  }

  public function keyword(): UseToken {
    return $this->keywordx();
  }

  public function keywordx(): UseToken {
    return TypeAssert::isInstanceOf(UseToken::class, $this->_keyword);
  }

  public function raw_keyword(): EditableSyntax {
    return $this->_keyword;
  }

  public function with_keyword(EditableSyntax $value): this {
    return new self(
      $value,
      $this->_names,
      $this->_left_brace,
      $this->_clauses,
      $this->_right_brace,
    );
  }

  public function names(): EditableList {
    return $this->namesx();
  }

  public function namesx(): EditableList {
    return TypeAssert::isInstanceOf(EditableList::class, $this->_names);
  }

  public function raw_names(): EditableSyntax {
    return $this->_names;
  }

  public function with_names(EditableSyntax $value): this {
    return new self(
      $this->_keyword,
      $value,
      $this->_left_brace,
      $this->_clauses,
      $this->_right_brace,
    );
  }

  public function left_brace(): LeftBraceToken {
    return $this->left_bracex();
  }

  public function left_bracex(): LeftBraceToken {
    return TypeAssert::isInstanceOf(LeftBraceToken::class, $this->_left_brace);
  }

  public function raw_left_brace(): EditableSyntax {
    return $this->_left_brace;
  }

  public function with_left_brace(EditableSyntax $value): this {
    return new self(
      $this->_keyword,
      $this->_names,
      $value,
      $this->_clauses,
      $this->_right_brace,
    );
  }

  public function clauses(): ?EditableList {
    return $this->_clauses->is_missing()
      ? null
      : TypeAssert::isInstanceOf(EditableList::class, $this->_clauses);
  }

  public function clausesx(): EditableList {
    return TypeAssert::isInstanceOf(EditableList::class, $this->_clauses);
  }

  public function raw_clauses(): EditableSyntax {
    return $this->_clauses;
  }

  public function with_clauses(EditableSyntax $value): this {
    return new self(
      $this->_keyword,
      $this->_names,
      $this->_left_brace,
      $value,
      $this->_right_brace,
    );
  }

  public function right_brace(): RightBraceToken {
    return $this->right_bracex();
  }

  public function right_bracex(): RightBraceToken {
    return
      TypeAssert::isInstanceOf(RightBraceToken::class, $this->_right_brace);
  }

  public function raw_right_brace(): EditableSyntax {
    return $this->_right_brace;
  }

  public function with_right_brace(EditableSyntax $value): this {
    return new self(
      $this->_keyword,
      $this->_names,
      $this->_left_brace,
      $this->_clauses,
      $value,
    );
  }
}
