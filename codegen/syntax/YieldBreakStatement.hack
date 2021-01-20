/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<cd6859bda937699ed63706754dd80b4a>>
 */
namespace Facebook\HHAST;
use namespace Facebook\TypeAssert;
use namespace HH\Lib\Dict;

<<__ConsistentConstruct>>
final class YieldBreakStatement extends Node implements IStatement {

  const string SYNTAX_KIND = 'yield_break_statement';

  private YieldToken $_keyword;
  private BreakToken $_break;
  private SemicolonToken $_semicolon;

  public function __construct(
    YieldToken $keyword,
    BreakToken $break,
    SemicolonToken $semicolon,
    ?__Private\SourceRef $source_ref = null,
  ) {
    $this->_keyword = $keyword;
    $this->_break = $break;
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
      /* HH_FIXME[4110] */ $json['yield_break_keyword'],
      $file,
      $offset,
      $source,
      'YieldToken',
    );
    $keyword = $keyword as nonnull;
    $offset += $keyword->getWidth();
    $break = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['yield_break_break'],
      $file,
      $offset,
      $source,
      'BreakToken',
    );
    $break = $break as nonnull;
    $offset += $break->getWidth();
    $semicolon = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['yield_break_semicolon'],
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
      /* HH_IGNORE_ERROR[4110] */ $break,
      /* HH_IGNORE_ERROR[4110] */ $semicolon,
      $source_ref,
    );
  }

  <<__Override>>
  public function getChildren(): dict<string, Node> {
    return dict[
      'keyword' => $this->_keyword,
      'break' => $this->_break,
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
    $break = $rewriter($this->_break, $parents);
    $semicolon = $rewriter($this->_semicolon, $parents);
    if (
      $keyword === $this->_keyword &&
      $break === $this->_break &&
      $semicolon === $this->_semicolon
    ) {
      return $this;
    }
    return new static(
      /* HH_FIXME[4110] use `as` */ $keyword,
      /* HH_FIXME[4110] use `as` */ $break,
      /* HH_FIXME[4110] use `as` */ $semicolon,
    );
  }

  public function getKeywordUNTYPED(): ?Node {
    return $this->_keyword;
  }

  public function withKeyword(YieldToken $value): this {
    if ($value === $this->_keyword) {
      return $this;
    }
    return new static($value, $this->_break, $this->_semicolon);
  }

  public function hasKeyword(): bool {
    return $this->_keyword !== null;
  }

  /**
   * @return YieldToken
   */
  public function getKeyword(): YieldToken {
    return TypeAssert\instance_of(YieldToken::class, $this->_keyword);
  }

  /**
   * @return YieldToken
   */
  public function getKeywordx(): YieldToken {
    return $this->getKeyword();
  }

  public function getBreakUNTYPED(): ?Node {
    return $this->_break;
  }

  public function withBreak(BreakToken $value): this {
    if ($value === $this->_break) {
      return $this;
    }
    return new static($this->_keyword, $value, $this->_semicolon);
  }

  public function hasBreak(): bool {
    return $this->_break !== null;
  }

  /**
   * @return BreakToken
   */
  public function getBreak(): BreakToken {
    return TypeAssert\instance_of(BreakToken::class, $this->_break);
  }

  /**
   * @return BreakToken
   */
  public function getBreakx(): BreakToken {
    return $this->getBreak();
  }

  public function getSemicolonUNTYPED(): ?Node {
    return $this->_semicolon;
  }

  public function withSemicolon(SemicolonToken $value): this {
    if ($value === $this->_semicolon) {
      return $this;
    }
    return new static($this->_keyword, $this->_break, $value);
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
