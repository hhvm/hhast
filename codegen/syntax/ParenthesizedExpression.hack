/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<9345364dcea11a3f7baff3d4ee6ec0b4>>
 */
namespace Facebook\HHAST;
use namespace Facebook\TypeAssert;

<<__ConsistentConstruct>>
final class ParenthesizedExpression
  extends EditableNode
  implements IExpression {

  private EditableNode $_left_paren;
  private EditableNode $_expression;
  private EditableNode $_right_paren;

  public function __construct(
    EditableNode $left_paren,
    EditableNode $expression,
    EditableNode $right_paren,
    ?__Private\SourceRef $source_ref = null,
  ) {
    $this->_left_paren = $left_paren;
    $this->_expression = $expression;
    $this->_right_paren = $right_paren;
    parent::__construct('parenthesized_expression', $source_ref);
  }

  <<__Override>>
  public static function fromJSON(
    dict<string, mixed> $json,
    string $file,
    int $initial_offset,
    string $source,
  ): this {
    $offset = $initial_offset;
    $left_paren = EditableNode::fromJSON(
      /* UNSAFE_EXPR */ $json['parenthesized_expression_left_paren'],
      $file,
      $offset,
      $source,
    );
    $offset += $left_paren->getWidth();
    $expression = EditableNode::fromJSON(
      /* UNSAFE_EXPR */ $json['parenthesized_expression_expression'],
      $file,
      $offset,
      $source,
    );
    $offset += $expression->getWidth();
    $right_paren = EditableNode::fromJSON(
      /* UNSAFE_EXPR */ $json['parenthesized_expression_right_paren'],
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
    return new static($left_paren, $expression, $right_paren, $source_ref);
  }

  <<__Override>>
  public function getChildren(): dict<string, EditableNode> {
    return dict[
      'left_paren' => $this->_left_paren,
      'expression' => $this->_expression,
      'right_paren' => $this->_right_paren,
    ];
  }

  <<__Override>>
  public function rewriteChildren(
    self::TRewriter $rewriter,
    vec<EditableNode> $parents = vec[],
  ): this {
    $parents[] = $this;
    $left_paren = $rewriter($this->_left_paren, $parents);
    $expression = $rewriter($this->_expression, $parents);
    $right_paren = $rewriter($this->_right_paren, $parents);
    if (
      $left_paren === $this->_left_paren &&
      $expression === $this->_expression &&
      $right_paren === $this->_right_paren
    ) {
      return $this;
    }
    return new static($left_paren, $expression, $right_paren);
  }

  public function getLeftParenUNTYPED(): EditableNode {
    return $this->_left_paren;
  }

  public function withLeftParen(EditableNode $value): this {
    if ($value === $this->_left_paren) {
      return $this;
    }
    return new static($value, $this->_expression, $this->_right_paren);
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

  public function getExpressionUNTYPED(): EditableNode {
    return $this->_expression;
  }

  public function withExpression(EditableNode $value): this {
    if ($value === $this->_expression) {
      return $this;
    }
    return new static($this->_left_paren, $value, $this->_right_paren);
  }

  public function hasExpression(): bool {
    return !$this->_expression->isMissing();
  }

  /**
   * @return AnonymousFunction | ArrayIntrinsicExpression | BinaryExpression |
   * CastExpression | CollectionLiteralExpression | ConditionalExpression |
   * EmptyExpression | FunctionCallExpression | InclusionExpression |
   * InstanceofExpression | IsExpression | IssetExpression | LambdaExpression |
   * LiteralExpression | MemberSelectionExpression | ObjectCreationExpression |
   * ParenthesizedExpression | PostfixUnaryExpression | PrefixUnaryExpression |
   * QualifiedName | ScopeResolutionExpression | SubscriptExpression |
   * NameToken | VariableExpression | VectorIntrinsicExpression | XHPExpression
   * | YieldExpression
   */
  public function getExpression(): EditableNode {
    return TypeAssert\instance_of(EditableNode::class, $this->_expression);
  }

  /**
   * @return AnonymousFunction | ArrayIntrinsicExpression | BinaryExpression |
   * CastExpression | CollectionLiteralExpression | ConditionalExpression |
   * EmptyExpression | FunctionCallExpression | InclusionExpression |
   * InstanceofExpression | IsExpression | IssetExpression | LambdaExpression |
   * LiteralExpression | MemberSelectionExpression | ObjectCreationExpression |
   * ParenthesizedExpression | PostfixUnaryExpression | PrefixUnaryExpression |
   * QualifiedName | ScopeResolutionExpression | SubscriptExpression |
   * NameToken | VariableExpression | VectorIntrinsicExpression | XHPExpression
   * | YieldExpression
   */
  public function getExpressionx(): EditableNode {
    return $this->getExpression();
  }

  public function getRightParenUNTYPED(): EditableNode {
    return $this->_right_paren;
  }

  public function withRightParen(EditableNode $value): this {
    if ($value === $this->_right_paren) {
      return $this;
    }
    return new static($this->_left_paren, $this->_expression, $value);
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
