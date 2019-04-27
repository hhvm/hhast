/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<2151cf2c343b73f4b51cecdd77fd6dae>>
 */
namespace Facebook\HHAST;
use namespace Facebook\TypeAssert;

<<__ConsistentConstruct>>
final class ShapeExpression extends EditableNode {

  private EditableNode $_keyword;
  private EditableNode $_left_paren;
  private EditableNode $_fields;
  private EditableNode $_right_paren;

  public function __construct(
    EditableNode $keyword,
    EditableNode $left_paren,
    EditableNode $fields,
    EditableNode $right_paren,
    ?__Private\SourceRef $source_ref = null,
  ) {
    $this->_keyword = $keyword;
    $this->_left_paren = $left_paren;
    $this->_fields = $fields;
    $this->_right_paren = $right_paren;
    parent::__construct('shape_expression', $source_ref);
  }

  <<__Override>>
  public static function fromJSON(
    dict<string, mixed> $json,
    string $file,
    int $initial_offset,
    string $source,
  ): this {
    $offset = $initial_offset;
    $keyword = EditableNode::fromJSON(
      /* UNSAFE_EXPR */ $json['shape_expression_keyword'],
      $file,
      $offset,
      $source,
    );
    $offset += $keyword->getWidth();
    $left_paren = EditableNode::fromJSON(
      /* UNSAFE_EXPR */ $json['shape_expression_left_paren'],
      $file,
      $offset,
      $source,
    );
    $offset += $left_paren->getWidth();
    $fields = EditableNode::fromJSON(
      /* UNSAFE_EXPR */ $json['shape_expression_fields'],
      $file,
      $offset,
      $source,
    );
    $offset += $fields->getWidth();
    $right_paren = EditableNode::fromJSON(
      /* UNSAFE_EXPR */ $json['shape_expression_right_paren'],
      $file,
      $offset,
      $source,
    );
    $offset += $right_paren->getWidth();
    $source_ref = shape(
      'file' => $file,
      'source' => $source,
      'offset' => $initial_offset,
      'width' => $offset - $initial_offset,
    );
    return new static(
      $keyword,
      $left_paren,
      $fields,
      $right_paren,
      $source_ref,
    );
  }

  <<__Override>>
  public function getChildren(): dict<string, EditableNode> {
    return dict[
      'keyword' => $this->_keyword,
      'left_paren' => $this->_left_paren,
      'fields' => $this->_fields,
      'right_paren' => $this->_right_paren,
    ];
  }

  <<__Override>>
  public function rewriteDescendants(
    self::TRewriter $rewriter,
    vec<EditableNode> $parents = vec[],
  ): this {
    $parents[] = $this;
    $keyword = $this->_keyword->rewrite($rewriter, $parents);
    $left_paren = $this->_left_paren->rewrite($rewriter, $parents);
    $fields = $this->_fields->rewrite($rewriter, $parents);
    $right_paren = $this->_right_paren->rewrite($rewriter, $parents);
    if (
      $keyword === $this->_keyword &&
      $left_paren === $this->_left_paren &&
      $fields === $this->_fields &&
      $right_paren === $this->_right_paren
    ) {
      return $this;
    }
    return new static($keyword, $left_paren, $fields, $right_paren);
  }

  public function getKeywordUNTYPED(): EditableNode {
    return $this->_keyword;
  }

  public function withKeyword(EditableNode $value): this {
    if ($value === $this->_keyword) {
      return $this;
    }
    return new static(
      $value,
      $this->_left_paren,
      $this->_fields,
      $this->_right_paren,
    );
  }

  public function hasKeyword(): bool {
    return !$this->_keyword->isMissing();
  }

  /**
   * @return ShapeToken
   */
  public function getKeyword(): ShapeToken {
    return TypeAssert\instance_of(ShapeToken::class, $this->_keyword);
  }

  /**
   * @return ShapeToken
   */
  public function getKeywordx(): ShapeToken {
    return $this->getKeyword();
  }

  public function getLeftParenUNTYPED(): EditableNode {
    return $this->_left_paren;
  }

  public function withLeftParen(EditableNode $value): this {
    if ($value === $this->_left_paren) {
      return $this;
    }
    return new static(
      $this->_keyword,
      $value,
      $this->_fields,
      $this->_right_paren,
    );
  }

  public function hasLeftParen(): bool {
    return !$this->_left_paren->isMissing();
  }

  /**
   * @return LeftParenToken
   */
  public function getLeftParen(): LeftParenToken {
    return TypeAssert\instance_of(LeftParenToken::class, $this->_left_paren);
  }

  /**
   * @return LeftParenToken
   */
  public function getLeftParenx(): LeftParenToken {
    return $this->getLeftParen();
  }

  public function getFieldsUNTYPED(): EditableNode {
    return $this->_fields;
  }

  public function withFields(EditableNode $value): this {
    if ($value === $this->_fields) {
      return $this;
    }
    return new static(
      $this->_keyword,
      $this->_left_paren,
      $value,
      $this->_right_paren,
    );
  }

  public function hasFields(): bool {
    return !$this->_fields->isMissing();
  }

  /**
   * @return EditableList<FieldInitializer> | null
   */
  public function getFields(): ?EditableList<FieldInitializer> {
    if ($this->_fields->isMissing()) {
      return null;
    }
    return TypeAssert\instance_of(EditableList::class, $this->_fields);
  }

  /**
   * @return EditableList<FieldInitializer>
   */
  public function getFieldsx(): EditableList<FieldInitializer> {
    return TypeAssert\instance_of(EditableList::class, $this->_fields);
  }

  public function getRightParenUNTYPED(): EditableNode {
    return $this->_right_paren;
  }

  public function withRightParen(EditableNode $value): this {
    if ($value === $this->_right_paren) {
      return $this;
    }
    return new static(
      $this->_keyword,
      $this->_left_paren,
      $this->_fields,
      $value,
    );
  }

  public function hasRightParen(): bool {
    return !$this->_right_paren->isMissing();
  }

  /**
   * @return RightParenToken
   */
  public function getRightParen(): RightParenToken {
    return TypeAssert\instance_of(RightParenToken::class, $this->_right_paren);
  }

  /**
   * @return RightParenToken
   */
  public function getRightParenx(): RightParenToken {
    return $this->getRightParen();
  }
}
