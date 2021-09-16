/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<5fba3eeb540264862d2cbaf39c2a5555>>
 */
namespace Facebook\HHAST;
use namespace Facebook\TypeAssert;
use namespace HH\Lib\Dict;

<<__ConsistentConstruct>>
final class ConcurrentStatement extends Node implements IStatement {

  const string SYNTAX_KIND = 'concurrent_statement';

  private ConcurrentToken $_keyword;
  private CompoundStatement $_statement;

  public function __construct(
    ConcurrentToken $keyword,
    CompoundStatement $statement,
    ?__Private\SourceRef $source_ref = null,
  ) {
    $this->_keyword = $keyword;
    $this->_statement = $statement;
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
      ($json['concurrent_keyword']) as dict<_, _>,
      $file,
      $offset,
      $source,
      'ConcurrentToken',
    );
    $keyword = $keyword as nonnull;
    $offset += $keyword->getWidth();
    $statement = Node::fromJSON(
      ($json['concurrent_statement']) as dict<_, _>,
      $file,
      $offset,
      $source,
      'CompoundStatement',
    );
    $statement = $statement as nonnull;
    $offset += $statement->getWidth();
    $source_ref = shape(
      'file' => $file,
      'source' => $source,
      'offset' => $initial_offset,
      'width' => $offset - $initial_offset,
    );
    return new static(
      /* HH_IGNORE_ERROR[4110] */ $keyword,
      /* HH_IGNORE_ERROR[4110] */ $statement,
      $source_ref,
    );
  }

  <<__Override>>
  public function getChildren(): dict<string, Node> {
    return dict[
      'keyword' => $this->_keyword,
      'statement' => $this->_statement,
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
    $statement = $rewriter($this->_statement, $parents);
    if ($keyword === $this->_keyword && $statement === $this->_statement) {
      return $this;
    }
    return
      new static($keyword as ConcurrentToken, $statement as CompoundStatement);
  }

  public function getKeywordUNTYPED(): ?Node {
    return $this->_keyword;
  }

  public function withKeyword(ConcurrentToken $value): this {
    if ($value === $this->_keyword) {
      return $this;
    }
    return new static($value, $this->_statement);
  }

  public function hasKeyword(): bool {
    return $this->_keyword !== null;
  }

  /**
   * @return ConcurrentToken
   */
  public function getKeyword(): ConcurrentToken {
    return TypeAssert\instance_of(ConcurrentToken::class, $this->_keyword);
  }

  /**
   * @return ConcurrentToken
   */
  public function getKeywordx(): ConcurrentToken {
    return $this->getKeyword();
  }

  public function getStatementUNTYPED(): ?Node {
    return $this->_statement;
  }

  public function withStatement(CompoundStatement $value): this {
    if ($value === $this->_statement) {
      return $this;
    }
    return new static($this->_keyword, $value);
  }

  public function hasStatement(): bool {
    return $this->_statement !== null;
  }

  /**
   * @return CompoundStatement
   */
  public function getStatement(): CompoundStatement {
    return TypeAssert\instance_of(CompoundStatement::class, $this->_statement);
  }

  /**
   * @return CompoundStatement
   */
  public function getStatementx(): CompoundStatement {
    return $this->getStatement();
  }
}
