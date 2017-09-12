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
use namespace HH\Lib\Vec;

abstract class EditableSyntax {
  const type TRewriter =
    (function(EditableSyntax, ?Traversable<EditableSyntax>): EditableSyntax);

  private string $_syntax_kind;
  protected ?int $_width;
  public function __construct(string $syntax_kind) {
    $this->_syntax_kind = $syntax_kind;
  }

  public function syntax_kind(): string {
    return $this->_syntax_kind;
  }

  public abstract function children(): KeyedTraversable<string, EditableSyntax>;

  public function preorder(): Traversable<EditableSyntax> {
    yield $this;
    foreach ($this->children() as $child)
      foreach ($child->preorder() as $descendant)
        yield $descendant;
  }

  private function _parented_preorder(
    Traversable<EditableSyntax> $parents,
  ): Traversable<(EditableSyntax, Traversable<EditableSyntax>)> {
    $new_parents = $parents;
    array_push($new_parents, $this);
    yield tuple($this, $parents);
    foreach ($this->children() as $child)
      foreach ($child->_parented_preorder($new_parents) as $descendant)
        yield $descendant;
  }

  public function parented_preorder(
  ): Traversable<(EditableSyntax, Traversable<EditableSyntax>)> {
    return $this->_parented_preorder([]);
  }

  public function postorder(): Traversable<EditableSyntax> {
    foreach ($this->children() as $child)
      foreach ($child->preorder() as $descendant)
        yield $descendant;
    yield $this;
  }

  public function is_token(): bool {
    return false;
  }

  public function is_trivia(): bool {
    return false;
  }

  public function is_list(): bool {
    return false;
  }

  public function is_missing(): bool {
    return false;
  }

  public function width(): int {
    if ($this->_width === null) {
      $width = 0;
      /* TODO: Make an accumulation sequence operator */
      foreach ($this->children() as $node) {
        $width += $node->width();
      }
      $this->_width = $width;
      return $width;
    } else {
      return $this->_width;
    }
  }

  public function full_text(): string {
    /* TODO: Make an accumulation sequence operator */
    $s = '';
    foreach ($this->children() as $node) {
      $s .= $node->full_text();
    }
    return $s;
  }

  public static function from_json(
    array<string, mixed> $json,
    int $position,
    string $source,
  ): EditableSyntax {
    return __Private\editable_syntax_from_json($json, $position, $source);
  }

  public function to_vec(): vec<EditableSyntax> {
    return vec[$this];
  }

  public function reduce<TAccumulator>(
    (function(
      EditableSyntax,
      TAccumulator,
      array<EditableSyntax>,
    ): TAccumulator) $reducer,
    TAccumulator $accumulator,
    ?array<EditableSyntax> $parents = null,
  ): TAccumulator {
    $new_parents = $parents ?? [];
    array_push($new_parents, $this);
    foreach ($this->children() as $child) {
      $accumulator = $child->reduce($reducer, $accumulator, $new_parents);
    }
    return $reducer($this, $accumulator, $parents ?? []);
  }

  // Returns all the parents (and the node itself) of the first node
  // that matches a predicate, or [] if there is no such node.
  public function find_with_parents(
    (function(EditableSyntax): bool) $predicate,
    ?array<EditableSyntax> $parents = null,
  ): array<EditableSyntax> {
    $new_parents = $parents ?? [];
    array_push($new_parents, $this);
    if ($predicate($this))
      return $new_parents;
    foreach ($this->children() as $child) {
      $result = $child->find_with_parents($predicate, $new_parents);
      if (count($result) != 0)
        return $result;
    }
    return [];
  }

  // Returns a list of nodes that match a predicate.
  public function filter(
    (function(EditableSyntax, ?array<EditableSyntax>): bool) $predicate,
  ): array<EditableSyntax> {
    $reducer = ($node, $acc, $parents) ==> {
      if ($predicate($node, $parents))
        array_push($acc, $node);
      return $acc;
    };
    return $this->reduce($reducer, []);
  }

  public function of_syntax_kind(string $kind): Traversable<EditableSyntax> {
    foreach ($this->preorder() as $child)
      if ($child->syntax_kind() === $kind)
        yield $child;
  }

  public function of_class<T as EditableSyntax>(
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
    return $this->rewrite_children(
      ($node, $parents) ==> $node === $target ? $new_node : $node,
    );
  }

  public function getFirstTokenx(): EditableToken {
    return TypeAssert::isNotNull($this->getFirstToken());
  }

  public function getFirstToken(): ?EditableToken {
    if ($this instanceof EditableToken) {
      return $this;
    }

    foreach ($this->children() as $child) {
      if (!$child->is_missing())
        return $child->getFirstToken();
    }
    return null;
  }

  public function getLastTokenx(): EditableToken {
    return TypeAssert::isNotNull($this->getLastToken());
  }

  public function getLastToken(): ?EditableToken {
    if ($this instanceof EditableToken) {
      return $this;
    }

    foreach (Vec\reverse($this->children()) as $child) {
      if (!$child->is_missing()) {
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
    if ($target->is_missing())
      throw new \Exception('Target must not be missing in insert_before.');

    // Inserting missing is a no-op
    if ($new_node->is_missing())
      return $this;

    if ($new_node->is_trivia() && !$target->is_trivia()) {
      $token = $target->is_token() ? $target : $target->getFirstToken();
      if ($token === null)
        throw new \Exception('Unable to find token to insert trivia.');
      $token = TypeAssert::isInstanceOf(EditableToken::class, $token);

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
    if ($target->is_missing())
      throw new \Exception('Target must not be missing in insert_after.');

    // Inserting missing is a no-op
    if ($new_node->is_missing())
      return $this;

    if ($new_node->is_trivia() && !$target->is_trivia()) {
      $token = $target->is_token() ? $target : $target->getLastToken();
      if ($token === null)
        throw new \Exception('Unable to find token to insert trivia.');

      $token = TypeAssert::isInstanceOf(EditableToken::class, $token);

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

  abstract public function rewrite_children(
    self::TRewriter $rewriter,
    ?Traversable<EditableSyntax> $parents = null,
  ): this ;

  public function rewrite(
    self::TRewriter $rewriter,
    ?Traversable<EditableSyntax> $parents = null,
  ): EditableSyntax {
    $parents = $parents === null ? vec[] : vec($parents);
    $with_rewritten_children = $this->rewrite_children(
      $rewriter,
      $parents,
    );
    return $rewriter($with_rewritten_children, $parents);
  }
}
