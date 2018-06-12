<?hh // strict
/*
 *  Copyright (c) 2017-present, Facebook, Inc.
 *  All rights reserved.
 *
 *  This source code is licensed under the MIT license found in the
 *  LICENSE file in the root directory of this source tree.
 *
 */

namespace Facebook\HHAST\Linters\SuppressASTLinter;

use type Facebook\HHAST\{
  BreakStatement,
  ContinueStatement,
  EchoStatement,
  EditableNode,
  EditableToken,
  GotoStatement,
  IControlFlowStatement,
  ReturnStatement,
  ThrowStatement,
  TryStatement,
  UnsetStatement
};
use type Facebook\HHAST\Linters\{
  BaseLinter,
  LintError,
};

use namespace Facebook\HHAST;
use namespace HH\Lib\{C, Str, Vec};

/**
 * Allow users to suppress specific cases where a linter is used.
 **/
function is_linter_error_suppressed(
  BaseLinter $linter,
  EditableNode $node,
  vec<EditableNode> $parents,
  LintError $error,
): bool {
  $token = $node->getFirstToken();
  $fixme = $linter->getFixmeMarker();
  $ignore = $linter->getIgnoreSingleErrorMarker();

  return is_linter_suppressed_in_current_node($token, $fixme, $ignore) ||
    is_linter_suppressed_in_sibling_node($parents, $fixme, $ignore) ||
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
  vec<EditableNode> $parents,
  string $fixme,
  string $ignore,
): bool {
  $parent = C\last($parents);
  if ($parent === null) {
    return false;
  }

  $sibling = C\first($parent->getChildren());
  if ($sibling === null) {
    return false;
  }

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
  $parents = Vec\reverse($parents);

  foreach ($parents as $parent) {
    if (
      $parent instanceof IControlFlowStatement ||
      $parent instanceof BreakStatement ||
      $parent instanceof ContinueStatement ||
      $parent instanceof EchoStatement ||
      $parent instanceof GotoStatement ||
      $parent instanceof ReturnStatement ||
      $parent instanceof ThrowStatement ||
      $parent instanceof TryStatement ||
      $parent instanceof UnsetStatement
    ) {
      return false;
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
