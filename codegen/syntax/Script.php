<?hh
/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<a84ede821d12dde01d833b0dd2cc5f65>>
 */
namespace Facebook\HHAST;
use type Facebook\TypeAssert\TypeAssert;

final class Script extends EditableSyntax {

  private EditableSyntax $_declarations;

  public function __construct(EditableSyntax $declarations) {
    parent::__construct('script');
    $this->_declarations = $declarations;
  }

  public static function from_json(
    array<string, mixed> $json,
    int $position,
    string $source,
  ): this {
    $declarations = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['script_declarations'],
      $position,
      $source,
    );
    $position += $declarations->width();
    return new self($declarations);
  }

  public function children(): KeyedTraversable<string, EditableSyntax> {
    yield 'declarations' => $this->_declarations;
  }

  public function rewrite(
    self::TRewriter $rewriter,
    ?Traversable<EditableSyntax> $parents = null,
  ): EditableSyntax {
    $parents = $parents === null ? vec[] : vec($parents);
    $child_parents = $parents;
    $child_parents[] = $this;
    $declarations = $this->_declarations->rewrite($rewriter, $child_parents);
    if ($declarations === $this->_declarations) {
      $node = $this;
    } else {
      $node = new self($declarations);
    }
    return $rewriter($node, $parents);
  }

  public function declarations(): EditableList {
    return $this->declarationsx();
  }

  public function declarationsx(): EditableList {
    return TypeAssert::isInstanceOf(EditableList::class, $this->_declarations);
  }

  public function raw_declarations(): EditableSyntax {
    return $this->_declarations;
  }

  public function with_declarations(EditableSyntax $value): this {
    return new self($value);
  }
}
