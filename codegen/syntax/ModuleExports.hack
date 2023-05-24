/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<620aadd00bffc91a9642c0c4fcc095ed>>
 */
namespace Facebook\HHAST;
use namespace Facebook\TypeAssert;
use namespace HH\Lib\Dict;
/* HHAST_IGNORE_ALL[5607] 5607 is ignored because of false positives when comparing a generic to a typed value */
/* HHAST_IGNORE_ALL[5624] HHAST_IGNORE_ALL[5639] 5624 and 5639 are ignored because they insist on using co(tra)variant generics. Could this break external consumers? */

<<__ConsistentConstruct>>
final class ModuleExports extends Node {

  const string SYNTAX_KIND = 'module_exports';

  private ?Node $_exports_keyword;
  private ?Node $_left_brace;
  private ?Node $_exports;
  private ?Node $_right_brace;

  public function __construct(
    ?Node $exports_keyword,
    ?Node $left_brace,
    ?Node $exports,
    ?Node $right_brace,
    ?__Private\SourceRef $source_ref = null,
  ) {
    $this->_exports_keyword = $exports_keyword;
    $this->_left_brace = $left_brace;
    $this->_exports = $exports;
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
    $exports_keyword = Node::fromJSON(
      ($json['module_exports_exports_keyword'] ?? dict['kind' => 'missing'])
        as dict<_, _>,
      $file,
      $offset,
      $source,
      'Node',
    );
    $offset += $exports_keyword?->getWidth() ?? 0;
    $left_brace = Node::fromJSON(
      ($json['module_exports_left_brace'] ?? dict['kind' => 'missing'])
        as dict<_, _>,
      $file,
      $offset,
      $source,
      'Node',
    );
    $offset += $left_brace?->getWidth() ?? 0;
    $exports = Node::fromJSON(
      ($json['module_exports_exports'] ?? dict['kind' => 'missing'])
        as dict<_, _>,
      $file,
      $offset,
      $source,
      'Node',
    );
    $offset += $exports?->getWidth() ?? 0;
    $right_brace = Node::fromJSON(
      ($json['module_exports_right_brace'] ?? dict['kind' => 'missing'])
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
      $exports_keyword,
      $left_brace,
      $exports,
      $right_brace,
      $source_ref,
    );
  }

  <<__Override>>
  public function getChildren(): dict<string, Node> {
    return dict[
      'exports_keyword' => $this->_exports_keyword,
      'left_brace' => $this->_left_brace,
      'exports' => $this->_exports,
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
    $exports_keyword = $this->_exports_keyword === null
      ? null
      : $rewriter($this->_exports_keyword, $parents);
    $left_brace = $this->_left_brace === null
      ? null
      : $rewriter($this->_left_brace, $parents);
    $exports =
      $this->_exports === null ? null : $rewriter($this->_exports, $parents);
    $right_brace = $this->_right_brace === null
      ? null
      : $rewriter($this->_right_brace, $parents);
    if (
      $exports_keyword === $this->_exports_keyword &&
      $left_brace === $this->_left_brace &&
      $exports === $this->_exports &&
      $right_brace === $this->_right_brace
    ) {
      return $this;
    }
    return new static(
      $exports_keyword as ?Node,
      $left_brace as ?Node,
      $exports as ?Node,
      $right_brace as ?Node,
    );
  }

  public function getExportsKeywordUNTYPED(): ?Node {
    return $this->_exports_keyword;
  }

  public function withExportsKeyword(?Node $value): this {
    if ($value === $this->_exports_keyword) {
      return $this;
    }
    return new static(
      $value,
      $this->_left_brace,
      $this->_exports,
      $this->_right_brace,
    );
  }

  public function hasExportsKeyword(): bool {
    return $this->_exports_keyword !== null;
  }

  /**
   * @return unknown
   */
  public function getExportsKeyword(): ?Node {
    return $this->_exports_keyword;
  }

  /**
   * @return unknown
   */
  public function getExportsKeywordx(): Node {
    return TypeAssert\not_null($this->getExportsKeyword());
  }

  public function getLeftBraceUNTYPED(): ?Node {
    return $this->_left_brace;
  }

  public function withLeftBrace(?Node $value): this {
    if ($value === $this->_left_brace) {
      return $this;
    }
    return new static(
      $this->_exports_keyword,
      $value,
      $this->_exports,
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

  public function getExportsUNTYPED(): ?Node {
    return $this->_exports;
  }

  public function withExports(?Node $value): this {
    if ($value === $this->_exports) {
      return $this;
    }
    return new static(
      $this->_exports_keyword,
      $this->_left_brace,
      $value,
      $this->_right_brace,
    );
  }

  public function hasExports(): bool {
    return $this->_exports !== null;
  }

  /**
   * @return unknown
   */
  public function getExports(): ?Node {
    return $this->_exports;
  }

  /**
   * @return unknown
   */
  public function getExportsx(): Node {
    return TypeAssert\not_null($this->getExports());
  }

  public function getRightBraceUNTYPED(): ?Node {
    return $this->_right_brace;
  }

  public function withRightBrace(?Node $value): this {
    if ($value === $this->_right_brace) {
      return $this;
    }
    return new static(
      $this->_exports_keyword,
      $this->_left_brace,
      $this->_exports,
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
