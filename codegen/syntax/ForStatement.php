<?hh
/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<5599e753f18f74bd648c82da72871576>>
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

  <<__Override>>
  public static function fromJSON(
    dict<string, mixed> $json,
    int $position,
    string $source,
  ): this {
    $keyword = EditableSyntax::fromJSON(
      /* UNSAFE_EXPR */ $json['for_keyword'],
      $position,
      $source,
    );
    $position += $keyword->getWidth();
    $left_paren = EditableSyntax::fromJSON(
      /* UNSAFE_EXPR */ $json['for_left_paren'],
      $position,
      $source,
    );
    $position += $left_paren->getWidth();
    $initializer = EditableSyntax::fromJSON(
      /* UNSAFE_EXPR */ $json['for_initializer'],
      $position,
      $source,
    );
    $position += $initializer->getWidth();
    $first_semicolon = EditableSyntax::fromJSON(
      /* UNSAFE_EXPR */ $json['for_first_semicolon'],
      $position,
      $source,
    );
    $position += $first_semicolon->getWidth();
    $control = EditableSyntax::fromJSON(
      /* UNSAFE_EXPR */ $json['for_control'],
      $position,
      $source,
    );
    $position += $control->getWidth();
    $second_semicolon = EditableSyntax::fromJSON(
      /* UNSAFE_EXPR */ $json['for_second_semicolon'],
      $position,
      $source,
    );
    $position += $second_semicolon->getWidth();
    $end_of_loop = EditableSyntax::fromJSON(
      /* UNSAFE_EXPR */ $json['for_end_of_loop'],
      $position,
      $source,
    );
    $position += $end_of_loop->getWidth();
    $right_paren = EditableSyntax::fromJSON(
      /* UNSAFE_EXPR */ $json['for_right_paren'],
      $position,
      $source,
    );
    $position += $right_paren->getWidth();
    $body = EditableSyntax::fromJSON(
      /* UNSAFE_EXPR */ $json['for_body'],
      $position,
      $source,
    );
    $position += $body->getWidth();
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

  <<__Override>>
  public function getChildren(): KeyedTraversable<string, EditableSyntax> {
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

  <<__Override>>
  public function rewriteDescendants(
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

  public function getKeywordUNTYPED(): EditableSyntax {
    return $this->_keyword;
  }

  public function withKeyword(EditableSyntax $value): this {
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

  public function hasKeyword(): bool {
    return !$this->_keyword->isMissing();
  }

  /**
   * @returns ForToken
   */
  public function getKeyword(): ForToken {
    return TypeAssert::isInstanceOf(ForToken::class, $this->_keyword);
  }

  public function getLeftParenUNTYPED(): EditableSyntax {
    return $this->_left_paren;
  }

  public function withLeftParen(EditableSyntax $value): this {
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

  public function hasLeftParen(): bool {
    return !$this->_left_paren->isMissing();
  }

  /**
   * @returns LeftParenToken
   */
  public function getLeftParen(): LeftParenToken {
    return TypeAssert::isInstanceOf(LeftParenToken::class, $this->_left_paren);
  }

  public function getInitializerUNTYPED(): EditableSyntax {
    return $this->_initializer;
  }

  public function withInitializer(EditableSyntax $value): this {
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

  public function hasInitializer(): bool {
    return !$this->_initializer->isMissing();
  }

  /**
   * @returns EditableList | Missing
   */
  public function getInitializer(): ?EditableList {
    if ($this->_initializer->isMissing()) {
      return null;
    }
    return TypeAssert::isInstanceOf(EditableList::class, $this->_initializer);
  }

  /**
   * @returns EditableList
   */
  public function getInitializerx(): EditableList {
    return TypeAssert::isInstanceOf(EditableList::class, $this->_initializer);
  }

  public function getFirstSemicolonUNTYPED(): EditableSyntax {
    return $this->_first_semicolon;
  }

  public function withFirstSemicolon(EditableSyntax $value): this {
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

  public function hasFirstSemicolon(): bool {
    return !$this->_first_semicolon->isMissing();
  }

  /**
   * @returns SemicolonToken
   */
  public function getFirstSemicolon(): SemicolonToken {
    return TypeAssert::isInstanceOf(SemicolonToken::class, $this->_first_semicolon);
  }

  public function getControlUNTYPED(): EditableSyntax {
    return $this->_control;
  }

  public function withControl(EditableSyntax $value): this {
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

  public function hasControl(): bool {
    return !$this->_control->isMissing();
  }

  /**
   * @returns EditableList | Missing
   */
  public function getControl(): ?EditableList {
    if ($this->_control->isMissing()) {
      return null;
    }
    return TypeAssert::isInstanceOf(EditableList::class, $this->_control);
  }

  /**
   * @returns EditableList
   */
  public function getControlx(): EditableList {
    return TypeAssert::isInstanceOf(EditableList::class, $this->_control);
  }

  public function getSecondSemicolonUNTYPED(): EditableSyntax {
    return $this->_second_semicolon;
  }

  public function withSecondSemicolon(EditableSyntax $value): this {
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

  public function hasSecondSemicolon(): bool {
    return !$this->_second_semicolon->isMissing();
  }

  /**
   * @returns SemicolonToken
   */
  public function getSecondSemicolon(): SemicolonToken {
    return TypeAssert::isInstanceOf(SemicolonToken::class, $this->_second_semicolon);
  }

  public function getEndOfLoopUNTYPED(): EditableSyntax {
    return $this->_end_of_loop;
  }

  public function withEndOfLoop(EditableSyntax $value): this {
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

  public function hasEndOfLoop(): bool {
    return !$this->_end_of_loop->isMissing();
  }

  /**
   * @returns EditableList | Missing
   */
  public function getEndOfLoop(): ?EditableList {
    if ($this->_end_of_loop->isMissing()) {
      return null;
    }
    return TypeAssert::isInstanceOf(EditableList::class, $this->_end_of_loop);
  }

  /**
   * @returns EditableList
   */
  public function getEndOfLoopx(): EditableList {
    return TypeAssert::isInstanceOf(EditableList::class, $this->_end_of_loop);
  }

  public function getRightParenUNTYPED(): EditableSyntax {
    return $this->_right_paren;
  }

  public function withRightParen(EditableSyntax $value): this {
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

  public function hasRightParen(): bool {
    return !$this->_right_paren->isMissing();
  }

  /**
   * @returns RightParenToken
   */
  public function getRightParen(): RightParenToken {
    return TypeAssert::isInstanceOf(RightParenToken::class, $this->_right_paren);
  }

  public function getBodyUNTYPED(): EditableSyntax {
    return $this->_body;
  }

  public function withBody(EditableSyntax $value): this {
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

  public function hasBody(): bool {
    return !$this->_body->isMissing();
  }

  /**
   * @returns ExpressionStatement | CompoundStatement | UnsetStatement |
   * EchoStatement | ForStatement
   */
  public function getBody(): EditableSyntax {
    return TypeAssert::isInstanceOf(EditableSyntax::class, $this->_body);
  }
}
