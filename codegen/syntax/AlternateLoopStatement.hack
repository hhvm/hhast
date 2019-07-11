/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<36854b48ac922ee21fc2ee4c0166f869>>
 */
namespace Facebook\HHAST;
use namespace Facebook\TypeAssert;
use namespace HH\Lib\Dict;

<<__ConsistentConstruct>>
abstract class AlternateLoopStatementGeneratedBase
  extends Node
  implements IControlFlowStatement, ILoopStatement, IStatement {

  const string SYNTAX_KIND = 'alternate_loop_statement';

  private ColonToken $_opening_colon;
  private NodeList<IStatement> $_statements;
  private Token $_closing_keyword;
  private SemicolonToken $_closing_semicolon;

  public function __construct(
    ColonToken $opening_colon,
    NodeList<IStatement> $statements,
    Token $closing_keyword,
    SemicolonToken $closing_semicolon,
    ?__Private\SourceRef $source_ref = null,
  ) {
    $this->_opening_colon = $opening_colon;
    $this->_statements = $statements;
    $this->_closing_keyword = $closing_keyword;
    $this->_closing_semicolon = $closing_semicolon;
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
    $opening_colon = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['alternate_loop_opening_colon'],
      $file,
      $offset,
      $source,
      'ColonToken',
    );
    $opening_colon = $opening_colon as nonnull;
    $offset += $opening_colon->getWidth();
    $statements = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['alternate_loop_statements'],
      $file,
      $offset,
      $source,
      'NodeList<IStatement>',
    );
    $statements = $statements as nonnull;
    $offset += $statements->getWidth();
    $closing_keyword = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['alternate_loop_closing_keyword'],
      $file,
      $offset,
      $source,
      'Token',
    );
    $closing_keyword = $closing_keyword as nonnull;
    $offset += $closing_keyword->getWidth();
    $closing_semicolon = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['alternate_loop_closing_semicolon'],
      $file,
      $offset,
      $source,
      'SemicolonToken',
    );
    $closing_semicolon = $closing_semicolon as nonnull;
    $offset += $closing_semicolon->getWidth();
    $source_ref = shape(
      'file' => $file,
      'source' => $source,
      'offset' => $initial_offset,
      'width' => $offset - $initial_offset,
    );
    return new static(
      /* HH_IGNORE_ERROR[4110] */ $opening_colon,
      /* HH_IGNORE_ERROR[4110] */ $statements,
      /* HH_IGNORE_ERROR[4110] */ $closing_keyword,
      /* HH_IGNORE_ERROR[4110] */ $closing_semicolon,
      $source_ref,
    );
  }

  <<__Override>>
  public function getChildren(): dict<string, Node> {
    return dict[
      'opening_colon' => $this->_opening_colon,
      'statements' => $this->_statements,
      'closing_keyword' => $this->_closing_keyword,
      'closing_semicolon' => $this->_closing_semicolon,
    ]
      |> Dict\filter_nulls($$);
  }

  <<__Override>>
  public function rewriteChildren<Tret as ?Node>(
    (function(Node, vec<Node>): Tret) $rewriter,
    vec<Node> $parents = vec[],
  ): this {
    $parents[] = $this;
    $opening_colon = $rewriter($this->_opening_colon, $parents);
    $statements = $rewriter($this->_statements, $parents);
    $closing_keyword = $rewriter($this->_closing_keyword, $parents);
    $closing_semicolon = $rewriter($this->_closing_semicolon, $parents);
    if (
      $opening_colon === $this->_opening_colon &&
      $statements === $this->_statements &&
      $closing_keyword === $this->_closing_keyword &&
      $closing_semicolon === $this->_closing_semicolon
    ) {
      return $this;
    }
    return new static(
      /* HH_FIXME[4110] use `as` */ $opening_colon,
      /* HH_FIXME[4110] use `as` */ $statements,
      /* HH_FIXME[4110] use `as` */ $closing_keyword,
      /* HH_FIXME[4110] use `as` */ $closing_semicolon,
    );
  }

  public function getOpeningColonUNTYPED(): ?Node {
    return $this->_opening_colon;
  }

  public function withOpeningColon(ColonToken $value): this {
    if ($value === $this->_opening_colon) {
      return $this;
    }
    return new static(
      $value,
      $this->_statements,
      $this->_closing_keyword,
      $this->_closing_semicolon,
    );
  }

  public function hasOpeningColon(): bool {
    return $this->_opening_colon !== null;
  }

  /**
   * @return ColonToken
   */
  public function getOpeningColon(): ColonToken {
    return TypeAssert\instance_of(ColonToken::class, $this->_opening_colon);
  }

  /**
   * @return ColonToken
   */
  public function getOpeningColonx(): ColonToken {
    return $this->getOpeningColon();
  }

  public function getStatementsUNTYPED(): ?Node {
    return $this->_statements;
  }

  public function withStatements(NodeList<IStatement> $value): this {
    if ($value === $this->_statements) {
      return $this;
    }
    return new static(
      $this->_opening_colon,
      $value,
      $this->_closing_keyword,
      $this->_closing_semicolon,
    );
  }

  public function hasStatements(): bool {
    return $this->_statements !== null;
  }

  /**
   * @return NodeList<EchoStatement> | NodeList<IStatement> |
   * NodeList<ExpressionStatement>
   */
  public function getStatements(): NodeList<IStatement> {
    return TypeAssert\instance_of(NodeList::class, $this->_statements);
  }

  /**
   * @return NodeList<EchoStatement> | NodeList<IStatement> |
   * NodeList<ExpressionStatement>
   */
  public function getStatementsx(): NodeList<IStatement> {
    return $this->getStatements();
  }

  public function getClosingKeywordUNTYPED(): ?Node {
    return $this->_closing_keyword;
  }

  public function withClosingKeyword(Token $value): this {
    if ($value === $this->_closing_keyword) {
      return $this;
    }
    return new static(
      $this->_opening_colon,
      $this->_statements,
      $value,
      $this->_closing_semicolon,
    );
  }

  public function hasClosingKeyword(): bool {
    return $this->_closing_keyword !== null;
  }

  /**
   * @return EndforToken | EndforeachToken | EndwhileToken
   */
  public function getClosingKeyword(): Token {
    return TypeAssert\instance_of(Token::class, $this->_closing_keyword);
  }

  /**
   * @return EndforToken | EndforeachToken | EndwhileToken
   */
  public function getClosingKeywordx(): Token {
    return $this->getClosingKeyword();
  }

  public function getClosingSemicolonUNTYPED(): ?Node {
    return $this->_closing_semicolon;
  }

  public function withClosingSemicolon(SemicolonToken $value): this {
    if ($value === $this->_closing_semicolon) {
      return $this;
    }
    return new static(
      $this->_opening_colon,
      $this->_statements,
      $this->_closing_keyword,
      $value,
    );
  }

  public function hasClosingSemicolon(): bool {
    return $this->_closing_semicolon !== null;
  }

  /**
   * @return SemicolonToken
   */
  public function getClosingSemicolon(): SemicolonToken {
    return TypeAssert\instance_of(
      SemicolonToken::class,
      $this->_closing_semicolon,
    );
  }

  /**
   * @return SemicolonToken
   */
  public function getClosingSemicolonx(): SemicolonToken {
    return $this->getClosingSemicolon();
  }
}
