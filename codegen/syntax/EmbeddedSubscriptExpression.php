<?hh // strict
/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<ea3ff05da7d4af9787a9983bfb426c3b>>
 */
namespace Facebook\HHAST;
use namespace Facebook\TypeAssert;

final class EmbeddedSubscriptExpression extends EditableSyntax {

  private EditableSyntax $_receiver;
  private EditableSyntax $_left_bracket;
  private EditableSyntax $_index;
  private EditableSyntax $_right_bracket;

  public function __construct(
    EditableSyntax $receiver,
    EditableSyntax $left_bracket,
    EditableSyntax $index,
    EditableSyntax $right_bracket,
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
    $receiver = EditableSyntax::fromJSON(
      /* UNSAFE_EXPR */ $json['embedded_subscript_receiver'],
      $position,
      $source,
    );
    $position += $receiver->getWidth();
    $left_bracket = EditableSyntax::fromJSON(
      /* UNSAFE_EXPR */ $json['embedded_subscript_left_bracket'],
      $position,
      $source,
    );
    $position += $left_bracket->getWidth();
    $index = EditableSyntax::fromJSON(
      /* UNSAFE_EXPR */ $json['embedded_subscript_index'],
      $position,
      $source,
    );
    $position += $index->getWidth();
    $right_bracket = EditableSyntax::fromJSON(
      /* UNSAFE_EXPR */ $json['embedded_subscript_right_bracket'],
      $position,
      $source,
    );
    $position += $right_bracket->getWidth();
    return new self($receiver, $left_bracket, $index, $right_bracket);
  }

  <<__Override>>
  public function getChildren(): KeyedTraversable<string, EditableSyntax> {
    yield 'receiver' => $this->_receiver;
    yield 'left_bracket' => $this->_left_bracket;
    yield 'index' => $this->_index;
    yield 'right_bracket' => $this->_right_bracket;
  }

  <<__Override>>
  public function rewriteDescendants(
    self::TRewriter $rewriter,
    ?Traversable<EditableSyntax> $parents = null,
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

  public function getReceiverUNTYPED(): EditableSyntax {
    return $this->_receiver;
  }

  public function withReceiver(EditableSyntax $value): this {
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
  public function getReceiver(): EditableSyntax {
    return TypeAssert\instance_of(EditableSyntax::class, $this->_receiver);
  }

  public function getLeftBracketUNTYPED(): EditableSyntax {
    return $this->_left_bracket;
  }

  public function withLeftBracket(EditableSyntax $value): this {
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
  public function getLeftBracket(): EditableSyntax {
    return TypeAssert\instance_of(EditableSyntax::class, $this->_left_bracket);
  }

  public function getIndexUNTYPED(): EditableSyntax {
    return $this->_index;
  }

  public function withIndex(EditableSyntax $value): this {
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
  public function getIndex(): EditableSyntax {
    return TypeAssert\instance_of(EditableSyntax::class, $this->_index);
  }

  public function getRightBracketUNTYPED(): EditableSyntax {
    return $this->_right_bracket;
  }

  public function withRightBracket(EditableSyntax $value): this {
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
  public function getRightBracket(): EditableSyntax {
    return TypeAssert\instance_of(EditableSyntax::class, $this->_right_bracket);
  }
}
