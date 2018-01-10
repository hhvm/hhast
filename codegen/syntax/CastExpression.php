<?hh // strict
/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<af669ac3d5501b80ae27844dc8f6298d>>
 */
namespace Facebook\HHAST;
use namespace Facebook\TypeAssert;

<<__ConsistentConstruct>>
final class CastExpression extends EditableNode {

  private EditableNode $_left_paren;
  private EditableNode $_type;
  private EditableNode $_right_paren;
  private EditableNode $_operand;

  public function __construct(
    EditableNode $left_paren,
    EditableNode $type,
    EditableNode $right_paren,
    EditableNode $operand,
  ) {
    parent::__construct('cast_expression');
    $this->_left_paren = $left_paren;
    $this->_type = $type;
    $this->_right_paren = $right_paren;
    $this->_operand = $operand;
  }

  <<__Override>>
  public static function fromJSON(
    dict<string, mixed> $json,
    string $file,
    int $offset,
    string $source,
  ): this {
    $left_paren = EditableNode::fromJSON(
      /* UNSAFE_EXPR */ $json['cast_left_paren'],
      $file,
      $offset,
      $source,
    );
    $offset += $left_paren->getWidth();
    $type = EditableNode::fromJSON(
      /* UNSAFE_EXPR */ $json['cast_type'],
      $file,
      $offset,
      $source,
    );
    $offset += $type->getWidth();
    $right_paren = EditableNode::fromJSON(
      /* UNSAFE_EXPR */ $json['cast_right_paren'],
      $file,
      $offset,
      $source,
    );
    $offset += $right_paren->getWidth();
    $operand = EditableNode::fromJSON(
      /* UNSAFE_EXPR */ $json['cast_operand'],
      $file,
      $offset,
      $source,
    );
    $offset += $operand->getWidth();
    return new static($left_paren, $type, $right_paren, $operand);
  }

  <<__Override>>
  public function getChildren(): dict<string, EditableNode> {
    return dict[
      'left_paren' => $this->_left_paren,
      'type' => $this->_type,
      'right_paren' => $this->_right_paren,
      'operand' => $this->_operand,
    ];
  }

  <<__Override>>
  public function rewriteDescendants(
    self::TRewriter $rewriter,
    ?vec<EditableNode> $parents = null,
  ): this {
    $parents = $parents === null ? vec[] : vec($parents);
    $parents[] = $this;
    $left_paren = $this->_left_paren->rewrite($rewriter, $parents);
    $type = $this->_type->rewrite($rewriter, $parents);
    $right_paren = $this->_right_paren->rewrite($rewriter, $parents);
    $operand = $this->_operand->rewrite($rewriter, $parents);
    if (
      $left_paren === $this->_left_paren &&
      $type === $this->_type &&
      $right_paren === $this->_right_paren &&
      $operand === $this->_operand
    ) {
      return $this;
    }
    return new static($left_paren, $type, $right_paren, $operand);
  }

  public function getLeftParenUNTYPED(): EditableNode {
    return $this->_left_paren;
  }

  public function withLeftParen(EditableNode $value): this {
    if ($value === $this->_left_paren) {
      return $this;
    }
    return
      new static($value, $this->_type, $this->_right_paren, $this->_operand);
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

  public function getTypeUNTYPED(): EditableNode {
    return $this->_type;
  }

  public function withType(EditableNode $value): this {
    if ($value === $this->_type) {
      return $this;
    }
    return new static(
      $this->_left_paren,
      $value,
      $this->_right_paren,
      $this->_operand,
    );
  }

  public function hasType(): bool {
    return !$this->_type->isMissing();
  }

  /**
   * @returns IntToken | DoubleToken | StringToken | BoolToken | ObjectToken |
   * ArrayToken | FloatToken | UnsetToken | NameToken
   */
  public function getType(): EditableToken {
    return TypeAssert\instance_of(EditableToken::class, $this->_type);
  }

  public function getRightParenUNTYPED(): EditableNode {
    return $this->_right_paren;
  }

  public function withRightParen(EditableNode $value): this {
    if ($value === $this->_right_paren) {
      return $this;
    }
    return
      new static($this->_left_paren, $this->_type, $value, $this->_operand);
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

  public function getOperandUNTYPED(): EditableNode {
    return $this->_operand;
  }

  public function withOperand(EditableNode $value): this {
    if ($value === $this->_operand) {
      return $this;
    }
    return
      new static($this->_left_paren, $this->_type, $this->_right_paren, $value);
  }

  public function hasOperand(): bool {
    return !$this->_operand->isMissing();
  }

  /**
   * @returns VariableExpression | ParenthesizedExpression | LiteralExpression
   * | FunctionCallExpression | MemberSelectionExpression | SubscriptExpression
   * | ObjectCreationExpression | NameToken | ArrayIntrinsicExpression |
   * CastExpression | ArrayCreationExpression | ScopeResolutionExpression |
   * VectorIntrinsicExpression | PostfixUnaryExpression |
   * CollectionLiteralExpression | DictionaryIntrinsicExpression |
   * XHPExpression | InstanceofExpression | AnonymousFunction |
   * PrefixUnaryExpression
   */
  public function getOperand(): EditableNode {
    return TypeAssert\instance_of(EditableNode::class, $this->_operand);
  }
}
