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

use namespace Facebook\TypeAssert;
use namespace HH\Lib\Vec;

abstract class EditableSyntax {
  const type TRewriter =
    (function(EditableSyntax, ?Traversable<EditableSyntax>): EditableSyntax);

  private string $_syntax_kind;
  protected ?int $_width;
  public function __construct(string $syntax_kind) {
    $this->_syntax_kind = $syntax_kind;
  }

  public function getSyntaxKind(): string {
    return $this->_syntax_kind;
  }

  public abstract function getChildren(
  ): KeyedTraversable<string, EditableSyntax>;

  final public function getChildrenOfType<T as EditableSyntax>(
    classname<T> $what,
  ): KeyedTraversable<string, T> {
    foreach ($this->getChildren() as $k => $node) {
      if ($node instanceof $what) {
        yield $k => $node;
      }
    }
  }

  public function preorder(): Traversable<EditableSyntax> {
    yield $this;
    foreach ($this->getChildren() as $child) {
      foreach ($child->preorder() as $descendant) {
        yield $descendant;
      }
    }
  }

  private function _parented_preorder(
    Traversable<EditableSyntax> $parents,
  ): Traversable<(EditableSyntax, Traversable<EditableSyntax>)> {
    $new_parents = vec($parents);
    $new_parents[] = $this;
    yield tuple($this, $parents);
    foreach ($this->getChildren() as $child) {
      foreach ($child->_parented_preorder($new_parents) as $descendant) {
        yield $descendant;
      }
    }
  }

  public function parented_preorder(
  ): Traversable<(EditableSyntax, Traversable<EditableSyntax>)> {
    return $this->_parented_preorder([]);
  }

  public function postorder(): Traversable<EditableSyntax> {
    foreach ($this->getChildren() as $child) {
      foreach ($child->preorder() as $descendant) {
        yield $descendant;
      }
    }
    yield $this;
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

  public function getCode(): string {
    /* TODO: Make an accumulation sequence operator */
    $s = '';
    foreach ($this->getChildren() as $node) {
      $s .= $node->getCode();
    }
    return $s;
  }

  public static function fromJSON(
    dict<string, mixed> $json,
    int $position,
    string $source,
  ): EditableSyntax {
    return __Private\editable_syntax_from_json($json, $position, $source);
  }

  public function toVec(): vec<EditableSyntax> {
    return vec[$this];
  }

  public function reduce<TAccumulator>(
    (function(
      EditableSyntax,
      TAccumulator,
      vec<EditableSyntax>,
    ): TAccumulator) $reducer,
    TAccumulator $accumulator,
    ?vec<EditableSyntax> $parents = null,
  ): TAccumulator {
    $new_parents = vec($parents ?? vec[]);
    $new_parents[] =$this;
    foreach ($this->getChildren() as $child) {
      $accumulator = $child->reduce($reducer, $accumulator, $new_parents);
    }
    return $reducer($this, $accumulator, $parents ?? vec[]);
  }

  // Returns all the parents (and the node itself) of the first node
  // that matches a predicate, or [] if there is no such node.
  public function find_with_parents(
    (function(EditableSyntax): bool) $predicate,
    ?Traversable<EditableSyntax> $parents = null,
  ): vec<EditableSyntax> {
    $parents = $parents === null ? vec[] : vec($parents);
    $new_parents = $parents;
    $new_parents[] = $this;
    if ($predicate($this)) {
      return $new_parents;
    }
    foreach ($this->getChildren() as $child) {
      $result = $child->find_with_parents($predicate, $new_parents);
      if (count($result) != 0) {
        return $result;
      }
    }
    return vec[];
  }

  // Returns a list of nodes that match a predicate.
  public function filter(
    (function(EditableSyntax, ?vec<EditableSyntax>): bool) $predicate,
  ): vec<EditableSyntax> {
    $reducer = ($node, $acc, $parents) ==> {
      if ($predicate($node, $parents)) {
        $acc[] = $node;
      }
      return $acc;
    };
    return $this->reduce($reducer, vec[]);
  }

  public function getDescendantsOfType<T as EditableSyntax>(
    classname<T> $what,
  ): Traversable<T> {
    foreach ($this->preorder() as $child) {
      if ($child instanceof $what) {
        yield $child;
      }
    }
    yield break;
  }

  public function remove_where(
    (function(EditableSyntax, ?Traversable<EditableSyntax>): bool) $predicate,
  ): EditableSyntax {
    return $this->rewrite(
      ($node, $parents) ==>
        $predicate($node, $parents) ? Missing::getInstance() : $node,
    );
  }

  public function without(EditableSyntax $target): EditableSyntax {
    return $this->remove_where(($node, $parents) ==> $node === $target);
  }

  public function replace(
    EditableSyntax $new_node,
    EditableSyntax $target,
  ): this {
    return $this->rewriteDescendants(
      ($node, $parents) ==> $node === $target ? $new_node : $node,
    );
  }

  public function getFirstTokenx(): EditableToken {
    return TypeAssert\not_null($this->getFirstToken());
  }

  public function getFirstToken(): ?EditableToken {
    foreach ($this->getChildren() as $child) {
      if (!$child->isMissing()) {
        return $child->getFirstToken();
      }
    }
    return null;
  }

  public function getLastTokenx(): EditableToken {
    return TypeAssert\not_null($this->getLastToken());
  }

  public function getLastToken(): ?EditableToken {
    foreach (Vec\reverse($this->getChildren()) as $child) {
      if (!$child->isMissing()) {
        return $child->getLastToken();
      }
    }
    return null;
  }

  public function insert_before(
    EditableSyntax $new_node,
    EditableSyntax $target,
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
      $token = TypeAssert\instance_of(EditableToken::class, $token);

      // Inserting trivia before token is inserting to the right end of
      // the leading trivia.
      $new_leading =
        EditableList::concatenate_lists($token->getLeading(), $new_node);
      $new_token = $token->withLeading($new_leading);
      return $this->replace($new_token, $token);
    }

    return $this->replace(
      EditableList::concatenate_lists($new_node, $target),
      $target,
    );
  }

  public function insert_after(
    EditableSyntax $new_node,
    EditableSyntax $target,
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

      $token = TypeAssert\instance_of(EditableToken::class, $token);

      // Inserting trivia after token is inserting to the left end of
      // the trailing trivia.
      $new_trailing =
        EditableList::concatenate_lists($new_node, $token->getTrailing());
      $new_token = $token->withTrailing($new_trailing);
      return $this->replace($new_token, $token);
    }

    return $this->replace(
      EditableList::concatenate_lists($target, $new_node),
      $target,
    );
  }

  abstract public function rewriteDescendants(
    self::TRewriter $rewriter,
    ?Traversable<EditableSyntax> $parents = null,
  ): this ;

  public function rewrite(
    self::TRewriter $rewriter,
    ?Traversable<EditableSyntax> $parents = null,
  ): EditableSyntax {
    $parents = $parents === null ? vec[] : vec($parents);
    $with_rewritten_children = $this->rewriteDescendants(
      $rewriter,
      $parents,
    );
    return $rewriter($with_rewritten_children, $parents);
  }
}
