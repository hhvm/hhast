<?hh // strict
/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<65cf07941a12082f1672cdb347000000>>
 */
namespace Facebook\HHAST;
use namespace Facebook\TypeAssert;

<<__ConsistentConstruct>>
final class PipeVariableExpression extends EditableNode {

  private EditableNode $_expression;

  public function __construct(EditableNode $expression) {
    parent::__construct('pipe_variable_expression');
    $this->_expression = $expression;
  }

  <<__Override>>
  public static function fromJSON(
    dict<string, mixed> $json,
    string $file,
    int $offset,
    string $source,
  ): this {
    $expression = EditableNode::fromJSON(
      /* UNSAFE_EXPR */ $json['pipe_variable_expression'],
      $file,
      $offset,
      $source,
    );
    $offset += $expression->getWidth();
    return new static($expression);
  }

  <<__Override>>
  public function getChildren(): dict<string, EditableNode> {
    return dict[
      'expression' => $this->_expression,
    ];
  }

  <<__Override>>
  public function rewriteDescendants(
    self::TRewriter $rewriter,
    ?vec<EditableNode> $parents = null,
  ): this {
    $parents = $parents === null ? vec[] : vec($parents);
    $parents[] = $this;
    $expression = $this->_expression->rewrite($rewriter, $parents);
    if ($expression === $this->_expression) {
      return $this;
    }
    return new static($expression);
  }

  public function getExpressionUNTYPED(): EditableNode {
    return $this->_expression;
  }

  public function withExpression(EditableNode $value): this {
    if ($value === $this->_expression) {
      return $this;
    }
    return new static($value);
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
}
