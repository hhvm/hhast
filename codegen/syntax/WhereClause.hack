/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<30ed4c31dd755410f451486d07f6d243>>
 */
namespace Facebook\HHAST;
use namespace Facebook\TypeAssert;
use namespace HH\Lib\Dict;
/* HHAST_IGNORE_ALL[5607] 5607 is ignored because of false positives when comparing a generic to a typed value */
/* HHAST_IGNORE_ALL[5624] HHAST_IGNORE_ALL[5639] 5624 and 5639 are ignored because they insist on using co(tra)variant generics. Could this break external consumers? */

<<__ConsistentConstruct>>
final class WhereClause extends Node {

  const string SYNTAX_KIND = 'where_clause';

  private WhereToken $_keyword;
  private NodeList<ListItem<WhereConstraint>> $_constraints;

  public function __construct(
    WhereToken $keyword,
    NodeList<ListItem<WhereConstraint>> $constraints,
    ?__Private\SourceRef $source_ref = null,
  ) {
    $this->_keyword = $keyword;
    $this->_constraints = $constraints;
    parent::__construct($source_ref);
  }

  <<__Override>>
  public static function fromJSON(
    dict<arraykey, mixed> $json,
    string $file,
    int $initial_offset,
    string $source,
    string $_type_hint,
  ): this {
    $offset = $initial_offset;
    $keyword = Node::fromJSON(
      ($json['where_clause_keyword']) as dict<_, _>,
      $file,
      $offset,
      $source,
      'WhereToken',
    );
    $keyword = $keyword as nonnull;
    $offset += $keyword->getWidth();
    $constraints = Node::fromJSON(
      ($json['where_clause_constraints']) as dict<_, _>,
      $file,
      $offset,
      $source,
      'NodeList<ListItem<WhereConstraint>>',
    );
    $constraints = $constraints as nonnull;
    $offset += $constraints->getWidth();
    $source_ref = shape(
      'file' => $file,
      'source' => $source,
      'offset' => $initial_offset,
      'width' => $offset - $initial_offset,
    );
    return new static(
      $keyword as WhereToken,
      \HH\FIXME\UNSAFE_CAST<
        NodeList<Node>,
        NodeList<ListItem<WhereConstraint>>,
      >(
        $constraints as NodeList<_>,
        'Open for sound approaches that are not O(n).',
      ),
      $source_ref,
    );
  }

  <<__Override>>
  public function getChildren(): dict<string, Node> {
    return dict[
      'keyword' => $this->_keyword,
      'constraints' => $this->_constraints,
    ]
      |> Dict\filter_nulls($$);
  }

  <<__Override>>
  public function rewriteChildren<Tret as ?Node>(
    (function(Node, vec<Node>): Tret) $rewriter,
    vec<Node> $parents = vec[],
  ): this {
    $parents[] = $this;
    $keyword = $rewriter($this->_keyword, $parents);
    $constraints = $rewriter($this->_constraints, $parents);
    if ($keyword === $this->_keyword && $constraints === $this->_constraints) {
      return $this;
    }
    return new static(
      $keyword as WhereToken,
      \HH\FIXME\UNSAFE_CAST<
        NodeList<Node>,
        NodeList<ListItem<WhereConstraint>>,
      >(
        $constraints as NodeList<_>,
        'Open for sound approaches that are not O(n).',
      ),
    );
  }

  public function getKeywordUNTYPED(): ?Node {
    return $this->_keyword;
  }

  public function withKeyword(WhereToken $value): this {
    if ($value === $this->_keyword) {
      return $this;
    }
    return new static($value, $this->_constraints);
  }

  public function hasKeyword(): bool {
    return true;
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

  public function getConstraintsUNTYPED(): ?Node {
    return $this->_constraints;
  }

  public function withConstraints(
    NodeList<ListItem<WhereConstraint>> $value,
  ): this {
    if ($value === $this->_constraints) {
      return $this;
    }
    return new static($this->_keyword, $value);
  }

  public function hasConstraints(): bool {
    return true;
  }

  /**
   * @return NodeList<ListItem<WhereConstraint>>
   */
  public function getConstraints(): NodeList<ListItem<WhereConstraint>> {
    return TypeAssert\instance_of(NodeList::class, $this->_constraints);
  }

  /**
   * @return NodeList<ListItem<WhereConstraint>>
   */
  public function getConstraintsx(): NodeList<ListItem<WhereConstraint>> {
    return $this->getConstraints();
  }
}
