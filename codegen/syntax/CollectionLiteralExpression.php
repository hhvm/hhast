<?hh // strict
/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<0b0bc8dd5612e8a26f51d41baa4df584>>
 */
namespace Facebook\HHAST;
use namespace Facebook\TypeAssert;

<<__ConsistentConstruct>>
final class CollectionLiteralExpression extends EditableNode {

  private EditableNode $_name;
  private EditableNode $_left_brace;
  private EditableNode $_initializers;
  private EditableNode $_right_brace;

  public function __construct(
    EditableNode $name,
    EditableNode $left_brace,
    EditableNode $initializers,
    EditableNode $right_brace,
  ) {
    parent::__construct('collection_literal_expression');
    $this->_name = $name;
    $this->_left_brace = $left_brace;
    $this->_initializers = $initializers;
    $this->_right_brace = $right_brace;
  }

  <<__Override>>
  public static function fromJSON(
    dict<string, mixed> $json,
    string $file,
    int $offset,
    string $source,
  ): this {
    $name = EditableNode::fromJSON(
      /* UNSAFE_EXPR */ $json['collection_literal_name'],
      $file,
      $offset,
      $source,
    );
    $offset += $name->getWidth();
    $left_brace = EditableNode::fromJSON(
      /* UNSAFE_EXPR */ $json['collection_literal_left_brace'],
      $file,
      $offset,
      $source,
    );
    $offset += $left_brace->getWidth();
    $initializers = EditableNode::fromJSON(
      /* UNSAFE_EXPR */ $json['collection_literal_initializers'],
      $file,
      $offset,
      $source,
    );
    $offset += $initializers->getWidth();
    $right_brace = EditableNode::fromJSON(
      /* UNSAFE_EXPR */ $json['collection_literal_right_brace'],
      $file,
      $offset,
      $source,
    );
    $offset += $right_brace->getWidth();
    return new static($name, $left_brace, $initializers, $right_brace);
  }

  <<__Override>>
  public function getChildren(): dict<string, EditableNode> {
    return dict[
      'name' => $this->_name,
      'left_brace' => $this->_left_brace,
      'initializers' => $this->_initializers,
      'right_brace' => $this->_right_brace,
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
    $left_brace = $this->_left_brace->rewrite($rewriter, $parents);
    $initializers = $this->_initializers->rewrite($rewriter, $parents);
    $right_brace = $this->_right_brace->rewrite($rewriter, $parents);
    if (
      $name === $this->_name &&
      $left_brace === $this->_left_brace &&
      $initializers === $this->_initializers &&
      $right_brace === $this->_right_brace
    ) {
      return $this;
    }
    return new static($name, $left_brace, $initializers, $right_brace);
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
      $this->_left_brace,
      $this->_initializers,
      $this->_right_brace,
    );
  }

  public function hasName(): bool {
    return !$this->_name->isMissing();
  }

  /**
   * @returns SimpleTypeSpecifier | GenericTypeSpecifier
   */
  public function getName(): EditableNode {
    return TypeAssert\instance_of(EditableNode::class, $this->_name);
  }

  public function getLeftBraceUNTYPED(): EditableNode {
    return $this->_left_brace;
  }

  public function withLeftBrace(EditableNode $value): this {
    if ($value === $this->_left_brace) {
      return $this;
    }
    return new static(
      $this->_name,
      $value,
      $this->_initializers,
      $this->_right_brace,
    );
  }

  public function hasLeftBrace(): bool {
    return !$this->_left_brace->isMissing();
  }

  /**
   * @returns LeftBraceToken
   */
  public function getLeftBrace(): LeftBraceToken {
    return TypeAssert\instance_of(LeftBraceToken::class, $this->_left_brace);
  }

  public function getInitializersUNTYPED(): EditableNode {
    return $this->_initializers;
  }

  public function withInitializers(EditableNode $value): this {
    if ($value === $this->_initializers) {
      return $this;
    }
    return
      new static($this->_name, $this->_left_brace, $value, $this->_right_brace);
  }

  public function hasInitializers(): bool {
    return !$this->_initializers->isMissing();
  }

  /**
   * @returns EditableList | Missing
   */
  public function getInitializers(): ?EditableList {
    if ($this->_initializers->isMissing()) {
      return null;
    }
    return TypeAssert\instance_of(EditableList::class, $this->_initializers);
  }

  /**
   * @returns EditableList
   */
  public function getInitializersx(): EditableList {
    return TypeAssert\instance_of(EditableList::class, $this->_initializers);
  }

  public function getRightBraceUNTYPED(): EditableNode {
    return $this->_right_brace;
  }

  public function withRightBrace(EditableNode $value): this {
    if ($value === $this->_right_brace) {
      return $this;
    }
    return new static(
      $this->_name,
      $this->_left_brace,
      $this->_initializers,
      $value,
    );
  }

  public function hasRightBrace(): bool {
    return !$this->_right_brace->isMissing();
  }

  /**
   * @returns RightBraceToken | Missing
   */
  public function getRightBrace(): ?RightBraceToken {
    if ($this->_right_brace->isMissing()) {
      return null;
    }
    return TypeAssert\instance_of(RightBraceToken::class, $this->_right_brace);
  }

  /**
   * @returns RightBraceToken
   */
  public function getRightBracex(): RightBraceToken {
    return TypeAssert\instance_of(RightBraceToken::class, $this->_right_brace);
  }
}
