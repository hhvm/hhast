/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<4b868c9b98947cca3cdde4e453232e79>>
 */
namespace Facebook\HHAST;
use namespace Facebook\TypeAssert;

<<__ConsistentConstruct>>
final class ConcurrentStatement extends Node implements IStatement {

  const string SYNTAX_KIND = 'concurrent_statement';

  private Node $_keyword;
  private Node $_statement;

  public function __construct(
    Node $keyword,
    Node $statement,
    ?__Private\SourceRef $source_ref = null,
  ) {
    $this->_keyword = $keyword;
    $this->_statement = $statement;
    parent::__construct($source_ref);
  }

  <<__Override>>
  public static function fromJSON(
    dict<string, mixed> $json,
    string $file,
    int $initial_offset,
    string $source,
  ): this {
    $offset = $initial_offset;
    $keyword = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['concurrent_keyword'],
      $file,
      $offset,
      $source,
    );
    $offset += $keyword->getWidth();
    $statement = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['concurrent_statement'],
      $file,
      $offset,
      $source,
    );
    $offset += $statement->getWidth();
    $source_ref = shape(
      'file' => $file,
      'source' => $source,
      'offset' => $initial_offset,
      'width' => $offset - $initial_offset,
    );
    return new static($keyword, $statement, $source_ref);
  }

  <<__Override>>
  public function getChildren(): dict<string, Node> {
    return dict[
      'keyword' => $this->_keyword,
      'statement' => $this->_statement,
    ];
  }

  <<__Override>>
  public function rewriteChildren(
    self::TRewriter $rewriter,
    vec<Node> $parents = vec[],
  ): this {
    $parents[] = $this;
    $keyword = $rewriter($this->_keyword, $parents);
    $statement = $rewriter($this->_statement, $parents);
    if ($keyword === $this->_keyword && $statement === $this->_statement) {
      return $this;
    }
    return new static($keyword, $statement);
  }

  public function getKeywordUNTYPED(): Node {
    return $this->_keyword;
  }

  public function withKeyword(Node $value): this {
    if ($value === $this->_keyword) {
      return $this;
    }
    return new static($value, $this->_statement);
  }

  public function hasKeyword(): bool {
    return !$this->_keyword->isMissing();
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

  public function getStatementUNTYPED(): Node {
    return $this->_statement;
  }

  public function withStatement(Node $value): this {
    if ($value === $this->_statement) {
      return $this;
    }
    return new static($this->_keyword, $value);
  }

  public function hasStatement(): bool {
    return !$this->_statement->isMissing();
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
