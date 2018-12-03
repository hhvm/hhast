<?hh // strict
/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<5d3855770652604757e323702066bde4>>
 */
namespace Facebook\HHAST;
use namespace Facebook\TypeAssert;

<<__ConsistentConstruct>>
final class NamespaceUseDeclaration
  extends EditableNode
  implements INamespaceUseDeclaration {

  private EditableNode $_keyword;
  private EditableNode $_kind;
  private EditableNode $_clauses;
  private EditableNode $_semicolon;

  public function __construct(
    EditableNode $keyword,
    EditableNode $kind,
    EditableNode $clauses,
    EditableNode $semicolon,
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
    string $file,
    int $offset,
    string $source,
  ): this {
    $keyword = EditableNode::fromJSON(
      /* UNSAFE_EXPR */ $json['namespace_use_keyword'],
      $file,
      $offset,
      $source,
    );
    $offset += $keyword->getWidth();
    $kind = EditableNode::fromJSON(
      /* UNSAFE_EXPR */ $json['namespace_use_kind'],
      $file,
      $offset,
      $source,
    );
    $offset += $kind->getWidth();
    $clauses = EditableNode::fromJSON(
      /* UNSAFE_EXPR */ $json['namespace_use_clauses'],
      $file,
      $offset,
      $source,
    );
    $offset += $clauses->getWidth();
    $semicolon = EditableNode::fromJSON(
      /* UNSAFE_EXPR */ $json['namespace_use_semicolon'],
      $file,
      $offset,
      $source,
    );
    $offset += $semicolon->getWidth();
    return new static($keyword, $kind, $clauses, $semicolon);
  }

  <<__Override>>
  public function getChildren(): dict<string, EditableNode> {
    return dict[
      'keyword' => $this->_keyword,
      'kind' => $this->_kind,
      'clauses' => $this->_clauses,
      'semicolon' => $this->_semicolon,
    ];
  }

  <<__Override>>
  public function rewriteDescendants(
    self::TRewriter $rewriter,
    ?vec<EditableNode> $parents = null,
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
    return new static($keyword, $kind, $clauses, $semicolon);
  }

  public function getKeywordUNTYPED(): EditableNode {
    return $this->_keyword;
  }

  public function withKeyword(EditableNode $value): this {
    if ($value === $this->_keyword) {
      return $this;
    }
    return new static($value, $this->_kind, $this->_clauses, $this->_semicolon);
  }

  public function hasKeyword(): bool {
    return !$this->_keyword->isMissing();
  }

  /**
   * @return UseToken
   */
  public function getKeyword(): UseToken {
    return TypeAssert\instance_of(UseToken::class, $this->_keyword);
  }

  /**
   * @return UseToken
   */
  public function getKeywordx(): UseToken {
    return $this->getKeyword();
  }

  public function getKindUNTYPED(): EditableNode {
    return $this->_kind;
  }

  public function withKind(EditableNode $value): this {
    if ($value === $this->_kind) {
      return $this;
    }
    return
      new static($this->_keyword, $value, $this->_clauses, $this->_semicolon);
  }

  public function hasKind(): bool {
    return !$this->_kind->isMissing();
  }

  /**
   * @return null | ConstToken | FunctionToken | NamespaceToken | TypeToken
   */
  public function getKind(): ?EditableToken {
    if ($this->_kind->isMissing()) {
      return null;
    }
    return TypeAssert\instance_of(EditableToken::class, $this->_kind);
  }

  /**
   * @return ConstToken | FunctionToken | NamespaceToken | TypeToken
   */
  public function getKindx(): EditableToken {
    return TypeAssert\instance_of(EditableToken::class, $this->_kind);
  }

  public function getClausesUNTYPED(): EditableNode {
    return $this->_clauses;
  }

  public function withClauses(EditableNode $value): this {
    if ($value === $this->_clauses) {
      return $this;
    }
    return new static($this->_keyword, $this->_kind, $value, $this->_semicolon);
  }

  public function hasClauses(): bool {
    return !$this->_clauses->isMissing();
  }

  /**
   * @return EditableList<NamespaceUseClause>
   */
  public function getClauses(): EditableList<NamespaceUseClause> {
    return TypeAssert\instance_of(EditableList::class, $this->_clauses);
  }

  /**
   * @return EditableList<NamespaceUseClause>
   */
  public function getClausesx(): EditableList<NamespaceUseClause> {
    return $this->getClauses();
  }

  public function getSemicolonUNTYPED(): EditableNode {
    return $this->_semicolon;
  }

  public function withSemicolon(EditableNode $value): this {
    if ($value === $this->_semicolon) {
      return $this;
    }
    return new static($this->_keyword, $this->_kind, $this->_clauses, $value);
  }

  public function hasSemicolon(): bool {
    return !$this->_semicolon->isMissing();
  }

  /**
   * @return SemicolonToken
   */
  public function getSemicolon(): SemicolonToken {
    return TypeAssert\instance_of(SemicolonToken::class, $this->_semicolon);
  }

  /**
   * @return SemicolonToken
   */
  public function getSemicolonx(): SemicolonToken {
    return $this->getSemicolon();
  }
}
