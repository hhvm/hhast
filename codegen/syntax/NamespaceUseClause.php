<?hh
/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<a4a45fef7388aabb01d5dba06d09edb3>>
 */
namespace Facebook\HHAST;
use type Facebook\TypeAssert\TypeAssert;

final class NamespaceUseClause extends EditableSyntax {

  private EditableSyntax $_clause_kind;
  private EditableSyntax $_name;
  private EditableSyntax $_as;
  private EditableSyntax $_alias;

  public function __construct(
    EditableSyntax $clause_kind,
    EditableSyntax $name,
    EditableSyntax $as,
    EditableSyntax $alias,
  ) {
    parent::__construct('namespace_use_clause');
    $this->_clause_kind = $clause_kind;
    $this->_name = $name;
    $this->_as = $as;
    $this->_alias = $alias;
  }

  <<__Override>>
  public static function fromJSON(
    array<string, mixed> $json,
    int $position,
    string $source,
  ): this {
    $clause_kind = EditableSyntax::fromJSON(
      /* UNSAFE_EXPR */ $json['namespace_use_clause_kind'],
      $position,
      $source,
    );
    $position += $clause_kind->getWidth();
    $name = EditableSyntax::fromJSON(
      /* UNSAFE_EXPR */ $json['namespace_use_name'],
      $position,
      $source,
    );
    $position += $name->getWidth();
    $as = EditableSyntax::fromJSON(
      /* UNSAFE_EXPR */ $json['namespace_use_as'],
      $position,
      $source,
    );
    $position += $as->getWidth();
    $alias = EditableSyntax::fromJSON(
      /* UNSAFE_EXPR */ $json['namespace_use_alias'],
      $position,
      $source,
    );
    $position += $alias->getWidth();
    return new self($clause_kind, $name, $as, $alias);
  }

  <<__Override>>
  public function getChildren(): KeyedTraversable<string, EditableSyntax> {
    yield 'clause_kind' => $this->_clause_kind;
    yield 'name' => $this->_name;
    yield 'as' => $this->_as;
    yield 'alias' => $this->_alias;
  }

  <<__Override>>
  public function rewriteDescendants(
    self::TRewriter $rewriter,
    ?Traversable<EditableSyntax> $parents = null,
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

  public function getClauseKindUNTYPED(): EditableSyntax {
    return $this->_clause_kind;
  }

  public function withClauseKind(EditableSyntax $value): this {
    if ($value === $this->_clause_kind) {
      return $this;
    }
    return new self($value, $this->_name, $this->_as, $this->_alias);
  }

  public function hasClauseKind(): bool {
    return !$this->_clause_kind->isMissing();
  }

  public function getClauseKind(): EditableSyntax {
    return TypeAssert::isInstanceOf(EditableSyntax::class, $this->_clause_kind);
  }

  public function getNameUNTYPED(): EditableSyntax {
    return $this->_name;
  }

  public function withName(EditableSyntax $value): this {
    if ($value === $this->_name) {
      return $this;
    }
    return new self($this->_clause_kind, $value, $this->_as, $this->_alias);
  }

  public function hasName(): bool {
    return !$this->_name->isMissing();
  }

  public function getName(): EditableSyntax {
    return TypeAssert::isInstanceOf(EditableSyntax::class, $this->_name);
  }

  public function getAsUNTYPED(): EditableSyntax {
    return $this->_as;
  }

  public function withAs(EditableSyntax $value): this {
    if ($value === $this->_as) {
      return $this;
    }
    return new self($this->_clause_kind, $this->_name, $value, $this->_alias);
  }

  public function hasAs(): bool {
    return !$this->_as->isMissing();
  }

  public function getAs(): ?AsToken {
    if ($this->_as->isMissing()) {
      return null;
    }
    return TypeAssert::isInstanceOf(AsToken::class, $this->_as);
  }

  public function getAsx(): AsToken {
    return TypeAssert::isInstanceOf(AsToken::class, $this->_as);
  }

  public function getAliasUNTYPED(): EditableSyntax {
    return $this->_alias;
  }

  public function withAlias(EditableSyntax $value): this {
    if ($value === $this->_alias) {
      return $this;
    }
    return new self($this->_clause_kind, $this->_name, $this->_as, $value);
  }

  public function hasAlias(): bool {
    return !$this->_alias->isMissing();
  }

  public function getAlias(): ?NameToken {
    if ($this->_alias->isMissing()) {
      return null;
    }
    return TypeAssert::isInstanceOf(NameToken::class, $this->_alias);
  }

  public function getAliasx(): NameToken {
    return TypeAssert::isInstanceOf(NameToken::class, $this->_alias);
  }
}
