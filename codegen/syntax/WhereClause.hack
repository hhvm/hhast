/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<9a69a8031ebd1593dc9c7723ef2492a2>>
 */
namespace Facebook\HHAST;
use namespace Facebook\TypeAssert;

<<__ConsistentConstruct>>
final class WhereClause extends EditableNode {

  const string SYNTAX_KIND = 'where_clause';

  private EditableNode $_keyword;
  private EditableNode $_constraints;

  public function __construct(
    EditableNode $keyword,
    EditableNode $constraints,
    ?__Private\SourceRef $source_ref = null,
  ) {
    $this->_keyword = $keyword;
    $this->_constraints = $constraints;
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
      /* UNSAFE_EXPR */ $json['where_clause_keyword'],
      $file,
      $offset,
      $source,
    );
    $offset += $keyword->getWidth();
    $constraints = EditableNode::fromJSON(
      /* UNSAFE_EXPR */ $json['where_clause_constraints'],
      $file,
      $offset,
      $source,
    );
    $offset += $constraints->getWidth();
    $source_ref = shape(
      'file' => $file,
      'source' => $source,
      'offset' => $initial_offset,
      'width' => $offset - $initial_offset,
    );
    return new static($keyword, $constraints, $source_ref);
  }

  <<__Override>>
  public function getChildren(): dict<string, EditableNode> {
    return dict[
      'keyword' => $this->_keyword,
      'constraints' => $this->_constraints,
    ];
  }

  <<__Override>>
  public function rewriteChildren(
    self::TRewriter $rewriter,
    vec<EditableNode> $parents = vec[],
  ): this {
    $parents[] = $this;
    $keyword = $rewriter($this->_keyword, $parents);
    $constraints = $rewriter($this->_constraints, $parents);
    if ($keyword === $this->_keyword && $constraints === $this->_constraints) {
      return $this;
    }
    return new static($keyword, $constraints);
  }

  public function getKeywordUNTYPED(): EditableNode {
    return $this->_keyword;
  }

  public function withKeyword(EditableNode $value): this {
    if ($value === $this->_keyword) {
      return $this;
    }
    return new static($value, $this->_constraints);
  }

  public function hasKeyword(): bool {
    return !$this->_keyword->isMissing();
  }

  /**
   * @return WhereToken
   */
  public function getKeyword(): WhereToken {
    return TypeAssert\instance_of(WhereToken::class, $this->_keyword);
  }

  /**
   * @return WhereToken
   */
  public function getKeywordx(): WhereToken {
    return $this->getKeyword();
  }

  public function getConstraintsUNTYPED(): EditableNode {
    return $this->_constraints;
  }

  public function withConstraints(EditableNode $value): this {
    if ($value === $this->_constraints) {
      return $this;
    }
    return new static($this->_keyword, $value);
  }

  public function hasConstraints(): bool {
    return !$this->_constraints->isMissing();
  }

  /**
   * @return EditableList<WhereConstraint>
   */
  public function getConstraints(): EditableList<WhereConstraint> {
    return TypeAssert\instance_of(EditableList::class, $this->_constraints);
  }

  /**
   * @return EditableList<WhereConstraint>
   */
  public function getConstraintsx(): EditableList<WhereConstraint> {
    return $this->getConstraints();
  }
}
