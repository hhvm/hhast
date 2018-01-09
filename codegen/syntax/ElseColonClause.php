<?hh // strict
/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<bf4d31f9c6b5108e076a96598b723b38>>
 */
namespace Facebook\HHAST;
use namespace Facebook\TypeAssert;

final class ElseColonClause extends EditableNode {

  private EditableNode $_keyword;
  private EditableNode $_colon;
  private EditableNode $_statement;

  public function __construct(
    EditableNode $keyword,
    EditableNode $colon,
    EditableNode $statement,
  ) {
    parent::__construct('else_colon_clause');
    $this->_keyword = $keyword;
    $this->_colon = $colon;
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
      /* UNSAFE_EXPR */ $json['else_colon_keyword'],
      $file,
      $offset,
      $source,
    );
    $offset += $keyword->getWidth();
    $colon = EditableNode::fromJSON(
      /* UNSAFE_EXPR */ $json['else_colon_colon'],
      $file,
      $offset,
      $source,
    );
    $offset += $colon->getWidth();
    $statement = EditableNode::fromJSON(
      /* UNSAFE_EXPR */ $json['else_colon_statement'],
      $file,
      $offset,
      $source,
    );
    $offset += $statement->getWidth();
    return new self($keyword, $colon, $statement);
  }

  <<__Override>>
  public function getChildren(): dict<string, EditableNode> {
    return dict[
      'keyword' => $this->_keyword,
      'colon' => $this->_colon,
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
    $colon = $this->_colon->rewrite($rewriter, $parents);
    $statement = $this->_statement->rewrite($rewriter, $parents);
    if (
      $keyword === $this->_keyword &&
      $colon === $this->_colon &&
      $statement === $this->_statement
    ) {
      return $this;
    }
    return new self($keyword, $colon, $statement);
  }

  public function getKeywordUNTYPED(): EditableNode {
    return $this->_keyword;
  }

  public function withKeyword(EditableNode $value): this {
    if ($value === $this->_keyword) {
      return $this;
    }
    return new self($value, $this->_colon, $this->_statement);
  }

  public function hasKeyword(): bool {
    return !$this->_keyword->isMissing();
  }

  /**
   * @returns unknown
   */
  public function getKeyword(): EditableNode {
    return TypeAssert\instance_of(EditableNode::class, $this->_keyword);
  }

  public function getColonUNTYPED(): EditableNode {
    return $this->_colon;
  }

  public function withColon(EditableNode $value): this {
    if ($value === $this->_colon) {
      return $this;
    }
    return new self($this->_keyword, $value, $this->_statement);
  }

  public function hasColon(): bool {
    return !$this->_colon->isMissing();
  }

  /**
   * @returns unknown
   */
  public function getColon(): EditableNode {
    return TypeAssert\instance_of(EditableNode::class, $this->_colon);
  }

  public function getStatementUNTYPED(): EditableNode {
    return $this->_statement;
  }

  public function withStatement(EditableNode $value): this {
    if ($value === $this->_statement) {
      return $this;
    }
    return new self($this->_keyword, $this->_colon, $value);
  }

  public function hasStatement(): bool {
    return !$this->_statement->isMissing();
  }

  /**
   * @returns unknown
   */
  public function getStatement(): EditableNode {
    return TypeAssert\instance_of(EditableNode::class, $this->_statement);
  }
}
