<?hh
/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<b1ea37873ba696a6d7cea74dafd09bcc>>
 */
namespace Facebook\HHAST;
use type Facebook\TypeAssert\TypeAssert;

final class SubscriptExpression extends EditableSyntax {

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
    parent::__construct('subscript_expression');
    $this->_receiver = $receiver;
    $this->_left_bracket = $left_bracket;
    $this->_index = $index;
    $this->_right_bracket = $right_bracket;
  }

  public static function from_json(
    array<string, mixed> $json,
    int $position,
    string $source,
  ): this {
    $receiver = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['subscript_receiver'],
      $position,
      $source,
    );
    $position += $receiver->width();
    $left_bracket = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['subscript_left_bracket'],
      $position,
      $source,
    );
    $position += $left_bracket->width();
    $index = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['subscript_index'],
      $position,
      $source,
    );
    $position += $index->width();
    $right_bracket = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['subscript_right_bracket'],
      $position,
      $source,
    );
    $position += $right_bracket->width();
    return new self($receiver, $left_bracket, $index, $right_bracket);
  }

  public function children(): KeyedTraversable<string, EditableSyntax> {
    yield 'receiver' => $this->_receiver;
    yield 'left_bracket' => $this->_left_bracket;
    yield 'index' => $this->_index;
    yield 'right_bracket' => $this->_right_bracket;
  }

  public function rewrite(
    self::TRewriter $rewriter,
    ?Traversable<EditableSyntax> $parents = null,
  ): EditableSyntax {
    $parents = $parents === null ? vec[] : vec($parents);
    $child_parents = $parents;
    $child_parents[] = $this;
    $receiver = $this->_receiver->rewrite($rewriter, $child_parents);
    $left_bracket = $this->_left_bracket->rewrite($rewriter, $child_parents);
    $index = $this->_index->rewrite($rewriter, $child_parents);
    $right_bracket = $this->_right_bracket->rewrite($rewriter, $child_parents);
    if (
      $receiver === $this->_receiver &&
      $left_bracket === $this->_left_bracket &&
      $index === $this->_index &&
      $right_bracket === $this->_right_bracket
    ) {
      $node = $this;
    } else {
      $node = new self($receiver, $left_bracket, $index, $right_bracket);
    }
    return $rewriter($node, $parents);
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
      $this->_left_bracket,
      $this->_index,
      $this->_right_bracket,
    );
  }

  public function left_bracket(): EditableSyntax {
    return $this->left_bracketx();
  }

  public function left_bracketx(): EditableSyntax {
    return
      TypeAssert::isInstanceOf(EditableSyntax::class, $this->_left_bracket);
  }

  public function raw_left_bracket(): EditableSyntax {
    return $this->_left_bracket;
  }

  public function with_left_bracket(EditableSyntax $value): this {
    return
      new self($this->_receiver, $value, $this->_index, $this->_right_bracket);
  }

  public function index(): EditableSyntax {
    return $this->indexx();
  }

  public function indexx(): EditableSyntax {
    return TypeAssert::isInstanceOf(EditableSyntax::class, $this->_index);
  }

  public function raw_index(): EditableSyntax {
    return $this->_index;
  }

  public function with_index(EditableSyntax $value): this {
    return new self(
      $this->_receiver,
      $this->_left_bracket,
      $value,
      $this->_right_bracket,
    );
  }

  public function right_bracket(): EditableSyntax {
    return $this->right_bracketx();
  }

  public function right_bracketx(): EditableSyntax {
    return
      TypeAssert::isInstanceOf(EditableSyntax::class, $this->_right_bracket);
  }

  public function raw_right_bracket(): EditableSyntax {
    return $this->_right_bracket;
  }

  public function with_right_bracket(EditableSyntax $value): this {
    return
      new self($this->_receiver, $this->_left_bracket, $this->_index, $value);
  }
}
