<?hh
/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<d7125879832cce02b3ed5ea7dbd6a3c3>>
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

  public function children(): KeyedTraversable<string, EditableSyntax> {
    yield 'name' => $this->_name;
    yield 'colon' => $this->_colon;
  }

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

  public function name(): NameToken {
    return $this->namex();
  }

  public function namex(): NameToken {
    return TypeAssert::isInstanceOf(NameToken::class, $this->_name);
  }

  public function raw_name(): EditableSyntax {
    return $this->_name;
  }

  public function with_name(EditableSyntax $value): this {
    return new self($value, $this->_colon);
  }

  public function colon(): ColonToken {
    return $this->colonx();
  }

  public function colonx(): ColonToken {
    return TypeAssert::isInstanceOf(ColonToken::class, $this->_colon);
  }

  public function raw_colon(): EditableSyntax {
    return $this->_colon;
  }

  public function with_colon(EditableSyntax $value): this {
    return new self($this->_name, $value);
  }
}
