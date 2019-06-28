/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<7418dd8fdc4c3e400b82e64e010c4fc2>>
 */
namespace Facebook\HHAST;
use namespace Facebook\TypeAssert;

<<__ConsistentConstruct>>
final class TraitUsePrecedenceItem extends Node implements ITraitUseItem {

  const string SYNTAX_KIND = 'trait_use_precedence_item';

  private Node $_name;
  private Node $_keyword;
  private Node $_removed_names;

  public function __construct(
    Node $name,
    Node $keyword,
    Node $removed_names,
    ?__Private\SourceRef $source_ref = null,
  ) {
    $this->_name = $name;
    $this->_keyword = $keyword;
    $this->_removed_names = $removed_names;
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
    $name = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['trait_use_precedence_item_name'],
      $file,
      $offset,
      $source,
      'ScopeResolutionExpression',
    );
    $offset += $name->getWidth();
    $keyword = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['trait_use_precedence_item_keyword'],
      $file,
      $offset,
      $source,
      'InsteadofToken',
    );
    $offset += $keyword->getWidth();
    $removed_names = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['trait_use_precedence_item_removed_names'],
      $file,
      $offset,
      $source,
      'NodeList<ListItem<SimpleTypeSpecifier>>',
    );
    $offset += $removed_names->getWidth();
    $source_ref = shape(
      'file' => $file,
      'source' => $source,
      'offset' => $initial_offset,
      'width' => $offset - $initial_offset,
    );
    return new static($name, $keyword, $removed_names, $source_ref);
  }

  <<__Override>>
  public function getChildren(): dict<string, Node> {
    return dict[
      'name' => $this->_name,
      'keyword' => $this->_keyword,
      'removed_names' => $this->_removed_names,
    ];
  }

  <<__Override>>
  public function rewriteChildren(
    self::TRewriter $rewriter,
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
    return new static($name, $keyword, $removed_names);
  }

  public function getNameUNTYPED(): Node {
    return $this->_name;
  }

  public function withName(ScopeResolutionExpression $value): this {
    if ($value === $this->_name) {
      return $this;
    }
    return new static(
      $value ?? Missing(),
      $this->_keyword,
      $this->_removed_names,
    );
  }

  public function hasName(): bool {
    return !$this->_name->isMissing();
  }

  /**
   * @return ScopeResolutionExpression
   */
  public function getName(): ScopeResolutionExpression {
    return TypeAssert\instance_of(
      ScopeResolutionExpression::class,
      $this->_name,
    );
  }

  /**
   * @return ScopeResolutionExpression
   */
  public function getNamex(): ScopeResolutionExpression {
    return $this->getName();
  }

  public function getKeywordUNTYPED(): Node {
    return $this->_keyword;
  }

  public function withKeyword(InsteadofToken $value): this {
    if ($value === $this->_keyword) {
      return $this;
    }
    return new static($this->_name, $value ?? Missing(), $this->_removed_names);
  }

  public function hasKeyword(): bool {
    return !$this->_keyword->isMissing();
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

  public function getRemovedNamesUNTYPED(): Node {
    return $this->_removed_names;
  }

  public function withRemovedNames(
    NodeList<ListItem<SimpleTypeSpecifier>> $value,
  ): this {
    if ($value === $this->_removed_names) {
      return $this;
    }
    return new static($this->_name, $this->_keyword, $value ?? Missing());
  }

  public function hasRemovedNames(): bool {
    return !$this->_removed_names->isMissing();
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
