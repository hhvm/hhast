/*
 *  Copyright (c) 2017-present, Facebook, Inc.
 *  All rights reserved.
 *
 *  This source code is licensed under the MIT license found in the
 *  LICENSE file in the root directory of this source tree.
 *
 */

namespace Facebook\HHAST;

use namespace HH\Lib\{C, Vec};

final class EditableList<+Titem as ?EditableNode> extends EditableNode {
  const string SYNTAX_KIND = 'list';
  /**
   * Use `EditableList::createMaybeEmptyList()` or
   * `EditableList::createNonEmptyListOrMissing()` instead to be explicit
   * about desired behavior.
   */
  <<__Override>>
  public function __construct(
    private vec<EditableNode> $_children,
    ?__Private\SourceRef $ref = null,
  ) {
    parent::__construct($ref);
  }

  <<__Override>>
  final public function isList(): bool {
    return true;
  }

  <<__Override>>
  public function toVec(): vec<EditableNode> {
    return $this->_children;
  }

  <<__Override>>
  public function getChildren(): vec<EditableNode> {
    return $this->_children;
  }

  final public function getItems(): vec<Titem> {
    // The `filter_nulls()` is needed for for expressions like
    // `list($a,,$c) = $foo` and types like `\Foo\Bar`, now that the first
    // is parsed as name token items with  backslash separators - i.e. the first
    // item is empty.

    /* HH_FIXME[4110] we have to trust the typechecker here; in future, use
     * reified generics */
    return Vec\map(
      $this->_children,
      $child ==> $child instanceof ListItem ? $child->getItem() : $child,
    ); // |> Vec\filter_nulls($$);
  }

  final public function getItemsOfType<T as EditableNode>(
    classname<T> $what,
  ): vec<T> {
    $out = vec[];
    foreach ($this->getItems() as $item) {
      if ($item instanceof $what) {
        $out[] = $item;
      }
    }
    return $out;
  }

  <<__Deprecated("Use createNonEmptyListOrMissing() instead")>>
  public static function fromItems(vec<EditableNode> $items): EditableNode {
    return self::createNonEmptyListOrMissing($items);
  }

  public static function createNonEmptyListOrMissing(
    vec<EditableNode> $items,
  ): EditableNode {
    if (C\count($items) === 0) {
      return Missing();
    } else {
      return new self($items);
    }
  }

  public static function createMaybeEmptyList<T as EditableNode>(
    vec<T> $items,
  ): EditableList<T> {
    return new self($items);
  }

  public static function concat(
    EditableNode $left,
    EditableNode $right,
  ): EditableNode {
    if ($left->isMissing()) {
      return $right;
    }
    if ($right->isMissing()) {
      return $left;
    }
    return new EditableList(Vec\concat($left->toVec(), $right->toVec()));
  }

  <<__Override>>
  public static function fromJSON(
    dict<string, mixed> $json,
    string $file,
    int $offset,
    string $source,
  ): this {
    $children = vec[];
    $current_position = $offset;
    foreach (/* UNSAFE_EXPR */$json['elements'] as $element) {
      $child = EditableNode::fromJSON(
        $element,
        $file,
        $current_position,
        $source,
      );
      $children[] = $child;
      $current_position += $child->getWidth();
    }
    return new EditableList($children, shape(
      'file' => $file,
      'source' => $source,
      'offset' => $offset,
      'width' => $current_position - $offset,
    ));
  }

  <<__Override>>
  public function rewriteChildren(
    self::TRewriter $rewriter,
    vec<EditableNode> $parents = vec[],
  ): this {
    $parents[] = $this;
    $old_children = $this->_children;
    $new_children = vec[];
    foreach ($old_children as $old) {
      $new = $rewriter($old, $parents);
      if ($old === $new) {
        $new_children[] = $old;
        continue;
      }
      if ($new->isMissing()) {
        continue;
      }
      if ($new instanceof EditableList) {
        $new_children = Vec\concat($new_children, $new->getChildren());
        continue;
      }
      $new_children[] = $new;
    }

    if ($old_children === $new_children) {
      return $this;
    }

    return new EditableList($new_children);
  }

  <<__Override>>
  protected function replaceImpl(
    int $old_id,
    EditableNode $new,
  ): this {
    $children = $this->_children;
    foreach ($children as $idx => $child) {
      if ($child->getUniqueID() === $old_id) {
        $children[$idx] = $new;
        break;
      }
      if (!C\contains_key($child->_descendants, $old_id)) {
        continue;
      }
      $children[$idx] = $child->replaceImpl($old_id, $new);
      break;
    }
    return new self(Vec\filter($children, $child ==> !$child->isMissing()));
  }

  <<__Override>>
  public function rewrite(
    self::TRewriter $rewriter,
    vec<EditableNode> $parents = vec[],
  ): EditableNode {
    $with_rewritten_children = $this->rewriteDescendants($rewriter, $parents);
    if (C\is_empty($with_rewritten_children->_children)) {
      $node = Missing();
    } else {
      $node = $with_rewritten_children;
    }
    return $rewriter($node, $parents);
  }
}
