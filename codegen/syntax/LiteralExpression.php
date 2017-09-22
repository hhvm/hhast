<?hh // strict
/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<452f183040f6552a6cf82908f9259ea1>>
 */
namespace Facebook\HHAST;
use namespace Facebook\TypeAssert;

final class LiteralExpression extends EditableNode {

  private EditableNode $_expression;

  public function __construct(EditableNode $expression) {
    parent::__construct('literal_expression');
    $this->_expression = $expression;
  }

  <<__Override>>
  public static function fromJSON(
    dict<string, mixed> $json,
    int $position,
    string $source,
  ): this {
    $expression = EditableNode::fromJSON(
      /* UNSAFE_EXPR */ $json['literal_expression'],
      $position,
      $source,
    );
    $position += $expression->getWidth();
    return new self($expression);
  }

  <<__Override>>
  public function getChildren(): KeyedTraversable<string, EditableNode> {
    return dict['expression' => $this->_expression];
  }

  <<__Override>>
  public function rewriteDescendants(
    self::TRewriter $rewriter,
    ?Traversable<EditableNode> $parents = null,
  ): this {
    $parents = $parents === null ? vec[] : vec($parents);
    $parents[] = $this;
    $expression = $this->_expression->rewrite($rewriter, $parents);
    if ($expression === $this->_expression) {
      return $this;
    }
    return new self($expression);
  }

  public function getExpressionUNTYPED(): EditableNode {
    return $this->_expression;
  }

  public function withExpression(EditableNode $value): this {
    if ($value === $this->_expression) {
      return $this;
    }
    return new self($value);
  }

  public function hasExpression(): bool {
    return !$this->_expression->isMissing();
  }

  /**
   * @returns unknown
   */
  public function getExpression(): EditableNode {
    return TypeAssert\instance_of(EditableNode::class, $this->_expression);
  }
}
