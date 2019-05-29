/*
 *  Copyright (c) 2017-present, Facebook, Inc.
 *  All rights reserved.
 *
 *  This source code is licensed under the MIT license found in the
 *  LICENSE file in the root directory of this source tree.
 *
 */

namespace Facebook\HHAST;

use namespace HH\Lib\{Dict, Vec, C, Str};
use namespace Facebook\TypeAssert;

abstract class Node {
  abstract const string SYNTAX_KIND;
  const type TRewriter = (function(
    Node,
    ?vec<Node>,
  ): Node);

  protected dict<int, Node> $_descendants = dict[];
  protected ?int $_width;

  public function __construct(
    protected ?__Private\SourceRef $sourceRef,
  ) {
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
      if ($node instanceof $what) {
        $out[$k] = $node;
      }
    }
    return $out;
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

  public function isMissing(): bool {
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
    foreach ($this->getChildren() as $key => $node) {
      $s .= $node->getCode();
    }
    return $s;
  }

  public static function fromJSON(
    dict<string, mixed> $json,
    string $file,
    int $offset,
    string $source,
  ): Node {
    return __Private\node_from_json($json, $file, $offset, $source);
  }

  public function toVec(): vec<Node> {
    return vec[$this];
  }

  final public function getDescendantsOfType<T as Node>(
    classname<T> $what,
  ): vec<T> {
    $out = vec[];
    foreach ($this->_descendants as $node) {
      if ($node instanceof $what) {
        $out[] = $node;
      }
    }
    return $out;
  }

  public function removeWhere(
    (function(Node, ?vec<Node>): bool) $predicate,
  ): this {
    return $this->rewriteDescendants(
      ($node, $parents) ==>
        $predicate($node, $parents) ? Missing::getInstance() : $node,
    );
  }

  public function without(Node $target): this {
    return $this->replace($target, Missing::getInstance());
  }

  final public function replace(Node $old, Node $new): this {
    if ($old === $new) {
      return $this;
    }
    $old_id = $old->getUniqueID();
    if (!C\contains_key($this->_descendants, $old_id)) {
      return $this;
    }
    return $this->replaceImpl($old_id, $new);
  }

  protected function replaceImpl(
    int $old_id,
    Node $new,
  ): this {
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
      if (!$child->isMissing()) {
        return $child->getFirstToken();
      }
    }
    return null;
  }

  public function getLastTokenx(): Token {
    return TypeAssert\not_null($this->getLastToken());
  }

  public function getLastToken(): ?Token {
    foreach (Vec\reverse($this->getChildren()) as $child) {
      if (!$child->isMissing()) {
        return $child->getLastToken();
      }
    }
    return null;
  }

  public function insertBefore(
    Node $target,
    Node $new_node,
  ): this {
    // Inserting before missing is an error.
    if ($target->isMissing()) {
      throw new \Exception('Target must not be missing in insert_before.');
    }

    // Inserting missing is a no-op
    if ($new_node->isMissing()) {
      return $this;
    }

    if ($new_node->isTrivia() && !$target->isTrivia()) {
      $token = $target->getFirstToken();
      if ($token === null) {
        throw new \Exception('Unable to find token to insert trivia.');
      }
      $token = TypeAssert\instance_of(Token::class, $token);

      // Inserting trivia before token is inserting to the right end of
      // the leading trivia.
      $new_leading = NodeList::concat($token->getLeading(), $new_node);
      $new_token = $token->withLeading($new_leading);
      return $this->replace($token, $new_token);
    }

    return $this->replace($target, NodeList::concat($new_node, $target));
  }

  public function insertAfter(
    Node $target,
    Node $new_node,
  ): this {

    // Inserting after missing is an error.
    if ($target->isMissing()) {
      throw new \Exception('Target must not be missing in insert_after.');
    }

    // Inserting missing is a no-op
    if ($new_node->isMissing()) {
      return $this;
    }

    if ($new_node->isTrivia() && !$target->isTrivia()) {
      $token = $target->getLastToken();
      if ($token === null) {
        throw new \Exception('Unable to find token to insert trivia.');
      }

      $token = TypeAssert\instance_of(Token::class, $token);

      // Inserting trivia after token is inserting to the left end of
      // the trailing trivia.
      $new_trailing = NodeList::concat($new_node, $token->getTrailing());
      $new_token = $token->withTrailing($new_trailing);
      return $this->replace($token, $new_token);
    }

    return $this->replace($target, NodeList::concat($target, $new_node));
  }

  final public function rewriteDescendants(
    self::TRewriter $rewriter,
    vec<Node> $parents = vec[],
  ): this {
    return $this->rewriteChildren(
      ($c, $p) ==> $c->rewrite($rewriter, $p ?? vec[]),
      $parents,
    );
  }

  abstract public function rewriteChildren(
    self::TRewriter $rewriter,
    vec<Node> $parents = vec[],
  ): this;

  public function rewrite(
    self::TRewriter $rewriter,
    vec<Node> $parents = vec[],
  ): Node {
    $with_rewritten_children = $this->rewriteDescendants($rewriter, $parents);
    return $rewriter($with_rewritten_children, $parents);
  }

  final public function getAncestorsOfDescendant(
    Node $node,
  ): vec<Node> {
    if ($node === $this) {
      return vec[$this];
    }

    invariant($this->isAncestorOf($node), "Node is not a descendant");
    $stack = vec[$this];
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
