/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<0f1aa40f6c9ddc5030fec8b4a5fd6db3>>
 */
namespace Facebook\HHAST;
use namespace Facebook\TypeAssert;

<<__ConsistentConstruct>>
final class GotoStatement extends Node implements IStatement {

  const string SYNTAX_KIND = 'goto_statement';

  private Node $_keyword;
  private Node $_label_name;
  private Node $_semicolon;

  public function __construct(
    Node $keyword,
    Node $label_name,
    Node $semicolon,
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
    string $_type_hint,
  ): this {
    $offset = $initial_offset;
    $keyword = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['goto_statement_keyword'],
      $file,
      $offset,
      $source,
      'GotoToken',
    );
    $offset += $keyword->getWidth();
    $label_name = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['goto_statement_label_name'],
      $file,
      $offset,
      $source,
      'NameToken',
    );
    $offset += $label_name->getWidth();
    $semicolon = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['goto_statement_semicolon'],
      $file,
      $offset,
      $source,
      'SemicolonToken',
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
  public function getChildren(): dict<string, Node> {
    return dict[
      'keyword' => $this->_keyword,
      'label_name' => $this->_label_name,
      'semicolon' => $this->_semicolon,
    ];
  }

  <<__Override>>
  public function rewriteChildren(
    self::TRewriter $rewriter,
    vec<Node> $parents = vec[],
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

  public function getKeywordUNTYPED(): Node {
    return $this->_keyword;
  }

  public function withKeyword(Node $value): this {
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

  public function getLabelNameUNTYPED(): Node {
    return $this->_label_name;
  }

  public function withLabelName(Node $value): this {
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

  public function getSemicolonUNTYPED(): Node {
    return $this->_semicolon;
  }

  public function withSemicolon(Node $value): this {
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
