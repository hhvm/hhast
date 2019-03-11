<?hh // strict
/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<8778467dbef0ca886a8f211b1859a056>>
 */
namespace Facebook\HHAST;
use namespace Facebook\TypeAssert;

<<__ConsistentConstruct>>
final class TraitUsePrecedenceItem extends EditableNode {

  private EditableNode $_name;
  private EditableNode $_keyword;
  private EditableNode $_removed_names;

  public function __construct(
    EditableNode $name,
    EditableNode $keyword,
    EditableNode $removed_names,
  ) {
    parent::__construct('trait_use_precedence_item');
    $this->_name = $name;
    $this->_keyword = $keyword;
    $this->_removed_names = $removed_names;
  }

  <<__Override>>
  public static function fromJSON(
    dict<string, mixed> $json,
    string $file,
    int $offset,
    string $source,
  ): this {
    $name = EditableNode::fromJSON(
      /* UNSAFE_EXPR */ $json['trait_use_precedence_item_name'],
      $file,
      $offset,
      $source,
    );
    $offset += $name->getWidth();
    $keyword = EditableNode::fromJSON(
      /* UNSAFE_EXPR */ $json['trait_use_precedence_item_keyword'],
      $file,
      $offset,
      $source,
    );
    $offset += $keyword->getWidth();
    $removed_names = EditableNode::fromJSON(
      /* UNSAFE_EXPR */ $json['trait_use_precedence_item_removed_names'],
      $file,
      $offset,
      $source,
    );
    $offset += $removed_names->getWidth();
    return new static($name, $keyword, $removed_names);
  }

  <<__Override>>
  public function getChildren(): dict<string, EditableNode> {
    return dict[
      'name' => $this->_name,
      'keyword' => $this->_keyword,
      'removed_names' => $this->_removed_names,
    ];
  }

  <<__Override>>
  public function rewriteDescendants(
    self::TRewriter $rewriter,
    ?vec<EditableNode> $parents = null,
  ): this {
    $parents = $parents === null ? vec[] : vec($parents);
    $parents[] = $this;
    $name = $this->_name->rewrite($rewriter, $parents);
    $keyword = $this->_keyword->rewrite($rewriter, $parents);
    $removed_names = $this->_removed_names->rewrite($rewriter, $parents);
    if (
      $name === $this->_name &&
      $keyword === $this->_keyword &&
      $removed_names === $this->_removed_names
    ) {
      return $this;
    }
    return new static($name, $keyword, $removed_names);
  }

  public function getNameUNTYPED(): EditableNode {
    return $this->_name;
  }

  public function withName(EditableNode $value): this {
    if ($value === $this->_name) {
      return $this;
    }
    return new static($value, $this->_keyword, $this->_removed_names);
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

  public function getKeywordUNTYPED(): EditableNode {
    return $this->_keyword;
  }

  public function withKeyword(EditableNode $value): this {
    if ($value === $this->_keyword) {
      return $this;
    }
    return new static($this->_name, $value, $this->_removed_names);
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

  public function getRemovedNamesUNTYPED(): EditableNode {
    return $this->_removed_names;
  }

  public function withRemovedNames(EditableNode $value): this {
    if ($value === $this->_removed_names) {
      return $this;
    }
    return new static($this->_name, $this->_keyword, $value);
  }

  public function hasRemovedNames(): bool {
    return !$this->_removed_names->isMissing();
  }

  /**
   * @return EditableList<SimpleTypeSpecifier>
   */
  public function getRemovedNames(): EditableList<SimpleTypeSpecifier> {
    return TypeAssert\instance_of(EditableList::class, $this->_removed_names);
  }

  /**
   * @return EditableList<SimpleTypeSpecifier>
   */
  public function getRemovedNamesx(): EditableList<SimpleTypeSpecifier> {
    return $this->getRemovedNames();
  }
}
