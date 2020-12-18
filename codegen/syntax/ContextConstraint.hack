/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<32342174414cafdda7d89577207b225b>>
 */
namespace Facebook\HHAST;
use namespace Facebook\TypeAssert;
use namespace HH\Lib\Dict;

<<__ConsistentConstruct>>
final class ContextConstraint extends Node {

  const string SYNTAX_KIND = 'context_constraint';

  private ?Node $_keyword;
  private ?Node $_ctx_list;

  public function __construct(
    ?Node $keyword,
    ?Node $ctx_list,
    ?__Private\SourceRef $source_ref = null,
  ) {
    $this->_keyword = $keyword;
    $this->_ctx_list = $ctx_list;
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
      /* HH_FIXME[4110] */ $json['ctx_constraint_keyword'] ?? dict['kind' => 'missing'],
      $file,
      $offset,
      $source,
      'Node',
    );
    $offset += $keyword?->getWidth() ?? 0;
    $ctx_list = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['ctx_constraint_ctx_list'] ?? dict['kind' => 'missing'],
      $file,
      $offset,
      $source,
      'Node',
    );
    $offset += $ctx_list?->getWidth() ?? 0;
    $source_ref = shape(
      'file' => $file,
      'source' => $source,
      'offset' => $initial_offset,
      'width' => $offset - $initial_offset,
    );
    return new static(
      /* HH_IGNORE_ERROR[4110] */ $keyword,
      /* HH_IGNORE_ERROR[4110] */ $ctx_list,
      $source_ref,
    );
  }

  <<__Override>>
  public function getChildren(): dict<string, Node> {
    return dict[
      'keyword' => $this->_keyword,
      'ctx_list' => $this->_ctx_list,
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
    $ctx_list = $this->_ctx_list === null
      ? null
      : $rewriter($this->_ctx_list, $parents);
    if ($keyword === $this->_keyword && $ctx_list === $this->_ctx_list) {
      return $this;
    }
    return new static(
      /* HH_FIXME[4110] use `as` */ $keyword,
      /* HH_FIXME[4110] use `as` */ $ctx_list,
    );
  }

  public function getKeywordUNTYPED(): ?Node {
    return $this->_keyword;
  }

  public function withKeyword(?Node $value): this {
    if ($value === $this->_keyword) {
      return $this;
    }
    return new static($value, $this->_ctx_list);
  }

  public function hasKeyword(): bool {
    return $this->_keyword !== null;
  }

  /**
   * @return unknown
   */
  public function getKeyword(): ?Node {
    return $this->_keyword;
  }

  /**
   * @return unknown
   */
  public function getKeywordx(): Node {
    return TypeAssert\not_null($this->getKeyword());
  }

  public function getCtxListUNTYPED(): ?Node {
    return $this->_ctx_list;
  }

  public function withCtxList(?Node $value): this {
    if ($value === $this->_ctx_list) {
      return $this;
    }
    return new static($this->_keyword, $value);
  }

  public function hasCtxList(): bool {
    return $this->_ctx_list !== null;
  }

  /**
   * @return unknown
   */
  public function getCtxList(): ?Node {
    return $this->_ctx_list;
  }

  /**
   * @return unknown
   */
  public function getCtxListx(): Node {
    return TypeAssert\not_null($this->getCtxList());
  }
}
