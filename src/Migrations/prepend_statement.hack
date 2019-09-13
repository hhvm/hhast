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
use function Facebook\HHAST\__Private\whitespace_from_nodelist;

/**
 * Adds the provided statement to the closest reasonable position _before_ the
 * specified node. For example, if the `$before` node is part of a larger
 * statement, the provided `$statement` will not be added directly before the
 * node, but it will be added before the whole larger statement.
 *
 * Tries to make the formatting consistent with the rest of the block into which
 * the statement is inserted.
 */
function prepend_statement(
  Script $root,
  IStatement $new_statement,
  Node $before,
): Script {
  // Find the closest parent block.
  $ancestors = $root->getAncestorsOfDescendant($before);
  for ($i = C\count($ancestors) - 1; $i >= 0; --$i) {
    if ($ancestors[$i] is IStatement) {
      break;
    }
  }
  for (--$i; $i >= 0; --$i) {
    if ($ancestors[$i] is NodeList<_>) {
      break;
    }
  }
  invariant(
    $i >= 0,
    'Failed to find any parent NodeList of any parent Statement.',
  );

  $parent_block = $ancestors[$i] as NodeList<_>;
  $statements = $parent_block->getChildren();
  for ($cur_idx = 0; $cur_idx < C\count($statements); ++$cur_idx) {
    if ($statements[$cur_idx] === $ancestors[$i + 1]) {
      break;
    }
  }
  invariant(
    $cur_idx < C\count($statements),
    'Failed to find the current statement in the parent block. This should '.
    'never happen.',
  );

  // Move leading trivia (both whitespace and comments) from the current
  // statement to the statement being prepended -- i.e. we want to insert the
  // new statement _inbetween_ the current statement and its leading trivia.
  $new_statement = $new_statement->replace(
    $new_statement->getFirstTokenx(),
    $new_statement->getFirstTokenx()
      ->withLeading($statements[$cur_idx]->getFirstTokenx()->getLeading()),
  );

  $statements[$cur_idx] = $statements[$cur_idx]->replace(
    $statements[$cur_idx]->getFirstTokenx(),
    $statements[$cur_idx]->getFirstTokenx()->withLeading(null),
  );

  // Put an autodetected (via whitespace_from_nodelist) amount of whitespace
  // between the current statement and the prepended one.
  $new_statement = $new_statement->replace(
    $new_statement->getLastTokenx(),
    $new_statement->getLastTokenx()
      ->withTrailing(whitespace_from_nodelist($root, $parent_block)['between']),
  );

  return $root->replace(
    $parent_block,
    NodeList::createMaybeEmptyList(
      Vec\concat(
        Vec\take($statements, $cur_idx),
        vec[$new_statement],
        Vec\drop($statements, $cur_idx),
      ),
    ),
  );
}
