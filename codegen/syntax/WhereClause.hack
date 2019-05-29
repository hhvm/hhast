/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<06ef11a98059ad040802692c737b2846>>
 */
namespace Facebook\HHAST;
use namespace Facebook\TypeAssert;

<<__ConsistentConstruct>>
final class WhereClause extends Node {

  const string SYNTAX_KIND = 'where_clause';

  private Node $_keyword;
  private Node $_constraints;

  public function __construct(
    Node $keyword,
    Node $constraints,
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
    $keyword = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['where_clause_keyword'],
      $file,
      $offset,
      $source,
    );
    $offset += $keyword->getWidth();
    $constraints = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['where_clause_constraints'],
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
  public function getChildren(): dict<string, Node> {
    return dict[
      'keyword' => $this->_keyword,
      'constraints' => $this->_constraints,
    ];
  }

  <<__Override>>
  public function rewriteChildren(
    self::TRewriter $rewriter,
    vec<Node> $parents = vec[],
  ): this {
    $parents[] = $this;
    $keyword = $rewriter($this->_keyword, $parents);
    $constraints = $rewriter($this->_constraints, $parents);
    if ($keyword === $this->_keyword && $constraints === $this->_constraints) {
      return $this;
    }
    return new static($keyword, $constraints);
  }

  public function getKeywordUNTYPED(): Node {
    return $this->_keyword;
  }

  public function withKeyword(Node $value): this {
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

  public function getConstraintsUNTYPED(): Node {
    return $this->_constraints;
  }

  public function withConstraints(Node $value): this {
    if ($value === $this->_constraints) {
      return $this;
    }
    return new static($this->_keyword, $value);
  }

  public function hasConstraints(): bool {
    return !$this->_constraints->isMissing();
  }

  /**
   * @return NodeList<WhereConstraint>
   */
  public function getConstraints(): NodeList<WhereConstraint> {
    return TypeAssert\instance_of(NodeList::class, $this->_constraints);
  }

  /**
   * @return NodeList<WhereConstraint>
   */
  public function getConstraintsx(): NodeList<WhereConstraint> {
    return $this->getConstraints();
  }
}
