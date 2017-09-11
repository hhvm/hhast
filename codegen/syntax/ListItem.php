<?hh
/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<2dc1509315d1c8b578bf79eb7ce7eb92>>
 */
namespace Facebook\HHAST;
use type Facebook\TypeAssert\TypeAssert;

final class ListItem extends EditableSyntax {

  private EditableSyntax $_item;
  private EditableSyntax $_separator;

  public function __construct(EditableSyntax $item, EditableSyntax $separator) {
    parent::__construct('list_item');
    $this->_item = $item;
    $this->_separator = $separator;
  }

  public static function from_json(
    array<string, mixed> $json,
    int $position,
    string $source,
  ): this {
    $item = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['list_item'],
      $position,
      $source,
    );
    $position += $item->width();
    $separator = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['list_separator'],
      $position,
      $source,
    );
    $position += $separator->width();
    return new self($item, $separator);
  }

  public function children(): KeyedTraversable<string, EditableSyntax> {
    yield 'item' => $this->_item;
    yield 'separator' => $this->_separator;
  }

  public function rewrite_children(
    self::TRewriter $rewriter,
    ?Traversable<EditableSyntax> $parents = null,
  ): this {
    $parents = $parents === null ? vec[] : vec($parents);
    $parents[] = $this;
    $item = $this->_item->rewrite($rewriter, $parents);
    $separator = $this->_separator->rewrite($rewriter, $parents);
    if (
      $item === $this->_item &&
      $separator === $this->_separator
    ) {
      return $this;
    }
    return new self($item, $separator);
  }

  public function raw_item(): EditableSyntax {
    return $this->_item;
  }

  public function with_item(EditableSyntax $value): this {
    if ($value === $this->_item) {
      return $this;
    }
    return new self($value, $this->_separator);
  }

  public function item(): EditableSyntax {
    return TypeAssert::isInstanceOf(EditableSyntax::class, $this->_item);
  }

  public function raw_separator(): EditableSyntax {
    return $this->_separator;
  }

  public function with_separator(EditableSyntax $value): this {
    if ($value === $this->_separator) {
      return $this;
    }
    return new self($this->_item, $value);
  }

  public function separator(): EditableSyntax {
    return TypeAssert::isInstanceOf(EditableSyntax::class, $this->_separator);
  }
}
