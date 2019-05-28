/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<f45b71c9f5472c300b7485258b2eb795>>
 */
namespace Facebook\HHAST;
use namespace Facebook\TypeAssert;

<<__ConsistentConstruct>>
abstract class AlternateLoopStatementGeneratedBase
  extends EditableNode
  implements IControlFlowStatement, ILoopStatement, IStatement {

  const string SYNTAX_KIND = 'alternate_loop_statement';

  private EditableNode $_opening_colon;
  private EditableNode $_statements;
  private EditableNode $_closing_keyword;
  private EditableNode $_closing_semicolon;

  public function __construct(
    EditableNode $opening_colon,
    EditableNode $statements,
    EditableNode $closing_keyword,
    EditableNode $closing_semicolon,
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
  ): this {
    $offset = $initial_offset;
    $opening_colon = EditableNode::fromJSON(
      /* HH_FIXME[4110] */ $json['alternate_loop_opening_colon'],
      $file,
      $offset,
      $source,
    );
    $offset += $opening_colon->getWidth();
    $statements = EditableNode::fromJSON(
      /* HH_FIXME[4110] */ $json['alternate_loop_statements'],
      $file,
      $offset,
      $source,
    );
    $offset += $statements->getWidth();
    $closing_keyword = EditableNode::fromJSON(
      /* HH_FIXME[4110] */ $json['alternate_loop_closing_keyword'],
      $file,
      $offset,
      $source,
    );
    $offset += $closing_keyword->getWidth();
    $closing_semicolon = EditableNode::fromJSON(
      /* HH_FIXME[4110] */ $json['alternate_loop_closing_semicolon'],
      $file,
      $offset,
      $source,
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
  public function getChildren(): dict<string, EditableNode> {
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
    vec<EditableNode> $parents = vec[],
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

  public function getOpeningColonUNTYPED(): EditableNode {
    return $this->_opening_colon;
  }

  public function withOpeningColon(EditableNode $value): this {
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

  public function getStatementsUNTYPED(): EditableNode {
    return $this->_statements;
  }

  public function withStatements(EditableNode $value): this {
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
   * @return EditableList<EditableNode>
   */
  public function getStatements(): EditableList<EditableNode> {
    return TypeAssert\instance_of(EditableList::class, $this->_statements);
  }

  /**
   * @return EditableList<EditableNode>
   */
  public function getStatementsx(): EditableList<EditableNode> {
    return $this->getStatements();
  }

  public function getClosingKeywordUNTYPED(): EditableNode {
    return $this->_closing_keyword;
  }

  public function withClosingKeyword(EditableNode $value): this {
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
  public function getClosingKeyword(): EditableToken {
    return TypeAssert\instance_of(
      EditableToken::class,
      $this->_closing_keyword,
    );
  }

  /**
   * @return EndforToken | EndforeachToken | EndwhileToken
   */
  public function getClosingKeywordx(): EditableToken {
    return $this->getClosingKeyword();
  }

  public function getClosingSemicolonUNTYPED(): EditableNode {
    return $this->_closing_semicolon;
  }

  public function withClosingSemicolon(EditableNode $value): this {
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
