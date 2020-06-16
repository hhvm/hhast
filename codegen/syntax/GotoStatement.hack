/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<848cec49e8aeb3fdc5f4c4e81f834eb5>>
 */
namespace Facebook\HHAST;
use namespace Facebook\TypeAssert;
use namespace HH\Lib\Dict;

<<__ConsistentConstruct>>
final class GotoStatement extends Node implements IStatement {

  const string SYNTAX_KIND = 'goto_statement';

  private GotoToken $_keyword;
  private NameToken $_label_name;
  private SemicolonToken $_semicolon;

  public function __construct(
    GotoToken $keyword,
    NameToken $label_name,
    SemicolonToken $semicolon,
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
    $keyword = $keyword as nonnull;
    $offset += $keyword->getWidth();
    $label_name = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['goto_statement_label_name'],
      $file,
      $offset,
      $source,
      'NameToken',
    );
    $label_name = $label_name as nonnull;
    $offset += $label_name->getWidth();
    $semicolon = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['goto_statement_semicolon'],
      $file,
      $offset,
      $source,
      'SemicolonToken',
    );
    $semicolon = $semicolon as nonnull;
    $offset += $semicolon->getWidth();
    $source_ref = shape(
      'file' => $file,
      'source' => $source,
      'offset' => $initial_offset,
      'width' => $offset - $initial_offset,
    );
    return new static(
      /* HH_IGNORE_ERROR[4110] */ $keyword,
      /* HH_IGNORE_ERROR[4110] */ $label_name,
      /* HH_IGNORE_ERROR[4110] */ $semicolon,
      $source_ref,
    );
  }

  <<__Override>>
  public function getChildren(): dict<string, Node> {
    return dict[
      'keyword' => $this->_keyword,
      'label_name' => $this->_label_name,
      'semicolon' => $this->_semicolon,
    ]
      |> Dict\filter_nulls($$);
  }

  <<__Override>>
  public function rewriteChildren<Tret as ?Node>(
    (function(Node, vec<Node>): Tret) $rewriter,
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
    return new static(
      /* HH_FIXME[4110] use `as` */ $keyword,
      /* HH_FIXME[4110] use `as` */ $label_name,
      /* HH_FIXME[4110] use `as` */ $semicolon,
    );
  }

  public function getKeywordUNTYPED(): ?Node {
    return $this->_keyword;
  }

  public function withKeyword(GotoToken $value): this {
    if ($value === $this->_keyword) {
      return $this;
    }
    return new static($value, $this->_label_name, $this->_semicolon);
  }

  public function hasKeyword(): bool {
    return $this->_keyword !== null;
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

  public function getLabelNameUNTYPED(): ?Node {
    return $this->_label_name;
  }

  public function withLabelName(NameToken $value): this {
    if ($value === $this->_label_name) {
      return $this;
    }
    return new static($this->_keyword, $value, $this->_semicolon);
  }

  public function hasLabelName(): bool {
    return $this->_label_name !== null;
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

  public function getSemicolonUNTYPED(): ?Node {
    return $this->_semicolon;
  }

  public function withSemicolon(SemicolonToken $value): this {
    if ($value === $this->_semicolon) {
      return $this;
    }
    return new static($this->_keyword, $this->_label_name, $value);
  }

  public function hasSemicolon(): bool {
    return $this->_semicolon !== null;
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
