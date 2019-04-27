/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<d3c057a8ea29de956aa1e4541eb2a3d9>>
 */
namespace Facebook\HHAST;
use namespace Facebook\TypeAssert;

<<__ConsistentConstruct>>
final class EmbeddedBracedExpression extends EditableNode {

  private EditableNode $_left_brace;
  private EditableNode $_expression;
  private EditableNode $_right_brace;

  public function __construct(
    EditableNode $left_brace,
    EditableNode $expression,
    EditableNode $right_brace,
    ?__Private\SourceRef $source_ref = null,
  ) {
    $this->_left_brace = $left_brace;
    $this->_expression = $expression;
    $this->_right_brace = $right_brace;
    parent::__construct('embedded_braced_expression', $source_ref);
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
      /* UNSAFE_EXPR */ $json['embedded_braced_expression_left_brace'],
      $file,
      $offset,
      $source,
    );
    $offset += $left_brace->getWidth();
    $expression = EditableNode::fromJSON(
      /* UNSAFE_EXPR */ $json['embedded_braced_expression_expression'],
      $file,
      $offset,
      $source,
    );
    $offset += $expression->getWidth();
    $right_brace = EditableNode::fromJSON(
      /* UNSAFE_EXPR */ $json['embedded_braced_expression_right_brace'],
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
    return new static($left_brace, $expression, $right_brace, $source_ref);
  }

  <<__Override>>
  public function getChildren(): dict<string, EditableNode> {
    return dict[
      'left_brace' => $this->_left_brace,
      'expression' => $this->_expression,
      'right_brace' => $this->_right_brace,
    ];
  }

  <<__Override>>
  public function rewriteDescendants(
    self::TRewriter $rewriter,
    vec<EditableNode> $parents = vec[],
  ): this {
    $parents[] = $this;
    $left_brace = $this->_left_brace->rewrite($rewriter, $parents);
    $expression = $this->_expression->rewrite($rewriter, $parents);
    $right_brace = $this->_right_brace->rewrite($rewriter, $parents);
    if (
      $left_brace === $this->_left_brace &&
      $expression === $this->_expression &&
      $right_brace === $this->_right_brace
    ) {
      return $this;
    }
    return new static($left_brace, $expression, $right_brace);
  }

  public function getLeftBraceUNTYPED(): EditableNode {
    return $this->_left_brace;
  }

  public function withLeftBrace(EditableNode $value): this {
    if ($value === $this->_left_brace) {
      return $this;
    }
    return new static($value, $this->_expression, $this->_right_brace);
  }

  public function hasLeftBrace(): bool {
    return !$this->_left_brace->isMissing();
  }

  /**
   * @return unknown
   */
  public function getLeftBrace(): EditableNode {
    return TypeAssert\instance_of(EditableNode::class, $this->_left_brace);
  }

  /**
   * @return unknown
   */
  public function getLeftBracex(): EditableNode {
    return $this->getLeftBrace();
  }

  public function getExpressionUNTYPED(): EditableNode {
    return $this->_expression;
  }

  public function withExpression(EditableNode $value): this {
    if ($value === $this->_expression) {
      return $this;
    }
    return new static($this->_left_brace, $value, $this->_right_brace);
  }

  public function hasExpression(): bool {
    return !$this->_expression->isMissing();
  }

  /**
   * @return unknown
   */
  public function getExpression(): EditableNode {
    return TypeAssert\instance_of(EditableNode::class, $this->_expression);
  }

  /**
   * @return unknown
   */
  public function getExpressionx(): EditableNode {
    return $this->getExpression();
  }

  public function getRightBraceUNTYPED(): EditableNode {
    return $this->_right_brace;
  }

  public function withRightBrace(EditableNode $value): this {
    if ($value === $this->_right_brace) {
      return $this;
    }
    return new static($this->_left_brace, $this->_expression, $value);
  }

  public function hasRightBrace(): bool {
    return !$this->_right_brace->isMissing();
  }

  /**
   * @return unknown
   */
  public function getRightBrace(): EditableNode {
    return TypeAssert\instance_of(EditableNode::class, $this->_right_brace);
  }

  /**
   * @return unknown
   */
  public function getRightBracex(): EditableNode {
    return $this->getRightBrace();
  }
}
