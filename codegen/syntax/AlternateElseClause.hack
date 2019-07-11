/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<18fc8c278c6931c188b821c5e6dd9488>>
 */
namespace Facebook\HHAST;
use namespace Facebook\TypeAssert;
use namespace HH\Lib\Dict;

<<__ConsistentConstruct>>
final class AlternateElseClause extends Node implements IControlFlowStatement {

  const string SYNTAX_KIND = 'alternate_else_clause';

  private ElseToken $_keyword;
  private ColonToken $_colon;
  private NodeList<IStatement> $_statement;

  public function __construct(
    ElseToken $keyword,
    ColonToken $colon,
    NodeList<IStatement> $statement,
    ?__Private\SourceRef $source_ref = null,
  ) {
    $this->_keyword = $keyword;
    $this->_colon = $colon;
    $this->_statement = $statement;
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
      /* HH_FIXME[4110] */ $json['alternate_else_keyword'],
      $file,
      $offset,
      $source,
      'ElseToken',
    );
    $keyword = $keyword as nonnull;
    $offset += $keyword->getWidth();
    $colon = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['alternate_else_colon'],
      $file,
      $offset,
      $source,
      'ColonToken',
    );
    $colon = $colon as nonnull;
    $offset += $colon->getWidth();
    $statement = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['alternate_else_statement'],
      $file,
      $offset,
      $source,
      'NodeList<IStatement>',
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
      /* HH_IGNORE_ERROR[4110] */ $colon,
      /* HH_IGNORE_ERROR[4110] */ $statement,
      $source_ref,
    );
  }

  <<__Override>>
  public function getChildren(): dict<string, Node> {
    return dict[
      'keyword' => $this->_keyword,
      'colon' => $this->_colon,
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
    $colon = $rewriter($this->_colon, $parents);
    $statement = $rewriter($this->_statement, $parents);
    if (
      $keyword === $this->_keyword &&
      $colon === $this->_colon &&
      $statement === $this->_statement
    ) {
      return $this;
    }
    return new static(
      /* HH_FIXME[4110] use `as` */ $keyword,
      /* HH_FIXME[4110] use `as` */ $colon,
      /* HH_FIXME[4110] use `as` */ $statement,
    );
  }

  public function getKeywordUNTYPED(): ?Node {
    return $this->_keyword;
  }

  public function withKeyword(ElseToken $value): this {
    if ($value === $this->_keyword) {
      return $this;
    }
    return new static($value, $this->_colon, $this->_statement);
  }

  public function hasKeyword(): bool {
    return $this->_keyword !== null;
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

  public function getColonUNTYPED(): ?Node {
    return $this->_colon;
  }

  public function withColon(ColonToken $value): this {
    if ($value === $this->_colon) {
      return $this;
    }
    return new static($this->_keyword, $value, $this->_statement);
  }

  public function hasColon(): bool {
    return $this->_colon !== null;
  }

  /**
   * @return ColonToken
   */
  public function getColon(): ColonToken {
    return TypeAssert\instance_of(ColonToken::class, $this->_colon);
  }

  /**
   * @return ColonToken
   */
  public function getColonx(): ColonToken {
    return $this->getColon();
  }

  public function getStatementUNTYPED(): ?Node {
    return $this->_statement;
  }

  public function withStatement(NodeList<IStatement> $value): this {
    if ($value === $this->_statement) {
      return $this;
    }
    return new static($this->_keyword, $this->_colon, $value);
  }

  public function hasStatement(): bool {
    return $this->_statement !== null;
  }

  /**
   * @return NodeList<EchoStatement> | NodeList<ExpressionStatement>
   */
  public function getStatement(): NodeList<IStatement> {
    return TypeAssert\instance_of(NodeList::class, $this->_statement);
  }

  /**
   * @return NodeList<EchoStatement> | NodeList<ExpressionStatement>
   */
  public function getStatementx(): NodeList<IStatement> {
    return $this->getStatement();
  }
}
