/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<ffcf7d834fddf52e681663f7fa4bee6d>>
 */
namespace Facebook\HHAST;
use namespace Facebook\TypeAssert;
use namespace HH\Lib\Dict;

<<__ConsistentConstruct>>
final class XHPRequired extends Node {

  const string SYNTAX_KIND = 'xhp_required';

  private AtToken $_at;
  private RequiredToken $_keyword;

  public function __construct(
    AtToken $at,
    RequiredToken $keyword,
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
      /* HH_FIXME[4110] */ $json['xhp_required_at'],
      $file,
      $offset,
      $source,
      'AtToken',
    );
    $at = $at as nonnull;
    $offset += $at->getWidth();
    $keyword = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['xhp_required_keyword'],
      $file,
      $offset,
      $source,
      'RequiredToken',
    );
    $keyword = $keyword as nonnull;
    $offset += $keyword->getWidth();
    $source_ref = shape(
      'file' => $file,
      'source' => $source,
      'offset' => $initial_offset,
      'width' => $offset - $initial_offset,
    );
    return new static(
      /* HH_IGNORE_ERROR[4110] */ $at,
      /* HH_IGNORE_ERROR[4110] */ $keyword,
      $source_ref,
    );
  }

  <<__Override>>
  public function getChildren(): dict<string, Node> {
    return dict[
      'at' => $this->_at,
      'keyword' => $this->_keyword,
    ]
      |> Dict\filter_nulls($$);
  }

  <<__Override>>
  public function rewriteChildren<Tret as ?Node>(
    (function(Node, vec<Node>): Tret) $rewriter,
    vec<Node> $parents = vec[],
  ): this {
    $parents[] = $this;
    $at = $rewriter($this->_at, $parents);
    $keyword = $rewriter($this->_keyword, $parents);
    if ($at === $this->_at && $keyword === $this->_keyword) {
      return $this;
    }
    return new static(
      /* HH_FIXME[4110] use `as` */ $at,
      /* HH_FIXME[4110] use `as` */ $keyword,
    );
  }

  public function getAtUNTYPED(): ?Node {
    return $this->_at;
  }

  public function withAt(AtToken $value): this {
    if ($value === $this->_at) {
      return $this;
    }
    return new static($value, $this->_keyword);
  }

  public function hasAt(): bool {
    return $this->_at !== null;
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

  public function getKeywordUNTYPED(): ?Node {
    return $this->_keyword;
  }

  public function withKeyword(RequiredToken $value): this {
    if ($value === $this->_keyword) {
      return $this;
    }
    return new static($this->_at, $value);
  }

  public function hasKeyword(): bool {
    return $this->_keyword !== null;
  }

  /**
   * @return RequiredToken
   */
  public function getKeyword(): RequiredToken {
    return TypeAssert\instance_of(RequiredToken::class, $this->_keyword);
  }

  /**
   * @return RequiredToken
   */
  public function getKeywordx(): RequiredToken {
    return $this->getKeyword();
  }
}
