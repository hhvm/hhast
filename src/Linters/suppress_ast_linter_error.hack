/*
 *  Copyright (c) 2017-present, Facebook, Inc.
 *  All rights reserved.
 *
 *  This source code is licensed under the MIT license found in the
 *  LICENSE file in the root directory of this source tree.
 *
 */

namespace Facebook\HHAST\SuppressASTLinter;

use type Facebook\HHAST\{BaseLinter, IStatement, Node, Script};

use namespace HH\Lib\{C, Str, Vec};

/**
 * Allow users to suppress specific cases where a linter is used.
 **/
function is_linter_error_suppressed(
  BaseLinter $linter,
  Node $node,
  Script $root,
): bool {
  $fixme = $linter->getFixmeMarker();
  $ignore = $linter->getIgnoreSingleErrorMarker();

  if (is_linter_suppressed_in_current_node($node, $fixme, $ignore)) {
    return true;
  }

  return is_linter_suppressed_in_sibling_node($node, $root, $fixme, $ignore) ||
    is_linter_suppressed_up_to_statement($node, $root, $fixme, $ignore);
}

// Check the current token's leading trivia. For example a comment on the line before
function is_linter_suppressed_in_current_node(
  Node $node,
  string $fixme,
  string $ignore,
): bool {
  $token = $node->getFirstToken();
  if ($token === null) {
    return false;
  }

  $leading = $token->getLeading()->getCode();
  return Str\contains($leading, $fixme) || Str\contains($leading, $ignore);
}

// Check sibling node as the comment might be attached there instead of on the current node
function is_linter_suppressed_in_sibling_node(
  Node $node,
  Script $root,
  string $fixme,
  string $ignore,
): bool {
  $token = $root->getPreviousToken($node->getFirstTokenx());
  if ($token === null) {
    return false;
  }
  $trailing = $token->getTrailing()->getCode();
  return Str\contains($trailing, $fixme) || Str\contains($trailing, $ignore);
}

// Walk up the parents and check the leading trivia until we hit a Statement type node.
function is_linter_suppressed_up_to_statement(
  Node $node,
  Script $root,
  string $fixme,
  string $ignore,
): bool {
  if ($node is IStatement) {
    return false;
  }
  $children = $root->getChildren();
  $statement = null;
  while ($children) {
    $child = C\firstx($children);
    if ($child === $node) {
      break;
    }
    if (!$child->isAncestorOf($node)) {
      $children = Vec\drop($children, 1);
      continue;
    }
    $children = $child->getChildren();
    if ($child is IStatement) {
      $statement = $child;
    }
  }
  if ($statement === null) {
    return false;
  }
  return is_linter_suppressed_in_current_node($statement, $fixme, $ignore) ||
    is_linter_suppressed_in_sibling_node($statement, $root, $fixme, $ignore);
}
