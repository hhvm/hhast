<?hh
/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<db8abaccc5d3726c656165d3a9d01572>>
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

  <<__Override>>
  public static function fromJSON(
    array<string, mixed> $json,
    int $position,
    string $source,
  ): this {
    $keyword = EditableSyntax::fromJSON(
      /* UNSAFE_EXPR */ $json['else_keyword'],
      $position,
      $source,
    );
    $position += $keyword->getWidth();
    $statement = EditableSyntax::fromJSON(
      /* UNSAFE_EXPR */ $json['else_statement'],
      $position,
      $source,
    );
    $position += $statement->getWidth();
    return new self($keyword, $statement);
  }

  <<__Override>>
  public function getChildren(): KeyedTraversable<string, EditableSyntax> {
    yield 'keyword' => $this->_keyword;
    yield 'statement' => $this->_statement;
  }

  <<__Override>>
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

  public function getKeywordUNTYPED(): EditableSyntax {
    return $this->_keyword;
  }

  public function withKeyword(EditableSyntax $value): this {
    if ($value === $this->_keyword) {
      return $this;
    }
    return new self($value, $this->_statement);
  }

  public function hasKeyword(): bool {
    return !$this->_keyword->isMissing();
  }

  public function getKeyword(): ElseToken {
    return TypeAssert::isInstanceOf(ElseToken::class, $this->_keyword);
  }

  public function getStatementUNTYPED(): EditableSyntax {
    return $this->_statement;
  }

  public function withStatement(EditableSyntax $value): this {
    if ($value === $this->_statement) {
      return $this;
    }
    return new self($this->_keyword, $value);
  }

  public function hasStatement(): bool {
    return !$this->_statement->isMissing();
  }

  public function getStatement(): EditableSyntax {
    return TypeAssert::isInstanceOf(EditableSyntax::class, $this->_statement);
  }
}
