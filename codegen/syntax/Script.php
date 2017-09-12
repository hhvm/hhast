<?hh
/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<07d64a9d6656af67a979c0db6f47464f>>
 */
namespace Facebook\HHAST;
use type Facebook\TypeAssert\TypeAssert;

final class Script extends EditableSyntax {

  private EditableSyntax $_declarations;

  public function __construct(EditableSyntax $declarations) {
    parent::__construct('script');
    $this->_declarations = $declarations;
  }

  <<__Override>>
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

  <<__Override>>
  public function children(): KeyedTraversable<string, EditableSyntax> {
    yield 'declarations' => $this->_declarations;
  }

  <<__Override>>
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

  public function getDeclarationsUNTYPED(): EditableSyntax {
    return $this->_declarations;
  }

  public function withDeclarations(EditableSyntax $value): this {
    if ($value === $this->_declarations) {
      return $this;
    }
    return new self($value);
  }

  public function hasDeclarations(): bool {
    return !$this->_declarations->is_missing();
  }

  public function getDeclarations(): EditableList {
    return TypeAssert::isInstanceOf(EditableList::class, $this->_declarations);
  }
}
