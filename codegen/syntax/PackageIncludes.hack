/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<8ddab217e385115c2ff9dfb4f36fa2fa>>
 */
namespace Facebook\HHAST;
use namespace Facebook\TypeAssert;
use namespace HH\Lib\Dict;
/* HHAST_IGNORE_ALL[5607] 5607 is ignored because of false positives when comparing a generic to a typed value */
/* HHAST_IGNORE_ALL[5624] HHAST_IGNORE_ALL[5639] 5624 and 5639 are ignored because they insist on using co(tra)variant generics. Could this break external consumers? */

<<__ConsistentConstruct>>
final class PackageIncludes extends Node {

  const string SYNTAX_KIND = 'package_includes';

  private ?Node $_include_keyword;
  private ?Node $_left_brace;
  private ?Node $_includes;
  private ?Node $_right_brace;

  public function __construct(
    ?Node $include_keyword,
    ?Node $left_brace,
    ?Node $includes,
    ?Node $right_brace,
    ?__Private\SourceRef $source_ref = null,
  ) {
    $this->_include_keyword = $include_keyword;
    $this->_left_brace = $left_brace;
    $this->_includes = $includes;
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
    $include_keyword = Node::fromJSON(
      ($json['package_includes_include_keyword'] ?? dict['kind' => 'missing'])
        as dict<_, _>,
      $file,
      $offset,
      $source,
      'Node',
    );
    $offset += $include_keyword?->getWidth() ?? 0;
    $left_brace = Node::fromJSON(
      ($json['package_includes_left_brace'] ?? dict['kind' => 'missing'])
        as dict<_, _>,
      $file,
      $offset,
      $source,
      'Node',
    );
    $offset += $left_brace?->getWidth() ?? 0;
    $includes = Node::fromJSON(
      ($json['package_includes_includes'] ?? dict['kind' => 'missing'])
        as dict<_, _>,
      $file,
      $offset,
      $source,
      'Node',
    );
    $offset += $includes?->getWidth() ?? 0;
    $right_brace = Node::fromJSON(
      ($json['package_includes_right_brace'] ?? dict['kind' => 'missing'])
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
      /* HH_IGNORE_ERROR[4110] */ $include_keyword,
      /* HH_IGNORE_ERROR[4110] */ $left_brace,
      /* HH_IGNORE_ERROR[4110] */ $includes,
      /* HH_IGNORE_ERROR[4110] */ $right_brace,
      $source_ref,
    );
  }

  <<__Override>>
  public function getChildren(): dict<string, Node> {
    return dict[
      'include_keyword' => $this->_include_keyword,
      'left_brace' => $this->_left_brace,
      'includes' => $this->_includes,
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
    $include_keyword = $this->_include_keyword === null
      ? null
      : $rewriter($this->_include_keyword, $parents);
    $left_brace = $this->_left_brace === null
      ? null
      : $rewriter($this->_left_brace, $parents);
    $includes =
      $this->_includes === null ? null : $rewriter($this->_includes, $parents);
    $right_brace = $this->_right_brace === null
      ? null
      : $rewriter($this->_right_brace, $parents);
    if (
      $include_keyword === $this->_include_keyword &&
      $left_brace === $this->_left_brace &&
      $includes === $this->_includes &&
      $right_brace === $this->_right_brace
    ) {
      return $this;
    }
    return new static(
      $include_keyword as ?Node,
      $left_brace as ?Node,
      $includes as ?Node,
      $right_brace as ?Node,
    );
  }

  public function getIncludeKeywordUNTYPED(): ?Node {
    return $this->_include_keyword;
  }

  public function withIncludeKeyword(?Node $value): this {
    if ($value === $this->_include_keyword) {
      return $this;
    }
    return new static(
      $value,
      $this->_left_brace,
      $this->_includes,
      $this->_right_brace,
    );
  }

  public function hasIncludeKeyword(): bool {
    return $this->_include_keyword !== null;
  }

  /**
   * @return unknown
   */
  public function getIncludeKeyword(): ?Node {
    return $this->_include_keyword;
  }

  /**
   * @return unknown
   */
  public function getIncludeKeywordx(): Node {
    return TypeAssert\not_null($this->getIncludeKeyword());
  }

  public function getLeftBraceUNTYPED(): ?Node {
    return $this->_left_brace;
  }

  public function withLeftBrace(?Node $value): this {
    if ($value === $this->_left_brace) {
      return $this;
    }
    return new static(
      $this->_include_keyword,
      $value,
      $this->_includes,
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

  public function getIncludesUNTYPED(): ?Node {
    return $this->_includes;
  }

  public function withIncludes(?Node $value): this {
    if ($value === $this->_includes) {
      return $this;
    }
    return new static(
      $this->_include_keyword,
      $this->_left_brace,
      $value,
      $this->_right_brace,
    );
  }

  public function hasIncludes(): bool {
    return $this->_includes !== null;
  }

  /**
   * @return unknown
   */
  public function getIncludes(): ?Node {
    return $this->_includes;
  }

  /**
   * @return unknown
   */
  public function getIncludesx(): Node {
    return TypeAssert\not_null($this->getIncludes());
  }

  public function getRightBraceUNTYPED(): ?Node {
    return $this->_right_brace;
  }

  public function withRightBrace(?Node $value): this {
    if ($value === $this->_right_brace) {
      return $this;
    }
    return new static(
      $this->_include_keyword,
      $this->_left_brace,
      $this->_includes,
      $value,
    );
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
