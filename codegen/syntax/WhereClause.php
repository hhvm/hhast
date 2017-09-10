<?hh
/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<efdbf7b9dca28c983be2ae3c2b674182>>
 */
namespace Facebook\HHAST;
use type Facebook\TypeAssert\TypeAssert;

final class WhereClause extends EditableSyntax {

  private EditableSyntax $_keyword;
  private EditableSyntax $_constraints;

  public function __construct(
    EditableSyntax $keyword,
    EditableSyntax $constraints,
  ) {
    parent::__construct('where_clause');
    $this->_keyword = $keyword;
    $this->_constraints = $constraints;
  }

  public static function from_json(
    array<string, mixed> $json,
    int $position,
    string $source,
  ): this {
    $keyword = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['where_clause_keyword'],
      $position,
      $source,
    );
    $position += $keyword->width();
    $constraints = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['where_clause_constraints'],
      $position,
      $source,
    );
    $position += $constraints->width();
    return new self($keyword, $constraints);
  }

  public function children(): KeyedTraversable<string, EditableSyntax> {
    yield 'keyword' => $this->_keyword;
    yield 'constraints' => $this->_constraints;
  }

  public function rewrite(
    self::TRewriter $rewriter,
    ?Traversable<EditableSyntax> $parents = null,
  ): EditableSyntax {
    $parents = $parents === null ? vec[] : vec($parents);
    $child_parents = $parents;
    $child_parents[] = $this;
    $keyword = $this->_keyword->rewrite($rewriter, $child_parents);
    $constraints = $this->_constraints->rewrite($rewriter, $child_parents);
    if ($keyword === $this->_keyword && $constraints === $this->_constraints) {
      $node = $this;
    } else {
      $node = new self($keyword, $constraints);
    }
    return $rewriter($node, $parents);
  }

  public function keyword(): WhereToken {
    return $this->keywordx();
  }

  public function keywordx(): WhereToken {
    return TypeAssert::isInstanceOf(WhereToken::class, $this->_keyword);
  }

  public function raw_keyword(): EditableSyntax {
    return $this->_keyword;
  }

  public function with_keyword(EditableSyntax $value): this {
    return new self($value, $this->_constraints);
  }

  public function constraints(): EditableList {
    return $this->constraintsx();
  }

  public function constraintsx(): EditableList {
    return TypeAssert::isInstanceOf(EditableList::class, $this->_constraints);
  }

  public function raw_constraints(): EditableSyntax {
    return $this->_constraints;
  }

  public function with_constraints(EditableSyntax $value): this {
    return new self($this->_keyword, $value);
  }
}
