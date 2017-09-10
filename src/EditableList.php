<?hh // strict
/**
 * Copyright (c) 2016, Facebook, Inc.
 * All rights reserved.
 *
 * This source code is licensed under the BSD-style license found in the
 * LICENSE file in the root directory of this source tree. An additional
 * grant of patent rights can be found in the PATENTS file in the same
 * directory.
 *
 */

namespace Facebook\HHAST;

use type Facebook\TypeAssert\TypeAssert;
use namespace HH\Lib\{C, Vec};

final class EditableList extends EditableSyntax
  implements \ArrayAccess<mixed, mixed> {
  private vec<EditableSyntax> $_children;
  public function __construct(Traversable<EditableSyntax> $children) {
    parent::__construct('list');
    $this->_children = vec($children);
  }

  public function offsetExists(mixed $offset): bool {
    return array_key_exists($offset, $this->_children);
  }

  public function offsetGet(mixed $offset): EditableSyntax {
    $offset = TypeAssert::isInt($offset);
    return $this->_children[$offset];
  }

  public function offsetSet(mixed $offset, mixed $value): void {
    invariant_violation('unimplemented');
  }

  public function offsetUnset(mixed $offset): void {
    invariant_violation('unimplemented');
  }

  public function is_list(): bool {
    return true;
  }

  public function to_vec(): vec<EditableSyntax> {
    return $this->_children;
  }

  public function children(): KeyedTraversable<string, EditableSyntax> {
    $i = 0;
    foreach ($this->_children as $child) {
      yield (string) $i => $child;
      $i++;
    }
  }

  /* TODO: Getter by index? */

  public static function to_list(
    Traversable<EditableSyntax> $syntax_list,
  ): EditableSyntax {
    $syntax_list = vec($syntax_list);
    if (C\count($syntax_list) === 0)
      return Missing();
    else
      return new EditableList($syntax_list);
  }

  public static function concatenate_lists(
    EditableSyntax $left,
    EditableSyntax $right,
  ): EditableSyntax {
    if ($left->is_missing())
      return $right;
    if ($right->is_missing())
      return $left;
    return new EditableList(Vec\concat($left->to_vec(), $right->to_vec()));
  }

  public static function from_json(
    array<string, mixed> $json,
    int $position,
    string $source,
  ): this {
    // TODO Implement array map
    $children = vec[];
    $current_position = $position;
    foreach (/* UNSAFE_EXPR */$json['elements'] as $element) {
      $child = EditableSyntax::from_json($element, $current_position, $source);
      $children[] = $child;
      $current_position += $child->width();
    }
    return new EditableList($children);
  }

  public function rewrite(
    self::TRewriter $rewriter,
    ?Traversable<EditableSyntax> $parents = null,
  ): EditableSyntax {
    $parents = $parents === null ? vec[] : vec($parents);

    $dirty = false;
    $new_children = vec[];
    $new_parents = $parents;
    $new_parents[] = $this;
    foreach ($this->children() as $child) {
      $new_child = $child->rewrite($rewriter, $new_parents);
      if ($new_child != $child)
        $dirty = true;
      if ($new_child != null) {
        if ($new_child->is_list()) {
          foreach ($new_child->children() as $n)
            array_push($new_children, $n);
        } else
          array_push($new_children, $new_child);
      }
    }
    $result = $this;
    if ($dirty) {
      if (count($new_children) === 0)
        $result = Missing();
      else
        $result = new EditableList($new_children);
    }
    return $rewriter($result, $parents);
  }
}
