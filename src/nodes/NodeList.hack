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

final class NodeList<+Titem as Node> extends Node {
  const string SYNTAX_KIND = 'list';
  /**
   * Use `NodeList::createMaybeEmptyList()` or
   * `NodeList::createNonEmptyListOrMissing()` instead to be explicit
   * about desired behavior.
   */
  <<__Override>>
  public function __construct(
    private vec<Node> $_children,
    ?__Private\SourceRef $ref = null,
  ) {
    parent::__construct($ref);
  }

  <<__Override>>
  final public function isList(): bool {
    return true;
  }

  <<__Override>>
  public function toVec(): vec<Titem> {
    return /* HH_FIXME[4110] */ $this->_children;
  }

  <<__Override>>
  public function getChildren(): vec<Titem> {
    return /* HH_FIXME[4110] */ $this->_children;
  }

  final public function getChildrenOfItems<T>(): vec<T> where Titem as ListItem<T> {
    /* HH_FIXME[4110] we have to trust the typechecker here; in future, use
     * reified generics */
    return Vec\map(
      $this->getChildren(),
      $child ==> $child->getItem(),
    );
  }

  final public function getChildrenOfItemsOfType<T>(
    classname<T> $what,
  ): vec<T> where Titem as ListItem<T> {
    $out = vec[];
    foreach ($this->getChildrenOfItems() as $item) {
      if ($item instanceof $what) {
        $out[] = $item;
      }
    }
    return $out;
  }

  <<__Deprecated("Use createNonEmptyListOrMissing() instead")>>
  public static function fromItems(vec<Node> $items): Node {
    return self::createNonEmptyListOrMissing($items);
  }

  public static function createNonEmptyListOrMissing(vec<Node> $items): Node {
    if (C\count($items) === 0) {
      return Missing();
    } else {
      return new self($items);
    }
  }

  public static function createMaybeEmptyList<T as Node>(
    vec<T> $items,
  ): NodeList<T> {
    return new self($items);
  }

  public static function concat(Node $left, Node $right): Node {
    if ($left->isMissing()) {
      return $right;
    }
    if ($right->isMissing()) {
      return $left;
    }
    return new NodeList(Vec\concat($left->toVec(), $right->toVec()));
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
    foreach (/* HH_FIXME[4110] */ $json['elements'] as $element) {
      $child = Node::fromJSON($element, $file, $current_position, $source);
      $children[] = $child;
      $current_position += $child->getWidth();
    }
    return new NodeList($children, shape(
      'file' => $file,
      'source' => $source,
      'offset' => $offset,
      'width' => $current_position - $offset,
    ));
  }

  <<__Override>>
  public function rewriteChildren(
    self::TRewriter $rewriter,
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
      if ($new->isMissing()) {
        continue;
      }
      if ($new instanceof NodeList) {
        $new_children = Vec\concat($new_children, $new->getChildren());
        continue;
      }
      $new_children[] = $new;
    }

    if ($old_children === $new_children) {
      return $this;
    }

    return new NodeList($new_children);
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
    return new self(Vec\filter($children, $child ==> !$child->isMissing()));
  }

  <<__Override>>
  public function rewrite(
    self::TRewriter $rewriter,
    vec<Node> $parents = vec[],
  ): Node {
    $with_rewritten_children = $this->rewriteDescendants($rewriter, $parents);
    if (C\is_empty($with_rewritten_children->_children)) {
      $node = Missing();
    } else {
      $node = $with_rewritten_children;
    }
    return $rewriter($node, $parents);
  }
}
