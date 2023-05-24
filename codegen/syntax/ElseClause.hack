/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<390356a2040ed125251932d900a2a7eb>>
 */
namespace Facebook\HHAST;
use namespace Facebook\TypeAssert;
use namespace HH\Lib\Dict;
/* HHAST_IGNORE_ALL[5607] 5607 is ignored because of false positives when comparing a generic to a typed value */
/* HHAST_IGNORE_ALL[5624] HHAST_IGNORE_ALL[5639] 5624 and 5639 are ignored because they insist on using co(tra)variant generics. Could this break external consumers? */

<<__ConsistentConstruct>>
final class ElseClause extends Node implements IControlFlowStatement {

  const string SYNTAX_KIND = 'else_clause';

  private ElseToken $_keyword;
  private IStatement $_statement;

  public function __construct(
    ElseToken $keyword,
    IStatement $statement,
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
      ($json['else_keyword']) as dict<_, _>,
      $file,
      $offset,
      $source,
      'ElseToken',
    );
    $keyword = $keyword as nonnull;
    $offset += $keyword->getWidth();
    $statement = Node::fromJSON(
      ($json['else_statement']) as dict<_, _>,
      $file,
      $offset,
      $source,
      'IStatement',
    );
    $statement = $statement as nonnull;
    $offset += $statement->getWidth();
    $source_ref = shape(
      'file' => $file,
      'source' => $source,
      'offset' => $initial_offset,
      'width' => $offset - $initial_offset,
    );
    return
      new static($keyword as ElseToken, $statement as IStatement, $source_ref);
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
    return new static($keyword as ElseToken, $statement as IStatement);
  }

  public function getKeywordUNTYPED(): ?Node {
    return $this->_keyword;
  }

  public function withKeyword(ElseToken $value): this {
    if ($value === $this->_keyword) {
      return $this;
    }
    return new static($value, $this->_statement);
  }

  public function hasKeyword(): bool {
    return true;
  }

  /**
   * @return ElseToken
   */
  public function getKeyword(): ElseToken {
    return TypeAssert\instance_of(ElseToken::class, $this->_keyword);
  }

  /**
   * @return ElseToken
   */
  public function getKeywordx(): ElseToken {
    return $this->getKeyword();
  }

  public function getStatementUNTYPED(): ?Node {
    return $this->_statement;
  }

  public function withStatement(IStatement $value): this {
    if ($value === $this->_statement) {
      return $this;
    }
    return new static($this->_keyword, $value);
  }

  public function hasStatement(): bool {
    return true;
  }

  /**
   * @return CompoundStatement | EchoStatement | ExpressionStatement |
   * IfStatement | ReturnStatement
   */
  public function getStatement(): IStatement {
    return TypeAssert\instance_of(IStatement::class, $this->_statement);
  }

  /**
   * @return CompoundStatement | EchoStatement | ExpressionStatement |
   * IfStatement | ReturnStatement
   */
  public function getStatementx(): IStatement {
    return $this->getStatement();
  }
}
