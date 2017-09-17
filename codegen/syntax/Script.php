<?hh
/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<5a575dfee6d0c5b8903787442ee9fb75>>
 */
namespace Facebook\HHAST;
use namespace Facebook\TypeAssert;

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
    return TypeAssert\instance_of(EditableList::class, $this->_declarations);
  }
}
