<?hh // strict
/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<0be4e52e4b826ddb71272eff78086ccc>>
 */
namespace Facebook\HHAST;
use namespace Facebook\TypeAssert;

<<__ConsistentConstruct>>
final class ClassishBody extends EditableNode {

  private EditableNode $_left_brace;
  private EditableNode $_elements;
  private EditableNode $_right_brace;

  public function __construct(
    EditableNode $left_brace,
    EditableNode $elements,
    EditableNode $right_brace,
  ) {
    parent::__construct('classish_body');
    $this->_left_brace = $left_brace;
    $this->_elements = $elements;
    $this->_right_brace = $right_brace;
  }

  <<__Override>>
  public static function fromJSON(
    dict<string, mixed> $json,
    string $file,
    int $offset,
    string $source,
  ): this {
    $left_brace = EditableNode::fromJSON(
      /* UNSAFE_EXPR */ $json['classish_body_left_brace'],
      $file,
      $offset,
      $source,
    );
    $offset += $left_brace->getWidth();
    $elements = EditableNode::fromJSON(
      /* UNSAFE_EXPR */ $json['classish_body_elements'],
      $file,
      $offset,
      $source,
    );
    $offset += $elements->getWidth();
    $right_brace = EditableNode::fromJSON(
      /* UNSAFE_EXPR */ $json['classish_body_right_brace'],
      $file,
      $offset,
      $source,
    );
    $offset += $right_brace->getWidth();
    return new static($left_brace, $elements, $right_brace);
  }

  <<__Override>>
  public function getChildren(): dict<string, EditableNode> {
    return dict[
      'left_brace' => $this->_left_brace,
      'elements' => $this->_elements,
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
    $left_brace = $this->_left_brace->rewrite($rewriter, $parents);
    $elements = $this->_elements->rewrite($rewriter, $parents);
    $right_brace = $this->_right_brace->rewrite($rewriter, $parents);
    if (
      $left_brace === $this->_left_brace &&
      $elements === $this->_elements &&
      $right_brace === $this->_right_brace
    ) {
      return $this;
    }
    return new static($left_brace, $elements, $right_brace);
  }

  public function getLeftBraceUNTYPED(): EditableNode {
    return $this->_left_brace;
  }

  public function withLeftBrace(EditableNode $value): this {
    if ($value === $this->_left_brace) {
      return $this;
    }
    return new static($value, $this->_elements, $this->_right_brace);
  }

  public function hasLeftBrace(): bool {
    return !$this->_left_brace->isMissing();
  }

  /**
   * @return LeftBraceToken
   */
  public function getLeftBrace(): LeftBraceToken {
    return TypeAssert\instance_of(LeftBraceToken::class, $this->_left_brace);
  }

  /**
   * @return LeftBraceToken
   */
  public function getLeftBracex(): LeftBraceToken {
    return $this->getLeftBrace();
  }

  public function getElementsUNTYPED(): EditableNode {
    return $this->_elements;
  }

  public function withElements(EditableNode $value): this {
    if ($value === $this->_elements) {
      return $this;
    }
    return new static($this->_left_brace, $value, $this->_right_brace);
  }

  public function hasElements(): bool {
    return !$this->_elements->isMissing();
  }

  /**
   * @return EditableList<EditableNode> | null
   */
  public function getElements(): ?EditableList<EditableNode> {
    if ($this->_elements->isMissing()) {
      return null;
    }
    return TypeAssert\instance_of(EditableList::class, $this->_elements);
  }

  /**
   * @return EditableList<EditableNode>
   */
  public function getElementsx(): EditableList<EditableNode> {
    return TypeAssert\instance_of(EditableList::class, $this->_elements);
  }

  public function getRightBraceUNTYPED(): EditableNode {
    return $this->_right_brace;
  }

  public function withRightBrace(EditableNode $value): this {
    if ($value === $this->_right_brace) {
      return $this;
    }
    return new static($this->_left_brace, $this->_elements, $value);
  }

  public function hasRightBrace(): bool {
    return !$this->_right_brace->isMissing();
  }

  /**
   * @return null | RightBraceToken
   */
  public function getRightBrace(): ?RightBraceToken {
    if ($this->_right_brace->isMissing()) {
      return null;
    }
    return TypeAssert\instance_of(RightBraceToken::class, $this->_right_brace);
  }

  /**
   * @return RightBraceToken
   */
  public function getRightBracex(): RightBraceToken {
    return TypeAssert\instance_of(RightBraceToken::class, $this->_right_brace);
  }
}
