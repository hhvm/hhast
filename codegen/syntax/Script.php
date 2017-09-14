<?hh
/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<2de655d8b5c21f0cca1f5bc61b733fc4>>
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
  public static function fromJSON(
    dict<string, mixed> $json,
    int $position,
    string $source,
  ): this {
    $declarations = EditableSyntax::fromJSON(
      /* UNSAFE_EXPR */ $json['script_declarations'],
      $position,
      $source,
    );
    $position += $declarations->getWidth();
    return new self($declarations);
  }

  <<__Override>>
  public function getChildren(): KeyedTraversable<string, EditableSyntax> {
    yield 'declarations' => $this->_declarations;
  }

  <<__Override>>
  public function rewriteDescendants(
    self::TRewriter $rewriter,
    ?Traversable<EditableSyntax> $parents = null,
  ): this {
    $parents = $parents === null ? vec[] : vec($parents);
    $parents[] = $this;
    $declarations = $this->_declarations->rewrite($rewriter, $parents);
    if ($declarations === $this->_declarations) {
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
    return !$this->_declarations->isMissing();
  }

  /**
   * @returns EditableList
   */
  public function getDeclarations(): EditableList {
    return TypeAssert::isInstanceOf(EditableList::class, $this->_declarations);
  }
}
