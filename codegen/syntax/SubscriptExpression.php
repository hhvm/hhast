<?hh // strict
/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<0b210c39f681563f8707f535eeeac77e>>
 */
namespace Facebook\HHAST;
use namespace Facebook\TypeAssert;

final class SubscriptExpression extends EditableNode {

  private EditableNode $_receiver;
  private EditableNode $_left_bracket;
  private EditableNode $_index;
  private EditableNode $_right_bracket;

  public function __construct(
    EditableNode $receiver,
    EditableNode $left_bracket,
    EditableNode $index,
    EditableNode $right_bracket,
  ) {
    parent::__construct('subscript_expression');
    $this->_receiver = $receiver;
    $this->_left_bracket = $left_bracket;
    $this->_index = $index;
    $this->_right_bracket = $right_bracket;
  }

  <<__Override>>
  public static function fromJSON(
    dict<string, mixed> $json,
    string $file,
    int $offset,
    string $source,
  ): this {
    $receiver = EditableNode::fromJSON(
      /* UNSAFE_EXPR */ $json['subscript_receiver'],
      $file,
      $offset,
      $source,
    );
    $offset += $receiver->getWidth();
    $left_bracket = EditableNode::fromJSON(
      /* UNSAFE_EXPR */ $json['subscript_left_bracket'],
      $file,
      $offset,
      $source,
    );
    $offset += $left_bracket->getWidth();
    $index = EditableNode::fromJSON(
      /* UNSAFE_EXPR */ $json['subscript_index'],
      $file,
      $offset,
      $source,
    );
    $offset += $index->getWidth();
    $right_bracket = EditableNode::fromJSON(
      /* UNSAFE_EXPR */ $json['subscript_right_bracket'],
      $file,
      $offset,
      $source,
    );
    $offset += $right_bracket->getWidth();
    return new self($receiver, $left_bracket, $index, $right_bracket);
  }

  <<__Override>>
  public function getChildren(): KeyedTraversable<string, EditableNode> {
    return dict[
      'receiver' => $this->_receiver,
      'left_bracket' => $this->_left_bracket,
      'index' => $this->_index,
      'right_bracket' => $this->_right_bracket,
    ];
  }

  <<__Override>>
  public function rewriteDescendants(
    self::TRewriter $rewriter,
    ?Traversable<EditableNode> $parents = null,
  ): this {
    $parents = $parents === null ? vec[] : vec($parents);
    $parents[] = $this;
    $receiver = $this->_receiver->rewrite($rewriter, $parents);
    $left_bracket = $this->_left_bracket->rewrite($rewriter, $parents);
    $index = $this->_index->rewrite($rewriter, $parents);
    $right_bracket = $this->_right_bracket->rewrite($rewriter, $parents);
    if (
      $receiver === $this->_receiver &&
      $left_bracket === $this->_left_bracket &&
      $index === $this->_index &&
      $right_bracket === $this->_right_bracket
    ) {
      return $this;
    }
    return new self($receiver, $left_bracket, $index, $right_bracket);
  }

  public function getReceiverUNTYPED(): EditableNode {
    return $this->_receiver;
  }

  public function withReceiver(EditableNode $value): this {
    if ($value === $this->_receiver) {
      return $this;
    }
    return new self(
      $value,
      $this->_left_bracket,
      $this->_index,
      $this->_right_bracket,
    );
  }

  public function hasReceiver(): bool {
    return !$this->_receiver->isMissing();
  }

  /**
   * @returns VariableExpression | FunctionCallExpression | SubscriptExpression
   * | MemberSelectionExpression | ScopeResolutionExpression |
   * ParenthesizedExpression | ArrayIntrinsicExpression | RightParenToken |
   * QualifiedNameExpression | PrefixUnaryExpression | LiteralExpression |
   * SafeMemberSelectionExpression | NamespacePrefixToken |
   * ArrayCreationExpression | ObjectCreationExpression
   */
  public function getReceiver(): EditableNode {
    return TypeAssert\instance_of(EditableNode::class, $this->_receiver);
  }

  public function getLeftBracketUNTYPED(): EditableNode {
    return $this->_left_bracket;
  }

  public function withLeftBracket(EditableNode $value): this {
    if ($value === $this->_left_bracket) {
      return $this;
    }
    return
      new self($this->_receiver, $value, $this->_index, $this->_right_bracket);
  }

  public function hasLeftBracket(): bool {
    return !$this->_left_bracket->isMissing();
  }

  /**
   * @returns LeftBracketToken | LeftBraceToken
   */
  public function getLeftBracket(): EditableToken {
    return TypeAssert\instance_of(EditableToken::class, $this->_left_bracket);
  }

  public function getIndexUNTYPED(): EditableNode {
    return $this->_index;
  }

  public function withIndex(EditableNode $value): this {
    if ($value === $this->_index) {
      return $this;
    }
    return new self(
      $this->_receiver,
      $this->_left_bracket,
      $value,
      $this->_right_bracket,
    );
  }

  public function hasIndex(): bool {
    return !$this->_index->isMissing();
  }

  /**
   * @returns LiteralExpression | Missing | VariableExpression |
   * FunctionCallExpression | QualifiedNameExpression |
   * ScopeResolutionExpression | BinaryExpression | PrefixUnaryExpression |
   * CastExpression | ObjectCreationExpression | MemberSelectionExpression |
   * PostfixUnaryExpression | SubscriptExpression | ArrayIntrinsicExpression |
   * SafeMemberSelectionExpression | AnonymousFunction | YieldExpression |
   * LambdaExpression | EvalExpression | ParenthesizedExpression
   */
  public function getIndex(): EditableNode {
    return TypeAssert\instance_of(EditableNode::class, $this->_index);
  }

  public function getRightBracketUNTYPED(): EditableNode {
    return $this->_right_bracket;
  }

  public function withRightBracket(EditableNode $value): this {
    if ($value === $this->_right_bracket) {
      return $this;
    }
    return
      new self($this->_receiver, $this->_left_bracket, $this->_index, $value);
  }

  public function hasRightBracket(): bool {
    return !$this->_right_bracket->isMissing();
  }

  /**
   * @returns RightBracketToken | RightBraceToken | Missing
   */
  public function getRightBracket(): ?EditableToken {
    if ($this->_right_bracket->isMissing()) {
      return null;
    }
    return TypeAssert\instance_of(EditableToken::class, $this->_right_bracket);
  }

  /**
   * @returns RightBracketToken | RightBraceToken
   */
  public function getRightBracketx(): EditableToken {
    return TypeAssert\instance_of(EditableToken::class, $this->_right_bracket);
  }
}
