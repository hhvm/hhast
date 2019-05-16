/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<d610d859eb514dc0239a3e8dd4f03250>>
 */
namespace Facebook\HHAST;
use namespace Facebook\TypeAssert;

<<__ConsistentConstruct>>
final class GotoStatement extends EditableNode implements IStatement {

  const string SYNTAX_KIND = 'goto_statement';

  private EditableNode $_keyword;
  private EditableNode $_label_name;
  private EditableNode $_semicolon;

  public function __construct(
    EditableNode $keyword,
    EditableNode $label_name,
    EditableNode $semicolon,
    ?__Private\SourceRef $source_ref = null,
  ) {
    $this->_keyword = $keyword;
    $this->_label_name = $label_name;
    $this->_semicolon = $semicolon;
    parent::__construct($source_ref);
  }

  <<__Override>>
  public static function fromJSON(
    dict<string, mixed> $json,
    string $file,
    int $initial_offset,
    string $source,
  ): this {
    $offset = $initial_offset;
    $keyword = EditableNode::fromJSON(
      /* UNSAFE_EXPR */ $json['goto_statement_keyword'],
      $file,
      $offset,
      $source,
    );
    $offset += $keyword->getWidth();
    $label_name = EditableNode::fromJSON(
      /* UNSAFE_EXPR */ $json['goto_statement_label_name'],
      $file,
      $offset,
      $source,
    );
    $offset += $label_name->getWidth();
    $semicolon = EditableNode::fromJSON(
      /* UNSAFE_EXPR */ $json['goto_statement_semicolon'],
      $file,
      $offset,
      $source,
    );
    $offset += $semicolon->getWidth();
    $source_ref = shape(
      'file' => $file,
      'source' => $source,
      'offset' => $initial_offset,
      'width' => $offset - $initial_offset,
    );
    return new static($keyword, $label_name, $semicolon, $source_ref);
  }

  <<__Override>>
  public function getChildren(): dict<string, EditableNode> {
    return dict[
      'keyword' => $this->_keyword,
      'label_name' => $this->_label_name,
      'semicolon' => $this->_semicolon,
    ];
  }

  <<__Override>>
  public function rewriteChildren(
    self::TRewriter $rewriter,
    vec<EditableNode> $parents = vec[],
  ): this {
    $parents[] = $this;
    $keyword = $rewriter($this->_keyword, $parents);
    $label_name = $rewriter($this->_label_name, $parents);
    $semicolon = $rewriter($this->_semicolon, $parents);
    if (
      $keyword === $this->_keyword &&
      $label_name === $this->_label_name &&
      $semicolon === $this->_semicolon
    ) {
      return $this;
    }
    return new static($keyword, $label_name, $semicolon);
  }

  public function getKeywordUNTYPED(): EditableNode {
    return $this->_keyword;
  }

  public function withKeyword(EditableNode $value): this {
    if ($value === $this->_keyword) {
      return $this;
    }
    return new static($value, $this->_label_name, $this->_semicolon);
  }

  public function hasKeyword(): bool {
    return !$this->_keyword->isMissing();
  }

  /**
   * @return GotoToken
   */
  public function getKeyword(): GotoToken {
    return TypeAssert\instance_of(GotoToken::class, $this->_keyword);
  }

  /**
   * @return GotoToken
   */
  public function getKeywordx(): GotoToken {
    return $this->getKeyword();
  }

  public function getLabelNameUNTYPED(): EditableNode {
    return $this->_label_name;
  }

  public function withLabelName(EditableNode $value): this {
    if ($value === $this->_label_name) {
      return $this;
    }
    return new static($this->_keyword, $value, $this->_semicolon);
  }

  public function hasLabelName(): bool {
    return !$this->_label_name->isMissing();
  }

  /**
   * @return NameToken
   */
  public function getLabelName(): NameToken {
    return TypeAssert\instance_of(NameToken::class, $this->_label_name);
  }

  /**
   * @return NameToken
   */
  public function getLabelNamex(): NameToken {
    return $this->getLabelName();
  }

  public function getSemicolonUNTYPED(): EditableNode {
    return $this->_semicolon;
  }

  public function withSemicolon(EditableNode $value): this {
    if ($value === $this->_semicolon) {
      return $this;
    }
    return new static($this->_keyword, $this->_label_name, $value);
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
