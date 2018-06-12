<?hh // strict
/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<456e3a3bb64052a1ce51ef93fe599e74>>
 */
namespace Facebook\HHAST;
use namespace Facebook\TypeAssert;

<<__ConsistentConstruct>>
final class Attribute extends EditableNode {

  private EditableNode $_name;
  private EditableNode $_left_paren;
  private EditableNode $_values;
  private EditableNode $_right_paren;

  public function __construct(
    EditableNode $name,
    EditableNode $left_paren,
    EditableNode $values,
    EditableNode $right_paren,
  ) {
    parent::__construct('attribute');
    $this->_name = $name;
    $this->_left_paren = $left_paren;
    $this->_values = $values;
    $this->_right_paren = $right_paren;
  }

  <<__Override>>
  public static function fromJSON(
    dict<string, mixed> $json,
    string $file,
    int $offset,
    string $source,
  ): this {
    $name = EditableNode::fromJSON(
      /* UNSAFE_EXPR */ $json['attribute_name'],
      $file,
      $offset,
      $source,
    );
    $offset += $name->getWidth();
    $left_paren = EditableNode::fromJSON(
      /* UNSAFE_EXPR */ $json['attribute_left_paren'],
      $file,
      $offset,
      $source,
    );
    $offset += $left_paren->getWidth();
    $values = EditableNode::fromJSON(
      /* UNSAFE_EXPR */ $json['attribute_values'],
      $file,
      $offset,
      $source,
    );
    $offset += $values->getWidth();
    $right_paren = EditableNode::fromJSON(
      /* UNSAFE_EXPR */ $json['attribute_right_paren'],
      $file,
      $offset,
      $source,
    );
    $offset += $right_paren->getWidth();
    return new static($name, $left_paren, $values, $right_paren);
  }

  <<__Override>>
  public function getChildren(): dict<string, EditableNode> {
    return dict[
      'name' => $this->_name,
      'left_paren' => $this->_left_paren,
      'values' => $this->_values,
      'right_paren' => $this->_right_paren,
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
    $left_paren = $this->_left_paren->rewrite($rewriter, $parents);
    $values = $this->_values->rewrite($rewriter, $parents);
    $right_paren = $this->_right_paren->rewrite($rewriter, $parents);
    if (
      $name === $this->_name &&
      $left_paren === $this->_left_paren &&
      $values === $this->_values &&
      $right_paren === $this->_right_paren
    ) {
      return $this;
    }
    return new static($name, $left_paren, $values, $right_paren);
  }

  public function getNameUNTYPED(): EditableNode {
    return $this->_name;
  }

  public function withName(EditableNode $value): this {
    if ($value === $this->_name) {
      return $this;
    }
    return new static(
      $value,
      $this->_left_paren,
      $this->_values,
      $this->_right_paren,
    );
  }

  public function hasName(): bool {
    return !$this->_name->isMissing();
  }

  /**
   * @returns NameToken
   */
  public function getName(): NameToken {
    return TypeAssert\instance_of(NameToken::class, $this->_name);
  }

  /**
   * @returns NameToken
   */
  public function getNamex(): NameToken {
    return $this->getName();
  }

  public function getLeftParenUNTYPED(): EditableNode {
    return $this->_left_paren;
  }

  public function withLeftParen(EditableNode $value): this {
    if ($value === $this->_left_paren) {
      return $this;
    }
    return
      new static($this->_name, $value, $this->_values, $this->_right_paren);
  }

  public function hasLeftParen(): bool {
    return !$this->_left_paren->isMissing();
  }

  /**
   * @returns Missing | LeftParenToken
   */
  public function getLeftParen(): ?LeftParenToken {
    if ($this->_left_paren->isMissing()) {
      return null;
    }
    return TypeAssert\instance_of(LeftParenToken::class, $this->_left_paren);
  }

  /**
   * @returns LeftParenToken
   */
  public function getLeftParenx(): LeftParenToken {
    return TypeAssert\instance_of(LeftParenToken::class, $this->_left_paren);
  }

  public function getValuesUNTYPED(): EditableNode {
    return $this->_values;
  }

  public function withValues(EditableNode $value): this {
    if ($value === $this->_values) {
      return $this;
    }
    return
      new static($this->_name, $this->_left_paren, $value, $this->_right_paren);
  }

  public function hasValues(): bool {
    return !$this->_values->isMissing();
  }

  /**
   * @returns EditableList | Missing
   */
  public function getValues(): ?EditableList {
    if ($this->_values->isMissing()) {
      return null;
    }
    return TypeAssert\instance_of(EditableList::class, $this->_values);
  }

  /**
   * @returns EditableList
   */
  public function getValuesx(): EditableList {
    return TypeAssert\instance_of(EditableList::class, $this->_values);
  }

  public function getRightParenUNTYPED(): EditableNode {
    return $this->_right_paren;
  }

  public function withRightParen(EditableNode $value): this {
    if ($value === $this->_right_paren) {
      return $this;
    }
    return new static($this->_name, $this->_left_paren, $this->_values, $value);
  }

  public function hasRightParen(): bool {
    return !$this->_right_paren->isMissing();
  }

  /**
   * @returns Missing | RightParenToken
   */
  public function getRightParen(): ?RightParenToken {
    if ($this->_right_paren->isMissing()) {
      return null;
    }
    return TypeAssert\instance_of(RightParenToken::class, $this->_right_paren);
  }

  /**
   * @returns RightParenToken
   */
  public function getRightParenx(): RightParenToken {
    return TypeAssert\instance_of(RightParenToken::class, $this->_right_paren);
  }
}
