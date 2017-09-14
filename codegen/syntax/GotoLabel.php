<?hh
/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<2e6024958b6f4ea1a229adb26b2ec3ba>>
 */
namespace Facebook\HHAST;
use type Facebook\TypeAssert\TypeAssert;

final class GotoLabel extends EditableSyntax {

  private EditableSyntax $_name;
  private EditableSyntax $_colon;

  public function __construct(EditableSyntax $name, EditableSyntax $colon) {
    parent::__construct('goto_label');
    $this->_name = $name;
    $this->_colon = $colon;
  }

  <<__Override>>
  public static function fromJSON(
    dict<string, mixed> $json,
    int $position,
    string $source,
  ): this {
    $name = EditableSyntax::fromJSON(
      /* UNSAFE_EXPR */ $json['goto_label_name'],
      $position,
      $source,
    );
    $position += $name->getWidth();
    $colon = EditableSyntax::fromJSON(
      /* UNSAFE_EXPR */ $json['goto_label_colon'],
      $position,
      $source,
    );
    $position += $colon->getWidth();
    return new self($name, $colon);
  }

  <<__Override>>
  public function getChildren(): KeyedTraversable<string, EditableSyntax> {
    yield 'name' => $this->_name;
    yield 'colon' => $this->_colon;
  }

  <<__Override>>
  public function rewriteDescendants(
    self::TRewriter $rewriter,
    ?Traversable<EditableSyntax> $parents = null,
  ): this {
    $parents = $parents === null ? vec[] : vec($parents);
    $parents[] = $this;
    $name = $this->_name->rewrite($rewriter, $parents);
    $colon = $this->_colon->rewrite($rewriter, $parents);
    if (
      $name === $this->_name &&
      $colon === $this->_colon
    ) {
      return $this;
    }
    return new self($name, $colon);
  }

  public function getNameUNTYPED(): EditableSyntax {
    return $this->_name;
  }

  public function withName(EditableSyntax $value): this {
    if ($value === $this->_name) {
      return $this;
    }
    return new self($value, $this->_colon);
  }

  public function hasName(): bool {
    return !$this->_name->isMissing();
  }

  /**
   * @returns NameToken
   */
  public function getName(): NameToken {
    return TypeAssert::isInstanceOf(NameToken::class, $this->_name);
  }

  public function getColonUNTYPED(): EditableSyntax {
    return $this->_colon;
  }

  public function withColon(EditableSyntax $value): this {
    if ($value === $this->_colon) {
      return $this;
    }
    return new self($this->_name, $value);
  }

  public function hasColon(): bool {
    return !$this->_colon->isMissing();
  }

  /**
   * @returns ColonToken
   */
  public function getColon(): ColonToken {
    return TypeAssert::isInstanceOf(ColonToken::class, $this->_colon);
  }
}
