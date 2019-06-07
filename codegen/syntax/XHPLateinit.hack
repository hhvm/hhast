/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<7b89df0f29ce016d50a3495055475d7b>>
 */
namespace Facebook\HHAST;
use namespace Facebook\TypeAssert;

<<__ConsistentConstruct>>
final class XHPLateinit extends Node {

  const string SYNTAX_KIND = 'xhp_lateinit';

  private Node $_at;
  private Node $_keyword;

  public function __construct(
    Node $at,
    Node $keyword,
    ?__Private\SourceRef $source_ref = null,
  ) {
    $this->_at = $at;
    $this->_keyword = $keyword;
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
    $at = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['xhp_lateinit_at'],
      $file,
      $offset,
      $source,
      'AtToken',
    );
    $offset += $at->getWidth();
    $keyword = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['xhp_lateinit_keyword'],
      $file,
      $offset,
      $source,
      'LateinitToken',
    );
    $offset += $keyword->getWidth();
    $source_ref = shape(
      'file' => $file,
      'source' => $source,
      'offset' => $initial_offset,
      'width' => $offset - $initial_offset,
    );
    return new static($at, $keyword, $source_ref);
  }

  <<__Override>>
  public function getChildren(): dict<string, Node> {
    return dict[
      'at' => $this->_at,
      'keyword' => $this->_keyword,
    ];
  }

  <<__Override>>
  public function rewriteChildren(
    self::TRewriter $rewriter,
    vec<Node> $parents = vec[],
  ): this {
    $parents[] = $this;
    $at = $rewriter($this->_at, $parents);
    $keyword = $rewriter($this->_keyword, $parents);
    if ($at === $this->_at && $keyword === $this->_keyword) {
      return $this;
    }
    return new static($at, $keyword);
  }

  public function getAtUNTYPED(): Node {
    return $this->_at;
  }

  public function withAt(Node $value): this {
    if ($value === $this->_at) {
      return $this;
    }
    return new static($value, $this->_keyword);
  }

  public function hasAt(): bool {
    return !$this->_at->isMissing();
  }

  /**
   * @return AtToken
   */
  public function getAt(): AtToken {
    return TypeAssert\instance_of(AtToken::class, $this->_at);
  }

  /**
   * @return AtToken
   */
  public function getAtx(): AtToken {
    return $this->getAt();
  }

  public function getKeywordUNTYPED(): Node {
    return $this->_keyword;
  }

  public function withKeyword(Node $value): this {
    if ($value === $this->_keyword) {
      return $this;
    }
    return new static($this->_at, $value);
  }

  public function hasKeyword(): bool {
    return !$this->_keyword->isMissing();
  }

  /**
   * @return LateinitToken
   */
  public function getKeyword(): LateinitToken {
    return TypeAssert\instance_of(LateinitToken::class, $this->_keyword);
  }

  /**
   * @return LateinitToken
   */
  public function getKeywordx(): LateinitToken {
    return $this->getKeyword();
  }
}
