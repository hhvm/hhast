/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<a3720905a7c78b36720e9f40890fb576>>
 */
namespace Facebook\HHAST;
use namespace Facebook\TypeAssert;

<<__ConsistentConstruct>>
final class FinallyClause extends EditableNode {

  const string SYNTAX_KIND = 'finally_clause';

  private EditableNode $_keyword;
  private EditableNode $_body;

  public function __construct(
    EditableNode $keyword,
    EditableNode $body,
    ?__Private\SourceRef $source_ref = null,
  ) {
    $this->_keyword = $keyword;
    $this->_body = $body;
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
    $source_ref = shape(
      'file' => $file,
      'source' => $source,
      'offset' => $initial_offset,
      'width' => $offset - $initial_offset,
    );
    return new static($keyword, $body, $source_ref);
  }

  <<__Override>>
  public function getChildren(): dict<string, EditableNode> {
    return dict[
      'keyword' => $this->_keyword,
      'body' => $this->_body,
    ];
  }

  <<__Override>>
  public function rewriteChildren(
    self::TRewriter $rewriter,
    vec<EditableNode> $parents = vec[],
  ): this {
    $parents[] = $this;
    $keyword = $rewriter($this->_keyword, $parents);
    $body = $rewriter($this->_body, $parents);
    if ($keyword === $this->_keyword && $body === $this->_body) {
      return $this;
    }
    return new static($keyword, $body);
  }

  public function getKeywordUNTYPED(): EditableNode {
    return $this->_keyword;
  }

  public function withKeyword(EditableNode $value): this {
    if ($value === $this->_keyword) {
      return $this;
    }
    return new static($value, $this->_body);
  }

  public function hasKeyword(): bool {
    return !$this->_keyword->isMissing();
  }

  /**
   * @return FinallyToken
   */
  public function getKeyword(): FinallyToken {
    return TypeAssert\instance_of(FinallyToken::class, $this->_keyword);
  }

  /**
   * @return FinallyToken
   */
  public function getKeywordx(): FinallyToken {
    return $this->getKeyword();
  }

  public function getBodyUNTYPED(): EditableNode {
    return $this->_body;
  }

  public function withBody(EditableNode $value): this {
    if ($value === $this->_body) {
      return $this;
    }
    return new static($this->_keyword, $value);
  }

  public function hasBody(): bool {
    return !$this->_body->isMissing();
  }

  /**
   * @return CompoundStatement
   */
  public function getBody(): CompoundStatement {
    return TypeAssert\instance_of(CompoundStatement::class, $this->_body);
  }

  /**
   * @return CompoundStatement
   */
  public function getBodyx(): CompoundStatement {
    return $this->getBody();
  }
}
