/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<c079312a1ba64210a6e15c8a9e2b0b77>>
 */
namespace Facebook\HHAST;
use namespace Facebook\TypeAssert;
use namespace HH\Lib\Dict;
/* HHAST_IGNORE_ALL[5607] 5607 is ignored because of false positives when comparing a generic to a typed value */
/* HHAST_IGNORE_ALL[5624] HHAST_IGNORE_ALL[5639] 5624 and 5639 are ignored because they insist on using co(tra)variant generics. Could this break external consumers? */

<<__ConsistentConstruct>>
final class TraitUsePrecedenceItem extends Node implements ITraitUseItem {

  const string SYNTAX_KIND = 'trait_use_precedence_item';

  private ScopeResolutionExpression $_name;
  private InsteadofToken $_keyword;
  private NodeList<ListItem<SimpleTypeSpecifier>> $_removed_names;

  public function __construct(
    ScopeResolutionExpression $name,
    InsteadofToken $keyword,
    NodeList<ListItem<SimpleTypeSpecifier>> $removed_names,
    ?__Private\SourceRef $source_ref = null,
  ) {
    $this->_name = $name;
    $this->_keyword = $keyword;
    $this->_removed_names = $removed_names;
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
    $name = Node::fromJSON(
      ($json['trait_use_precedence_item_name']) as dict<_, _>,
      $file,
      $offset,
      $source,
      'ScopeResolutionExpression',
    );
    $name = $name as nonnull;
    $offset += $name->getWidth();
    $keyword = Node::fromJSON(
      ($json['trait_use_precedence_item_keyword']) as dict<_, _>,
      $file,
      $offset,
      $source,
      'InsteadofToken',
    );
    $keyword = $keyword as nonnull;
    $offset += $keyword->getWidth();
    $removed_names = Node::fromJSON(
      ($json['trait_use_precedence_item_removed_names']) as dict<_, _>,
      $file,
      $offset,
      $source,
      'NodeList<ListItem<SimpleTypeSpecifier>>',
    );
    $removed_names = $removed_names as nonnull;
    $offset += $removed_names->getWidth();
    $source_ref = shape(
      'file' => $file,
      'source' => $source,
      'offset' => $initial_offset,
      'width' => $offset - $initial_offset,
    );
    return new static(
      /* HH_IGNORE_ERROR[4110] */ $name,
      /* HH_IGNORE_ERROR[4110] */ $keyword,
      /* HH_IGNORE_ERROR[4110] */ $removed_names,
      $source_ref,
    );
  }

  <<__Override>>
  public function getChildren(): dict<string, Node> {
    return dict[
      'name' => $this->_name,
      'keyword' => $this->_keyword,
      'removed_names' => $this->_removed_names,
    ]
      |> Dict\filter_nulls($$);
  }

  <<__Override>>
  public function rewriteChildren<Tret as ?Node>(
    (function(Node, vec<Node>): Tret) $rewriter,
    vec<Node> $parents = vec[],
  ): this {
    $parents[] = $this;
    $name = $rewriter($this->_name, $parents);
    $keyword = $rewriter($this->_keyword, $parents);
    $removed_names = $rewriter($this->_removed_names, $parents);
    if (
      $name === $this->_name &&
      $keyword === $this->_keyword &&
      $removed_names === $this->_removed_names
    ) {
      return $this;
    }
    return new static(
      $name as ScopeResolutionExpression,
      $keyword as InsteadofToken,
      /* HH_FIXME[4110] NodeList<ListItem<SimpleTypeSpecifier>> may not be enforceable */ $removed_names,
    );
  }

  public function getNameUNTYPED(): ?Node {
    return $this->_name;
  }

  public function withName(ScopeResolutionExpression $value): this {
    if ($value === $this->_name) {
      return $this;
    }
    return new static($value, $this->_keyword, $this->_removed_names);
  }

  public function hasName(): bool {
    return true;
  }

  /**
   * @return ScopeResolutionExpression
   */
  public function getName(): ScopeResolutionExpression {
    return
      TypeAssert\instance_of(ScopeResolutionExpression::class, $this->_name);
  }

  /**
   * @return ScopeResolutionExpression
   */
  public function getNamex(): ScopeResolutionExpression {
    return $this->getName();
  }

  public function getKeywordUNTYPED(): ?Node {
    return $this->_keyword;
  }

  public function withKeyword(InsteadofToken $value): this {
    if ($value === $this->_keyword) {
      return $this;
    }
    return new static($this->_name, $value, $this->_removed_names);
  }

  public function hasKeyword(): bool {
    return true;
  }

  /**
   * @return InsteadofToken
   */
  public function getKeyword(): InsteadofToken {
    return TypeAssert\instance_of(InsteadofToken::class, $this->_keyword);
  }

  /**
   * @return InsteadofToken
   */
  public function getKeywordx(): InsteadofToken {
    return $this->getKeyword();
  }

  public function getRemovedNamesUNTYPED(): ?Node {
    return $this->_removed_names;
  }

  public function withRemovedNames(
    NodeList<ListItem<SimpleTypeSpecifier>> $value,
  ): this {
    if ($value === $this->_removed_names) {
      return $this;
    }
    return new static($this->_name, $this->_keyword, $value);
  }

  public function hasRemovedNames(): bool {
    return true;
  }

  /**
   * @return NodeList<ListItem<SimpleTypeSpecifier>>
   */
  public function getRemovedNames(): NodeList<ListItem<SimpleTypeSpecifier>> {
    return TypeAssert\instance_of(NodeList::class, $this->_removed_names);
  }

  /**
   * @return NodeList<ListItem<SimpleTypeSpecifier>>
   */
  public function getRemovedNamesx(): NodeList<ListItem<SimpleTypeSpecifier>> {
    return $this->getRemovedNames();
  }
}
