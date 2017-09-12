<?hh
/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<194a98b1314a5303cdec2513bfe96802>>
 */
namespace Facebook\HHAST;
use type Facebook\TypeAssert\TypeAssert;

final class CatchClause extends EditableSyntax {

  private EditableSyntax $_keyword;
  private EditableSyntax $_left_paren;
  private EditableSyntax $_type;
  private EditableSyntax $_variable;
  private EditableSyntax $_right_paren;
  private EditableSyntax $_body;

  public function __construct(
    EditableSyntax $keyword,
    EditableSyntax $left_paren,
    EditableSyntax $type,
    EditableSyntax $variable,
    EditableSyntax $right_paren,
    EditableSyntax $body,
  ) {
    parent::__construct('catch_clause');
    $this->_keyword = $keyword;
    $this->_left_paren = $left_paren;
    $this->_type = $type;
    $this->_variable = $variable;
    $this->_right_paren = $right_paren;
    $this->_body = $body;
  }

  <<__Override>>
  public static function from_json(
    array<string, mixed> $json,
    int $position,
    string $source,
  ): this {
    $keyword = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['catch_keyword'],
      $position,
      $source,
    );
    $position += $keyword->getWidth();
    $left_paren = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['catch_left_paren'],
      $position,
      $source,
    );
    $position += $left_paren->getWidth();
    $type = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['catch_type'],
      $position,
      $source,
    );
    $position += $type->getWidth();
    $variable = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['catch_variable'],
      $position,
      $source,
    );
    $position += $variable->getWidth();
    $right_paren = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['catch_right_paren'],
      $position,
      $source,
    );
    $position += $right_paren->getWidth();
    $body = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['catch_body'],
      $position,
      $source,
    );
    $position += $body->getWidth();
    return new self(
      $keyword,
      $left_paren,
      $type,
      $variable,
      $right_paren,
      $body,
    );
  }

  <<__Override>>
  public function getChildren(): KeyedTraversable<string, EditableSyntax> {
    yield 'keyword' => $this->_keyword;
    yield 'left_paren' => $this->_left_paren;
    yield 'type' => $this->_type;
    yield 'variable' => $this->_variable;
    yield 'right_paren' => $this->_right_paren;
    yield 'body' => $this->_body;
  }

  <<__Override>>
  public function rewrite_children(
    self::TRewriter $rewriter,
    ?Traversable<EditableSyntax> $parents = null,
  ): this {
    $parents = $parents === null ? vec[] : vec($parents);
    $parents[] = $this;
    $keyword = $this->_keyword->rewrite($rewriter, $parents);
    $left_paren = $this->_left_paren->rewrite($rewriter, $parents);
    $type = $this->_type->rewrite($rewriter, $parents);
    $variable = $this->_variable->rewrite($rewriter, $parents);
    $right_paren = $this->_right_paren->rewrite($rewriter, $parents);
    $body = $this->_body->rewrite($rewriter, $parents);
    if (
      $keyword === $this->_keyword &&
      $left_paren === $this->_left_paren &&
      $type === $this->_type &&
      $variable === $this->_variable &&
      $right_paren === $this->_right_paren &&
      $body === $this->_body
    ) {
      return $this;
    }
    return new self($keyword, $left_paren, $type, $variable, $right_paren, $body);
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
      $this->_type,
      $this->_variable,
      $this->_right_paren,
      $this->_body,
    );
  }

  public function hasKeyword(): bool {
    return !$this->_keyword->isMissing();
  }

  public function getKeyword(): CatchToken {
    return TypeAssert::isInstanceOf(CatchToken::class, $this->_keyword);
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
      $this->_type,
      $this->_variable,
      $this->_right_paren,
      $this->_body,
    );
  }

  public function hasLeftParen(): bool {
    return !$this->_left_paren->isMissing();
  }

  public function getLeftParen(): LeftParenToken {
    return TypeAssert::isInstanceOf(LeftParenToken::class, $this->_left_paren);
  }

  public function getTypeUNTYPED(): EditableSyntax {
    return $this->_type;
  }

  public function withType(EditableSyntax $value): this {
    if ($value === $this->_type) {
      return $this;
    }
    return new self(
      $this->_keyword,
      $this->_left_paren,
      $value,
      $this->_variable,
      $this->_right_paren,
      $this->_body,
    );
  }

  public function hasType(): bool {
    return !$this->_type->isMissing();
  }

  public function getType(): EditableSyntax {
    return TypeAssert::isInstanceOf(EditableSyntax::class, $this->_type);
  }

  public function getVariableUNTYPED(): EditableSyntax {
    return $this->_variable;
  }

  public function withVariable(EditableSyntax $value): this {
    if ($value === $this->_variable) {
      return $this;
    }
    return new self(
      $this->_keyword,
      $this->_left_paren,
      $this->_type,
      $value,
      $this->_right_paren,
      $this->_body,
    );
  }

  public function hasVariable(): bool {
    return !$this->_variable->isMissing();
  }

  public function getVariable(): ?VariableToken {
    if ($this->_variable->isMissing()) {
      return null;
    }
    return TypeAssert::isInstanceOf(VariableToken::class, $this->_variable);
  }

  public function getVariablex(): VariableToken {
    return TypeAssert::isInstanceOf(VariableToken::class, $this->_variable);
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
      $this->_type,
      $this->_variable,
      $value,
      $this->_body,
    );
  }

  public function hasRightParen(): bool {
    return !$this->_right_paren->isMissing();
  }

  public function getRightParen(): ?RightParenToken {
    if ($this->_right_paren->isMissing()) {
      return null;
    }
    return TypeAssert::isInstanceOf(RightParenToken::class, $this->_right_paren);
  }

  public function getRightParenx(): RightParenToken {
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
      $this->_type,
      $this->_variable,
      $this->_right_paren,
      $value,
    );
  }

  public function hasBody(): bool {
    return !$this->_body->isMissing();
  }

  public function getBody(): CompoundStatement {
    return TypeAssert::isInstanceOf(CompoundStatement::class, $this->_body);
  }
}
