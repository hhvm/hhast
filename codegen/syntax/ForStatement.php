<?hh
/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<5374d1bdc2af1e2de698e7a1c2a7a99c>>
 */
namespace Facebook\HHAST;
use type Facebook\TypeAssert\TypeAssert;

final class ForStatement extends EditableSyntax {

  private EditableSyntax $_keyword;
  private EditableSyntax $_left_paren;
  private EditableSyntax $_initializer;
  private EditableSyntax $_first_semicolon;
  private EditableSyntax $_control;
  private EditableSyntax $_second_semicolon;
  private EditableSyntax $_end_of_loop;
  private EditableSyntax $_right_paren;
  private EditableSyntax $_body;

  public function __construct(
    EditableSyntax $keyword,
    EditableSyntax $left_paren,
    EditableSyntax $initializer,
    EditableSyntax $first_semicolon,
    EditableSyntax $control,
    EditableSyntax $second_semicolon,
    EditableSyntax $end_of_loop,
    EditableSyntax $right_paren,
    EditableSyntax $body,
  ) {
    parent::__construct('for_statement');
    $this->_keyword = $keyword;
    $this->_left_paren = $left_paren;
    $this->_initializer = $initializer;
    $this->_first_semicolon = $first_semicolon;
    $this->_control = $control;
    $this->_second_semicolon = $second_semicolon;
    $this->_end_of_loop = $end_of_loop;
    $this->_right_paren = $right_paren;
    $this->_body = $body;
  }

  public static function from_json(
    array<string, mixed> $json,
    int $position,
    string $source,
  ): this {
    $keyword = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['for_keyword'],
      $position,
      $source,
    );
    $position += $keyword->width();
    $left_paren = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['for_left_paren'],
      $position,
      $source,
    );
    $position += $left_paren->width();
    $initializer = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['for_initializer'],
      $position,
      $source,
    );
    $position += $initializer->width();
    $first_semicolon = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['for_first_semicolon'],
      $position,
      $source,
    );
    $position += $first_semicolon->width();
    $control = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['for_control'],
      $position,
      $source,
    );
    $position += $control->width();
    $second_semicolon = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['for_second_semicolon'],
      $position,
      $source,
    );
    $position += $second_semicolon->width();
    $end_of_loop = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['for_end_of_loop'],
      $position,
      $source,
    );
    $position += $end_of_loop->width();
    $right_paren = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['for_right_paren'],
      $position,
      $source,
    );
    $position += $right_paren->width();
    $body = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['for_body'],
      $position,
      $source,
    );
    $position += $body->width();
    return new self(
      $keyword,
      $left_paren,
      $initializer,
      $first_semicolon,
      $control,
      $second_semicolon,
      $end_of_loop,
      $right_paren,
      $body,
    );
  }

  public function children(): KeyedTraversable<string, EditableSyntax> {
    yield 'keyword' => $this->_keyword;
    yield 'left_paren' => $this->_left_paren;
    yield 'initializer' => $this->_initializer;
    yield 'first_semicolon' => $this->_first_semicolon;
    yield 'control' => $this->_control;
    yield 'second_semicolon' => $this->_second_semicolon;
    yield 'end_of_loop' => $this->_end_of_loop;
    yield 'right_paren' => $this->_right_paren;
    yield 'body' => $this->_body;
  }

  public function rewrite_children(
    self::TRewriter $rewriter,
    ?Traversable<EditableSyntax> $parents = null,
  ): this {
    $parents = $parents === null ? vec[] : vec($parents);
    $parents[] = $this;
    $keyword = $this->_keyword->rewrite($rewriter, $parents);
    $left_paren = $this->_left_paren->rewrite($rewriter, $parents);
    $initializer = $this->_initializer->rewrite($rewriter, $parents);
    $first_semicolon = $this->_first_semicolon->rewrite($rewriter, $parents);
    $control = $this->_control->rewrite($rewriter, $parents);
    $second_semicolon = $this->_second_semicolon->rewrite($rewriter, $parents);
    $end_of_loop = $this->_end_of_loop->rewrite($rewriter, $parents);
    $right_paren = $this->_right_paren->rewrite($rewriter, $parents);
    $body = $this->_body->rewrite($rewriter, $parents);
    if (
      $keyword === $this->_keyword &&
      $left_paren === $this->_left_paren &&
      $initializer === $this->_initializer &&
      $first_semicolon === $this->_first_semicolon &&
      $control === $this->_control &&
      $second_semicolon === $this->_second_semicolon &&
      $end_of_loop === $this->_end_of_loop &&
      $right_paren === $this->_right_paren &&
      $body === $this->_body
    ) {
      return $this;
    }
    return new self(
      $keyword,
      $left_paren,
      $initializer,
      $first_semicolon,
      $control,
      $second_semicolon,
      $end_of_loop,
      $right_paren,
      $body,
    );
  }

  public function keyword(): ForToken {
    return $this->keywordx();
  }

  public function keywordx(): ForToken {
    return TypeAssert::isInstanceOf(ForToken::class, $this->_keyword);
  }

  public function raw_keyword(): EditableSyntax {
    return $this->_keyword;
  }

  public function with_keyword(EditableSyntax $value): this {
    if ($value === $this->_keyword) {
      return $this;
    }
    return new self(
      $value,
      $this->_left_paren,
      $this->_initializer,
      $this->_first_semicolon,
      $this->_control,
      $this->_second_semicolon,
      $this->_end_of_loop,
      $this->_right_paren,
      $this->_body,
    );
  }

  public function left_paren(): LeftParenToken {
    return $this->left_parenx();
  }

  public function left_parenx(): LeftParenToken {
    return TypeAssert::isInstanceOf(LeftParenToken::class, $this->_left_paren);
  }

  public function raw_left_paren(): EditableSyntax {
    return $this->_left_paren;
  }

  public function with_left_paren(EditableSyntax $value): this {
    if ($value === $this->_left_paren) {
      return $this;
    }
    return new self(
      $this->_keyword,
      $value,
      $this->_initializer,
      $this->_first_semicolon,
      $this->_control,
      $this->_second_semicolon,
      $this->_end_of_loop,
      $this->_right_paren,
      $this->_body,
    );
  }

  public function initializer(): ?EditableList {
    return $this->_initializer->is_missing() ? null : TypeAssert::isInstanceOf(EditableList::class, $this->_initializer);
  }

  public function initializerx(): EditableList {
    return TypeAssert::isInstanceOf(EditableList::class, $this->_initializer);
  }

  public function raw_initializer(): EditableSyntax {
    return $this->_initializer;
  }

  public function with_initializer(EditableSyntax $value): this {
    if ($value === $this->_initializer) {
      return $this;
    }
    return new self(
      $this->_keyword,
      $this->_left_paren,
      $value,
      $this->_first_semicolon,
      $this->_control,
      $this->_second_semicolon,
      $this->_end_of_loop,
      $this->_right_paren,
      $this->_body,
    );
  }

  public function first_semicolon(): SemicolonToken {
    return $this->first_semicolonx();
  }

  public function first_semicolonx(): SemicolonToken {
    return TypeAssert::isInstanceOf(SemicolonToken::class, $this->_first_semicolon);
  }

  public function raw_first_semicolon(): EditableSyntax {
    return $this->_first_semicolon;
  }

  public function with_first_semicolon(EditableSyntax $value): this {
    if ($value === $this->_first_semicolon) {
      return $this;
    }
    return new self(
      $this->_keyword,
      $this->_left_paren,
      $this->_initializer,
      $value,
      $this->_control,
      $this->_second_semicolon,
      $this->_end_of_loop,
      $this->_right_paren,
      $this->_body,
    );
  }

  public function control(): ?EditableList {
    return $this->_control->is_missing() ? null : TypeAssert::isInstanceOf(EditableList::class, $this->_control);
  }

  public function controlx(): EditableList {
    return TypeAssert::isInstanceOf(EditableList::class, $this->_control);
  }

  public function raw_control(): EditableSyntax {
    return $this->_control;
  }

  public function with_control(EditableSyntax $value): this {
    if ($value === $this->_control) {
      return $this;
    }
    return new self(
      $this->_keyword,
      $this->_left_paren,
      $this->_initializer,
      $this->_first_semicolon,
      $value,
      $this->_second_semicolon,
      $this->_end_of_loop,
      $this->_right_paren,
      $this->_body,
    );
  }

  public function second_semicolon(): SemicolonToken {
    return $this->second_semicolonx();
  }

  public function second_semicolonx(): SemicolonToken {
    return TypeAssert::isInstanceOf(SemicolonToken::class, $this->_second_semicolon);
  }

  public function raw_second_semicolon(): EditableSyntax {
    return $this->_second_semicolon;
  }

  public function with_second_semicolon(EditableSyntax $value): this {
    if ($value === $this->_second_semicolon) {
      return $this;
    }
    return new self(
      $this->_keyword,
      $this->_left_paren,
      $this->_initializer,
      $this->_first_semicolon,
      $this->_control,
      $value,
      $this->_end_of_loop,
      $this->_right_paren,
      $this->_body,
    );
  }

  public function end_of_loop(): ?EditableList {
    return $this->_end_of_loop->is_missing() ? null : TypeAssert::isInstanceOf(EditableList::class, $this->_end_of_loop);
  }

  public function end_of_loopx(): EditableList {
    return TypeAssert::isInstanceOf(EditableList::class, $this->_end_of_loop);
  }

  public function raw_end_of_loop(): EditableSyntax {
    return $this->_end_of_loop;
  }

  public function with_end_of_loop(EditableSyntax $value): this {
    if ($value === $this->_end_of_loop) {
      return $this;
    }
    return new self(
      $this->_keyword,
      $this->_left_paren,
      $this->_initializer,
      $this->_first_semicolon,
      $this->_control,
      $this->_second_semicolon,
      $value,
      $this->_right_paren,
      $this->_body,
    );
  }

  public function right_paren(): RightParenToken {
    return $this->right_parenx();
  }

  public function right_parenx(): RightParenToken {
    return TypeAssert::isInstanceOf(RightParenToken::class, $this->_right_paren);
  }

  public function raw_right_paren(): EditableSyntax {
    return $this->_right_paren;
  }

  public function with_right_paren(EditableSyntax $value): this {
    if ($value === $this->_right_paren) {
      return $this;
    }
    return new self(
      $this->_keyword,
      $this->_left_paren,
      $this->_initializer,
      $this->_first_semicolon,
      $this->_control,
      $this->_second_semicolon,
      $this->_end_of_loop,
      $value,
      $this->_body,
    );
  }

  public function body(): EditableSyntax {
    return $this->bodyx();
  }

  public function bodyx(): EditableSyntax {
    return TypeAssert::isInstanceOf(EditableSyntax::class, $this->_body);
  }

  public function raw_body(): EditableSyntax {
    return $this->_body;
  }

  public function with_body(EditableSyntax $value): this {
    if ($value === $this->_body) {
      return $this;
    }
    return new self(
      $this->_keyword,
      $this->_left_paren,
      $this->_initializer,
      $this->_first_semicolon,
      $this->_control,
      $this->_second_semicolon,
      $this->_end_of_loop,
      $this->_right_paren,
      $value,
    );
  }
}
