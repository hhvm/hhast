<?hh // strict
/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<00c0f13b20d0d3e885061a659f760f83>>
 */
namespace Facebook\HHAST;
use namespace Facebook\TypeAssert;

final class ElseClause extends EditableNode implements IControlFlowStatement {

  private EditableNode $_keyword;
  private EditableNode $_statement;

  public function __construct(EditableNode $keyword, EditableNode $statement) {
    parent::__construct('else_clause');
    $this->_keyword = $keyword;
    $this->_statement = $statement;
  }

  <<__Override>>
  public static function fromJSON(
    dict<string, mixed> $json,
    string $file,
    int $offset,
    string $source,
  ): this {
    $keyword = EditableNode::fromJSON(
      /* UNSAFE_EXPR */ $json['else_keyword'],
      $file,
      $offset,
      $source,
    );
    $offset += $keyword->getWidth();
    $statement = EditableNode::fromJSON(
      /* UNSAFE_EXPR */ $json['else_statement'],
      $file,
      $offset,
      $source,
    );
    $offset += $statement->getWidth();
    return new self($keyword, $statement);
  }

  <<__Override>>
  public function getChildren(): dict<string, EditableNode> {
    return dict[
      'keyword' => $this->_keyword,
      'statement' => $this->_statement,
    ];
  }

  <<__Override>>
  public function rewriteDescendants(
    self::TRewriter $rewriter,
    ?vec<EditableNode> $parents = null,
  ): this {
    $parents = $parents === null ? vec[] : vec($parents);
    $parents[] = $this;
    $keyword = $this->_keyword->rewrite($rewriter, $parents);
    $statement = $this->_statement->rewrite($rewriter, $parents);
    if ($keyword === $this->_keyword && $statement === $this->_statement) {
      return $this;
    }
    return new self($keyword, $statement);
  }

  public function getKeywordUNTYPED(): EditableNode {
    return $this->_keyword;
  }

  public function withKeyword(EditableNode $value): this {
    if ($value === $this->_keyword) {
      return $this;
    }
    return new self($value, $this->_statement);
  }

  public function hasKeyword(): bool {
    return !$this->_keyword->isMissing();
  }

  /**
   * @returns ElseToken
   */
  public function getKeyword(): ElseToken {
    return TypeAssert\instance_of(ElseToken::class, $this->_keyword);
  }

  public function getStatementUNTYPED(): EditableNode {
    return $this->_statement;
  }

  public function withStatement(EditableNode $value): this {
    if ($value === $this->_statement) {
      return $this;
    }
    return new self($this->_keyword, $value);
  }

  public function hasStatement(): bool {
    return !$this->_statement->isMissing();
  }

  /**
   * @returns CompoundStatement | IfStatement | ReturnStatement | EchoStatement
   * | ExpressionStatement
   */
  public function getStatement(): EditableNode {
    return TypeAssert\instance_of(EditableNode::class, $this->_statement);
  }
}
