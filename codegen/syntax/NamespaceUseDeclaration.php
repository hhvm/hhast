<?hh
/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<af36d02f75efcfe283dcd3910de3b8e0>>
 */
namespace Facebook\HHAST;
use type Facebook\TypeAssert\TypeAssert;

final class NamespaceUseDeclaration extends EditableSyntax {

  private EditableSyntax $_keyword;
  private EditableSyntax $_kind;
  private EditableSyntax $_clauses;
  private EditableSyntax $_semicolon;

  public function __construct(
    EditableSyntax $keyword,
    EditableSyntax $kind,
    EditableSyntax $clauses,
    EditableSyntax $semicolon,
  ) {
    parent::__construct('namespace_use_declaration');
    $this->_keyword = $keyword;
    $this->_kind = $kind;
    $this->_clauses = $clauses;
    $this->_semicolon = $semicolon;
  }

  <<__Override>>
  public static function from_json(
    array<string, mixed> $json,
    int $position,
    string $source,
  ): this {
    $keyword = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['namespace_use_keyword'],
      $position,
      $source,
    );
    $position += $keyword->width();
    $kind = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['namespace_use_kind'],
      $position,
      $source,
    );
    $position += $kind->width();
    $clauses = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['namespace_use_clauses'],
      $position,
      $source,
    );
    $position += $clauses->width();
    $semicolon = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['namespace_use_semicolon'],
      $position,
      $source,
    );
    $position += $semicolon->width();
    return new self($keyword, $kind, $clauses, $semicolon);
  }

  <<__Override>>
  public function children(): KeyedTraversable<string, EditableSyntax> {
    yield 'keyword' => $this->_keyword;
    yield 'kind' => $this->_kind;
    yield 'clauses' => $this->_clauses;
    yield 'semicolon' => $this->_semicolon;
  }

  <<__Override>>
  public function rewrite_children(
    self::TRewriter $rewriter,
    ?Traversable<EditableSyntax> $parents = null,
  ): this {
    $parents = $parents === null ? vec[] : vec($parents);
    $parents[] = $this;
    $keyword = $this->_keyword->rewrite($rewriter, $parents);
    $kind = $this->_kind->rewrite($rewriter, $parents);
    $clauses = $this->_clauses->rewrite($rewriter, $parents);
    $semicolon = $this->_semicolon->rewrite($rewriter, $parents);
    if (
      $keyword === $this->_keyword &&
      $kind === $this->_kind &&
      $clauses === $this->_clauses &&
      $semicolon === $this->_semicolon
    ) {
      return $this;
    }
    return new self($keyword, $kind, $clauses, $semicolon);
  }

  public function getKeywordUNTYPED(): EditableSyntax {
    return $this->_keyword;
  }

  public function withKeyword(EditableSyntax $value): this {
    if ($value === $this->_keyword) {
      return $this;
    }
    return new self($value, $this->_kind, $this->_clauses, $this->_semicolon);
  }

  public function hasKeyword(): bool {
    return !$this->_keyword->is_missing();
  }

  public function getKeyword(): UseToken {
    return TypeAssert::isInstanceOf(UseToken::class, $this->_keyword);
  }

  public function getKindUNTYPED(): EditableSyntax {
    return $this->_kind;
  }

  public function withKind(EditableSyntax $value): this {
    if ($value === $this->_kind) {
      return $this;
    }
    return new self($this->_keyword, $value, $this->_clauses, $this->_semicolon);
  }

  public function hasKind(): bool {
    return !$this->_kind->is_missing();
  }

  public function getKind(): EditableSyntax {
    return TypeAssert::isInstanceOf(EditableSyntax::class, $this->_kind);
  }

  public function getClausesUNTYPED(): EditableSyntax {
    return $this->_clauses;
  }

  public function withClauses(EditableSyntax $value): this {
    if ($value === $this->_clauses) {
      return $this;
    }
    return new self($this->_keyword, $this->_kind, $value, $this->_semicolon);
  }

  public function hasClauses(): bool {
    return !$this->_clauses->is_missing();
  }

  public function getClauses(): EditableList {
    return TypeAssert::isInstanceOf(EditableList::class, $this->_clauses);
  }

  public function getSemicolonUNTYPED(): EditableSyntax {
    return $this->_semicolon;
  }

  public function withSemicolon(EditableSyntax $value): this {
    if ($value === $this->_semicolon) {
      return $this;
    }
    return new self($this->_keyword, $this->_kind, $this->_clauses, $value);
  }

  public function hasSemicolon(): bool {
    return !$this->_semicolon->is_missing();
  }

  public function getSemicolon(): ?SemicolonToken {
    if ($this->_semicolon->is_missing()) {
      return null;
    }
    return TypeAssert::isInstanceOf(SemicolonToken::class, $this->_semicolon);
  }

  public function getSemicolonx(): SemicolonToken {
    return TypeAssert::isInstanceOf(SemicolonToken::class, $this->_semicolon);
  }
}
