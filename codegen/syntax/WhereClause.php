<?hh // strict
/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<1e919dd031e7c44470cb79844bbb8aa8>>
 */
namespace Facebook\HHAST;
use namespace Facebook\TypeAssert;

final class WhereClause extends EditableNode {

  private EditableNode $_keyword;
  private EditableNode $_constraints;

  public function __construct(
    EditableNode $keyword,
    EditableNode $constraints,
  ) {
    parent::__construct('where_clause');
    $this->_keyword = $keyword;
    $this->_constraints = $constraints;
  }

  <<__Override>>
  public static function fromJSON(
    dict<string, mixed> $json,
    string $file,
    int $offset,
    string $source,
  ): this {
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
    return new self($keyword, $constraints);
  }

  <<__Override>>
  public function getChildren(): dict<string, EditableNode> {
    return dict[
      'keyword' => $this->_keyword,
      'constraints' => $this->_constraints,
    ];
  }

  <<__Override>>
  public function rewriteDescendants(
    self::TRewriter $rewriter,
    ?vec<EditableNode> $parents = null,
  ): this {
    $parents = $parents === null ? vec[] : vec($parents);
    $parents[] = $this;
    $keyword = $this->_keyword->rewrite($rewriter, $parents);
    $constraints = $this->_constraints->rewrite($rewriter, $parents);
    if ($keyword === $this->_keyword && $constraints === $this->_constraints) {
      return $this;
    }
    return new self($keyword, $constraints);
  }

  public function getKeywordUNTYPED(): EditableNode {
    return $this->_keyword;
  }

  public function withKeyword(EditableNode $value): this {
    if ($value === $this->_keyword) {
      return $this;
    }
    return new self($value, $this->_constraints);
  }

  public function hasKeyword(): bool {
    return !$this->_keyword->isMissing();
  }

  /**
   * @returns WhereToken
   */
  public function getKeyword(): WhereToken {
    return TypeAssert\instance_of(WhereToken::class, $this->_keyword);
  }

  public function getConstraintsUNTYPED(): EditableNode {
    return $this->_constraints;
  }

  public function withConstraints(EditableNode $value): this {
    if ($value === $this->_constraints) {
      return $this;
    }
    return new self($this->_keyword, $value);
  }

  public function hasConstraints(): bool {
    return !$this->_constraints->isMissing();
  }

  /**
   * @returns EditableList
   */
  public function getConstraints(): EditableList {
    return TypeAssert\instance_of(EditableList::class, $this->_constraints);
  }
}
