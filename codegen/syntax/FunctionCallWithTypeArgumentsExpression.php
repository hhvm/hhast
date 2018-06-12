<?hh // strict
/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<77773aef426dfda373fbcc4f9f55b759>>
 */
namespace Facebook\HHAST;
use namespace Facebook\TypeAssert;

<<__ConsistentConstruct>>
final class FunctionCallWithTypeArgumentsExpression extends EditableNode {

  private EditableNode $_receiver;
  private EditableNode $_type_args;
  private EditableNode $_left_paren;
  private EditableNode $_argument_list;
  private EditableNode $_right_paren;

  public function __construct(
    EditableNode $receiver,
    EditableNode $type_args,
    EditableNode $left_paren,
    EditableNode $argument_list,
    EditableNode $right_paren,
  ) {
    parent::__construct('function_call_with_type_arguments_expression');
    $this->_receiver = $receiver;
    $this->_type_args = $type_args;
    $this->_left_paren = $left_paren;
    $this->_argument_list = $argument_list;
    $this->_right_paren = $right_paren;
  }

  <<__Override>>
  public static function fromJSON(
    dict<string, mixed> $json,
    string $file,
    int $offset,
    string $source,
  ): this {
    $receiver = EditableNode::fromJSON(
      /* UNSAFE_EXPR */ $json['function_call_with_type_arguments_receiver'],
      $file,
      $offset,
      $source,
    );
    $offset += $receiver->getWidth();
    $type_args = EditableNode::fromJSON(
      /* UNSAFE_EXPR */ $json['function_call_with_type_arguments_type_args'],
      $file,
      $offset,
      $source,
    );
    $offset += $type_args->getWidth();
    $left_paren = EditableNode::fromJSON(
      /* UNSAFE_EXPR */ $json['function_call_with_type_arguments_left_paren'],
      $file,
      $offset,
      $source,
    );
    $offset += $left_paren->getWidth();
    $argument_list = EditableNode::fromJSON(
      /* UNSAFE_EXPR */ $json['function_call_with_type_arguments_argument_list'],
      $file,
      $offset,
      $source,
    );
    $offset += $argument_list->getWidth();
    $right_paren = EditableNode::fromJSON(
      /* UNSAFE_EXPR */ $json['function_call_with_type_arguments_right_paren'],
      $file,
      $offset,
      $source,
    );
    $offset += $right_paren->getWidth();
    return new static(
      $receiver,
      $type_args,
      $left_paren,
      $argument_list,
      $right_paren,
    );
  }

  <<__Override>>
  public function getChildren(): dict<string, EditableNode> {
    return dict[
      'receiver' => $this->_receiver,
      'type_args' => $this->_type_args,
      'left_paren' => $this->_left_paren,
      'argument_list' => $this->_argument_list,
      'right_paren' => $this->_right_paren,
    ];
  }

  <<__Override>>
  public function rewriteDescendants(
    self::TRewriter $rewriter,
    ?vec<EditableNode> $parents = null,
  ): this {
    $parents = $parents === null ? vec[] : vec($parents);
    $parents[] = $this;
    $receiver = $this->_receiver->rewrite($rewriter, $parents);
    $type_args = $this->_type_args->rewrite($rewriter, $parents);
    $left_paren = $this->_left_paren->rewrite($rewriter, $parents);
    $argument_list = $this->_argument_list->rewrite($rewriter, $parents);
    $right_paren = $this->_right_paren->rewrite($rewriter, $parents);
    if (
      $receiver === $this->_receiver &&
      $type_args === $this->_type_args &&
      $left_paren === $this->_left_paren &&
      $argument_list === $this->_argument_list &&
      $right_paren === $this->_right_paren
    ) {
      return $this;
    }
    return new static(
      $receiver,
      $type_args,
      $left_paren,
      $argument_list,
      $right_paren,
    );
  }

  public function getReceiverUNTYPED(): EditableNode {
    return $this->_receiver;
  }

  public function withReceiver(EditableNode $value): this {
    if ($value === $this->_receiver) {
      return $this;
    }
    return new static(
      $value,
      $this->_type_args,
      $this->_left_paren,
      $this->_argument_list,
      $this->_right_paren,
    );
  }

  public function hasReceiver(): bool {
    return !$this->_receiver->isMissing();
  }

  /**
   * @returns MemberSelectionExpression | ScopeResolutionExpression | NameToken
   */
  public function getReceiver(): EditableNode {
    return TypeAssert\instance_of(EditableNode::class, $this->_receiver);
  }

  /**
   * @returns MemberSelectionExpression | ScopeResolutionExpression | NameToken
   */
  public function getReceiverx(): EditableNode {
    return $this->getReceiver();
  }

  public function getTypeArgsUNTYPED(): EditableNode {
    return $this->_type_args;
  }

  public function withTypeArgs(EditableNode $value): this {
    if ($value === $this->_type_args) {
      return $this;
    }
    return new static(
      $this->_receiver,
      $value,
      $this->_left_paren,
      $this->_argument_list,
      $this->_right_paren,
    );
  }

  public function hasTypeArgs(): bool {
    return !$this->_type_args->isMissing();
  }

  /**
   * @returns TypeArguments
   */
  public function getTypeArgs(): TypeArguments {
    return TypeAssert\instance_of(TypeArguments::class, $this->_type_args);
  }

  /**
   * @returns TypeArguments
   */
  public function getTypeArgsx(): TypeArguments {
    return $this->getTypeArgs();
  }

  public function getLeftParenUNTYPED(): EditableNode {
    return $this->_left_paren;
  }

  public function withLeftParen(EditableNode $value): this {
    if ($value === $this->_left_paren) {
      return $this;
    }
    return new static(
      $this->_receiver,
      $this->_type_args,
      $value,
      $this->_argument_list,
      $this->_right_paren,
    );
  }

  public function hasLeftParen(): bool {
    return !$this->_left_paren->isMissing();
  }

  /**
   * @returns Missing | LeftParenToken
   */
  public function getLeftParen(): ?LeftParenToken {
    if ($this->_left_paren->isMissing()) {
      return null;
    }
    return TypeAssert\instance_of(LeftParenToken::class, $this->_left_paren);
  }

  /**
   * @returns LeftParenToken
   */
  public function getLeftParenx(): LeftParenToken {
    return TypeAssert\instance_of(LeftParenToken::class, $this->_left_paren);
  }

  public function getArgumentListUNTYPED(): EditableNode {
    return $this->_argument_list;
  }

  public function withArgumentList(EditableNode $value): this {
    if ($value === $this->_argument_list) {
      return $this;
    }
    return new static(
      $this->_receiver,
      $this->_type_args,
      $this->_left_paren,
      $value,
      $this->_right_paren,
    );
  }

  public function hasArgumentList(): bool {
    return !$this->_argument_list->isMissing();
  }

  /**
   * @returns EditableList | Missing
   */
  public function getArgumentList(): ?EditableList {
    if ($this->_argument_list->isMissing()) {
      return null;
    }
    return TypeAssert\instance_of(EditableList::class, $this->_argument_list);
  }

  /**
   * @returns EditableList
   */
  public function getArgumentListx(): EditableList {
    return TypeAssert\instance_of(EditableList::class, $this->_argument_list);
  }

  public function getRightParenUNTYPED(): EditableNode {
    return $this->_right_paren;
  }

  public function withRightParen(EditableNode $value): this {
    if ($value === $this->_right_paren) {
      return $this;
    }
    return new static(
      $this->_receiver,
      $this->_type_args,
      $this->_left_paren,
      $this->_argument_list,
      $value,
    );
  }

  public function hasRightParen(): bool {
    return !$this->_right_paren->isMissing();
  }

  /**
   * @returns Missing | RightParenToken
   */
  public function getRightParen(): ?RightParenToken {
    if ($this->_right_paren->isMissing()) {
      return null;
    }
    return TypeAssert\instance_of(RightParenToken::class, $this->_right_paren);
  }

  /**
   * @returns RightParenToken
   */
  public function getRightParenx(): RightParenToken {
    return TypeAssert\instance_of(RightParenToken::class, $this->_right_paren);
  }
}
