<?hh
/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<45c1ec292a5e19fd8664556c6988daa5>>
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

  public static function from_json(
    array<string, mixed> $json,
    int $position,
    string $source,
  ): this {
    $left_brace = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['namespace_left_brace'],
      $position,
      $source,
    );
    $position += $left_brace->width();
    $declarations = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['namespace_declarations'],
      $position,
      $source,
    );
    $position += $declarations->width();
    $right_brace = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['namespace_right_brace'],
      $position,
      $source,
    );
    $position += $right_brace->width();
    return new self($left_brace, $declarations, $right_brace);
  }

  public function children(): KeyedTraversable<string, EditableSyntax> {
    yield 'left_brace' => $this->_left_brace;
    yield 'declarations' => $this->_declarations;
    yield 'right_brace' => $this->_right_brace;
  }

  public function rewrite(
    self::TRewriter $rewriter,
    ?Traversable<EditableSyntax> $parents = null,
  ): EditableSyntax {
    $parents = $parents === null ? vec[] : vec($parents);
    $child_parents = $parents;
    $child_parents[] = $this;
    $left_brace = $this->_left_brace->rewrite($rewriter, $child_parents);
    $declarations = $this->_declarations->rewrite($rewriter, $child_parents);
    $right_brace = $this->_right_brace->rewrite($rewriter, $child_parents);
    if (
      $left_brace === $this->_left_brace &&
      $declarations === $this->_declarations &&
      $right_brace === $this->_right_brace
    ) {
      $node = $this;
    } else {
      $node = new self($left_brace, $declarations, $right_brace);
    }
    return $rewriter($node, $parents);
  }

  public function left_brace(): LeftBraceToken {
    return $this->left_bracex();
  }

  public function left_bracex(): LeftBraceToken {
    return TypeAssert::isInstanceOf(LeftBraceToken::class, $this->_left_brace);
  }

  public function raw_left_brace(): EditableSyntax {
    return $this->_left_brace;
  }

  public function with_left_brace(EditableSyntax $value): this {
    return new self($value, $this->_declarations, $this->_right_brace);
  }

  public function declarations(): ?EditableList {
    return $this->_declarations->is_missing()
      ? null
      : TypeAssert::isInstanceOf(EditableList::class, $this->_declarations);
  }

  public function declarationsx(): EditableList {
    return TypeAssert::isInstanceOf(EditableList::class, $this->_declarations);
  }

  public function raw_declarations(): EditableSyntax {
    return $this->_declarations;
  }

  public function with_declarations(EditableSyntax $value): this {
    return new self($this->_left_brace, $value, $this->_right_brace);
  }

  public function right_brace(): ?RightBraceToken {
    return $this->_right_brace->is_missing()
      ? null
      : TypeAssert::isInstanceOf(RightBraceToken::class, $this->_right_brace);
  }

  public function right_bracex(): RightBraceToken {
    return
      TypeAssert::isInstanceOf(RightBraceToken::class, $this->_right_brace);
  }

  public function raw_right_brace(): EditableSyntax {
    return $this->_right_brace;
  }

  public function with_right_brace(EditableSyntax $value): this {
    return new self($this->_left_brace, $this->_declarations, $value);
  }
}
