/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<04ec73f236512bc406184d219df579be>>
 */
namespace Facebook\HHAST;
use namespace Facebook\TypeAssert;

<<__ConsistentConstruct>>
final class NamespaceUseClause extends EditableNode {

  const string SYNTAX_KIND = 'NamespaceUseClause';

  private EditableNode $_clause_kind;
  private EditableNode $_name;
  private EditableNode $_as;
  private EditableNode $_alias;

  public function __construct(
    EditableNode $clause_kind,
    EditableNode $name,
    EditableNode $as,
    EditableNode $alias,
    ?__Private\SourceRef $source_ref = null,
  ) {
    $this->_clause_kind = $clause_kind;
    $this->_name = $name;
    $this->_as = $as;
    $this->_alias = $alias;
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
    $clause_kind = EditableNode::fromJSON(
      /* UNSAFE_EXPR */ $json['namespace_use_clause_kind'],
      $file,
      $offset,
      $source,
    );
    $offset += $clause_kind->getWidth();
    $name = EditableNode::fromJSON(
      /* UNSAFE_EXPR */ $json['namespace_use_name'],
      $file,
      $offset,
      $source,
    );
    $offset += $name->getWidth();
    $as = EditableNode::fromJSON(
      /* UNSAFE_EXPR */ $json['namespace_use_as'],
      $file,
      $offset,
      $source,
    );
    $offset += $as->getWidth();
    $alias = EditableNode::fromJSON(
      /* UNSAFE_EXPR */ $json['namespace_use_alias'],
      $file,
      $offset,
      $source,
    );
    $offset += $alias->getWidth();
    $source_ref = shape(
      'file' => $file,
      'source' => $source,
      'offset' => $initial_offset,
      'width' => $offset - $initial_offset,
    );
    return new static($clause_kind, $name, $as, $alias, $source_ref);
  }

  <<__Override>>
  public function getChildren(): dict<string, EditableNode> {
    return dict[
      'clause_kind' => $this->_clause_kind,
      'name' => $this->_name,
      'as' => $this->_as,
      'alias' => $this->_alias,
    ];
  }

  <<__Override>>
  public function rewriteChildren(
    self::TRewriter $rewriter,
    vec<EditableNode> $parents = vec[],
  ): this {
    $parents[] = $this;
    $clause_kind = $rewriter($this->_clause_kind, $parents);
    $name = $rewriter($this->_name, $parents);
    $as = $rewriter($this->_as, $parents);
    $alias = $rewriter($this->_alias, $parents);
    if (
      $clause_kind === $this->_clause_kind &&
      $name === $this->_name &&
      $as === $this->_as &&
      $alias === $this->_alias
    ) {
      return $this;
    }
    return new static($clause_kind, $name, $as, $alias);
  }

  public function getClauseKindUNTYPED(): EditableNode {
    return $this->_clause_kind;
  }

  public function withClauseKind(EditableNode $value): this {
    if ($value === $this->_clause_kind) {
      return $this;
    }
    return new static($value, $this->_name, $this->_as, $this->_alias);
  }

  public function hasClauseKind(): bool {
    return !$this->_clause_kind->isMissing();
  }

  /**
   * @return null | ConstToken | FunctionToken
   */
  public function getClauseKind(): ?EditableToken {
    if ($this->_clause_kind->isMissing()) {
      return null;
    }
    return TypeAssert\instance_of(EditableToken::class, $this->_clause_kind);
  }

  /**
   * @return ConstToken | FunctionToken
   */
  public function getClauseKindx(): EditableToken {
    return TypeAssert\not_null($this->getClauseKind());
  }

  public function getNameUNTYPED(): EditableNode {
    return $this->_name;
  }

  public function withName(EditableNode $value): this {
    if ($value === $this->_name) {
      return $this;
    }
    return new static($this->_clause_kind, $value, $this->_as, $this->_alias);
  }

  public function hasName(): bool {
    return !$this->_name->isMissing();
  }

  /**
   * @return QualifiedName | NameToken
   */
  public function getName(): INameishNode {
    return TypeAssert\instance_of(INameishNode::class, $this->_name);
  }

  /**
   * @return QualifiedName | NameToken
   */
  public function getNamex(): INameishNode {
    return $this->getName();
  }

  public function getAsUNTYPED(): EditableNode {
    return $this->_as;
  }

  public function withAs(EditableNode $value): this {
    if ($value === $this->_as) {
      return $this;
    }
    return new static($this->_clause_kind, $this->_name, $value, $this->_alias);
  }

  public function hasAs(): bool {
    return !$this->_as->isMissing();
  }

  /**
   * @return null | AsToken
   */
  public function getAs(): ?AsToken {
    if ($this->_as->isMissing()) {
      return null;
    }
    return TypeAssert\instance_of(AsToken::class, $this->_as);
  }

  /**
   * @return AsToken
   */
  public function getAsx(): AsToken {
    return TypeAssert\not_null($this->getAs());
  }

  public function getAliasUNTYPED(): EditableNode {
    return $this->_alias;
  }

  public function withAlias(EditableNode $value): this {
    if ($value === $this->_alias) {
      return $this;
    }
    return new static($this->_clause_kind, $this->_name, $this->_as, $value);
  }

  public function hasAlias(): bool {
    return !$this->_alias->isMissing();
  }

  /**
   * @return null | NameToken
   */
  public function getAlias(): ?NameToken {
    if ($this->_alias->isMissing()) {
      return null;
    }
    return TypeAssert\instance_of(NameToken::class, $this->_alias);
  }

  /**
   * @return NameToken
   */
  public function getAliasx(): NameToken {
    return TypeAssert\not_null($this->getAlias());
  }
}
