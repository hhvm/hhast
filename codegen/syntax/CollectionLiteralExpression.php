<?hh // strict
/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<dd74edbb59499b4a00e2191927ff2a5c>>
 */
namespace Facebook\HHAST;
use namespace Facebook\TypeAssert;

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
    int $position,
    string $source,
  ): this {
    $name = EditableNode::fromJSON(
      /* UNSAFE_EXPR */ $json['collection_literal_name'],
      $position,
      $source,
    );
    $position += $name->getWidth();
    $left_brace = EditableNode::fromJSON(
      /* UNSAFE_EXPR */ $json['collection_literal_left_brace'],
      $position,
      $source,
    );
    $position += $left_brace->getWidth();
    $initializers = EditableNode::fromJSON(
      /* UNSAFE_EXPR */ $json['collection_literal_initializers'],
      $position,
      $source,
    );
    $position += $initializers->getWidth();
    $right_brace = EditableNode::fromJSON(
      /* UNSAFE_EXPR */ $json['collection_literal_right_brace'],
      $position,
      $source,
    );
    $position += $right_brace->getWidth();
    return new self($name, $left_brace, $initializers, $right_brace);
  }

  <<__Override>>
  public function getChildren(): KeyedTraversable<string, EditableNode> {
    yield 'name' => $this->_name;
    yield 'left_brace' => $this->_left_brace;
    yield 'initializers' => $this->_initializers;
    yield 'right_brace' => $this->_right_brace;
  }

  <<__Override>>
  public function rewriteDescendants(
    self::TRewriter $rewriter,
    ?Traversable<EditableNode> $parents = null,
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
    return new self($name, $left_brace, $initializers, $right_brace);
  }

  public function getNameUNTYPED(): EditableNode {
    return $this->_name;
  }

  public function withName(EditableNode $value): this {
    if ($value === $this->_name) {
      return $this;
    }
    return new self(
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
   * @returns NameToken | QualifiedNameToken
   */
  public function getName(): EditableToken {
    return TypeAssert\instance_of(EditableToken::class, $this->_name);
  }

  public function getLeftBraceUNTYPED(): EditableNode {
    return $this->_left_brace;
  }

  public function withLeftBrace(EditableNode $value): this {
    if ($value === $this->_left_brace) {
      return $this;
    }
    return
      new self($this->_name, $value, $this->_initializers, $this->_right_brace);
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
      new self($this->_name, $this->_left_brace, $value, $this->_right_brace);
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
    return
      new self($this->_name, $this->_left_brace, $this->_initializers, $value);
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
