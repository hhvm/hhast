/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<95cc8b9a72884becaee4139a0b2ab4c1>>
 */
namespace Facebook\HHAST;
use namespace Facebook\TypeAssert;
use namespace HH\Lib\Dict;

<<__ConsistentConstruct>>
final class ContextConstraint extends Node {

  const string SYNTAX_KIND = 'context_constraint';

  private Token $_keyword;
  private Contexts $_ctx_list;

  public function __construct(
    Token $keyword,
    Contexts $ctx_list,
    ?__Private\SourceRef $source_ref = null,
  ) {
    $this->_keyword = $keyword;
    $this->_ctx_list = $ctx_list;
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
    $keyword = Node::fromJSON(
      ($json['ctx_constraint_keyword']) as dict<_, _>,
      $file,
      $offset,
      $source,
      'Token',
    );
    $keyword = $keyword as nonnull;
    $offset += $keyword->getWidth();
    $ctx_list = Node::fromJSON(
      ($json['ctx_constraint_ctx_list']) as dict<_, _>,
      $file,
      $offset,
      $source,
      'Contexts',
    );
    $ctx_list = $ctx_list as nonnull;
    $offset += $ctx_list->getWidth();
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
    $keyword = $rewriter($this->_keyword, $parents);
    $ctx_list = $rewriter($this->_ctx_list, $parents);
    if ($keyword === $this->_keyword && $ctx_list === $this->_ctx_list) {
      return $this;
    }
    return new static($keyword as Token, $ctx_list as Contexts);
  }

  public function getKeywordUNTYPED(): ?Node {
    return $this->_keyword;
  }

  public function withKeyword(Token $value): this {
    if ($value === $this->_keyword) {
      return $this;
    }
    return new static($value, $this->_ctx_list);
  }

  public function hasKeyword(): bool {
    return $this->_keyword !== null;
  }

  /**
   * @return AsToken | SuperToken
   */
  public function getKeyword(): Token {
    return TypeAssert\instance_of(Token::class, $this->_keyword);
  }

  /**
   * @return AsToken | SuperToken
   */
  public function getKeywordx(): Token {
    return $this->getKeyword();
  }

  public function getCtxListUNTYPED(): ?Node {
    return $this->_ctx_list;
  }

  public function withCtxList(Contexts $value): this {
    if ($value === $this->_ctx_list) {
      return $this;
    }
    return new static($this->_keyword, $value);
  }

  public function hasCtxList(): bool {
    return $this->_ctx_list !== null;
  }

  /**
   * @return Contexts
   */
  public function getCtxList(): Contexts {
    return TypeAssert\instance_of(Contexts::class, $this->_ctx_list);
  }

  /**
   * @return Contexts
   */
  public function getCtxListx(): Contexts {
    return $this->getCtxList();
  }
}
