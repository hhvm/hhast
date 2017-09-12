<?hh
/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<df0f48b0dd2a3867bbbd53ca40342445>>
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

  <<__Override>>
  public static function fromJSON(
    array<string, mixed> $json,
    int $position,
    string $source,
  ): this {
    $keyword = EditableSyntax::fromJSON(
      /* UNSAFE_EXPR */ $json['where_clause_keyword'],
      $position,
      $source,
    );
    $position += $keyword->getWidth();
    $constraints = EditableSyntax::fromJSON(
      /* UNSAFE_EXPR */ $json['where_clause_constraints'],
      $position,
      $source,
    );
    $position += $constraints->getWidth();
    return new self($keyword, $constraints);
  }

  <<__Override>>
  public function getChildren(): KeyedTraversable<string, EditableSyntax> {
    yield 'keyword' => $this->_keyword;
    yield 'constraints' => $this->_constraints;
  }

  <<__Override>>
  public function rewrite_children(
    self::TRewriter $rewriter,
    ?Traversable<EditableSyntax> $parents = null,
  ): this {
    $parents = $parents === null ? vec[] : vec($parents);
    $parents[] = $this;
    $keyword = $this->_keyword->rewrite($rewriter, $parents);
    $constraints = $this->_constraints->rewrite($rewriter, $parents);
    if (
      $keyword === $this->_keyword &&
      $constraints === $this->_constraints
    ) {
      return $this;
    }
    return new self($keyword, $constraints);
  }

  public function getKeywordUNTYPED(): EditableSyntax {
    return $this->_keyword;
  }

  public function withKeyword(EditableSyntax $value): this {
    if ($value === $this->_keyword) {
      return $this;
    }
    return new self($value, $this->_constraints);
  }

  public function hasKeyword(): bool {
    return !$this->_keyword->isMissing();
  }

  public function getKeyword(): WhereToken {
    return TypeAssert::isInstanceOf(WhereToken::class, $this->_keyword);
  }

  public function getConstraintsUNTYPED(): EditableSyntax {
    return $this->_constraints;
  }

  public function withConstraints(EditableSyntax $value): this {
    if ($value === $this->_constraints) {
      return $this;
    }
    return new self($this->_keyword, $value);
  }

  public function hasConstraints(): bool {
    return !$this->_constraints->isMissing();
  }

  public function getConstraints(): EditableList {
    return TypeAssert::isInstanceOf(EditableList::class, $this->_constraints);
  }
}
