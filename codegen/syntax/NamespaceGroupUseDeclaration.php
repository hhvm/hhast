<?hh // strict
/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<8a525652f2daa34b4d1fd1827887f167>>
 */
namespace Facebook\HHAST;
use namespace Facebook\TypeAssert;

final class NamespaceGroupUseDeclaration extends EditableNode {

  private EditableNode $_keyword;
  private EditableNode $_kind;
  private EditableNode $_prefix;
  private EditableNode $_left_brace;
  private EditableNode $_clauses;
  private EditableNode $_right_brace;
  private EditableNode $_semicolon;

  public function __construct(
    EditableNode $keyword,
    EditableNode $kind,
    EditableNode $prefix,
    EditableNode $left_brace,
    EditableNode $clauses,
    EditableNode $right_brace,
    EditableNode $semicolon,
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

  <<__Override>>
  public static function fromJSON(
    dict<string, mixed> $json,
    int $position,
    string $source,
  ): this {
    $keyword = EditableNode::fromJSON(
      /* UNSAFE_EXPR */ $json['namespace_group_use_keyword'],
      $position,
      $source,
    );
    $position += $keyword->getWidth();
    $kind = EditableNode::fromJSON(
      /* UNSAFE_EXPR */ $json['namespace_group_use_kind'],
      $position,
      $source,
    );
    $position += $kind->getWidth();
    $prefix = EditableNode::fromJSON(
      /* UNSAFE_EXPR */ $json['namespace_group_use_prefix'],
      $position,
      $source,
    );
    $position += $prefix->getWidth();
    $left_brace = EditableNode::fromJSON(
      /* UNSAFE_EXPR */ $json['namespace_group_use_left_brace'],
      $position,
      $source,
    );
    $position += $left_brace->getWidth();
    $clauses = EditableNode::fromJSON(
      /* UNSAFE_EXPR */ $json['namespace_group_use_clauses'],
      $position,
      $source,
    );
    $position += $clauses->getWidth();
    $right_brace = EditableNode::fromJSON(
      /* UNSAFE_EXPR */ $json['namespace_group_use_right_brace'],
      $position,
      $source,
    );
    $position += $right_brace->getWidth();
    $semicolon = EditableNode::fromJSON(
      /* UNSAFE_EXPR */ $json['namespace_group_use_semicolon'],
      $position,
      $source,
    );
    $position += $semicolon->getWidth();
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

  <<__Override>>
  public function getChildren(): KeyedTraversable<string, EditableNode> {
    yield 'keyword' => $this->_keyword;
    yield 'kind' => $this->_kind;
    yield 'prefix' => $this->_prefix;
    yield 'left_brace' => $this->_left_brace;
    yield 'clauses' => $this->_clauses;
    yield 'right_brace' => $this->_right_brace;
    yield 'semicolon' => $this->_semicolon;
  }

  <<__Override>>
  public function rewriteDescendants(
    self::TRewriter $rewriter,
    ?Traversable<EditableNode> $parents = null,
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

  public function getKeywordUNTYPED(): EditableNode {
    return $this->_keyword;
  }

  public function withKeyword(EditableNode $value): this {
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

  public function hasKeyword(): bool {
    return !$this->_keyword->isMissing();
  }

  /**
   * @returns UseToken
   */
  public function getKeyword(): UseToken {
    return TypeAssert\instance_of(UseToken::class, $this->_keyword);
  }

  public function getKindUNTYPED(): EditableNode {
    return $this->_kind;
  }

  public function withKind(EditableNode $value): this {
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

  public function hasKind(): bool {
    return !$this->_kind->isMissing();
  }

  /**
   * @returns Missing | FunctionToken | ConstToken
   */
  public function getKind(): ?EditableToken {
    if ($this->_kind->isMissing()) {
      return null;
    }
    return TypeAssert\instance_of(EditableToken::class, $this->_kind);
  }

  /**
   * @returns FunctionToken | ConstToken
   */
  public function getKindx(): EditableToken {
    return TypeAssert\instance_of(EditableToken::class, $this->_kind);
  }

  public function getPrefixUNTYPED(): EditableNode {
    return $this->_prefix;
  }

  public function withPrefix(EditableNode $value): this {
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

  public function hasPrefix(): bool {
    return !$this->_prefix->isMissing();
  }

  /**
   * @returns NamespacePrefixToken
   */
  public function getPrefix(): NamespacePrefixToken {
    return TypeAssert\instance_of(NamespacePrefixToken::class, $this->_prefix);
  }

  public function getLeftBraceUNTYPED(): EditableNode {
    return $this->_left_brace;
  }

  public function withLeftBrace(EditableNode $value): this {
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

  public function hasLeftBrace(): bool {
    return !$this->_left_brace->isMissing();
  }

  /**
   * @returns LeftBraceToken
   */
  public function getLeftBrace(): LeftBraceToken {
    return TypeAssert\instance_of(LeftBraceToken::class, $this->_left_brace);
  }

  public function getClausesUNTYPED(): EditableNode {
    return $this->_clauses;
  }

  public function withClauses(EditableNode $value): this {
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

  public function hasClauses(): bool {
    return !$this->_clauses->isMissing();
  }

  /**
   * @returns EditableList
   */
  public function getClauses(): EditableList {
    return TypeAssert\instance_of(EditableList::class, $this->_clauses);
  }

  public function getRightBraceUNTYPED(): EditableNode {
    return $this->_right_brace;
  }

  public function withRightBrace(EditableNode $value): this {
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

  public function hasRightBrace(): bool {
    return !$this->_right_brace->isMissing();
  }

  /**
   * @returns RightBraceToken | Missing
   */
  public function getRightBrace(): ?RightBraceToken {
    if ($this->_right_brace->isMissing()) {
      return null;
    }
    return TypeAssert\instance_of(RightBraceToken::class, $this->_right_brace);
  }

  /**
   * @returns RightBraceToken
   */
  public function getRightBracex(): RightBraceToken {
    return TypeAssert\instance_of(RightBraceToken::class, $this->_right_brace);
  }

  public function getSemicolonUNTYPED(): EditableNode {
    return $this->_semicolon;
  }

  public function withSemicolon(EditableNode $value): this {
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
