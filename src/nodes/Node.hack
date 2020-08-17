/*
 *  Copyright (c) 2017-present, Facebook, Inc.
 *  All rights reserved.
 *
 *  This source code is licensed under the MIT license found in the
 *  LICENSE file in the root directory of this source tree.
 *
 */

namespace Facebook\HHAST;

use namespace HH\Lib\{C, Dict, Str, Vec};
use namespace Facebook\TypeAssert;

abstract class Node implements IMemoizeParam {
  abstract const string SYNTAX_KIND;

  protected dict<int, Node> $_descendants = dict[];
  protected ?int $_width;

  public function __construct(protected ?__Private\SourceRef $sourceRef) {
    $this->_descendants = Dict\merge(
      dict[$this->getUniqueID() => $this],
      ...Vec\map($this->getChildren(), $c ==> $c->_descendants)
    );

    /* handy for debugging :)
    if ($sourceRef !== null) {
      $code = $this->getCode();
      $this->sourceRef = null;
      invariant(
        $code === $this->getCode(),
        'MISMATCH: %s -> %s',
        $this->getCode(),
        $code,
      );
    }
    */
  }

  private static int $_maxID = 0;

  <<__Memoize>>
  public function getUniqueID(): int {
    $id = self::$_maxID;
    self::$_maxID++;
    return $id;
  }

  public function getInstanceKey(): string {
    return (string)$this->getUniqueID();
  }

  final public function isAncestorOf(Node $other): bool {
    return C\contains_key($this->_descendants, $other->getUniqueID());
  }

  final public function getSyntaxKind(): string {
    return static::SYNTAX_KIND;
  }

  public abstract function getChildren(): KeyedContainer<arraykey, Node>;

  final public function getChildrenWhere(
    (function(Node): bool) $filter,
  ): KeyedContainer<arraykey, Node> {
    return Dict\filter($this->getChildren(), $child ==> $filter($child));
  }

  final public function getChildrenOfType<T as Node>(
    classname<T> $what,
  ): KeyedContainer<arraykey, T> {
    $out = dict[];
    foreach ($this->getChildren() as $k => $node) {
      if (\is_a($node, $what)) {
        $out[$k] = $node;
      }
    }
    return /* HH_FIXME[4110] need reified generics */ $out;
  }

  final public function traverse(): Container<Node> {
    return $this->_descendants;
  }

  public function isToken(): bool {
    return false;
  }

  public function isTrivia(): bool {
    return false;
  }

  public function isList(): bool {
    return false;
  }

  public function getWidth(): int {
    if ($this->_width === null) {
      $width = 0;
      /* TODO: Make an accumulation sequence operator */
      foreach ($this->getChildren() as $node) {
        $width += $node->getWidth();
      }
      $this->_width = $width;
      return $width;
    } else {
      return $this->_width;
    }
  }

  final public function getCode(): string {
    $loc = $this->sourceRef;
    if ($loc is nonnull) {
      return Str\slice($loc['source'], $loc['offset'], $loc['width']);
    }
    return $this->getCodeUncached();
  }

  protected function getCodeUncached(): string {
    /* TODO: Make an accumulation sequence operator */
    $s = '';
    foreach ($this->getChildren() as $node) {
      $s .= $node->getCode();
    }
    return $s;
  }

  public static function fromJSON(
    dict<string, mixed> $json,
    string $file,
    int $offset,
    string $source,
    string $type_hint,
  ): ?Node {
    return __Private\node_from_json($json, $file, $offset, $source, $type_hint);
  }

  public function toVec(): vec<Node> {
    return vec[$this];
  }

  final public function getDescendantsOfType<T as Node>(
    classname<T> $what,
  ): vec<T> {
    $out = vec[];
    foreach ($this->_descendants as $node) {
      if (\is_a($node, $what)) {
        $out[] = $node;
      }
    }
    return /* HH_FIXME[4110] need reified generics */ $out;
  }

  final public function getFirstDescendantOfType<T as Node>(
    classname<T> $what,
  ): ?T {
    foreach ($this->_descendants as $node) {
      if (\is_a($node, $what)) {
        return /* HH_FIXME[4110] need reified generics */ $node;
      }
    }
    return null;
  }


  final public function replace(Node $old, Node $new): this {
    if ($old === $new) {
      return $this;
    }
    return $this->replaceDescendant($old, $new);
  }

  final public function replaceDescendant(Node $old, Node $new): this {
    $old_id = $old->getUniqueID();
    if (!C\contains_key($this->_descendants, $old_id)) {
      return $this;
    }
    return $this->replaceImpl($old_id, $new);
  }

  protected function replaceImpl(int $old_id, Node $new): this {
    return $this->rewriteChildren(
      ($child, $_) ==> {
        if ($child->getUniqueID() === $old_id) {
          return $new;
        }
        if (!C\contains_key($child->_descendants, $old_id)) {
          return $child;
        }
        return $child->replaceImpl($old_id, $new);
      },
    );
  }

  public function getFirstTokenx(): Token {
    return TypeAssert\not_null($this->getFirstToken());
  }

  public function getFirstToken(): ?Token {
    foreach ($this->getChildren() as $child) {
      return $child->getFirstToken();
    }
    return null;
  }

  public function getLastTokenx(): Token {
    return TypeAssert\not_null($this->getLastToken());
  }

  public function getLastToken(): ?Token {
    return C\last($this->getChildren())?->getLastToken();
  }

  final public function withFirstTokenLeading(
    ?NodeList<Trivia> $leading,
  ): this {
    return $this is Token
      ? $this->withLeading($leading)
      : $this->replaceDescendant(
          $this->getFirstTokenx(),
          $this->getFirstTokenx()->withLeading($leading),
        );
  }

  final public function withLastTokenTrailing(
    ?NodeList<Trivia> $trailing,
  ): this {
    return $this is Token
      ? $this->withTrailing($trailing)
      : $this->replaceDescendant(
          $this->getLastTokenx(),
          $this->getLastTokenx()->withTrailing($trailing),
        );
  }

  final public function rewriteDescendants<Tret as ?Node>(
    (function(Node, vec<Node>): Tret) $rewriter,
    vec<Node> $parents = vec[],
  ): this {
    return $this->rewriteChildren(
      ($c, $p) ==> $c->rewrite($rewriter, $p ?? vec[]),
      $parents,
    );
  }

  abstract public function rewriteChildren<Tret as ?Node>(
    (function(Node, vec<Node>): Tret) $rewriter,
    vec<Node> $parents = vec[],
  ): this;

  public function rewrite<Tret as ?Node>(
    (function(Node, vec<Node>): Tret) $rewriter,
    vec<Node> $parents = vec[],
  ): Tret {
    $with_rewritten_children = $this->rewriteDescendants($rewriter, $parents);
    return $rewriter($with_rewritten_children, $parents);
  }

  final public function getAncestorsOfDescendant(Node $node): vec<Node> {
    if ($node === $this) {
      return vec[$this];
    }

    invariant($this->isAncestorOf($node), 'Node is not a descendant');
    foreach ($this->getChildren() as $child) {
      if ($child === $node) {
        return vec[$this, $node];
      }
      if (!$child->isAncestorOf($node)) {
        continue;
      }
      return Vec\concat(vec[$this], $child->getAncestorsOfDescendant($node));
    }
    invariant_violation('unreachable');
  }

  final public function getClosestAncestorOfDescendantOfType<
    <<__Enforceable>> reify TAncestor as Node,
  >(
    Node $node,
  ): ?TAncestor {
    foreach (Vec\reverse($this->getAncestorsOfDescendant($node)) as $ancestor) {
      if ($ancestor is TAncestor) {
        return $ancestor;
      }
    }
    return null;
  }

  final public function getParentOfDescendant(Node $node): Node {
    invariant($node !== $this, 'Asked to find parent of self');
    invariant($this->isAncestorOf($node), 'Node is not a descendant');
    foreach ($this->getChildren() as $child) {
      if ($child === $node) {
        return $this;
      }
      if ($child->isAncestorOf($node)) {
        return $child->getParentOfDescendant($node);
      }
    }
    invariant_violation('unreachable');
  }

  final public function getFirstAncestorOfDescendantWhere(
    Node $node,
    (function(Node): bool) $predicate,
  ): ?Node {
    if ($predicate($this)) {
      return $this;
    }
    $children = $this->getChildren();
    while ($children) {
      $child = C\firstx($children);
      if ($child === $node) {
        return null;
      }
      if (!$child->isAncestorOf($node)) {
        $children = Vec\drop($children, 1);
        continue;
      }
      if ($predicate($child)) {
        return $child;
      }
      $children = $child->getChildren();
    }
    return null;
  }
}
