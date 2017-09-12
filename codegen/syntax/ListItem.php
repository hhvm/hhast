<?hh
/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<9686b215b2e447d2829d1d92da3c8635>>
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

  <<__Override>>
  public static function fromJSON(
    array<string, mixed> $json,
    int $position,
    string $source,
  ): this {
    $item = EditableSyntax::fromJSON(
      /* UNSAFE_EXPR */ $json['list_item'],
      $position,
      $source,
    );
    $position += $item->getWidth();
    $separator = EditableSyntax::fromJSON(
      /* UNSAFE_EXPR */ $json['list_separator'],
      $position,
      $source,
    );
    $position += $separator->getWidth();
    return new self($item, $separator);
  }

  <<__Override>>
  public function getChildren(): KeyedTraversable<string, EditableSyntax> {
    yield 'item' => $this->_item;
    yield 'separator' => $this->_separator;
  }

  <<__Override>>
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

  public function getItemUNTYPED(): EditableSyntax {
    return $this->_item;
  }

  public function withItem(EditableSyntax $value): this {
    if ($value === $this->_item) {
      return $this;
    }
    return new self($value, $this->_separator);
  }

  public function hasItem(): bool {
    return !$this->_item->isMissing();
  }

  public function getItem(): EditableSyntax {
    return TypeAssert::isInstanceOf(EditableSyntax::class, $this->_item);
  }

  public function getSeparatorUNTYPED(): EditableSyntax {
    return $this->_separator;
  }

  public function withSeparator(EditableSyntax $value): this {
    if ($value === $this->_separator) {
      return $this;
    }
    return new self($this->_item, $value);
  }

  public function hasSeparator(): bool {
    return !$this->_separator->isMissing();
  }

  public function getSeparator(): EditableSyntax {
    return TypeAssert::isInstanceOf(EditableSyntax::class, $this->_separator);
  }
}
