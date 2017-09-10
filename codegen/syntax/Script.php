<?hh
/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<eb49fd588ef865711f51dd54add502c0>>
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

  public function rewrite_children(
    self::TRewriter $rewriter,
    ?Traversable<EditableSyntax> $parents = null,
  ): this {
    $parents = $parents === null ? vec[] : vec($parents);
    $parents[] = $this;
    $declarations = $this->_declarations->rewrite($rewriter, $parents);
    if (
      $declarations === $this->_declarations
    ) {
      return $this;
    }
    return new self($declarations);
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
