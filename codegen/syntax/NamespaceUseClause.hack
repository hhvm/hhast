/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<560abb853931bc26b1ca13fc444446dc>>
 */
namespace Facebook\HHAST;
use namespace Facebook\TypeAssert;
use namespace HH\Lib\Dict;

<<__ConsistentConstruct>>
final class NamespaceUseClause extends Node {

  const string SYNTAX_KIND = 'namespace_use_clause';

  private ?Token $_clause_kind;
  private INameishNode $_name;
  private ?AsToken $_as;
  private ?NameToken $_alias;

  public function __construct(
    ?Token $clause_kind,
    INameishNode $name,
    ?AsToken $as,
    ?NameToken $alias,
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
      /* HH_FIXME[4110] */ $json['namespace_use_clause_kind'] ?? dict['kind' => 'missing'],
      $file,
      $offset,
      $source,
      'Token',
    );
    $offset += $clause_kind?->getWidth() ?? 0;
    $name = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['namespace_use_name'],
      $file,
      $offset,
      $source,
      'INameishNode',
    );
    $name = $name as nonnull;
    $offset += $name->getWidth();
    $as = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['namespace_use_as'] ?? dict['kind' => 'missing'],
      $file,
      $offset,
      $source,
      'AsToken',
    );
    $offset += $as?->getWidth() ?? 0;
    $alias = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['namespace_use_alias'] ?? dict['kind' => 'missing'],
      $file,
      $offset,
      $source,
      'NameToken',
    );
    $offset += $alias?->getWidth() ?? 0;
    $source_ref = shape(
      'file' => $file,
      'source' => $source,
      'offset' => $initial_offset,
      'width' => $offset - $initial_offset,
    );
    return new static(
      /* HH_IGNORE_ERROR[4110] */ $clause_kind,
      /* HH_IGNORE_ERROR[4110] */ $name,
      /* HH_IGNORE_ERROR[4110] */ $as,
      /* HH_IGNORE_ERROR[4110] */ $alias,
      $source_ref,
    );
  }

  <<__Override>>
  public function getChildren(): dict<string, Node> {
    return dict[
      'clause_kind' => $this->_clause_kind,
      'name' => $this->_name,
      'as' => $this->_as,
      'alias' => $this->_alias,
    ]
      |> Dict\filter_nulls($$);
  }

  <<__Override>>
  public function rewriteChildren<Tret as ?Node>(
    (function(Node, vec<Node>): Tret) $rewriter,
    vec<Node> $parents = vec[],
  ): this {
    $parents[] = $this;
    $clause_kind = $this->_clause_kind === null
      ? null
      : $rewriter($this->_clause_kind, $parents);
    $name = $rewriter($this->_name, $parents);
    $as = $this->_as === null ? null : $rewriter($this->_as, $parents);
    $alias = $this->_alias === null ? null : $rewriter($this->_alias, $parents);
    if (
      $clause_kind === $this->_clause_kind &&
      $name === $this->_name &&
      $as === $this->_as &&
      $alias === $this->_alias
    ) {
      return $this;
    }
    return new static(
      /* HH_FIXME[4110] use `as` */ $clause_kind,
      /* HH_FIXME[4110] use `as` */ $name,
      /* HH_FIXME[4110] use `as` */ $as,
      /* HH_FIXME[4110] use `as` */ $alias,
    );
  }

  public function getClauseKindUNTYPED(): ?Node {
    return $this->_clause_kind;
  }

  public function withClauseKind(?Token $value): this {
    if ($value === $this->_clause_kind) {
      return $this;
    }
    return new static($value, $this->_name, $this->_as, $this->_alias);
  }

  public function hasClauseKind(): bool {
    return $this->_clause_kind !== null;
  }

  /**
   * @return null | ConstToken | FunctionToken
   */
  public function getClauseKind(): ?Token {
    return $this->_clause_kind;
  }

  /**
   * @return ConstToken | FunctionToken
   */
  public function getClauseKindx(): Token {
    return TypeAssert\not_null($this->getClauseKind());
  }

  public function getNameUNTYPED(): ?Node {
    return $this->_name;
  }

  public function withName(INameishNode $value): this {
    if ($value === $this->_name) {
      return $this;
    }
    return new static($this->_clause_kind, $value, $this->_as, $this->_alias);
  }

  public function hasName(): bool {
    return $this->_name !== null;
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

  public function getAsUNTYPED(): ?Node {
    return $this->_as;
  }

  public function withAs(?AsToken $value): this {
    if ($value === $this->_as) {
      return $this;
    }
    return new static($this->_clause_kind, $this->_name, $value, $this->_alias);
  }

  public function hasAs(): bool {
    return $this->_as !== null;
  }

  /**
   * @return null | AsToken
   */
  public function getAs(): ?AsToken {
    return $this->_as;
  }

  /**
   * @return AsToken
   */
  public function getAsx(): AsToken {
    return TypeAssert\not_null($this->getAs());
  }

  public function getAliasUNTYPED(): ?Node {
    return $this->_alias;
  }

  public function withAlias(?NameToken $value): this {
    if ($value === $this->_alias) {
      return $this;
    }
    return new static($this->_clause_kind, $this->_name, $this->_as, $value);
  }

  public function hasAlias(): bool {
    return $this->_alias !== null;
  }

  /**
   * @return null | NameToken
   */
  public function getAlias(): ?NameToken {
    return $this->_alias;
  }

  /**
   * @return NameToken
   */
  public function getAliasx(): NameToken {
    return TypeAssert\not_null($this->getAlias());
  }
}
