/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<d1ad8073a456828243f22cfb7575a893>>
 */
namespace Facebook\HHAST;
use namespace Facebook\TypeAssert;
use namespace HH\Lib\Dict;

<<__ConsistentConstruct>>
final class SwitchFallthrough extends Node implements IStatement {

  const string SYNTAX_KIND = 'switch_fallthrough';

  private ?Node $_keyword;
  private ?Node $_semicolon;

  public function __construct(
    ?Node $keyword,
    ?Node $semicolon,
    ?__Private\SourceRef $source_ref = null,
  ) {
    $this->_keyword = $keyword;
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
      /* HH_FIXME[4110] */ $json['fallthrough_keyword'] ?? dict['kind' => 'missing'],
      $file,
      $offset,
      $source,
      'Node',
    );
    $offset += $keyword?->getWidth() ?? 0;
    $semicolon = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['fallthrough_semicolon'] ?? dict['kind' => 'missing'],
      $file,
      $offset,
      $source,
      'Node',
    );
    $offset += $semicolon?->getWidth() ?? 0;
    $source_ref = shape(
      'file' => $file,
      'source' => $source,
      'offset' => $initial_offset,
      'width' => $offset - $initial_offset,
    );
    return new static(
      /* HH_IGNORE_ERROR[4110] */ $keyword,
      /* HH_IGNORE_ERROR[4110] */ $semicolon,
      $source_ref,
    );
  }

  <<__Override>>
  public function getChildren(): dict<string, Node> {
    return dict[
      'keyword' => $this->_keyword,
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
    $keyword = $this->_keyword === null
      ? null
      : $rewriter($this->_keyword, $parents);
    $semicolon = $this->_semicolon === null
      ? null
      : $rewriter($this->_semicolon, $parents);
    if ($keyword === $this->_keyword && $semicolon === $this->_semicolon) {
      return $this;
    }
    return new static(
      /* HH_FIXME[4110] use `as` */ $keyword,
      /* HH_FIXME[4110] use `as` */ $semicolon,
    );
  }

  public function getKeywordUNTYPED(): ?Node {
    return $this->_keyword;
  }

  public function withKeyword(?Node $value): this {
    if ($value === $this->_keyword) {
      return $this;
    }
    return new static($value, $this->_semicolon);
  }

  public function hasKeyword(): bool {
    return $this->_keyword !== null;
  }

  /**
   * @return null
   */
  public function getKeyword(): ?Node {
    return $this->_keyword;
  }

  /**
   * @return
   */
  public function getKeywordx(): Node {
    return TypeAssert\not_null($this->getKeyword());
  }

  public function getSemicolonUNTYPED(): ?Node {
    return $this->_semicolon;
  }

  public function withSemicolon(?Node $value): this {
    if ($value === $this->_semicolon) {
      return $this;
    }
    return new static($this->_keyword, $value);
  }

  public function hasSemicolon(): bool {
    return $this->_semicolon !== null;
  }

  /**
   * @return null
   */
  public function getSemicolon(): ?Node {
    return $this->_semicolon;
  }

  /**
   * @return
   */
  public function getSemicolonx(): Node {
    return TypeAssert\not_null($this->getSemicolon());
  }
}
