/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<debe6bcf1ec67c1dc3497f2a7cdcb67f>>
 */
namespace Facebook\HHAST;
use namespace Facebook\TypeAssert;
use namespace HH\Lib\Dict;

<<__ConsistentConstruct>>
final class DefaultLabel extends Node implements ISwitchLabel {

  const string SYNTAX_KIND = 'default_label';

  private DefaultToken $_keyword;
  private ColonToken $_colon;

  public function __construct(
    DefaultToken $keyword,
    ColonToken $colon,
    ?__Private\SourceRef $source_ref = null,
  ) {
    $this->_keyword = $keyword;
    $this->_colon = $colon;
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
      /* HH_FIXME[4110] */ $json['default_keyword'],
      $file,
      $offset,
      $source,
      'DefaultToken',
    );
    $keyword = $keyword as nonnull;
    $offset += $keyword->getWidth();
    $colon = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['default_colon'],
      $file,
      $offset,
      $source,
      'ColonToken',
    );
    $colon = $colon as nonnull;
    $offset += $colon->getWidth();
    $source_ref = shape(
      'file' => $file,
      'source' => $source,
      'offset' => $initial_offset,
      'width' => $offset - $initial_offset,
    );
    return new static(
      /* HH_IGNORE_ERROR[4110] */ $keyword,
      /* HH_IGNORE_ERROR[4110] */ $colon,
      $source_ref,
    );
  }

  <<__Override>>
  public function getChildren(): dict<string, Node> {
    return dict[
      'keyword' => $this->_keyword,
      'colon' => $this->_colon,
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
    $colon = $rewriter($this->_colon, $parents);
    if ($keyword === $this->_keyword && $colon === $this->_colon) {
      return $this;
    }
    return new static(
      /* HH_FIXME[4110] use `as` */ $keyword,
      /* HH_FIXME[4110] use `as` */ $colon,
    );
  }

  public function getKeywordUNTYPED(): ?Node {
    return $this->_keyword;
  }

  public function withKeyword(DefaultToken $value): this {
    if ($value === $this->_keyword) {
      return $this;
    }
    return new static($value, $this->_colon);
  }

  public function hasKeyword(): bool {
    return $this->_keyword !== null;
  }

  /**
   * @return DefaultToken
   */
  public function getKeyword(): DefaultToken {
    return TypeAssert\instance_of(DefaultToken::class, $this->_keyword);
  }

  /**
   * @return DefaultToken
   */
  public function getKeywordx(): DefaultToken {
    return $this->getKeyword();
  }

  public function getColonUNTYPED(): ?Node {
    return $this->_colon;
  }

  public function withColon(ColonToken $value): this {
    if ($value === $this->_colon) {
      return $this;
    }
    return new static($this->_keyword, $value);
  }

  public function hasColon(): bool {
    return $this->_colon !== null;
  }

  /**
   * @return ColonToken
   */
  public function getColon(): ColonToken {
    return TypeAssert\instance_of(ColonToken::class, $this->_colon);
  }

  /**
   * @return ColonToken
   */
  public function getColonx(): ColonToken {
    return $this->getColon();
  }
}
