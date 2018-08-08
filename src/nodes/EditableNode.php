<?hh // strict
/*
 *  Copyright (c) 2017-present, Facebook, Inc.
 *  All rights reserved.
 *
 *  This source code is licensed under the MIT license found in the
 *  LICENSE file in the root directory of this source tree.
 *
 */

namespace Facebook\HHAST;

use namespace HH\Lib\{Dict, Vec, C};
use namespace Facebook\TypeAssert;

abstract class EditableNode {
  const type TRewriter =
    (function(EditableNode, ?vec<EditableNode>): EditableNode);

  private string $_syntax_kind;
  protected ?int $_width;
  public function __construct(string $syntax_kind) {
    $this->_syntax_kind = $syntax_kind;
  }

  public function getSyntaxKind(): string {
    return $this->_syntax_kind;
  }

  public abstract function getChildren(
  ): dict<string, EditableNode>;

  public function getChildrenWhere(
    (function(EditableNode):bool) $filter,
  ): dict<string, EditableNode> {
    return Dict\filter(
      $this->getChildren(),
      $child ==> $filter($child),
    );
  }

  final public function getChildrenOfType<T as EditableNode>(
    classname<T> $what,
  ): dict<string, T> {
    $out = dict[];
    foreach ($this->getChildren() as $k => $node) {
      if ($node instanceof $what) {
        $out[$k] = $node;
      }
    }
    return $out;
  }

  public function traverse(): vec<EditableNode> {
    $out = vec[$this];
    foreach ($this->getChildren() as $child) {
      foreach ($child->traverse() as $descendant) {
        $out[] = $descendant;
      }
    }
    return $out;
  }

  private function traverseImpl(
    vec<EditableNode> $parents,
  ): vec<(EditableNode, vec<EditableNode>)> {
    $new_parents = vec($parents);
    $new_parents[] = $this;
    $out = vec[tuple($this, $parents)];
    foreach ($this->getChildren() as $child) {
      foreach ($child->traverseImpl($new_parents) as list($child, $child_parents)) {
        $out[] = tuple($child, $child_parents);
      }
    }
    return $out;
  }

  public function traverseWithParents(
  ): vec<(EditableNode, vec<EditableNode>)> {
    return $this->traverseImpl(vec[]);
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
    string $file,
    int $offset,
    string $source,
  ): EditableNode {
    return __Private\editable_node_from_json($json, $file, $offset, $source);
  }

  public function toVec(): vec<EditableNode> {
    return vec[$this];
  }

  // Returns all the parents (and the node itself) of the first node
  // that matches a predicate, or [] if there is no such node.
  public function findWithParents(
    (function(EditableNode): bool) $predicate,
    ?vec<EditableNode> $parents = null,
  ): vec<EditableNode> {
    $parents = $parents === null ? vec[] : vec($parents);
    $new_parents = $parents;
    $new_parents[] = $this;
    if ($predicate($this)) {
      return $new_parents;
    }
    foreach ($this->getChildren() as $child) {
      $result = $child->findWithParents($predicate, $new_parents);
      if (C\count($result) !== 0) {
        return $result;
      }
    }
    return vec[];
  }

  public function getDescendantsWhere(
    (function(EditableNode, vec<EditableNode>):bool) $filter,
  ): vec<EditableNode> {
    $out = vec[];
    foreach ($this->traverseWithParents() as list($node, $parents)) {
      if ($filter($node, $parents)) {
        $out[] = $node;
      }
    }
    return $out;
  }

  public function getDescendantsOfType<T as EditableNode>(
    classname<T> $what,
  ): vec<T> {
    $out = vec[];
    foreach ($this->traverse() as $child) {
      if ($child instanceof $what) {
        $out[] = $child;
      }
    }
    return $out;
  }

  public function removeWhere(
    (function(EditableNode, ?vec<EditableNode>): bool) $predicate,
  ): EditableNode {
    return $this->rewrite(
      ($node, $parents) ==>
        $predicate($node, $parents) ? Missing::getInstance() : $node,
    );
  }

  public function without(EditableNode $target): EditableNode {
    return $this->removeWhere(($node, $parents) ==> $node === $target);
  }

  public function replace(
    EditableNode $target,
    EditableNode $new_node,
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

  public function insertBefore(
    EditableNode $target,
    EditableNode $new_node,
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
        EditableList::concat($token->getLeading(), $new_node);
      $new_token = $token->withLeading($new_leading);
      return $this->replace($token, $new_token);
    }

    return $this->replace(
      $target,
      EditableList::concat($new_node, $target),
    );
  }

  public function insertAfter(
    EditableNode $target,
    EditableNode $new_node,
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
        EditableList::concat($new_node, $token->getTrailing());
      $new_token = $token->withTrailing($new_trailing);
      return $this->replace($token, $new_token);
    }

    return $this->replace(
      $target,
      EditableList::concat($target, $new_node),
    );
  }

  abstract public function rewriteDescendants(
    self::TRewriter $rewriter,
    ?vec<EditableNode> $parents = null,
  ): this;

  public function rewrite(
    self::TRewriter $rewriter,
    ?vec<EditableNode> $parents = null,
  ): EditableNode {
    $parents = $parents === null ? vec[] : vec($parents);
    $with_rewritten_children = $this->rewriteDescendants(
      $rewriter,
      $parents,
    );
    return $rewriter($with_rewritten_children, $parents);
  }
}
