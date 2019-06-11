/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<ca0999a331f99a06138a78d6baf58413>>
 */
namespace Facebook\HHAST;
use namespace Facebook\TypeAssert;

<<__ConsistentConstruct>>
abstract class AlternateLoopStatementGeneratedBase
  extends Node
  implements IControlFlowStatement, ILoopStatement, IStatement {

  const string SYNTAX_KIND = 'alternate_loop_statement';

  private Node $_opening_colon;
  private Node $_statements;
  private Node $_closing_keyword;
  private Node $_closing_semicolon;

  public function __construct(
    Node $opening_colon,
    Node $statements,
    Node $closing_keyword,
    Node $closing_semicolon,
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
    $offset += $opening_colon->getWidth();
    $statements = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['alternate_loop_statements'],
      $file,
      $offset,
      $source,
      'NodeList<IStatement>',
    );
    $offset += $statements->getWidth();
    $closing_keyword = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['alternate_loop_closing_keyword'],
      $file,
      $offset,
      $source,
      'Token',
    );
    $offset += $closing_keyword->getWidth();
    $closing_semicolon = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['alternate_loop_closing_semicolon'],
      $file,
      $offset,
      $source,
      'SemicolonToken',
    );
    $offset += $closing_semicolon->getWidth();
    $source_ref = shape(
      'file' => $file,
      'source' => $source,
      'offset' => $initial_offset,
      'width' => $offset - $initial_offset,
    );
    return new static(
      $opening_colon,
      $statements,
      $closing_keyword,
      $closing_semicolon,
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
    ];
  }

  <<__Override>>
  public function rewriteChildren(
    self::TRewriter $rewriter,
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
      $opening_colon,
      $statements,
      $closing_keyword,
      $closing_semicolon,
    );
  }

  public function getOpeningColonUNTYPED(): Node {
    return $this->_opening_colon;
  }

  public function withOpeningColon(Node $value): this {
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
    return !$this->_opening_colon->isMissing();
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

  public function getStatementsUNTYPED(): Node {
    return $this->_statements;
  }

  public function withStatements(Node $value): this {
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
    return !$this->_statements->isMissing();
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

  public function getClosingKeywordUNTYPED(): Node {
    return $this->_closing_keyword;
  }

  public function withClosingKeyword(Node $value): this {
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
    return !$this->_closing_keyword->isMissing();
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

  public function getClosingSemicolonUNTYPED(): Node {
    return $this->_closing_semicolon;
  }

  public function withClosingSemicolon(Node $value): this {
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
    return !$this->_closing_semicolon->isMissing();
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
