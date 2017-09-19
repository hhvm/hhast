<?hh // strict
/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<a3952559cd5336d0f23a8088d98ffa47>>
 */
namespace Facebook\HHAST;
use namespace Facebook\TypeAssert;

final class NamespaceUseClause extends EditableNode {

  private EditableNode $_clause_kind;
  private EditableNode $_name;
  private EditableNode $_as;
  private EditableNode $_alias;

  public function __construct(
    EditableNode $clause_kind,
    EditableNode $name,
    EditableNode $as,
    EditableNode $alias,
  ) {
    parent::__construct('namespace_use_clause');
    $this->_clause_kind = $clause_kind;
    $this->_name = $name;
    $this->_as = $as;
    $this->_alias = $alias;
  }

  <<__Override>>
  public static function fromJSON(
    dict<string, mixed> $json,
    int $position,
    string $source,
  ): this {
    $clause_kind = EditableNode::fromJSON(
      /* UNSAFE_EXPR */ $json['namespace_use_clause_kind'],
      $position,
      $source,
    );
    $position += $clause_kind->getWidth();
    $name = EditableNode::fromJSON(
      /* UNSAFE_EXPR */ $json['namespace_use_name'],
      $position,
      $source,
    );
    $position += $name->getWidth();
    $as = EditableNode::fromJSON(
      /* UNSAFE_EXPR */ $json['namespace_use_as'],
      $position,
      $source,
    );
    $position += $as->getWidth();
    $alias = EditableNode::fromJSON(
      /* UNSAFE_EXPR */ $json['namespace_use_alias'],
      $position,
      $source,
    );
    $position += $alias->getWidth();
    return new self($clause_kind, $name, $as, $alias);
  }

  <<__Override>>
  public function getChildren(): KeyedTraversable<string, EditableNode> {
    yield 'clause_kind' => $this->_clause_kind;
    yield 'name' => $this->_name;
    yield 'as' => $this->_as;
    yield 'alias' => $this->_alias;
  }

  <<__Override>>
  public function rewriteDescendants(
    self::TRewriter $rewriter,
    ?Traversable<EditableNode> $parents = null,
  ): this {
    $parents = $parents === null ? vec[] : vec($parents);
    $parents[] = $this;
    $clause_kind = $this->_clause_kind->rewrite($rewriter, $parents);
    $name = $this->_name->rewrite($rewriter, $parents);
    $as = $this->_as->rewrite($rewriter, $parents);
    $alias = $this->_alias->rewrite($rewriter, $parents);
    if (
      $clause_kind === $this->_clause_kind &&
      $name === $this->_name &&
      $as === $this->_as &&
      $alias === $this->_alias
    ) {
      return $this;
    }
    return new self($clause_kind, $name, $as, $alias);
  }

  public function getClauseKindUNTYPED(): EditableNode {
    return $this->_clause_kind;
  }

  public function withClauseKind(EditableNode $value): this {
    if ($value === $this->_clause_kind) {
      return $this;
    }
    return new self($value, $this->_name, $this->_as, $this->_alias);
  }

  public function hasClauseKind(): bool {
    return !$this->_clause_kind->isMissing();
  }

  /**
   * @returns Missing | FunctionToken | ConstToken
   */
  public function getClauseKind(): ?EditableToken {
    if ($this->_clause_kind->isMissing()) {
      return null;
    }
    return TypeAssert\instance_of(EditableToken::class, $this->_clause_kind);
  }

  /**
   * @returns FunctionToken | ConstToken
   */
  public function getClauseKindx(): EditableToken {
    return TypeAssert\instance_of(EditableToken::class, $this->_clause_kind);
  }

  public function getNameUNTYPED(): EditableNode {
    return $this->_name;
  }

  public function withName(EditableNode $value): this {
    if ($value === $this->_name) {
      return $this;
    }
    return new self($this->_clause_kind, $value, $this->_as, $this->_alias);
  }

  public function hasName(): bool {
    return !$this->_name->isMissing();
  }

  /**
   * @returns NameToken | QualifiedNameToken | Missing
   */
  public function getName(): ?EditableToken {
    if ($this->_name->isMissing()) {
      return null;
    }
    return TypeAssert\instance_of(EditableToken::class, $this->_name);
  }

  /**
   * @returns NameToken | QualifiedNameToken
   */
  public function getNamex(): EditableToken {
    return TypeAssert\instance_of(EditableToken::class, $this->_name);
  }

  public function getAsUNTYPED(): EditableNode {
    return $this->_as;
  }

  public function withAs(EditableNode $value): this {
    if ($value === $this->_as) {
      return $this;
    }
    return new self($this->_clause_kind, $this->_name, $value, $this->_alias);
  }

  public function hasAs(): bool {
    return !$this->_as->isMissing();
  }

  /**
   * @returns Missing | AsToken
   */
  public function getAs(): ?AsToken {
    if ($this->_as->isMissing()) {
      return null;
    }
    return TypeAssert\instance_of(AsToken::class, $this->_as);
  }

  /**
   * @returns AsToken
   */
  public function getAsx(): AsToken {
    return TypeAssert\instance_of(AsToken::class, $this->_as);
  }

  public function getAliasUNTYPED(): EditableNode {
    return $this->_alias;
  }

  public function withAlias(EditableNode $value): this {
    if ($value === $this->_alias) {
      return $this;
    }
    return new self($this->_clause_kind, $this->_name, $this->_as, $value);
  }

  public function hasAlias(): bool {
    return !$this->_alias->isMissing();
  }

  /**
   * @returns Missing | NameToken
   */
  public function getAlias(): ?NameToken {
    if ($this->_alias->isMissing()) {
      return null;
    }
    return TypeAssert\instance_of(NameToken::class, $this->_alias);
  }

  /**
   * @returns NameToken
   */
  public function getAliasx(): NameToken {
    return TypeAssert\instance_of(NameToken::class, $this->_alias);
  }
}
