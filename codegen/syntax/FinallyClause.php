<?hh // strict
/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<37c34817b35234128d7c01f389e77d71>>
 */
namespace Facebook\HHAST;
use namespace Facebook\TypeAssert;

final class FinallyClause extends EditableSyntax {

  private EditableSyntax $_keyword;
  private EditableSyntax $_body;

  public function __construct(EditableSyntax $keyword, EditableSyntax $body) {
    parent::__construct('finally_clause');
    $this->_keyword = $keyword;
    $this->_body = $body;
  }

  <<__Override>>
  public static function fromJSON(
    dict<string, mixed> $json,
    int $position,
    string $source,
  ): this {
    $keyword = EditableSyntax::fromJSON(
      /* UNSAFE_EXPR */ $json['finally_keyword'],
      $position,
      $source,
    );
    $position += $keyword->getWidth();
    $body = EditableSyntax::fromJSON(
      /* UNSAFE_EXPR */ $json['finally_body'],
      $position,
      $source,
    );
    $position += $body->getWidth();
    return new self($keyword, $body);
  }

  <<__Override>>
  public function getChildren(): KeyedTraversable<string, EditableSyntax> {
    yield 'keyword' => $this->_keyword;
    yield 'body' => $this->_body;
  }

  <<__Override>>
  public function rewriteDescendants(
    self::TRewriter $rewriter,
    ?Traversable<EditableSyntax> $parents = null,
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

  public function getKeywordUNTYPED(): EditableSyntax {
    return $this->_keyword;
  }

  public function withKeyword(EditableSyntax $value): this {
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

  public function getBodyUNTYPED(): EditableSyntax {
    return $this->_body;
  }

  public function withBody(EditableSyntax $value): this {
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
