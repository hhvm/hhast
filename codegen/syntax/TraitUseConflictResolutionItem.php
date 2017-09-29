<?hh // strict
/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<5f80b5544676c1f2c751a140d3b4c06d>>
 */
namespace Facebook\HHAST;
use namespace Facebook\TypeAssert;

final class TraitUseConflictResolutionItem extends EditableNode {

  private EditableNode $_aliasing_name;
  private EditableNode $_aliasing_keyword;
  private EditableNode $_aliased_names;

  public function __construct(
    EditableNode $aliasing_name,
    EditableNode $aliasing_keyword,
    EditableNode $aliased_names,
  ) {
    parent::__construct('trait_use_conflict_resolution_item');
    $this->_aliasing_name = $aliasing_name;
    $this->_aliasing_keyword = $aliasing_keyword;
    $this->_aliased_names = $aliased_names;
  }

  <<__Override>>
  public static function fromJSON(
    dict<string, mixed> $json,
    string $file,
    int $offset,
    string $source,
  ): this {
    $aliasing_name = EditableNode::fromJSON(
      /* UNSAFE_EXPR */ $json[
        'trait_use_conflict_resolution_item_aliasing_name'
      ],
      $file,
      $offset,
      $source,
    );
    $offset += $aliasing_name->getWidth();
    $aliasing_keyword = EditableNode::fromJSON(
      /* UNSAFE_EXPR */ $json[
        'trait_use_conflict_resolution_item_aliasing_keyword'
      ],
      $file,
      $offset,
      $source,
    );
    $offset += $aliasing_keyword->getWidth();
    $aliased_names = EditableNode::fromJSON(
      /* UNSAFE_EXPR */ $json[
        'trait_use_conflict_resolution_item_aliased_names'
      ],
      $file,
      $offset,
      $source,
    );
    $offset += $aliased_names->getWidth();
    return new self($aliasing_name, $aliasing_keyword, $aliased_names);
  }

  <<__Override>>
  public function getChildren(): KeyedTraversable<string, EditableNode> {
    return dict[
      'aliasing_name' => $this->_aliasing_name,
      'aliasing_keyword' => $this->_aliasing_keyword,
      'aliased_names' => $this->_aliased_names,
    ];
  }

  <<__Override>>
  public function rewriteDescendants(
    self::TRewriter $rewriter,
    ?Traversable<EditableNode> $parents = null,
  ): this {
    $parents = $parents === null ? vec[] : vec($parents);
    $parents[] = $this;
    $aliasing_name = $this->_aliasing_name->rewrite($rewriter, $parents);
    $aliasing_keyword = $this->_aliasing_keyword->rewrite($rewriter, $parents);
    $aliased_names = $this->_aliased_names->rewrite($rewriter, $parents);
    if (
      $aliasing_name === $this->_aliasing_name &&
      $aliasing_keyword === $this->_aliasing_keyword &&
      $aliased_names === $this->_aliased_names
    ) {
      return $this;
    }
    return new self($aliasing_name, $aliasing_keyword, $aliased_names);
  }

  public function getAliasingNameUNTYPED(): EditableNode {
    return $this->_aliasing_name;
  }

  public function withAliasingName(EditableNode $value): this {
    if ($value === $this->_aliasing_name) {
      return $this;
    }
    return new self($value, $this->_aliasing_keyword, $this->_aliased_names);
  }

  public function hasAliasingName(): bool {
    return !$this->_aliasing_name->isMissing();
  }

  /**
   * @returns SimpleTypeSpecifier | ScopeResolutionExpression
   */
  public function getAliasingName(): EditableNode {
    return TypeAssert\instance_of(EditableNode::class, $this->_aliasing_name);
  }

  public function getAliasingKeywordUNTYPED(): EditableNode {
    return $this->_aliasing_keyword;
  }

  public function withAliasingKeyword(EditableNode $value): this {
    if ($value === $this->_aliasing_keyword) {
      return $this;
    }
    return new self($this->_aliasing_name, $value, $this->_aliased_names);
  }

  public function hasAliasingKeyword(): bool {
    return !$this->_aliasing_keyword->isMissing();
  }

  /**
   * @returns AsToken | InsteadofToken
   */
  public function getAliasingKeyword(): EditableToken {
    return
      TypeAssert\instance_of(EditableToken::class, $this->_aliasing_keyword);
  }

  public function getAliasedNamesUNTYPED(): EditableNode {
    return $this->_aliased_names;
  }

  public function withAliasedNames(EditableNode $value): this {
    if ($value === $this->_aliased_names) {
      return $this;
    }
    return new self($this->_aliasing_name, $this->_aliasing_keyword, $value);
  }

  public function hasAliasedNames(): bool {
    return !$this->_aliased_names->isMissing();
  }

  /**
   * @returns EditableList
   */
  public function getAliasedNames(): EditableList {
    return TypeAssert\instance_of(EditableList::class, $this->_aliased_names);
  }
}
