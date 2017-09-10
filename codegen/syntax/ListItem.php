<?hh
/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<e32bf973fcf3e5185266dc544d5d68f0>>
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

  public function rewrite(
    self::TRewriter $rewriter,
    ?Traversable<EditableSyntax> $parents = null,
  ): EditableSyntax {
    $parents = $parents === null ? vec[] : vec($parents);
    $child_parents = $parents;
    $child_parents[] = $this;
    $item = $this->_item->rewrite($rewriter, $child_parents);
    $separator = $this->_separator->rewrite($rewriter, $child_parents);
    if ($item === $this->_item && $separator === $this->_separator) {
      $node = $this;
    } else {
      $node = new self($item, $separator);
    }
    return $rewriter($node, $parents);
  }

  public function item(): EditableSyntax {
    return $this->itemx();
  }

  public function itemx(): EditableSyntax {
    return TypeAssert::isInstanceOf(EditableSyntax::class, $this->_item);
  }

  public function raw_item(): EditableSyntax {
    return $this->_item;
  }

  public function with_item(EditableSyntax $value): this {
    return new self($value, $this->_separator);
  }

  public function separator(): EditableSyntax {
    return $this->separatorx();
  }

  public function separatorx(): EditableSyntax {
    return TypeAssert::isInstanceOf(EditableSyntax::class, $this->_separator);
  }

  public function raw_separator(): EditableSyntax {
    return $this->_separator;
  }

  public function with_separator(EditableSyntax $value): this {
    return new self($this->_item, $value);
  }
}
