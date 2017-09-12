<?hh
/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<1acb3def64ba39b3402c847699a95407>>
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
  public static function from_json(
    array<string, mixed> $json,
    int $position,
    string $source,
  ): this {
    $name = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['goto_label_name'],
      $position,
      $source,
    );
    $position += $name->width();
    $colon = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['goto_label_colon'],
      $position,
      $source,
    );
    $position += $colon->width();
    return new self($name, $colon);
  }

  <<__Override>>
  public function children(): KeyedTraversable<string, EditableSyntax> {
    yield 'name' => $this->_name;
    yield 'colon' => $this->_colon;
  }

  <<__Override>>
  public function rewrite_children(
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
    return !$this->_name->is_missing();
  }

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
    return !$this->_colon->is_missing();
  }

  public function getColon(): ColonToken {
    return TypeAssert::isInstanceOf(ColonToken::class, $this->_colon);
  }
}
