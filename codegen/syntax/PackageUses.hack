/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<0fa01f717cb62e81f530c9fdea113c0a>>
 */
namespace Facebook\HHAST;
use namespace Facebook\TypeAssert;
use namespace HH\Lib\Dict;
/* HHAST_IGNORE_ALL[5607] 5607 is ignored because of false positives when comparing a generic to a typed value */
/* HHAST_IGNORE_ALL[5624] HHAST_IGNORE_ALL[5639] 5624 and 5639 are ignored because they insist on using co(tra)variant generics. Could this break external consumers? */

<<__ConsistentConstruct>>
final class PackageUses extends Node {

  const string SYNTAX_KIND = 'package_uses';

  private ?Node $_use_keyword;
  private ?Node $_left_brace;
  private ?Node $_uses;
  private ?Node $_right_brace;

  public function __construct(
    ?Node $use_keyword,
    ?Node $left_brace,
    ?Node $uses,
    ?Node $right_brace,
    ?__Private\SourceRef $source_ref = null,
  ) {
    $this->_use_keyword = $use_keyword;
    $this->_left_brace = $left_brace;
    $this->_uses = $uses;
    $this->_right_brace = $right_brace;
    parent::__construct($source_ref);
  }

  <<__Override>>
  public static function fromJSON(
    dict<arraykey, mixed> $json,
    string $file,
    int $initial_offset,
    string $source,
    string $_type_hint,
  ): this {
    $offset = $initial_offset;
    $use_keyword = Node::fromJSON(
      ($json['package_uses_use_keyword'] ?? dict['kind' => 'missing'])
        as dict<_, _>,
      $file,
      $offset,
      $source,
      'Node',
    );
    $offset += $use_keyword?->getWidth() ?? 0;
    $left_brace = Node::fromJSON(
      ($json['package_uses_left_brace'] ?? dict['kind' => 'missing'])
        as dict<_, _>,
      $file,
      $offset,
      $source,
      'Node',
    );
    $offset += $left_brace?->getWidth() ?? 0;
    $uses = Node::fromJSON(
      ($json['package_uses_uses'] ?? dict['kind' => 'missing']) as dict<_, _>,
      $file,
      $offset,
      $source,
      'Node',
    );
    $offset += $uses?->getWidth() ?? 0;
    $right_brace = Node::fromJSON(
      ($json['package_uses_right_brace'] ?? dict['kind' => 'missing'])
        as dict<_, _>,
      $file,
      $offset,
      $source,
      'Node',
    );
    $offset += $right_brace?->getWidth() ?? 0;
    $source_ref = shape(
      'file' => $file,
      'source' => $source,
      'offset' => $initial_offset,
      'width' => $offset - $initial_offset,
    );
    return new static(
      /* HH_IGNORE_ERROR[4110] */ $use_keyword,
      /* HH_IGNORE_ERROR[4110] */ $left_brace,
      /* HH_IGNORE_ERROR[4110] */ $uses,
      /* HH_IGNORE_ERROR[4110] */ $right_brace,
      $source_ref,
    );
  }

  <<__Override>>
  public function getChildren(): dict<string, Node> {
    return dict[
      'use_keyword' => $this->_use_keyword,
      'left_brace' => $this->_left_brace,
      'uses' => $this->_uses,
      'right_brace' => $this->_right_brace,
    ]
      |> Dict\filter_nulls($$);
  }

  <<__Override>>
  public function rewriteChildren<Tret as ?Node>(
    (function(Node, vec<Node>): Tret) $rewriter,
    vec<Node> $parents = vec[],
  ): this {
    $parents[] = $this;
    $use_keyword = $this->_use_keyword === null
      ? null
      : $rewriter($this->_use_keyword, $parents);
    $left_brace = $this->_left_brace === null
      ? null
      : $rewriter($this->_left_brace, $parents);
    $uses = $this->_uses === null ? null : $rewriter($this->_uses, $parents);
    $right_brace = $this->_right_brace === null
      ? null
      : $rewriter($this->_right_brace, $parents);
    if (
      $use_keyword === $this->_use_keyword &&
      $left_brace === $this->_left_brace &&
      $uses === $this->_uses &&
      $right_brace === $this->_right_brace
    ) {
      return $this;
    }
    return new static(
      $use_keyword as ?Node,
      $left_brace as ?Node,
      $uses as ?Node,
      $right_brace as ?Node,
    );
  }

  public function getUseKeywordUNTYPED(): ?Node {
    return $this->_use_keyword;
  }

  public function withUseKeyword(?Node $value): this {
    if ($value === $this->_use_keyword) {
      return $this;
    }
    return
      new static($value, $this->_left_brace, $this->_uses, $this->_right_brace);
  }

  public function hasUseKeyword(): bool {
    return $this->_use_keyword !== null;
  }

  /**
   * @return unknown
   */
  public function getUseKeyword(): ?Node {
    return $this->_use_keyword;
  }

  /**
   * @return unknown
   */
  public function getUseKeywordx(): Node {
    return TypeAssert\not_null($this->getUseKeyword());
  }

  public function getLeftBraceUNTYPED(): ?Node {
    return $this->_left_brace;
  }

  public function withLeftBrace(?Node $value): this {
    if ($value === $this->_left_brace) {
      return $this;
    }
    return new static(
      $this->_use_keyword,
      $value,
      $this->_uses,
      $this->_right_brace,
    );
  }

  public function hasLeftBrace(): bool {
    return $this->_left_brace !== null;
  }

  /**
   * @return unknown
   */
  public function getLeftBrace(): ?Node {
    return $this->_left_brace;
  }

  /**
   * @return unknown
   */
  public function getLeftBracex(): Node {
    return TypeAssert\not_null($this->getLeftBrace());
  }

  public function getUsesUNTYPED(): ?Node {
    return $this->_uses;
  }

  public function withUses(?Node $value): this {
    if ($value === $this->_uses) {
      return $this;
    }
    return new static(
      $this->_use_keyword,
      $this->_left_brace,
      $value,
      $this->_right_brace,
    );
  }

  public function hasUses(): bool {
    return $this->_uses !== null;
  }

  /**
   * @return unknown
   */
  public function getUses(): ?Node {
    return $this->_uses;
  }

  /**
   * @return unknown
   */
  public function getUsesx(): Node {
    return TypeAssert\not_null($this->getUses());
  }

  public function getRightBraceUNTYPED(): ?Node {
    return $this->_right_brace;
  }

  public function withRightBrace(?Node $value): this {
    if ($value === $this->_right_brace) {
      return $this;
    }
    return
      new static($this->_use_keyword, $this->_left_brace, $this->_uses, $value);
  }

  public function hasRightBrace(): bool {
    return $this->_right_brace !== null;
  }

  /**
   * @return unknown
   */
  public function getRightBrace(): ?Node {
    return $this->_right_brace;
  }

  /**
   * @return unknown
   */
  public function getRightBracex(): Node {
    return TypeAssert\not_null($this->getRightBrace());
  }
}
