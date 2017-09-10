<?hh
/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<05a137d58deaf6f0111b00323c3bd8ee>>
 */
namespace Facebook\HHAST;
use type Facebook\TypeAssert\TypeAssert;

final class FunctionCallExpression extends EditableSyntax {

  private EditableSyntax $_receiver;
  private EditableSyntax $_left_paren;
  private EditableSyntax $_argument_list;
  private EditableSyntax $_right_paren;

  public function __construct(
    EditableSyntax $receiver,
    EditableSyntax $left_paren,
    EditableSyntax $argument_list,
    EditableSyntax $right_paren,
  ) {
    parent::__construct('function_call_expression');
    $this->_receiver = $receiver;
    $this->_left_paren = $left_paren;
    $this->_argument_list = $argument_list;
    $this->_right_paren = $right_paren;
  }

  public static function from_json(
    array<string, mixed> $json,
    int $position,
    string $source,
  ): this {
    $receiver = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['function_call_receiver'],
      $position,
      $source,
    );
    $position += $receiver->width();
    $left_paren = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['function_call_left_paren'],
      $position,
      $source,
    );
    $position += $left_paren->width();
    $argument_list = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['function_call_argument_list'],
      $position,
      $source,
    );
    $position += $argument_list->width();
    $right_paren = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['function_call_right_paren'],
      $position,
      $source,
    );
    $position += $right_paren->width();
    return new self($receiver, $left_paren, $argument_list, $right_paren);
  }

  public function children(): KeyedTraversable<string, EditableSyntax> {
    yield 'receiver' => $this->_receiver;
    yield 'left_paren' => $this->_left_paren;
    yield 'argument_list' => $this->_argument_list;
    yield 'right_paren' => $this->_right_paren;
  }

  public function rewrite_children(
    self::TRewriter $rewriter,
    ?Traversable<EditableSyntax> $parents = null,
  ): this {
    $parents = $parents === null ? vec[] : vec($parents);
    $parents[] = $this;
    $receiver = $this->_receiver->rewrite($rewriter, $parents);
    $left_paren = $this->_left_paren->rewrite($rewriter, $parents);
    $argument_list = $this->_argument_list->rewrite($rewriter, $parents);
    $right_paren = $this->_right_paren->rewrite($rewriter, $parents);
    if (
      $receiver === $this->_receiver &&
      $left_paren === $this->_left_paren &&
      $argument_list === $this->_argument_list &&
      $right_paren === $this->_right_paren
    ) {
      return $this;
    }
    return new self($receiver, $left_paren, $argument_list, $right_paren);
  }

  public function receiver(): EditableSyntax {
    return $this->receiverx();
  }

  public function receiverx(): EditableSyntax {
    return TypeAssert::isInstanceOf(EditableSyntax::class, $this->_receiver);
  }

  public function raw_receiver(): EditableSyntax {
    return $this->_receiver;
  }

  public function with_receiver(EditableSyntax $value): this {
    return new self(
      $value,
      $this->_left_paren,
      $this->_argument_list,
      $this->_right_paren,
    );
  }

  public function left_paren(): ?LeftParenToken {
    return $this->_left_paren->is_missing() ? null : TypeAssert::isInstanceOf(LeftParenToken::class, $this->_left_paren);
  }

  public function left_parenx(): LeftParenToken {
    return TypeAssert::isInstanceOf(LeftParenToken::class, $this->_left_paren);
  }

  public function raw_left_paren(): EditableSyntax {
    return $this->_left_paren;
  }

  public function with_left_paren(EditableSyntax $value): this {
    return new self($this->_receiver, $value, $this->_argument_list, $this->_right_paren);
  }

  public function argument_list(): ?EditableList {
    return $this->_argument_list->is_missing() ? null : TypeAssert::isInstanceOf(EditableList::class, $this->_argument_list);
  }

  public function argument_listx(): EditableList {
    return TypeAssert::isInstanceOf(EditableList::class, $this->_argument_list);
  }

  public function raw_argument_list(): EditableSyntax {
    return $this->_argument_list;
  }

  public function with_argument_list(EditableSyntax $value): this {
    return new self($this->_receiver, $this->_left_paren, $value, $this->_right_paren);
  }

  public function right_paren(): ?RightParenToken {
    return $this->_right_paren->is_missing() ? null : TypeAssert::isInstanceOf(RightParenToken::class, $this->_right_paren);
  }

  public function right_parenx(): RightParenToken {
    return TypeAssert::isInstanceOf(RightParenToken::class, $this->_right_paren);
  }

  public function raw_right_paren(): EditableSyntax {
    return $this->_right_paren;
  }

  public function with_right_paren(EditableSyntax $value): this {
    return new self($this->_receiver, $this->_left_paren, $this->_argument_list, $value);
  }
}
