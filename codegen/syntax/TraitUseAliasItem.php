<?hh // strict
/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<2bfd8195f2a90798bdf5fa7b34dc73a6>>
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
  ) {
    parent::__construct('trait_use_alias_item');
    $this->_aliasing_name = $aliasing_name;
    $this->_keyword = $keyword;
    $this->_modifiers = $modifiers;
    $this->_aliased_name = $aliased_name;
  }

  <<__Override>>
  public static function fromJSON(
    dict<string, mixed> $json,
    string $file,
    int $offset,
    string $source,
  ): this {
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
    return new static($aliasing_name, $keyword, $modifiers, $aliased_name);
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
   * @returns ScopeResolutionExpression | SimpleTypeSpecifier
   */
  public function getAliasingName(): EditableNode {
    return TypeAssert\instance_of(EditableNode::class, $this->_aliasing_name);
  }

  /**
   * @returns ScopeResolutionExpression | SimpleTypeSpecifier
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
   * @returns AsToken
   */
  public function getKeyword(): AsToken {
    return TypeAssert\instance_of(AsToken::class, $this->_keyword);
  }

  /**
   * @returns AsToken
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
   * @returns EditableList | Missing
   */
  public function getModifiers(): ?EditableList {
    if ($this->_modifiers->isMissing()) {
      return null;
    }
    return TypeAssert\instance_of(EditableList::class, $this->_modifiers);
  }

  /**
   * @returns EditableList
   */
  public function getModifiersx(): EditableList {
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
   * @returns Missing | SimpleTypeSpecifier
   */
  public function getAliasedName(): ?SimpleTypeSpecifier {
    if ($this->_aliased_name->isMissing()) {
      return null;
    }
    return
      TypeAssert\instance_of(SimpleTypeSpecifier::class, $this->_aliased_name);
  }

  /**
   * @returns SimpleTypeSpecifier
   */
  public function getAliasedNamex(): SimpleTypeSpecifier {
    return
      TypeAssert\instance_of(SimpleTypeSpecifier::class, $this->_aliased_name);
  }
}
