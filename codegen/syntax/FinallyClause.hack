/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<29362d550571fffc19ae025baad52e8f>>
 */
namespace Facebook\HHAST;
use namespace Facebook\TypeAssert;
use namespace HH\Lib\Dict;

<<__ConsistentConstruct>>
final class FinallyClause extends Node {

  const string SYNTAX_KIND = 'finally_clause';

  private FinallyToken $_keyword;
  private CompoundStatement $_body;

  public function __construct(
    FinallyToken $keyword,
    CompoundStatement $body,
    ?__Private\SourceRef $source_ref = null,
  ) {
    $this->_keyword = $keyword;
    $this->_body = $body;
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
      /* HH_FIXME[4110] */ $json['finally_keyword'],
      $file,
      $offset,
      $source,
      'FinallyToken',
    );
    $keyword = $keyword as nonnull;
    $offset += $keyword->getWidth();
    $body = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['finally_body'],
      $file,
      $offset,
      $source,
      'CompoundStatement',
    );
    $body = $body as nonnull;
    $offset += $body->getWidth();
    $source_ref = shape(
      'file' => $file,
      'source' => $source,
      'offset' => $initial_offset,
      'width' => $offset - $initial_offset,
    );
    return new static(
      /* HH_IGNORE_ERROR[4110] */ $keyword,
      /* HH_IGNORE_ERROR[4110] */ $body,
      $source_ref,
    );
  }

  <<__Override>>
  public function getChildren(): dict<string, Node> {
    return dict[
      'keyword' => $this->_keyword,
      'body' => $this->_body,
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
    $body = $rewriter($this->_body, $parents);
    if ($keyword === $this->_keyword && $body === $this->_body) {
      return $this;
    }
    return new static(
      /* HH_FIXME[4110] use `as` */ $keyword,
      /* HH_FIXME[4110] use `as` */ $body,
    );
  }

  public function getKeywordUNTYPED(): ?Node {
    return $this->_keyword;
  }

  public function withKeyword(FinallyToken $value): this {
    if ($value === $this->_keyword) {
      return $this;
    }
    return new static($value, $this->_body);
  }

  public function hasKeyword(): bool {
    return $this->_keyword !== null;
  }

  /**
   * @return FinallyToken
   */
  public function getKeyword(): FinallyToken {
    return TypeAssert\instance_of(FinallyToken::class, $this->_keyword);
  }

  /**
   * @return FinallyToken
   */
  public function getKeywordx(): FinallyToken {
    return $this->getKeyword();
  }

  public function getBodyUNTYPED(): ?Node {
    return $this->_body;
  }

  public function withBody(CompoundStatement $value): this {
    if ($value === $this->_body) {
      return $this;
    }
    return new static($this->_keyword, $value);
  }

  public function hasBody(): bool {
    return $this->_body !== null;
  }

  /**
   * @return CompoundStatement
   */
  public function getBody(): CompoundStatement {
    return TypeAssert\instance_of(CompoundStatement::class, $this->_body);
  }

  /**
   * @return CompoundStatement
   */
  public function getBodyx(): CompoundStatement {
    return $this->getBody();
  }
}
