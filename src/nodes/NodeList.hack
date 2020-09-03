/*
 *  Copyright (c) 2017-present, Facebook, Inc.
 *  All rights reserved.
 *
 *  This source code is licensed under the MIT license found in the
 *  LICENSE file in the root directory of this source tree.
 *
 */

namespace Facebook\HHAST;

use namespace HH\Lib\{C, Str, Vec};

final class NodeList<+Titem as Node> extends Node {
  const string SYNTAX_KIND = 'list';
  /**
   * Use `NodeList::createMaybeEmptyList()` or
   * `NodeList::createNonEmptyListNull()` instead to be explicit
   * about desired behavior.
   */
  <<__Override>>
  public function __construct(
    private vec<Titem> $_children = vec[],
    ?__Private\SourceRef $ref = null,
  ) {
    parent::__construct($ref);
  }

  <<__Override>>
  public function isList(): bool {
    return true;
  }

  <<__Override>>
  public function toVec(): vec<Titem> {
    return $this->_children;
  }

  <<__Override>>
  public function getChildren(): vec<Titem> {
    return $this->_children;
  }

  public function getChildrenOfItems<T as ?Node>(
  ): vec<T> where Titem as ListItem<T> {
    return Vec\map($this->getChildren(), $child ==> $child->getItem());
  }

  public function getChildrenOfItemsOfType<T as ?Node>(
    classname<T> $what,
  ): vec<T> where Titem as ListItem<T> {
    $out = vec[];
    foreach ($this->getChildrenOfItems() as $item) {
      if (\is_a($item, $what)) {
        $out[] = $item;
      }
    }
    return $out;
  }

  public static function createNonEmptyListOrNull<T as Node>(
    vec<T> $items,
  ): ?NodeList<T> {
    if (C\count($items) === 0) {
      return null;
    }
    return new self($items);
  }

  public static function createMaybeEmptyList<T as Node>(
    vec<T> $items,
  ): NodeList<T> {
    return new self($items);
  }

  public static function concat<T as Node>(
    NodeList<T> $first,
    NodeList<T> $second,
  ): NodeList<T> {
    return new NodeList(Vec\concat($first->toVec(), $second->toVec()));
  }

  <<__Override>>
  public static function fromJSON(
    dict<string, mixed> $json,
    string $file,
    int $offset,
    string $source,
    string $type_hint,
  ): this {
    if (Str\starts_with($type_hint, 'NodeList<')) {
      $type_hint = $type_hint
        |> Str\strip_prefix($$, 'NodeList<')
        |> Str\strip_suffix($$, '>');
    } else {
      $type_hint = 'Node';
    }
    $children = vec[];
    $current_position = $offset;
    foreach (/* HH_FIXME[4110] */ $json['elements'] as $element) {
      $child = Node::fromJSON(
        $element,
        $file,
        $current_position,
        $source,
        $type_hint,
      ) as nonnull;
      $children[] = $child;
      $current_position += $child->getWidth();
    }
    return new NodeList(/* HH_FIXME[4110] */ $children, shape(
      'file' => $file,
      'source' => $source,
      'offset' => $offset,
      'width' => $current_position - $offset,
    ));
  }

  <<__Override>>
  public function rewriteChildren<Tret as ?Node>(
    (function(Node, vec<Node>): Tret) $rewriter,
    vec<Node> $parents = vec[],
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
      if ($new is NodeList<_>) {
        $new_children = Vec\concat($new_children, $new->getChildren());
        continue;
      }
      $new_children[] = $new;
    }

    if ($old_children === $new_children) {
      return $this;
    }

    return new NodeList(/* HH_FIXME[4110] */ Vec\filter_nulls($new_children));
  }

  <<__Override>>
  protected function replaceImpl(int $old_id, Node $new): this {
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
    return new self(Vec\filter_nulls(/* HH_FIXME[4110] */ $children));
  }

  public function replaceChild<Tchild super Titem as Node>(
    Tchild $old,
    Tchild $new,
  ): NodeList<Tchild> {
    if ($old === $new) {
      return $this;
    }
    if (!C\contains($this->_children, $old)) {
      return $this;
    }
    return new NodeList(
      Vec\map($this->_children, $c ==> $c === $old ? $new : $c),
    );
  }

  public function insertBefore<Tchild super Titem as Node>(
    Tchild $before,
    Tchild $child,
  ): NodeList<Tchild> {
    $idx = C\find_key($this->_children, $c ==> $c === $before);
    invariant($idx !== null, 'asked to insert before non-child');
    return new NodeList(Vec\concat(
      Vec\take($this->_children, $idx),
      vec[$child],
      Vec\drop($this->_children, $idx),
    ));
  }

  public function insertAfter<Tchild super Titem as Node>(
    Tchild $after,
    Tchild $child,
  ): NodeList<Tchild> {
    $idx = C\find_key($this->_children, $c ==> $c === $after);
    invariant($idx !== null, 'asked to insert after non-child');
    return new NodeList(Vec\concat(
      Vec\take($this->_children, $idx + 1),
      vec[$child],
      Vec\drop($this->_children, $idx + 1),
    ));
  }

  public function filterChildren((function(Titem): bool) $filter): this {
    $new = Vec\filter($this->_children, $filter);
    if ($new === $this->_children) {
      return $this;
    }
    return new NodeList($new);
  }

  public function withoutChild<Tchild super Titem>(Tchild $child): this {
    $new = Vec\filter($this->_children, $c ==> $c !== $child);
    if ($new === $this->_children) {
      return $this;
    }
    return new NodeList($new);
  }

  public function withoutItemWithChild<Tinner as Node>(
    Tinner $inner,
  ): this where Titem as ListItem<Tinner> {
    $new = Vec\filter($this->_children, $c ==> $c->getItem() !== $inner);
    if ($new === $this->_children) {
      return $this;
    }
    return new NodeList($new);
  }

  public function isEmpty(): bool {
    return C\is_empty($this->_children);
  }

  public function getCount(): int {
    return C\count($this->_children);
  }
}
