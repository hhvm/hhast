/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<da39bb4aa0b1bef61b4f46f50f5c732d>>
 */
namespace Facebook\HHAST;
use namespace Facebook\TypeAssert;

<<__ConsistentConstruct>>
final class TraitUseAliasItem extends EditableNode {

  private EditableNode $_aliasing_name;
  private EditableNode $_keyword;
  private EditableNode $_modifiers;
  private EditableNode $_aliased_name;

  public function __construct(
    EditableNode $aliasing_name,
    EditableNode $keyword,
    EditableNode $modifiers,
    EditableNode $aliased_name,
    ?__Private\SourceRef $source_ref = null,
  ) {
    $this->_aliasing_name = $aliasing_name;
    $this->_keyword = $keyword;
    $this->_modifiers = $modifiers;
    $this->_aliased_name = $aliased_name;
    parent::__construct('trait_use_alias_item', $source_ref);
  }

  <<__Override>>
  public static function fromJSON(
    dict<string, mixed> $json,
    string $file,
    int $initial_offset,
    string $source,
  ): this {
    $offset = $initial_offset;
    $aliasing_name = EditableNode::fromJSON(
      /* UNSAFE_EXPR */ $json['trait_use_alias_item_aliasing_name'],
      $file,
      $offset,
      $source,
    );
    $offset += $aliasing_name->getWidth();
    $keyword = EditableNode::fromJSON(
      /* UNSAFE_EXPR */ $json['trait_use_alias_item_keyword'],
      $file,
      $offset,
      $source,
    );
    $offset += $keyword->getWidth();
    $modifiers = EditableNode::fromJSON(
      /* UNSAFE_EXPR */ $json['trait_use_alias_item_modifiers'],
      $file,
      $offset,
      $source,
    );
    $offset += $modifiers->getWidth();
    $aliased_name = EditableNode::fromJSON(
      /* UNSAFE_EXPR */ $json['trait_use_alias_item_aliased_name'],
      $file,
      $offset,
      $source,
    );
    $offset += $aliased_name->getWidth();
    $source_ref = shape(
      'file' => $file,
      'source' => $source,
      'offset' => $initial_offset,
      'width' => $offset - $initial_offset,
    );
    return new static(
      $aliasing_name,
      $keyword,
      $modifiers,
      $aliased_name,
      $source_ref,
    );
  }

  <<__Override>>
  public function getChildren(): dict<string, EditableNode> {
    return dict[
      'aliasing_name' => $this->_aliasing_name,
      'keyword' => $this->_keyword,
      'modifiers' => $this->_modifiers,
      'aliased_name' => $this->_aliased_name,
    ];
  }

  <<__Override>>
  public function rewriteDescendants(
    self::TRewriter $rewriter,
    ?vec<EditableNode> $parents = null,
  ): this {
    $parents = $parents === null ? vec[] : vec($parents);
    $parents[] = $this;
    $aliasing_name = $this->_aliasing_name->rewrite($rewriter, $parents);
    $keyword = $this->_keyword->rewrite($rewriter, $parents);
    $modifiers = $this->_modifiers->rewrite($rewriter, $parents);
    $aliased_name = $this->_aliased_name->rewrite($rewriter, $parents);
    if (
      $aliasing_name === $this->_aliasing_name &&
      $keyword === $this->_keyword &&
      $modifiers === $this->_modifiers &&
      $aliased_name === $this->_aliased_name
    ) {
      return $this;
    }
    return new static($aliasing_name, $keyword, $modifiers, $aliased_name);
  }

  public function getAliasingNameUNTYPED(): EditableNode {
    return $this->_aliasing_name;
  }

  public function withAliasingName(EditableNode $value): this {
    if ($value === $this->_aliasing_name) {
      return $this;
    }
    return new static(
      $value,
      $this->_keyword,
      $this->_modifiers,
      $this->_aliased_name,
    );
  }

  public function hasAliasingName(): bool {
    return !$this->_aliasing_name->isMissing();
  }

  /**
   * @return ScopeResolutionExpression | SimpleTypeSpecifier
   */
  public function getAliasingName(): EditableNode {
    return TypeAssert\instance_of(EditableNode::class, $this->_aliasing_name);
  }

  /**
   * @return ScopeResolutionExpression | SimpleTypeSpecifier
   */
  public function getAliasingNamex(): EditableNode {
    return $this->getAliasingName();
  }

  public function getKeywordUNTYPED(): EditableNode {
    return $this->_keyword;
  }

  public function withKeyword(EditableNode $value): this {
    if ($value === $this->_keyword) {
      return $this;
    }
    return new static(
      $this->_aliasing_name,
      $value,
      $this->_modifiers,
      $this->_aliased_name,
    );
  }

  public function hasKeyword(): bool {
    return !$this->_keyword->isMissing();
  }

  /**
   * @return AsToken
   */
  public function getKeyword(): AsToken {
    return TypeAssert\instance_of(AsToken::class, $this->_keyword);
  }

  /**
   * @return AsToken
   */
  public function getKeywordx(): AsToken {
    return $this->getKeyword();
  }

  public function getModifiersUNTYPED(): EditableNode {
    return $this->_modifiers;
  }

  public function withModifiers(EditableNode $value): this {
    if ($value === $this->_modifiers) {
      return $this;
    }
    return new static(
      $this->_aliasing_name,
      $this->_keyword,
      $value,
      $this->_aliased_name,
    );
  }

  public function hasModifiers(): bool {
    return !$this->_modifiers->isMissing();
  }

  /**
   * @return EditableList<EditableNode> | null
   */
  public function getModifiers(): ?EditableList<EditableNode> {
    if ($this->_modifiers->isMissing()) {
      return null;
    }
    return TypeAssert\instance_of(EditableList::class, $this->_modifiers);
  }

  /**
   * @return EditableList<EditableNode>
   */
  public function getModifiersx(): EditableList<EditableNode> {
    return TypeAssert\instance_of(EditableList::class, $this->_modifiers);
  }

  public function getAliasedNameUNTYPED(): EditableNode {
    return $this->_aliased_name;
  }

  public function withAliasedName(EditableNode $value): this {
    if ($value === $this->_aliased_name) {
      return $this;
    }
    return new static(
      $this->_aliasing_name,
      $this->_keyword,
      $this->_modifiers,
      $value,
    );
  }

  public function hasAliasedName(): bool {
    return !$this->_aliased_name->isMissing();
  }

  /**
   * @return null | SimpleTypeSpecifier
   */
  public function getAliasedName(): ?SimpleTypeSpecifier {
    if ($this->_aliased_name->isMissing()) {
      return null;
    }
    return TypeAssert\instance_of(
      SimpleTypeSpecifier::class,
      $this->_aliased_name,
    );
  }

  /**
   * @return SimpleTypeSpecifier
   */
  public function getAliasedNamex(): SimpleTypeSpecifier {
    return TypeAssert\instance_of(
      SimpleTypeSpecifier::class,
      $this->_aliased_name,
    );
  }
}
