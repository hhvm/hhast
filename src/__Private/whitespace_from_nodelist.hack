/*
 *  Copyright (c) 2017-present, Facebook, Inc.
 *  All rights reserved.
 *
 *  This source code is licensed under the MIT license found in the
 *  LICENSE file in the root directory of this source tree.
 *
 */

namespace Facebook\HHAST\__Private;

use namespace HH\Lib\{C, Vec};
use type Facebook\HHAST\{EndOfLine, Node, NodeList, Trivia, WhiteSpace};

/**
 * Analyzes the whitespace in the provided NodeList and returns the list of
 * whitespace Trivia that should be used when adding items to the list. Using
 * the returned values for new list items should make their formatting (e.g.
 * indentation) consistent with the rest of the list, although this can't be
 * guaranteed, especially if the original list is not formatted consistently.
 *
 * To preserve formatting, we'll copy whitespace from around the last item. The
 * choice of the last item is somewhat arbitrary, but since appending to the end
 * of a list is likely most common, it's probably the best option. If the list
 * is formatted consistently, the choice shouldn't matter anyway.
 */
function whitespace_from_nodelist(NodeList<Node> $list): NodeList<Trivia> {
  if ($list->isEmpty()) {
    // Nothing to analyze, single space should be a reasonable default.
    return NodeList::createMaybeEmptyList(vec[new WhiteSpace(' ')]);
  }

  // If there is an EndOfLine between the last and second-to-last item, we take
  // the last EndOfLine + any whitespace immediately after it (i.e. we exactly
  // preserve the current indentation). If there is no EndOfLine, we take
  // whitespace from immediately after the previous item. In both cases, we stop
  // when we hit the first non-whitespace trivium (e.g. a comment).
  $last_child = C\lastx($list->getChildren());
  $previous_child = $list->getCount() === 1
    ? $last_child // technically incorrect but should provide good enough result
    : $list->getChildren()[$list->getCount() - 2];
  $trivia = Vec\concat(
    $previous_child->getLastTokenx()->getTrailing()->getChildren(),
    $last_child->getFirstTokenx()->getLeading()->getChildren(),
  );
  if (!C\is_empty($trivia)) {
    for ($start_idx = C\count($trivia) - 1; $start_idx > 0; --$start_idx) {
      if ($trivia[$start_idx] is EndOfLine) {
        break;
      }
    }
    $trivia = Vec\drop($trivia, $start_idx);
  }
  for ($take_cnt = 0; $take_cnt < C\count($trivia); ++$take_cnt) {
    if (!$trivia[$take_cnt] is WhiteSpace && !$trivia[$take_cnt] is EndOfLine) {
      break;
    }
  }
  $ret = NodeList::createMaybeEmptyList(Vec\take($trivia, $take_cnt));

  // Special case for a single-line single-item list: If no other whitespace was
  // detected, we arbitrarily choose one space.
  if ($list->getCount() === 1 && $ret->isEmpty()) {
    $ret = NodeList::createMaybeEmptyList(vec[new WhiteSpace(' ')]);
  }
  return $ret;
}
