/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<c4b899c30af1d90134c547de3c7dbf19>>
 */
namespace Facebook\HHAST;
use namespace Facebook\TypeAssert;

<<__ConsistentConstruct>>
final class NamespaceUseClause extends Node {

  const string SYNTAX_KIND = 'namespace_use_clause';

  private Node $_clause_kind;
  private Node $_name;
  private Node $_as;
  private Node $_alias;

  public function __construct(
    Node $clause_kind,
    Node $name,
    Node $as,
    Node $alias,
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
    string $_type_hint,
  ): this {
    $offset = $initial_offset;
    $clause_kind = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['namespace_use_clause_kind'],
      $file,
      $offset,
      $source,
      'Token',
    );
    $offset += $clause_kind->getWidth();
    $name = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['namespace_use_name'],
      $file,
      $offset,
      $source,
      'INameishNode',
    );
    $offset += $name->getWidth();
    $as = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['namespace_use_as'],
      $file,
      $offset,
      $source,
      'AsToken',
    );
    $offset += $as->getWidth();
    $alias = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['namespace_use_alias'],
      $file,
      $offset,
      $source,
      'NameToken',
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
  public function getChildren(): dict<string, Node> {
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
    vec<Node> $parents = vec[],
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

  public function getClauseKindUNTYPED(): Node {
    return $this->_clause_kind;
  }

  public function withClauseKind(Node $value): this {
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
  public function getClauseKind(): ?Token {
    if ($this->_clause_kind->isMissing()) {
      return null;
    }
    return TypeAssert\instance_of(Token::class, $this->_clause_kind);
  }

  /**
   * @return ConstToken | FunctionToken
   */
  public function getClauseKindx(): Token {
    return TypeAssert\not_null($this->getClauseKind());
  }

  public function getNameUNTYPED(): Node {
    return $this->_name;
  }

  public function withName(Node $value): this {
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

  public function getAsUNTYPED(): Node {
    return $this->_as;
  }

  public function withAs(Node $value): this {
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

  public function getAliasUNTYPED(): Node {
    return $this->_alias;
  }

  public function withAlias(Node $value): this {
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
