/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<f5cce87b7cb736dfa694b8a5b24425aa>>
 */
namespace Facebook\HHAST;
use namespace Facebook\TypeAssert;
use namespace HH\Lib\Dict;
/* HHAST_IGNORE_ALL[5607] 5607 is ignored because of false positives when comparing a generic to a typed value */
/* HHAST_IGNORE_ALL[5624] HHAST_IGNORE_ALL[5639] 5624 and 5639 are ignored because they insist on using co(tra)variant generics. Could this break external consumers? */

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
    dict<arraykey, mixed> $json,
    string $file,
    int $initial_offset,
    string $source,
    string $_type_hint,
  ): this {
    $offset = $initial_offset;
    $keyword = Node::fromJSON(
      ($json['finally_keyword']) as dict<_, _>,
      $file,
      $offset,
      $source,
      'FinallyToken',
    );
    $keyword = $keyword as nonnull;
    $offset += $keyword->getWidth();
    $body = Node::fromJSON(
      ($json['finally_body']) as dict<_, _>,
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
    return new static($keyword as FinallyToken, $body as CompoundStatement);
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
    return true;
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
    return true;
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
