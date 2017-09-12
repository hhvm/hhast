<?hh
/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<37fdbc0bf8db5be0ddf4d485a1173049>>
 */
namespace Facebook\HHAST;
use type Facebook\TypeAssert\TypeAssert;

final class LambdaSignature extends EditableSyntax {

  private EditableSyntax $_left_paren;
  private EditableSyntax $_parameters;
  private EditableSyntax $_right_paren;
  private EditableSyntax $_colon;
  private EditableSyntax $_type;

  public function __construct(
    EditableSyntax $left_paren,
    EditableSyntax $parameters,
    EditableSyntax $right_paren,
    EditableSyntax $colon,
    EditableSyntax $type,
  ) {
    parent::__construct('lambda_signature');
    $this->_left_paren = $left_paren;
    $this->_parameters = $parameters;
    $this->_right_paren = $right_paren;
    $this->_colon = $colon;
    $this->_type = $type;
  }

  <<__Override>>
  public static function fromJSON(
    array<string, mixed> $json,
    int $position,
    string $source,
  ): this {
    $left_paren = EditableSyntax::fromJSON(
      /* UNSAFE_EXPR */ $json['lambda_left_paren'],
      $position,
      $source,
    );
    $position += $left_paren->getWidth();
    $parameters = EditableSyntax::fromJSON(
      /* UNSAFE_EXPR */ $json['lambda_parameters'],
      $position,
      $source,
    );
    $position += $parameters->getWidth();
    $right_paren = EditableSyntax::fromJSON(
      /* UNSAFE_EXPR */ $json['lambda_right_paren'],
      $position,
      $source,
    );
    $position += $right_paren->getWidth();
    $colon = EditableSyntax::fromJSON(
      /* UNSAFE_EXPR */ $json['lambda_colon'],
      $position,
      $source,
    );
    $position += $colon->getWidth();
    $type = EditableSyntax::fromJSON(
      /* UNSAFE_EXPR */ $json['lambda_type'],
      $position,
      $source,
    );
    $position += $type->getWidth();
    return new self($left_paren, $parameters, $right_paren, $colon, $type);
  }

  <<__Override>>
  public function getChildren(): KeyedTraversable<string, EditableSyntax> {
    yield 'left_paren' => $this->_left_paren;
    yield 'parameters' => $this->_parameters;
    yield 'right_paren' => $this->_right_paren;
    yield 'colon' => $this->_colon;
    yield 'type' => $this->_type;
  }

  <<__Override>>
  public function rewrite_children(
    self::TRewriter $rewriter,
    ?Traversable<EditableSyntax> $parents = null,
  ): this {
    $parents = $parents === null ? vec[] : vec($parents);
    $parents[] = $this;
    $left_paren = $this->_left_paren->rewrite($rewriter, $parents);
    $parameters = $this->_parameters->rewrite($rewriter, $parents);
    $right_paren = $this->_right_paren->rewrite($rewriter, $parents);
    $colon = $this->_colon->rewrite($rewriter, $parents);
    $type = $this->_type->rewrite($rewriter, $parents);
    if (
      $left_paren === $this->_left_paren &&
      $parameters === $this->_parameters &&
      $right_paren === $this->_right_paren &&
      $colon === $this->_colon &&
      $type === $this->_type
    ) {
      return $this;
    }
    return new self($left_paren, $parameters, $right_paren, $colon, $type);
  }

  public function getLeftParenUNTYPED(): EditableSyntax {
    return $this->_left_paren;
  }

  public function withLeftParen(EditableSyntax $value): this {
    if ($value === $this->_left_paren) {
      return $this;
    }
    return new self(
      $value,
      $this->_parameters,
      $this->_right_paren,
      $this->_colon,
      $this->_type,
    );
  }

  public function hasLeftParen(): bool {
    return !$this->_left_paren->isMissing();
  }

  public function getLeftParen(): ?LeftParenToken {
    if ($this->_left_paren->isMissing()) {
      return null;
    }
    return TypeAssert::isInstanceOf(LeftParenToken::class, $this->_left_paren);
  }

  public function getLeftParenx(): LeftParenToken {
    return TypeAssert::isInstanceOf(LeftParenToken::class, $this->_left_paren);
  }

  public function getParametersUNTYPED(): EditableSyntax {
    return $this->_parameters;
  }

  public function withParameters(EditableSyntax $value): this {
    if ($value === $this->_parameters) {
      return $this;
    }
    return new self(
      $this->_left_paren,
      $value,
      $this->_right_paren,
      $this->_colon,
      $this->_type,
    );
  }

  public function hasParameters(): bool {
    return !$this->_parameters->isMissing();
  }

  public function getParameters(): ?EditableList {
    if ($this->_parameters->isMissing()) {
      return null;
    }
    return TypeAssert::isInstanceOf(EditableList::class, $this->_parameters);
  }

  public function getParametersx(): EditableList {
    return TypeAssert::isInstanceOf(EditableList::class, $this->_parameters);
  }

  public function getRightParenUNTYPED(): EditableSyntax {
    return $this->_right_paren;
  }

  public function withRightParen(EditableSyntax $value): this {
    if ($value === $this->_right_paren) {
      return $this;
    }
    return new self(
      $this->_left_paren,
      $this->_parameters,
      $value,
      $this->_colon,
      $this->_type,
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

  public function getColonUNTYPED(): EditableSyntax {
    return $this->_colon;
  }

  public function withColon(EditableSyntax $value): this {
    if ($value === $this->_colon) {
      return $this;
    }
    return new self(
      $this->_left_paren,
      $this->_parameters,
      $this->_right_paren,
      $value,
      $this->_type,
    );
  }

  public function hasColon(): bool {
    return !$this->_colon->isMissing();
  }

  public function getColon(): ?ColonToken {
    if ($this->_colon->isMissing()) {
      return null;
    }
    return TypeAssert::isInstanceOf(ColonToken::class, $this->_colon);
  }

  public function getColonx(): ColonToken {
    return TypeAssert::isInstanceOf(ColonToken::class, $this->_colon);
  }

  public function getTypeUNTYPED(): EditableSyntax {
    return $this->_type;
  }

  public function withType(EditableSyntax $value): this {
    if ($value === $this->_type) {
      return $this;
    }
    return new self(
      $this->_left_paren,
      $this->_parameters,
      $this->_right_paren,
      $this->_colon,
      $value,
    );
  }

  public function hasType(): bool {
    return !$this->_type->isMissing();
  }

  public function getType(): EditableSyntax {
    return TypeAssert::isInstanceOf(EditableSyntax::class, $this->_type);
  }
}
