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
function prepend_statements(
  Script $root,
  vec<IStatement> $new,
  Node $before,
): Script {
  if (C\is_empty($new)) {
    return $root;
  }

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
  $old = $parent_block->getChildren();
  for ($before_idx = 0; $before_idx < C\count($old); ++$before_idx) {
    if ($old[$before_idx] === $ancestors[$i + 1]) {
      break;
    }
  }
  invariant(
    $before_idx < C\count($old),
    'Failed to find the provided statement in the parent block. This should '.
    'never happen.',
  );

  // Move leading trivia (both whitespace and comments) from the current
  // statement to the first statement being prepended -- i.e. we want to insert
  // the new statements _inbetween_ the current statement and its leading
  // trivia.
  $new[0] = $new[0]->replace(
    $new[0]->getFirstTokenx(),
    $new[0]->getFirstTokenx()
      ->withLeading($old[$before_idx]->getFirstTokenx()->getLeading()),
  );

  $old[$before_idx] = $old[$before_idx]->replace(
    $old[$before_idx]->getFirstTokenx(),
    $old[$before_idx]->getFirstTokenx()->withLeading(null),
  );

  // Put an autodetected (via whitespace_from_nodelist) amount of whitespace
  // between each pair of statements.
  $whitespace_between = whitespace_from_nodelist($parent_block);
  foreach ($new as $idx => $statement) {
    $new[$idx] = $statement->replace(
      $statement->getLastTokenx(),
      $statement->getLastTokenx()->withTrailing($whitespace_between),
    );
  }

  return $root->replace(
    $parent_block,
    NodeList::createMaybeEmptyList(
      Vec\concat(
        Vec\take($old, $before_idx),
        $new,
        Vec\drop($old, $before_idx),
      ),
    ),
  );
}
