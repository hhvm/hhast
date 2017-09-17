<?hh
/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<47b225dbf1d6547ac983c701f2cb7223>>
 */
namespace Facebook\HHAST;
use namespace Facebook\TypeAssert;

final class CollectionLiteralExpression extends EditableSyntax {

  private EditableSyntax $_name;
  private EditableSyntax $_left_brace;
  private EditableSyntax $_initializers;
  private EditableSyntax $_right_brace;

  public function __construct(
    EditableSyntax $name,
    EditableSyntax $left_brace,
    EditableSyntax $initializers,
    EditableSyntax $right_brace,
  ) {
    parent::__construct('collection_literal_expression');
    $this->_name = $name;
    $this->_left_brace = $left_brace;
    $this->_initializers = $initializers;
    $this->_right_brace = $right_brace;
  }

  <<__Override>>
  public static function fromJSON(
    dict<string, mixed> $json,
    int $position,
    string $source,
  ): this {
    $name = EditableSyntax::fromJSON(
      /* UNSAFE_EXPR */ $json['collection_literal_name'],
      $position,
      $source,
    );
    $position += $name->getWidth();
    $left_brace = EditableSyntax::fromJSON(
      /* UNSAFE_EXPR */ $json['collection_literal_left_brace'],
      $position,
      $source,
    );
    $position += $left_brace->getWidth();
    $initializers = EditableSyntax::fromJSON(
      /* UNSAFE_EXPR */ $json['collection_literal_initializers'],
      $position,
      $source,
    );
    $position += $initializers->getWidth();
    $right_brace = EditableSyntax::fromJSON(
      /* UNSAFE_EXPR */ $json['collection_literal_right_brace'],
      $position,
      $source,
    );
    $position += $right_brace->getWidth();
    return new self($name, $left_brace, $initializers, $right_brace);
  }

  <<__Override>>
  public function getChildren(): KeyedTraversable<string, EditableSyntax> {
    yield 'name' => $this->_name;
    yield 'left_brace' => $this->_left_brace;
    yield 'initializers' => $this->_initializers;
    yield 'right_brace' => $this->_right_brace;
  }

  <<__Override>>
  public function rewriteDescendants(
    self::TRewriter $rewriter,
    ?Traversable<EditableSyntax> $parents = null,
  ): this {
    $parents = $parents === null ? vec[] : vec($parents);
    $parents[] = $this;
    $name = $this->_name->rewrite($rewriter, $parents);
    $left_brace = $this->_left_brace->rewrite($rewriter, $parents);
    $initializers = $this->_initializers->rewrite($rewriter, $parents);
    $right_brace = $this->_right_brace->rewrite($rewriter, $parents);
    if (
      $name === $this->_name &&
      $left_brace === $this->_left_brace &&
      $initializers === $this->_initializers &&
      $right_brace === $this->_right_brace
    ) {
      return $this;
    }
    return new self($name, $left_brace, $initializers, $right_brace);
  }

  public function getNameUNTYPED(): EditableSyntax {
    return $this->_name;
  }

  public function withName(EditableSyntax $value): this {
    if ($value === $this->_name) {
      return $this;
    }
    return new self(
      $value,
      $this->_left_brace,
      $this->_initializers,
      $this->_right_brace,
    );
  }

  public function hasName(): bool {
    return !$this->_name->isMissing();
  }

  /**
   * @returns NameToken | QualifiedNameToken
   */
  public function getName(): EditableToken {
    return TypeAssert\instance_of(EditableToken::class, $this->_name);
  }

  public function getLeftBraceUNTYPED(): EditableSyntax {
    return $this->_left_brace;
  }

  public function withLeftBrace(EditableSyntax $value): this {
    if ($value === $this->_left_brace) {
      return $this;
    }
    return
      new self($this->_name, $value, $this->_initializers, $this->_right_brace);
  }

  public function hasLeftBrace(): bool {
    return !$this->_left_brace->isMissing();
  }

  /**
   * @returns LeftBraceToken
   */
  public function getLeftBrace(): LeftBraceToken {
    return TypeAssert\instance_of(LeftBraceToken::class, $this->_left_brace);
  }

  public function getInitializersUNTYPED(): EditableSyntax {
    return $this->_initializers;
  }

  public function withInitializers(EditableSyntax $value): this {
    if ($value === $this->_initializers) {
      return $this;
    }
    return
      new self($this->_name, $this->_left_brace, $value, $this->_right_brace);
  }

  public function hasInitializers(): bool {
    return !$this->_initializers->isMissing();
  }

  /**
   * @returns EditableList | Missing
   */
  public function getInitializers(): ?EditableList {
    if ($this->_initializers->isMissing()) {
      return null;
    }
    return TypeAssert\instance_of(EditableList::class, $this->_initializers);
  }

  /**
   * @returns EditableList
   */
  public function getInitializersx(): EditableList {
    return TypeAssert\instance_of(EditableList::class, $this->_initializers);
  }

  public function getRightBraceUNTYPED(): EditableSyntax {
    return $this->_right_brace;
  }

  public function withRightBrace(EditableSyntax $value): this {
    if ($value === $this->_right_brace) {
      return $this;
    }
    return
      new self($this->_name, $this->_left_brace, $this->_initializers, $value);
  }

  public function hasRightBrace(): bool {
    return !$this->_right_brace->isMissing();
  }

  /**
   * @returns RightBraceToken | Missing
   */
  public function getRightBrace(): ?RightBraceToken {
    if ($this->_right_brace->isMissing()) {
      return null;
    }
    return TypeAssert\instance_of(RightBraceToken::class, $this->_right_brace);
  }

  /**
   * @returns RightBraceToken
   */
  public function getRightBracex(): RightBraceToken {
    return TypeAssert\instance_of(RightBraceToken::class, $this->_right_brace);
  }
}
