<?hh
/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<b8d706d469cb268377ce706b92557d7c>>
 */
namespace Facebook\HHAST;
use type Facebook\TypeAssert\TypeAssert;

final class TraitUseConflictResolutionItem extends EditableSyntax {

  private EditableSyntax $_aliasing_name;
  private EditableSyntax $_aliasing_keyword;
  private EditableSyntax $_aliased_names;

  public function __construct(
    EditableSyntax $aliasing_name,
    EditableSyntax $aliasing_keyword,
    EditableSyntax $aliased_names,
  ) {
    parent::__construct('trait_use_conflict_resolution_item');
    $this->_aliasing_name = $aliasing_name;
    $this->_aliasing_keyword = $aliasing_keyword;
    $this->_aliased_names = $aliased_names;
  }

  public static function from_json(
    array<string, mixed> $json,
    int $position,
    string $source,
  ): this {
    $aliasing_name = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['trait_use_conflict_resolution_item_aliasing_name'],
      $position,
      $source,
    );
    $position += $aliasing_name->width();
    $aliasing_keyword = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['trait_use_conflict_resolution_item_aliasing_keyword'],
      $position,
      $source,
    );
    $position += $aliasing_keyword->width();
    $aliased_names = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['trait_use_conflict_resolution_item_aliased_names'],
      $position,
      $source,
    );
    $position += $aliased_names->width();
    return new self($aliasing_name, $aliasing_keyword, $aliased_names);
  }

  public function children(): KeyedTraversable<string, EditableSyntax> {
    yield 'aliasing_name' => $this->_aliasing_name;
    yield 'aliasing_keyword' => $this->_aliasing_keyword;
    yield 'aliased_names' => $this->_aliased_names;
  }

  public function rewrite_children(
    self::TRewriter $rewriter,
    ?Traversable<EditableSyntax> $parents = null,
  ): this {
    $parents = $parents === null ? vec[] : vec($parents);
    $parents[] = $this;
    $aliasing_name = $this->_aliasing_name->rewrite($rewriter, $parents);
    $aliasing_keyword = $this->_aliasing_keyword->rewrite($rewriter, $parents);
    $aliased_names = $this->_aliased_names->rewrite($rewriter, $parents);
    if (
      $aliasing_name === $this->_aliasing_name &&
      $aliasing_keyword === $this->_aliasing_keyword &&
      $aliased_names === $this->_aliased_names
    ) {
      return $this;
    }
    return new self($aliasing_name, $aliasing_keyword, $aliased_names);
  }

  public function raw_aliasing_name(): EditableSyntax {
    return $this->_aliasing_name;
  }

  public function with_aliasing_name(EditableSyntax $value): this {
    if ($value === $this->_aliasing_name) {
      return $this;
    }
    return new self($value, $this->_aliasing_keyword, $this->_aliased_names);
  }

  public function aliasing_name(): EditableSyntax {
    return TypeAssert::isInstanceOf(EditableSyntax::class, $this->_aliasing_name);
  }

  public function raw_aliasing_keyword(): EditableSyntax {
    return $this->_aliasing_keyword;
  }

  public function with_aliasing_keyword(EditableSyntax $value): this {
    if ($value === $this->_aliasing_keyword) {
      return $this;
    }
    return new self($this->_aliasing_name, $value, $this->_aliased_names);
  }

  public function aliasing_keyword(): EditableSyntax {
    return TypeAssert::isInstanceOf(EditableSyntax::class, $this->_aliasing_keyword);
  }

  public function raw_aliased_names(): EditableSyntax {
    return $this->_aliased_names;
  }

  public function with_aliased_names(EditableSyntax $value): this {
    if ($value === $this->_aliased_names) {
      return $this;
    }
    return new self($this->_aliasing_name, $this->_aliasing_keyword, $value);
  }

  public function aliased_names(): EditableList {
    return TypeAssert::isInstanceOf(EditableList::class, $this->_aliased_names);
  }
}
