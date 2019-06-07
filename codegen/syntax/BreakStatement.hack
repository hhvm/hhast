/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<9f5c2bf60cb3ad5db75f6ad6499e6c33>>
 */
namespace Facebook\HHAST;
use namespace Facebook\TypeAssert;

<<__ConsistentConstruct>>
final class BreakStatement extends Node implements IStatement {

  const string SYNTAX_KIND = 'break_statement';

  private Node $_keyword;
  private Node $_level;
  private Node $_semicolon;

  public function __construct(
    Node $keyword,
    Node $level,
    Node $semicolon,
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
    $offset += $keyword->getWidth();
    $level = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['break_level'],
      $file,
      $offset,
      $source,
      'LiteralExpression',
    );
    $offset += $level->getWidth();
    $semicolon = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['break_semicolon'],
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
    return new static($keyword, $level, $semicolon, $source_ref);
  }

  <<__Override>>
  public function getChildren(): dict<string, Node> {
    return dict[
      'keyword' => $this->_keyword,
      'level' => $this->_level,
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
    $level = $rewriter($this->_level, $parents);
    $semicolon = $rewriter($this->_semicolon, $parents);
    if (
      $keyword === $this->_keyword &&
      $level === $this->_level &&
      $semicolon === $this->_semicolon
    ) {
      return $this;
    }
    return new static($keyword, $level, $semicolon);
  }

  public function getKeywordUNTYPED(): Node {
    return $this->_keyword;
  }

  public function withKeyword(Node $value): this {
    if ($value === $this->_keyword) {
      return $this;
    }
    return new static($value, $this->_level, $this->_semicolon);
  }

  public function hasKeyword(): bool {
    return !$this->_keyword->isMissing();
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

  public function getLevelUNTYPED(): Node {
    return $this->_level;
  }

  public function withLevel(Node $value): this {
    if ($value === $this->_level) {
      return $this;
    }
    return new static($this->_keyword, $value, $this->_semicolon);
  }

  public function hasLevel(): bool {
    return !$this->_level->isMissing();
  }

  /**
   * @return LiteralExpression | null
   */
  public function getLevel(): ?LiteralExpression {
    if ($this->_level->isMissing()) {
      return null;
    }
    return TypeAssert\instance_of(LiteralExpression::class, $this->_level);
  }

  /**
   * @return LiteralExpression
   */
  public function getLevelx(): LiteralExpression {
    return TypeAssert\not_null($this->getLevel());
  }

  public function getSemicolonUNTYPED(): Node {
    return $this->_semicolon;
  }

  public function withSemicolon(Node $value): this {
    if ($value === $this->_semicolon) {
      return $this;
    }
    return new static($this->_keyword, $this->_level, $value);
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
