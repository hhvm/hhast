<?hh
/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<e333d8e3f1039e1ab51a90a95e78fcc1>>
 */
namespace Facebook\HHAST;
use type Facebook\TypeAssert\TypeAssert;

final class NamespaceGroupUseDeclaration extends EditableSyntax {

  private EditableSyntax $_keyword;
  private EditableSyntax $_kind;
  private EditableSyntax $_prefix;
  private EditableSyntax $_left_brace;
  private EditableSyntax $_clauses;
  private EditableSyntax $_right_brace;
  private EditableSyntax $_semicolon;

  public function __construct(
    EditableSyntax $keyword,
    EditableSyntax $kind,
    EditableSyntax $prefix,
    EditableSyntax $left_brace,
    EditableSyntax $clauses,
    EditableSyntax $right_brace,
    EditableSyntax $semicolon,
  ) {
    parent::__construct('namespace_group_use_declaration');
    $this->_keyword = $keyword;
    $this->_kind = $kind;
    $this->_prefix = $prefix;
    $this->_left_brace = $left_brace;
    $this->_clauses = $clauses;
    $this->_right_brace = $right_brace;
    $this->_semicolon = $semicolon;
  }

  public static function from_json(
    array<string, mixed> $json,
    int $position,
    string $source,
  ): this {
    $keyword = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['namespace_group_use_keyword'],
      $position,
      $source,
    );
    $position += $keyword->width();
    $kind = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['namespace_group_use_kind'],
      $position,
      $source,
    );
    $position += $kind->width();
    $prefix = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['namespace_group_use_prefix'],
      $position,
      $source,
    );
    $position += $prefix->width();
    $left_brace = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['namespace_group_use_left_brace'],
      $position,
      $source,
    );
    $position += $left_brace->width();
    $clauses = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['namespace_group_use_clauses'],
      $position,
      $source,
    );
    $position += $clauses->width();
    $right_brace = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['namespace_group_use_right_brace'],
      $position,
      $source,
    );
    $position += $right_brace->width();
    $semicolon = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['namespace_group_use_semicolon'],
      $position,
      $source,
    );
    $position += $semicolon->width();
    return new self(
      $keyword,
      $kind,
      $prefix,
      $left_brace,
      $clauses,
      $right_brace,
      $semicolon,
    );
  }

  public function children(): KeyedTraversable<string, EditableSyntax> {
    yield 'keyword' => $this->_keyword;
    yield 'kind' => $this->_kind;
    yield 'prefix' => $this->_prefix;
    yield 'left_brace' => $this->_left_brace;
    yield 'clauses' => $this->_clauses;
    yield 'right_brace' => $this->_right_brace;
    yield 'semicolon' => $this->_semicolon;
  }

  public function rewrite_children(
    self::TRewriter $rewriter,
    ?Traversable<EditableSyntax> $parents = null,
  ): this {
    $parents = $parents === null ? vec[] : vec($parents);
    $parents[] = $this;
    $keyword = $this->_keyword->rewrite($rewriter, $parents);
    $kind = $this->_kind->rewrite($rewriter, $parents);
    $prefix = $this->_prefix->rewrite($rewriter, $parents);
    $left_brace = $this->_left_brace->rewrite($rewriter, $parents);
    $clauses = $this->_clauses->rewrite($rewriter, $parents);
    $right_brace = $this->_right_brace->rewrite($rewriter, $parents);
    $semicolon = $this->_semicolon->rewrite($rewriter, $parents);
    if (
      $keyword === $this->_keyword &&
      $kind === $this->_kind &&
      $prefix === $this->_prefix &&
      $left_brace === $this->_left_brace &&
      $clauses === $this->_clauses &&
      $right_brace === $this->_right_brace &&
      $semicolon === $this->_semicolon
    ) {
      return $this;
    }
    return new self(
      $keyword,
      $kind,
      $prefix,
      $left_brace,
      $clauses,
      $right_brace,
      $semicolon,
    );
  }

  public function raw_keyword(): EditableSyntax {
    return $this->_keyword;
  }

  public function with_keyword(EditableSyntax $value): this {
    if ($value === $this->_keyword) {
      return $this;
    }
    return new self(
      $value,
      $this->_kind,
      $this->_prefix,
      $this->_left_brace,
      $this->_clauses,
      $this->_right_brace,
      $this->_semicolon,
    );
  }

  public function keyword(): UseToken {
    return TypeAssert::isInstanceOf(UseToken::class, $this->_keyword);
  }

  public function raw_kind(): EditableSyntax {
    return $this->_kind;
  }

  public function with_kind(EditableSyntax $value): this {
    if ($value === $this->_kind) {
      return $this;
    }
    return new self(
      $this->_keyword,
      $value,
      $this->_prefix,
      $this->_left_brace,
      $this->_clauses,
      $this->_right_brace,
      $this->_semicolon,
    );
  }

  public function kind(): EditableSyntax {
    return TypeAssert::isInstanceOf(EditableSyntax::class, $this->_kind);
  }

  public function raw_prefix(): EditableSyntax {
    return $this->_prefix;
  }

  public function with_prefix(EditableSyntax $value): this {
    if ($value === $this->_prefix) {
      return $this;
    }
    return new self(
      $this->_keyword,
      $this->_kind,
      $value,
      $this->_left_brace,
      $this->_clauses,
      $this->_right_brace,
      $this->_semicolon,
    );
  }

  public function prefix(): NamespacePrefixToken {
    return TypeAssert::isInstanceOf(NamespacePrefixToken::class, $this->_prefix);
  }

  public function raw_left_brace(): EditableSyntax {
    return $this->_left_brace;
  }

  public function with_left_brace(EditableSyntax $value): this {
    if ($value === $this->_left_brace) {
      return $this;
    }
    return new self(
      $this->_keyword,
      $this->_kind,
      $this->_prefix,
      $value,
      $this->_clauses,
      $this->_right_brace,
      $this->_semicolon,
    );
  }

  public function left_brace(): LeftBraceToken {
    return TypeAssert::isInstanceOf(LeftBraceToken::class, $this->_left_brace);
  }

  public function raw_clauses(): EditableSyntax {
    return $this->_clauses;
  }

  public function with_clauses(EditableSyntax $value): this {
    if ($value === $this->_clauses) {
      return $this;
    }
    return new self(
      $this->_keyword,
      $this->_kind,
      $this->_prefix,
      $this->_left_brace,
      $value,
      $this->_right_brace,
      $this->_semicolon,
    );
  }

  public function clauses(): EditableList {
    return TypeAssert::isInstanceOf(EditableList::class, $this->_clauses);
  }

  public function raw_right_brace(): EditableSyntax {
    return $this->_right_brace;
  }

  public function with_right_brace(EditableSyntax $value): this {
    if ($value === $this->_right_brace) {
      return $this;
    }
    return new self(
      $this->_keyword,
      $this->_kind,
      $this->_prefix,
      $this->_left_brace,
      $this->_clauses,
      $value,
      $this->_semicolon,
    );
  }

  public function right_brace(): ?RightBraceToken {
    if ($this->_right_brace->is_missing()) {
      return null;
    }
    return TypeAssert::isInstanceOf(RightBraceToken::class, $this->_right_brace);
  }

  public function right_bracex(): RightBraceToken {
    return TypeAssert::isInstanceOf(RightBraceToken::class, $this->_right_brace);
  }

  public function raw_semicolon(): EditableSyntax {
    return $this->_semicolon;
  }

  public function with_semicolon(EditableSyntax $value): this {
    if ($value === $this->_semicolon) {
      return $this;
    }
    return new self(
      $this->_keyword,
      $this->_kind,
      $this->_prefix,
      $this->_left_brace,
      $this->_clauses,
      $this->_right_brace,
      $value,
    );
  }

  public function semicolon(): ?SemicolonToken {
    if ($this->_semicolon->is_missing()) {
      return null;
    }
    return TypeAssert::isInstanceOf(SemicolonToken::class, $this->_semicolon);
  }

  public function semicolonx(): SemicolonToken {
    return TypeAssert::isInstanceOf(SemicolonToken::class, $this->_semicolon);
  }
}
