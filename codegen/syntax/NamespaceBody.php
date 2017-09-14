<?hh
/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<59d0a15d751d03959a5a806c5ed1d7e8>>
 */
namespace Facebook\HHAST;
use type Facebook\TypeAssert\TypeAssert;

final class NamespaceBody extends EditableSyntax {

  private EditableSyntax $_left_brace;
  private EditableSyntax $_declarations;
  private EditableSyntax $_right_brace;

  public function __construct(
    EditableSyntax $left_brace,
    EditableSyntax $declarations,
    EditableSyntax $right_brace,
  ) {
    parent::__construct('namespace_body');
    $this->_left_brace = $left_brace;
    $this->_declarations = $declarations;
    $this->_right_brace = $right_brace;
  }

  <<__Override>>
  public static function fromJSON(
    dict<string, mixed> $json,
    int $position,
    string $source,
  ): this {
    $left_brace = EditableSyntax::fromJSON(
      /* UNSAFE_EXPR */ $json['namespace_left_brace'],
      $position,
      $source,
    );
    $position += $left_brace->getWidth();
    $declarations = EditableSyntax::fromJSON(
      /* UNSAFE_EXPR */ $json['namespace_declarations'],
      $position,
      $source,
    );
    $position += $declarations->getWidth();
    $right_brace = EditableSyntax::fromJSON(
      /* UNSAFE_EXPR */ $json['namespace_right_brace'],
      $position,
      $source,
    );
    $position += $right_brace->getWidth();
    return new self($left_brace, $declarations, $right_brace);
  }

  <<__Override>>
  public function getChildren(): KeyedTraversable<string, EditableSyntax> {
    yield 'left_brace' => $this->_left_brace;
    yield 'declarations' => $this->_declarations;
    yield 'right_brace' => $this->_right_brace;
  }

  <<__Override>>
  public function rewriteDescendants(
    self::TRewriter $rewriter,
    ?Traversable<EditableSyntax> $parents = null,
  ): this {
    $parents = $parents === null ? vec[] : vec($parents);
    $parents[] = $this;
    $left_brace = $this->_left_brace->rewrite($rewriter, $parents);
    $declarations = $this->_declarations->rewrite($rewriter, $parents);
    $right_brace = $this->_right_brace->rewrite($rewriter, $parents);
    if (
      $left_brace === $this->_left_brace &&
      $declarations === $this->_declarations &&
      $right_brace === $this->_right_brace
    ) {
      return $this;
    }
    return new self($left_brace, $declarations, $right_brace);
  }

  public function getLeftBraceUNTYPED(): EditableSyntax {
    return $this->_left_brace;
  }

  public function withLeftBrace(EditableSyntax $value): this {
    if ($value === $this->_left_brace) {
      return $this;
    }
    return new self($value, $this->_declarations, $this->_right_brace);
  }

  public function hasLeftBrace(): bool {
    return !$this->_left_brace->isMissing();
  }

  /**
   * @returns LeftBraceToken
   */
  public function getLeftBrace(): LeftBraceToken {
    return TypeAssert::isInstanceOf(LeftBraceToken::class, $this->_left_brace);
  }

  public function getDeclarationsUNTYPED(): EditableSyntax {
    return $this->_declarations;
  }

  public function withDeclarations(EditableSyntax $value): this {
    if ($value === $this->_declarations) {
      return $this;
    }
    return new self($this->_left_brace, $value, $this->_right_brace);
  }

  public function hasDeclarations(): bool {
    return !$this->_declarations->isMissing();
  }

  /**
   * @returns EditableList
   */
  public function getDeclarations(): ?EditableList {
    if ($this->_declarations->isMissing()) {
      return null;
    }
    return TypeAssert::isInstanceOf(EditableList::class, $this->_declarations);
  }

  /**
   * @returns EditableList
   */
  public function getDeclarationsx(): EditableList {
    return TypeAssert::isInstanceOf(EditableList::class, $this->_declarations);
  }

  public function getRightBraceUNTYPED(): EditableSyntax {
    return $this->_right_brace;
  }

  public function withRightBrace(EditableSyntax $value): this {
    if ($value === $this->_right_brace) {
      return $this;
    }
    return new self($this->_left_brace, $this->_declarations, $value);
  }

  public function hasRightBrace(): bool {
    return !$this->_right_brace->isMissing();
  }

  /**
   * @returns RightBraceToken
   */
  public function getRightBrace(): ?RightBraceToken {
    if ($this->_right_brace->isMissing()) {
      return null;
    }
    return TypeAssert::isInstanceOf(RightBraceToken::class, $this->_right_brace);
  }

  /**
   * @returns RightBraceToken
   */
  public function getRightBracex(): RightBraceToken {
    return TypeAssert::isInstanceOf(RightBraceToken::class, $this->_right_brace);
  }
}
