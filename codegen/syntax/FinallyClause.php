<?hh // strict
/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<3e6e373352a8ba8b519ee2d42b8d4a61>>
 */
namespace Facebook\HHAST;
use namespace Facebook\TypeAssert;

final class FinallyClause extends EditableNode {

  private EditableNode $_keyword;
  private EditableNode $_body;

  public function __construct(EditableNode $keyword, EditableNode $body) {
    parent::__construct('finally_clause');
    $this->_keyword = $keyword;
    $this->_body = $body;
  }

  <<__Override>>
  public static function fromJSON(
    dict<string, mixed> $json,
    string $file,
    int $offset,
    string $source,
  ): this {
    $keyword = EditableNode::fromJSON(
      /* UNSAFE_EXPR */ $json['finally_keyword'],
      $file,
      $offset,
      $source,
    );
    $offset += $keyword->getWidth();
    $body = EditableNode::fromJSON(
      /* UNSAFE_EXPR */ $json['finally_body'],
      $file,
      $offset,
      $source,
    );
    $offset += $body->getWidth();
    return new self($keyword, $body);
  }

  <<__Override>>
  public function getChildren(): dict<string, EditableNode> {
    return dict[
      'keyword' => $this->_keyword,
      'body' => $this->_body,
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
    $body = $this->_body->rewrite($rewriter, $parents);
    if ($keyword === $this->_keyword && $body === $this->_body) {
      return $this;
    }
    return new self($keyword, $body);
  }

  public function getKeywordUNTYPED(): EditableNode {
    return $this->_keyword;
  }

  public function withKeyword(EditableNode $value): this {
    if ($value === $this->_keyword) {
      return $this;
    }
    return new self($value, $this->_body);
  }

  public function hasKeyword(): bool {
    return !$this->_keyword->isMissing();
  }

  /**
   * @returns FinallyToken
   */
  public function getKeyword(): FinallyToken {
    return TypeAssert\instance_of(FinallyToken::class, $this->_keyword);
  }

  public function getBodyUNTYPED(): EditableNode {
    return $this->_body;
  }

  public function withBody(EditableNode $value): this {
    if ($value === $this->_body) {
      return $this;
    }
    return new self($this->_keyword, $value);
  }

  public function hasBody(): bool {
    return !$this->_body->isMissing();
  }

  /**
   * @returns CompoundStatement
   */
  public function getBody(): CompoundStatement {
    return TypeAssert\instance_of(CompoundStatement::class, $this->_body);
  }
}
