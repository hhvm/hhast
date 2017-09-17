<?hh
/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<94c518b1870defcbaf3c24f2b865dcc0>>
 */
namespace Facebook\HHAST;
use namespace Facebook\TypeAssert;

final class GotoStatement extends EditableSyntax {

  private EditableSyntax $_keyword;
  private EditableSyntax $_label_name;
  private EditableSyntax $_semicolon;

  public function __construct(
    EditableSyntax $keyword,
    EditableSyntax $label_name,
    EditableSyntax $semicolon,
  ) {
    parent::__construct('goto_statement');
    $this->_keyword = $keyword;
    $this->_label_name = $label_name;
    $this->_semicolon = $semicolon;
  }

  <<__Override>>
  public static function fromJSON(
    dict<string, mixed> $json,
    int $position,
    string $source,
  ): this {
    $keyword = EditableSyntax::fromJSON(
      /* UNSAFE_EXPR */ $json['goto_statement_keyword'],
      $position,
      $source,
    );
    $position += $keyword->getWidth();
    $label_name = EditableSyntax::fromJSON(
      /* UNSAFE_EXPR */ $json['goto_statement_label_name'],
      $position,
      $source,
    );
    $position += $label_name->getWidth();
    $semicolon = EditableSyntax::fromJSON(
      /* UNSAFE_EXPR */ $json['goto_statement_semicolon'],
      $position,
      $source,
    );
    $position += $semicolon->getWidth();
    return new self($keyword, $label_name, $semicolon);
  }

  <<__Override>>
  public function getChildren(): KeyedTraversable<string, EditableSyntax> {
    yield 'keyword' => $this->_keyword;
    yield 'label_name' => $this->_label_name;
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
    $label_name = $this->_label_name->rewrite($rewriter, $parents);
    $semicolon = $this->_semicolon->rewrite($rewriter, $parents);
    if (
      $keyword === $this->_keyword &&
      $label_name === $this->_label_name &&
      $semicolon === $this->_semicolon
    ) {
      return $this;
    }
    return new self($keyword, $label_name, $semicolon);
  }

  public function getKeywordUNTYPED(): EditableSyntax {
    return $this->_keyword;
  }

  public function withKeyword(EditableSyntax $value): this {
    if ($value === $this->_keyword) {
      return $this;
    }
    return new self($value, $this->_label_name, $this->_semicolon);
  }

  public function hasKeyword(): bool {
    return !$this->_keyword->isMissing();
  }

  /**
   * @returns GotoToken
   */
  public function getKeyword(): GotoToken {
    return TypeAssert\instance_of(GotoToken::class, $this->_keyword);
  }

  public function getLabelNameUNTYPED(): EditableSyntax {
    return $this->_label_name;
  }

  public function withLabelName(EditableSyntax $value): this {
    if ($value === $this->_label_name) {
      return $this;
    }
    return new self($this->_keyword, $value, $this->_semicolon);
  }

  public function hasLabelName(): bool {
    return !$this->_label_name->isMissing();
  }

  /**
   * @returns NameToken
   */
  public function getLabelName(): NameToken {
    return TypeAssert\instance_of(NameToken::class, $this->_label_name);
  }

  public function getSemicolonUNTYPED(): EditableSyntax {
    return $this->_semicolon;
  }

  public function withSemicolon(EditableSyntax $value): this {
    if ($value === $this->_semicolon) {
      return $this;
    }
    return new self($this->_keyword, $this->_label_name, $value);
  }

  public function hasSemicolon(): bool {
    return !$this->_semicolon->isMissing();
  }

  /**
   * @returns SemicolonToken
   */
  public function getSemicolon(): SemicolonToken {
    return TypeAssert\instance_of(SemicolonToken::class, $this->_semicolon);
  }
}
