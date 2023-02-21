/*
 *  Copyright (c) 2017-present, Facebook, Inc.
 *  All rights reserved.
 *
 *  This source code is licensed under the MIT license found in the
 *  LICENSE file in the root directory of this source tree.
 *
 */

namespace Facebook\HHAST\SuppressASTLinter;

use type Facebook\HHAST\{IStatement, Node, Script, SingleRuleLinter, Token};

use namespace HH\Lib\{C, Str, Vec};

/**
 * Allow users to suppress specific cases where a linter is used.
 **/
function is_linter_error_suppressed(
  SingleRuleLinter $linter,
  Node $node,
  Script $root,
): bool {
  return linter_error_suppression_token($linter, $node, $root) is nonnull;
}

// Check the current token's leading trivia. For example a comment on the line before
function is_linter_suppressed_in_current_node(
  Node $node,
  string $fixme,
  string $ignore,
): bool {
  return linter_suppression_token_in_current_node($node, $fixme, $ignore) is nonnull;
}

// Check sibling node as the comment might be attached there instead of on the current node
function is_linter_suppressed_in_sibling_node(
  Node $node,
  Script $root,
  string $fixme,
  string $ignore,
): bool {
  return linter_suppression_token_in_sibling_node(
    $node,
    $root,
    $fixme,
    $ignore,
  ) is nonnull;
}

// Walk up the parents and check the leading trivia until we hit a Statement type node.
function is_linter_suppressed_up_to_statement(
  Node $node,
  Script $root,
  string $fixme,
  string $ignore,
): bool {
  return linter_suppression_token_up_to_statement(
    $node,
    $root,
    $fixme,
    $ignore,
  ) is nonnull;
}

function linter_error_suppression_token(
  SingleRuleLinter $linter,
  Node $node,
  Script $root,
): ?Token {
  $fixme = $linter->getFixmeMarker();
  $ignore = $linter->getIgnoreSingleErrorMarker();

  return linter_suppression_token_in_current_node($node, $fixme, $ignore) ??
    linter_suppression_token_in_sibling_node($node, $root, $fixme, $ignore) ??
    linter_suppression_token_up_to_statement($node, $root, $fixme, $ignore);
}

// Check the current token's leading trivia. For example a comment on the line before
function linter_suppression_token_in_current_node(
  Node $node,
  string $fixme,
  string $ignore,
): ?Token {
  $token = $node->getFirstToken();
  if ($token === null) {
    return null;
  }

  $leading = $token->getLeading()->getCode();
  return Str\contains($leading, $fixme) || Str\contains($leading, $ignore)
    ? $token
    : null;
}

// Check sibling node as the comment might be attached there instead of on the current node
function linter_suppression_token_in_sibling_node(
  Node $node,
  Script $root,
  string $fixme,
  string $ignore,
): ?Token {
  $first_token = $node->getFirstToken();
  if ($first_token is null) {
    return null;
  }
  $token = $root->getPreviousToken($first_token);
  if ($token === null) {
    return null;
  }
  $trailing = $token->getTrailing()->getCode();
  return Str\contains($trailing, $fixme) || Str\contains($trailing, $ignore)
    ? $token
    : null;
}

// Walk up the parents and check the leading trivia until we hit a Statement type node.
function linter_suppression_token_up_to_statement(
  Node $node,
  Script $root,
  string $fixme,
  string $ignore,
): ?Token {
  if ($node is IStatement) {
    return null;
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
    return null;
  }

  return linter_suppression_token_in_current_node($statement, $fixme, $ignore) ??
    linter_suppression_token_in_sibling_node($statement, $root, $fixme, $ignore);
}
