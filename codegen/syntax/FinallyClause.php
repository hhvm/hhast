<?hh
/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<df1fd8aa2fa30b36b1613cb82235e533>>
 */
namespace Facebook\HHAST;
use type Facebook\TypeAssert\TypeAssert;

final class FinallyClause extends EditableSyntax {

  private EditableSyntax $_keyword;
  private EditableSyntax $_body;

  public function __construct(EditableSyntax $keyword, EditableSyntax $body) {
    parent::__construct('finally_clause');
    $this->_keyword = $keyword;
    $this->_body = $body;
  }

  public static function from_json(
    array<string, mixed> $json,
    int $position,
    string $source,
  ): this {
    $keyword = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['finally_keyword'],
      $position,
      $source,
    );
    $position += $keyword->width();
    $body = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['finally_body'],
      $position,
      $source,
    );
    $position += $body->width();
    return new self($keyword, $body);
  }

  public function children(): KeyedTraversable<string, EditableSyntax> {
    yield 'keyword' => $this->_keyword;
    yield 'body' => $this->_body;
  }

  public function rewrite_children(
    self::TRewriter $rewriter,
    ?Traversable<EditableSyntax> $parents = null,
  ): this {
    $parents = $parents === null ? vec[] : vec($parents);
    $parents[] = $this;
    $keyword = $this->_keyword->rewrite($rewriter, $parents);
    $body = $this->_body->rewrite($rewriter, $parents);
    if (
      $keyword === $this->_keyword &&
      $body === $this->_body
    ) {
      return $this;
    }
    return new self($keyword, $body);
  }

  public function keyword(): FinallyToken {
    return $this->keywordx();
  }

  public function keywordx(): FinallyToken {
    return TypeAssert::isInstanceOf(FinallyToken::class, $this->_keyword);
  }

  public function raw_keyword(): EditableSyntax {
    return $this->_keyword;
  }

  public function with_keyword(EditableSyntax $value): this {
    return new self($value, $this->_body);
  }

  public function body(): CompoundStatement {
    return $this->bodyx();
  }

  public function bodyx(): CompoundStatement {
    return TypeAssert::isInstanceOf(CompoundStatement::class, $this->_body);
  }

  public function raw_body(): EditableSyntax {
    return $this->_body;
  }

  public function with_body(EditableSyntax $value): this {
    return new self($this->_keyword, $value);
  }
}
