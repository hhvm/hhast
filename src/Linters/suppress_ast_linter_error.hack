/*
 *  Copyright (c) 2017-present, Facebook, Inc.
 *  All rights reserved.
 *
 *  This source code is licensed under the MIT license found in the
 *  LICENSE file in the root directory of this source tree.
 *
 */

namespace Facebook\HHAST\Linters\SuppressASTLinter;

use type Facebook\HHAST\{EditableNode, EditableToken, IStatement};

use type Facebook\HHAST\Linters\{BaseLinter, LintError};

use namespace HH\Lib\{C, Str, Vec};

/**
 * Allow users to suppress specific cases where a linter is used.
 **/
function is_linter_error_suppressed(
  BaseLinter $linter,
  EditableNode $node,
  (function(): vec<EditableNode>) $parents,
  LintError $_error,
): bool {
  $token = $node->getFirstToken();
  $fixme = $linter->getFixmeMarker();
  $ignore = $linter->getIgnoreSingleErrorMarker();

  if (is_linter_suppressed_in_current_node($token, $fixme, $ignore)) {
    return true;
  }


  $parents = $parents();
  return is_linter_suppressed_in_sibling_node(
    $node,
    $parents,
    $fixme,
    $ignore,
  ) ||
    is_linter_suppressed_up_to_statement($parents, $fixme, $ignore);
}

// Check the current token's leading trivia. For example a comment on the line before
function is_linter_suppressed_in_current_node(
  ?EditableToken $token,
  string $fixme,
  string $ignore,
): bool {
  if ($token === null) {
    return false;
  }

  $leading = $token->getLeading()->getCode();
  return Str\contains($leading, $fixme) || Str\contains($leading, $ignore);
}

// Check sibling node as the comment might be attached there instead of on the current node
function is_linter_suppressed_in_sibling_node(
  EditableNode $node,
  vec<EditableNode> $parents,
  string $fixme,
  string $ignore,
): bool {
  $count = C\count($parents);
  if ($count === 1) {
    return false;
  }
  $parent = $parents[$count - 2];
  $siblings = vec($parent->getChildren());
  $idx = C\find_key($siblings, $x ==> $x === $node) as nonnull;
  if ($idx === 0) {
    return false;
  }
  $sibling = $siblings[$idx - 1];

  $token = $sibling->getLastToken();
  if ($token !== null) {
    $trailing = $token->getTrailing()->getCode();
    if (Str\contains($trailing, $fixme) || Str\contains($trailing, $ignore)) {
      return true;
    }

    $leading = $token->getLeading()->getCode();
    if (Str\contains($leading, $fixme) || Str\contains($leading, $ignore)) {
      return true;
    }
  }

  return false;
}

// Walk up the parents and check the leading trivia until we hit a Statement type node.
function is_linter_suppressed_up_to_statement(
  vec<EditableNode> $parents,
  string $fixme,
  string $ignore,
): bool {
  for ($idx = C\count($parents) - 1; $idx >= 0; --$idx) {
    $parent = $parents[$idx];
    if ($parent instanceof IStatement) {
      return is_linter_suppressed_in_current_node(
        $parent->getFirstToken(),
        $fixme,
        $ignore,
      ) ||
        is_linter_suppressed_in_sibling_node(
          $parent,
          Vec\take($parents, $idx + 1),
          $fixme,
          $ignore,
        );
    }

    $token = $parent->getFirstToken();
    if ($token !== null) {
      $leading = $token->getCode();
      if (Str\contains($leading, $fixme) || Str\contains($leading, $ignore)) {
        return true;
      }
    }
  }

  return false;
}
