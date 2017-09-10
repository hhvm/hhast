<?hh
/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<d36dc8b14010b6cc9861deb562e5c8e3>>
 */
namespace Facebook\HHAST;
use type Facebook\TypeAssert\TypeAssert;

final class ElseClause extends EditableSyntax {

  private EditableSyntax $_keyword;
  private EditableSyntax $_statement;

  public function __construct(
    EditableSyntax $keyword,
    EditableSyntax $statement,
  ) {
    parent::__construct('else_clause');
    $this->_keyword = $keyword;
    $this->_statement = $statement;
  }

  public static function from_json(
    array<string, mixed> $json,
    int $position,
    string $source,
  ): this {
    $keyword = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['else_keyword'],
      $position,
      $source,
    );
    $position += $keyword->width();
    $statement = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['else_statement'],
      $position,
      $source,
    );
    $position += $statement->width();
    return new self($keyword, $statement);
  }

  public function children(): KeyedTraversable<string, EditableSyntax> {
    yield 'keyword' => $this->_keyword;
    yield 'statement' => $this->_statement;
  }

  public function rewrite_children(
    self::TRewriter $rewriter,
    ?Traversable<EditableSyntax> $parents = null,
  ): this {
    $parents = $parents === null ? vec[] : vec($parents);
    $parents[] = $this;
    $keyword = $this->_keyword->rewrite($rewriter, $parents);
    $statement = $this->_statement->rewrite($rewriter, $parents);
    if (
      $keyword === $this->_keyword &&
      $statement === $this->_statement
    ) {
      return $this;
    }
    return new self($keyword, $statement);
  }

  public function keyword(): ElseToken {
    return $this->keywordx();
  }

  public function keywordx(): ElseToken {
    return TypeAssert::isInstanceOf(ElseToken::class, $this->_keyword);
  }

  public function raw_keyword(): EditableSyntax {
    return $this->_keyword;
  }

  public function with_keyword(EditableSyntax $value): this {
    return new self($value, $this->_statement);
  }

  public function statement(): EditableSyntax {
    return $this->statementx();
  }

  public function statementx(): EditableSyntax {
    return TypeAssert::isInstanceOf(EditableSyntax::class, $this->_statement);
  }

  public function raw_statement(): EditableSyntax {
    return $this->_statement;
  }

  public function with_statement(EditableSyntax $value): this {
    return new self($this->_keyword, $value);
  }
}
