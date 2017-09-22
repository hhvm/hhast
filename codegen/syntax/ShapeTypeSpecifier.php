<?hh // strict
/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<e0ea53e010321b5141f55ee2a116baec>>
 */
namespace Facebook\HHAST;
use namespace Facebook\TypeAssert;

final class ShapeTypeSpecifier extends EditableNode {

  private EditableNode $_keyword;
  private EditableNode $_left_paren;
  private EditableNode $_fields;
  private EditableNode $_ellipsis;
  private EditableNode $_right_paren;

  public function __construct(
    EditableNode $keyword,
    EditableNode $left_paren,
    EditableNode $fields,
    EditableNode $ellipsis,
    EditableNode $right_paren,
  ) {
    parent::__construct('shape_type_specifier');
    $this->_keyword = $keyword;
    $this->_left_paren = $left_paren;
    $this->_fields = $fields;
    $this->_ellipsis = $ellipsis;
    $this->_right_paren = $right_paren;
  }

  <<__Override>>
  public static function fromJSON(
    dict<string, mixed> $json,
    int $position,
    string $source,
  ): this {
    $keyword = EditableNode::fromJSON(
      /* UNSAFE_EXPR */ $json['shape_type_keyword'],
      $position,
      $source,
    );
    $position += $keyword->getWidth();
    $left_paren = EditableNode::fromJSON(
      /* UNSAFE_EXPR */ $json['shape_type_left_paren'],
      $position,
      $source,
    );
    $position += $left_paren->getWidth();
    $fields = EditableNode::fromJSON(
      /* UNSAFE_EXPR */ $json['shape_type_fields'],
      $position,
      $source,
    );
    $position += $fields->getWidth();
    $ellipsis = EditableNode::fromJSON(
      /* UNSAFE_EXPR */ $json['shape_type_ellipsis'],
      $position,
      $source,
    );
    $position += $ellipsis->getWidth();
    $right_paren = EditableNode::fromJSON(
      /* UNSAFE_EXPR */ $json['shape_type_right_paren'],
      $position,
      $source,
    );
    $position += $right_paren->getWidth();
    return new self($keyword, $left_paren, $fields, $ellipsis, $right_paren);
  }

  <<__Override>>
  public function getChildren(): KeyedTraversable<string, EditableNode> {
    return dict[
      'keyword' => $this->_keyword,
      'left_paren' => $this->_left_paren,
      'fields' => $this->_fields,
      'ellipsis' => $this->_ellipsis,
      'right_paren' => $this->_right_paren,
    ];
  }

  <<__Override>>
  public function rewriteDescendants(
    self::TRewriter $rewriter,
    ?Traversable<EditableNode> $parents = null,
  ): this {
    $parents = $parents === null ? vec[] : vec($parents);
    $parents[] = $this;
    $keyword = $this->_keyword->rewrite($rewriter, $parents);
    $left_paren = $this->_left_paren->rewrite($rewriter, $parents);
    $fields = $this->_fields->rewrite($rewriter, $parents);
    $ellipsis = $this->_ellipsis->rewrite($rewriter, $parents);
    $right_paren = $this->_right_paren->rewrite($rewriter, $parents);
    if (
      $keyword === $this->_keyword &&
      $left_paren === $this->_left_paren &&
      $fields === $this->_fields &&
      $ellipsis === $this->_ellipsis &&
      $right_paren === $this->_right_paren
    ) {
      return $this;
    }
    return new self($keyword, $left_paren, $fields, $ellipsis, $right_paren);
  }

  public function getKeywordUNTYPED(): EditableNode {
    return $this->_keyword;
  }

  public function withKeyword(EditableNode $value): this {
    if ($value === $this->_keyword) {
      return $this;
    }
    return new self(
      $value,
      $this->_left_paren,
      $this->_fields,
      $this->_ellipsis,
      $this->_right_paren,
    );
  }

  public function hasKeyword(): bool {
    return !$this->_keyword->isMissing();
  }

  /**
   * @returns ShapeToken
   */
  public function getKeyword(): ShapeToken {
    return TypeAssert\instance_of(ShapeToken::class, $this->_keyword);
  }

  public function getLeftParenUNTYPED(): EditableNode {
    return $this->_left_paren;
  }

  public function withLeftParen(EditableNode $value): this {
    if ($value === $this->_left_paren) {
      return $this;
    }
    return new self(
      $this->_keyword,
      $value,
      $this->_fields,
      $this->_ellipsis,
      $this->_right_paren,
    );
  }

  public function hasLeftParen(): bool {
    return !$this->_left_paren->isMissing();
  }

  /**
   * @returns LeftParenToken
   */
  public function getLeftParen(): LeftParenToken {
    return TypeAssert\instance_of(LeftParenToken::class, $this->_left_paren);
  }

  public function getFieldsUNTYPED(): EditableNode {
    return $this->_fields;
  }

  public function withFields(EditableNode $value): this {
    if ($value === $this->_fields) {
      return $this;
    }
    return new self(
      $this->_keyword,
      $this->_left_paren,
      $value,
      $this->_ellipsis,
      $this->_right_paren,
    );
  }

  public function hasFields(): bool {
    return !$this->_fields->isMissing();
  }

  /**
   * @returns EditableList | Missing
   */
  public function getFields(): ?EditableList {
    if ($this->_fields->isMissing()) {
      return null;
    }
    return TypeAssert\instance_of(EditableList::class, $this->_fields);
  }

  /**
   * @returns EditableList
   */
  public function getFieldsx(): EditableList {
    return TypeAssert\instance_of(EditableList::class, $this->_fields);
  }

  public function getEllipsisUNTYPED(): EditableNode {
    return $this->_ellipsis;
  }

  public function withEllipsis(EditableNode $value): this {
    if ($value === $this->_ellipsis) {
      return $this;
    }
    return new self(
      $this->_keyword,
      $this->_left_paren,
      $this->_fields,
      $value,
      $this->_right_paren,
    );
  }

  public function hasEllipsis(): bool {
    return !$this->_ellipsis->isMissing();
  }

  /**
   * @returns Missing | DotDotDotToken
   */
  public function getEllipsis(): ?DotDotDotToken {
    if ($this->_ellipsis->isMissing()) {
      return null;
    }
    return TypeAssert\instance_of(DotDotDotToken::class, $this->_ellipsis);
  }

  /**
   * @returns DotDotDotToken
   */
  public function getEllipsisx(): DotDotDotToken {
    return TypeAssert\instance_of(DotDotDotToken::class, $this->_ellipsis);
  }

  public function getRightParenUNTYPED(): EditableNode {
    return $this->_right_paren;
  }

  public function withRightParen(EditableNode $value): this {
    if ($value === $this->_right_paren) {
      return $this;
    }
    return new self(
      $this->_keyword,
      $this->_left_paren,
      $this->_fields,
      $this->_ellipsis,
      $value,
    );
  }

  public function hasRightParen(): bool {
    return !$this->_right_paren->isMissing();
  }

  /**
   * @returns RightParenToken
   */
  public function getRightParen(): RightParenToken {
    return TypeAssert\instance_of(RightParenToken::class, $this->_right_paren);
  }
}
