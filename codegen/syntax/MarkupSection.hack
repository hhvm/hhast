/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<ee5c4f225cf5b2765a40725abeb6bb49>>
 */
namespace Facebook\HHAST;
use namespace Facebook\TypeAssert;
use namespace HH\Lib\Dict;

<<__ConsistentConstruct>>
final class MarkupSection extends Node {

  const string SYNTAX_KIND = 'markup_section';

  private HashbangToken $_hashbang;
  private ?MarkupSuffix $_suffix;

  public function __construct(
    HashbangToken $hashbang,
    ?MarkupSuffix $suffix,
    ?__Private\SourceRef $source_ref = null,
  ) {
    $this->_hashbang = $hashbang;
    $this->_suffix = $suffix;
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
    $hashbang = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['markup_hashbang'],
      $file,
      $offset,
      $source,
      'HashbangToken',
    );
    $hashbang = $hashbang as nonnull;
    $offset += $hashbang->getWidth();
    $suffix = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['markup_suffix'] ?? dict['kind' => 'missing'],
      $file,
      $offset,
      $source,
      'MarkupSuffix',
    );
    $offset += $suffix?->getWidth() ?? 0;
    $source_ref = shape(
      'file' => $file,
      'source' => $source,
      'offset' => $initial_offset,
      'width' => $offset - $initial_offset,
    );
    return new static(
      /* HH_IGNORE_ERROR[4110] */ $hashbang,
      /* HH_IGNORE_ERROR[4110] */ $suffix,
      $source_ref,
    );
  }

  <<__Override>>
  public function getChildren(): dict<string, Node> {
    return dict[
      'hashbang' => $this->_hashbang,
      'suffix' => $this->_suffix,
    ]
      |> Dict\filter_nulls($$);
  }

  <<__Override>>
  public function rewriteChildren<Tret as ?Node>(
    (function(Node, vec<Node>): Tret) $rewriter,
    vec<Node> $parents = vec[],
  ): this {
    $parents[] = $this;
    $hashbang = $rewriter($this->_hashbang, $parents);
    $suffix = $this->_suffix === null
      ? null
      : $rewriter($this->_suffix, $parents);
    if ($hashbang === $this->_hashbang && $suffix === $this->_suffix) {
      return $this;
    }
    return new static(
      /* HH_FIXME[4110] use `as` */ $hashbang,
      /* HH_FIXME[4110] use `as` */ $suffix,
    );
  }

  public function getHashbangUNTYPED(): ?Node {
    return $this->_hashbang;
  }

  public function withHashbang(HashbangToken $value): this {
    if ($value === $this->_hashbang) {
      return $this;
    }
    return new static($value, $this->_suffix);
  }

  public function hasHashbang(): bool {
    return $this->_hashbang !== null;
  }

  /**
   * @return HashbangToken
   */
  public function getHashbang(): HashbangToken {
    return TypeAssert\instance_of(HashbangToken::class, $this->_hashbang);
  }

  /**
   * @return HashbangToken
   */
  public function getHashbangx(): HashbangToken {
    return $this->getHashbang();
  }

  public function getSuffixUNTYPED(): ?Node {
    return $this->_suffix;
  }

  public function withSuffix(?MarkupSuffix $value): this {
    if ($value === $this->_suffix) {
      return $this;
    }
    return new static($this->_hashbang, $value);
  }

  public function hasSuffix(): bool {
    return $this->_suffix !== null;
  }

  /**
   * @return MarkupSuffix | null
   */
  public function getSuffix(): ?MarkupSuffix {
    return $this->_suffix;
  }

  /**
   * @return MarkupSuffix
   */
  public function getSuffixx(): MarkupSuffix {
    return TypeAssert\not_null($this->getSuffix());
  }
}
