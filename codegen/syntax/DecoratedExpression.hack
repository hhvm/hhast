/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<60ad2f5e844e0bde1accddb49597e116>>
 */
namespace Facebook\HHAST;
use namespace Facebook\TypeAssert;

<<__ConsistentConstruct>>
final class DecoratedExpression extends EditableNode {

  private EditableNode $_decorator;
  private EditableNode $_expression;

  public function __construct(
    EditableNode $decorator,
    EditableNode $expression,
  ) {
    parent::__construct('decorated_expression');
    $this->_decorator = $decorator;
    $this->_expression = $expression;
  }

  <<__Override>>
  public static function fromJSON(
    dict<string, mixed> $json,
    string $file,
    int $offset,
    string $source,
  ): this {
    $decorator = EditableNode::fromJSON(
      /* UNSAFE_EXPR */ $json['decorated_expression_decorator'],
      $file,
      $offset,
      $source,
    );
    $offset += $decorator->getWidth();
    $expression = EditableNode::fromJSON(
      /* UNSAFE_EXPR */ $json['decorated_expression_expression'],
      $file,
      $offset,
      $source,
    );
    $offset += $expression->getWidth();
    return new static($decorator, $expression);
  }

  <<__Override>>
  public function getChildren(): dict<string, EditableNode> {
    return dict[
      'decorator' => $this->_decorator,
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
    $decorator = $this->_decorator->rewrite($rewriter, $parents);
    $expression = $this->_expression->rewrite($rewriter, $parents);
    if (
      $decorator === $this->_decorator && $expression === $this->_expression
    ) {
      return $this;
    }
    return new static($decorator, $expression);
  }

  public function getDecoratorUNTYPED(): EditableNode {
    return $this->_decorator;
  }

  public function withDecorator(EditableNode $value): this {
    if ($value === $this->_decorator) {
      return $this;
    }
    return new static($value, $this->_expression);
  }

  public function hasDecorator(): bool {
    return !$this->_decorator->isMissing();
  }

  /**
   * @return AmpersandToken | DotDotDotToken | InoutToken
   */
  public function getDecorator(): EditableToken {
    return TypeAssert\instance_of(EditableToken::class, $this->_decorator);
  }

  /**
   * @return AmpersandToken | DotDotDotToken | InoutToken
   */
  public function getDecoratorx(): EditableToken {
    return $this->getDecorator();
  }

  public function getExpressionUNTYPED(): EditableNode {
    return $this->_expression;
  }

  public function withExpression(EditableNode $value): this {
    if ($value === $this->_expression) {
      return $this;
    }
    return new static($this->_decorator, $value);
  }

  public function hasExpression(): bool {
    return !$this->_expression->isMissing();
  }

  /**
   * @return ArrayCreationExpression | ArrayIntrinsicExpression |
   * DecoratedExpression | FunctionCallExpression | ScopeResolutionExpression |
   * SubscriptExpression | VariableToken | VariableExpression
   */
  public function getExpression(): EditableNode {
    return TypeAssert\instance_of(EditableNode::class, $this->_expression);
  }

  /**
   * @return ArrayCreationExpression | ArrayIntrinsicExpression |
   * DecoratedExpression | FunctionCallExpression | ScopeResolutionExpression |
   * SubscriptExpression | VariableToken | VariableExpression
   */
  public function getExpressionx(): EditableNode {
    return $this->getExpression();
  }
}
