<?hh
/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<1eda8e666b898b50c99bd1c6c3d15bb1>>
 */
namespace Facebook\HHAST;
use namespace Facebook\TypeAssert;

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
  public static function fromJSON(
    dict<string, mixed> $json,
    int $position,
    string $source,
  ): this {
    $keyword = EditableSyntax::fromJSON(
      /* UNSAFE_EXPR */ $json['namespace_use_keyword'],
      $position,
      $source,
    );
    $position += $keyword->getWidth();
    $kind = EditableSyntax::fromJSON(
      /* UNSAFE_EXPR */ $json['namespace_use_kind'],
      $position,
      $source,
    );
    $position += $kind->getWidth();
    $clauses = EditableSyntax::fromJSON(
      /* UNSAFE_EXPR */ $json['namespace_use_clauses'],
      $position,
      $source,
    );
    $position += $clauses->getWidth();
    $semicolon = EditableSyntax::fromJSON(
      /* UNSAFE_EXPR */ $json['namespace_use_semicolon'],
      $position,
      $source,
    );
    $position += $semicolon->getWidth();
    return new self($keyword, $kind, $clauses, $semicolon);
  }

  <<__Override>>
  public function getChildren(): KeyedTraversable<string, EditableSyntax> {
    yield 'keyword' => $this->_keyword;
    yield 'kind' => $this->_kind;
    yield 'clauses' => $this->_clauses;
    yield 'semicolon' => $this->_semicolon;
  }

  <<__Override>>
  public function rewriteDescendants(
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
    return !$this->_keyword->isMissing();
  }

  /**
   * @returns UseToken
   */
  public function getKeyword(): UseToken {
    return TypeAssert\instance_of(UseToken::class, $this->_keyword);
  }

  public function getKindUNTYPED(): EditableSyntax {
    return $this->_kind;
  }

  public function withKind(EditableSyntax $value): this {
    if ($value === $this->_kind) {
      return $this;
    }
    return
      new self($this->_keyword, $value, $this->_clauses, $this->_semicolon);
  }

  public function hasKind(): bool {
    return !$this->_kind->isMissing();
  }

  /**
   * @returns Missing | ConstToken | FunctionToken
   */
  public function getKind(): ?EditableToken {
    if ($this->_kind->isMissing()) {
      return null;
    }
    return TypeAssert\instance_of(EditableToken::class, $this->_kind);
  }

  /**
   * @returns ConstToken | FunctionToken
   */
  public function getKindx(): EditableToken {
    return TypeAssert\instance_of(EditableToken::class, $this->_kind);
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
    return !$this->_clauses->isMissing();
  }

  /**
   * @returns EditableList
   */
  public function getClauses(): EditableList {
    return TypeAssert\instance_of(EditableList::class, $this->_clauses);
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
    return !$this->_semicolon->isMissing();
  }

  /**
   * @returns SemicolonToken | Missing
   */
  public function getSemicolon(): ?SemicolonToken {
    if ($this->_semicolon->isMissing()) {
      return null;
    }
    return TypeAssert\instance_of(SemicolonToken::class, $this->_semicolon);
  }

  /**
   * @returns SemicolonToken
   */
  public function getSemicolonx(): SemicolonToken {
    return TypeAssert\instance_of(SemicolonToken::class, $this->_semicolon);
  }
}
