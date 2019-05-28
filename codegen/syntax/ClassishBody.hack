/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<1b47efe01fa4bcd6c4ed44328c5681b6>>
 */
namespace Facebook\HHAST;
use namespace Facebook\TypeAssert;

<<__ConsistentConstruct>>
final class ClassishBody extends EditableNode {

  const string SYNTAX_KIND = 'classish_body';

  private EditableNode $_left_brace;
  private EditableNode $_elements;
  private EditableNode $_right_brace;

  public function __construct(
    EditableNode $left_brace,
    EditableNode $elements,
    EditableNode $right_brace,
    ?__Private\SourceRef $source_ref = null,
  ) {
    $this->_left_brace = $left_brace;
    $this->_elements = $elements;
    $this->_right_brace = $right_brace;
    parent::__construct($source_ref);
  }

  <<__Override>>
  public static function fromJSON(
    dict<string, mixed> $json,
    string $file,
    int $initial_offset,
    string $source,
  ): this {
    $offset = $initial_offset;
    $left_brace = EditableNode::fromJSON(
      /* HH_FIXME[4110] */ $json['classish_body_left_brace'],
      $file,
      $offset,
      $source,
    );
    $offset += $left_brace->getWidth();
    $elements = EditableNode::fromJSON(
      /* HH_FIXME[4110] */ $json['classish_body_elements'],
      $file,
      $offset,
      $source,
    );
    $offset += $elements->getWidth();
    $right_brace = EditableNode::fromJSON(
      /* HH_FIXME[4110] */ $json['classish_body_right_brace'],
      $file,
      $offset,
      $source,
    );
    $offset += $right_brace->getWidth();
    $source_ref = shape(
      'file' => $file,
      'source' => $source,
      'offset' => $initial_offset,
      'width' => $offset - $initial_offset,
    );
    return new static($left_brace, $elements, $right_brace, $source_ref);
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
  public function rewriteChildren(
    self::TRewriter $rewriter,
    vec<EditableNode> $parents = vec[],
  ): this {
    $parents[] = $this;
    $left_brace = $rewriter($this->_left_brace, $parents);
    $elements = $rewriter($this->_elements, $parents);
    $right_brace = $rewriter($this->_right_brace, $parents);
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
    return TypeAssert\not_null($this->getElements());
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
   * @return RightBraceToken
   */
  public function getRightBrace(): RightBraceToken {
    return TypeAssert\instance_of(RightBraceToken::class, $this->_right_brace);
  }

  /**
   * @return RightBraceToken
   */
  public function getRightBracex(): RightBraceToken {
    return $this->getRightBrace();
  }
}
