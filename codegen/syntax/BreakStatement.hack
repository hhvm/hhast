/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<20b05c5a01ce6aea14696f61e2dde63f>>
 */
namespace Facebook\HHAST;
use namespace Facebook\TypeAssert;
use namespace HH\Lib\Dict;

<<__ConsistentConstruct>>
final class BreakStatement extends Node implements IStatement {

  const string SYNTAX_KIND = 'break_statement';

  private BreakToken $_keyword;
  private ?LiteralExpression $_level;
  private SemicolonToken $_semicolon;

  public function __construct(
    BreakToken $keyword,
    ?LiteralExpression $level,
    SemicolonToken $semicolon,
    ?__Private\SourceRef $source_ref = null,
  ) {
    $this->_keyword = $keyword;
    $this->_level = $level;
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
      /* HH_FIXME[4110] */ $json['break_keyword'],
      $file,
      $offset,
      $source,
      'BreakToken',
    );
    $keyword = $keyword as nonnull;
    $offset += $keyword->getWidth();
    $level = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['break_level'] ?? dict['kind' => 'missing'],
      $file,
      $offset,
      $source,
      'LiteralExpression',
    );
    $offset += $level?->getWidth() ?? 0;
    $semicolon = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['break_semicolon'],
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
      /* HH_IGNORE_ERROR[4110] */ $level,
      /* HH_IGNORE_ERROR[4110] */ $semicolon,
      $source_ref,
    );
  }

  <<__Override>>
  public function getChildren(): dict<string, Node> {
    return dict[
      'keyword' => $this->_keyword,
      'level' => $this->_level,
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
    $level = $this->_level === null ? null : $rewriter($this->_level, $parents);
    $semicolon = $rewriter($this->_semicolon, $parents);
    if (
      $keyword === $this->_keyword &&
      $level === $this->_level &&
      $semicolon === $this->_semicolon
    ) {
      return $this;
    }
    return new static(
      /* HH_FIXME[4110] use `as` */ $keyword,
      /* HH_FIXME[4110] use `as` */ $level,
      /* HH_FIXME[4110] use `as` */ $semicolon,
    );
  }

  public function getKeywordUNTYPED(): ?Node {
    return $this->_keyword;
  }

  public function withKeyword(BreakToken $value): this {
    if ($value === $this->_keyword) {
      return $this;
    }
    return new static($value, $this->_level, $this->_semicolon);
  }

  public function hasKeyword(): bool {
    return $this->_keyword !== null;
  }

  /**
   * @return BreakToken
   */
  public function getKeyword(): BreakToken {
    return TypeAssert\instance_of(BreakToken::class, $this->_keyword);
  }

  /**
   * @return BreakToken
   */
  public function getKeywordx(): BreakToken {
    return $this->getKeyword();
  }

  public function getLevelUNTYPED(): ?Node {
    return $this->_level;
  }

  public function withLevel(?LiteralExpression $value): this {
    if ($value === $this->_level) {
      return $this;
    }
    return new static($this->_keyword, $value, $this->_semicolon);
  }

  public function hasLevel(): bool {
    return $this->_level !== null;
  }

  /**
   * @return LiteralExpression | null
   */
  public function getLevel(): ?LiteralExpression {
    return $this->_level;
  }

  /**
   * @return LiteralExpression
   */
  public function getLevelx(): LiteralExpression {
    return TypeAssert\not_null($this->getLevel());
  }

  public function getSemicolonUNTYPED(): ?Node {
    return $this->_semicolon;
  }

  public function withSemicolon(SemicolonToken $value): this {
    if ($value === $this->_semicolon) {
      return $this;
    }
    return new static($this->_keyword, $this->_level, $value);
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
