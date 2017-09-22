<?hh // strict
/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<5f95ea4821234484525479c6ef472621>>
 */
namespace Facebook\HHAST;
use namespace Facebook\TypeAssert;

final class EmbeddedSubscriptExpression extends EditableNode {

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
    parent::__construct('embedded_subscript_expression');
    $this->_receiver = $receiver;
    $this->_left_bracket = $left_bracket;
    $this->_index = $index;
    $this->_right_bracket = $right_bracket;
  }

  <<__Override>>
  public static function fromJSON(
    dict<string, mixed> $json,
    int $position,
    string $source,
  ): this {
    $receiver = EditableNode::fromJSON(
      /* UNSAFE_EXPR */ $json['embedded_subscript_receiver'],
      $position,
      $source,
    );
    $position += $receiver->getWidth();
    $left_bracket = EditableNode::fromJSON(
      /* UNSAFE_EXPR */ $json['embedded_subscript_left_bracket'],
      $position,
      $source,
    );
    $position += $left_bracket->getWidth();
    $index = EditableNode::fromJSON(
      /* UNSAFE_EXPR */ $json['embedded_subscript_index'],
      $position,
      $source,
    );
    $position += $index->getWidth();
    $right_bracket = EditableNode::fromJSON(
      /* UNSAFE_EXPR */ $json['embedded_subscript_right_bracket'],
      $position,
      $source,
    );
    $position += $right_bracket->getWidth();
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
   * @returns unknown
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
   * @returns unknown
   */
  public function getLeftBracket(): EditableNode {
    return TypeAssert\instance_of(EditableNode::class, $this->_left_bracket);
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
   * @returns unknown
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
   * @returns unknown
   */
  public function getRightBracket(): EditableNode {
    return TypeAssert\instance_of(EditableNode::class, $this->_right_bracket);
  }
}
