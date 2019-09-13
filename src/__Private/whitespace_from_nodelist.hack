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
use type Facebook\HHAST\{EndOfLine, Node, NodeList, Script, Trivia, WhiteSpace};

/**
 * Analyzes the whitespace in the provided NodeList and returns sets of
 * whitespace Trivia that should be used when adding items to the list. Using
 * the returned values for new list items should make their formatting (e.g.
 * indentation) consistent with the rest of the list, although this can't be
 * guaranteed, especially if the original list is not formatted consistently.
 */
function whitespace_from_nodelist(
  Script $root,
  NodeList<Node> $list,
): shape('between' => NodeList<Trivia>, 'after_last' => NodeList<Trivia>) {
  invariant(
    !$list->isEmpty(),
    'Cannot analyze whitespace inside an empty list.',
  );

  // To preserve formatting, we'll copy whitespace from around the last item.
  // The choice of the last item is somewhat arbitrary, but since appending to
  // the end of a list is likely most common, it's probably the best option. If
  // the list is formatted consistently, the choice shouldn't matter anyway.
  $ret = shape();

  // Whitespace between items: If there is an EndOfLine, we take the last
  // EndOfLine + any whitespace immediately after it (i.e. we exactly preserve
  // the current indentation). If there is no EndOfLine, we take whitespace from
  // immediately after the previous item. In both cases, we stop when we hit the
  // first non-whitespace trivium (e.g. a comment).
  $token = C\lastx($list->getChildren())->getFirstTokenx();
  $trivia = Vec\concat(
    ($root->getPreviousToken($token) as nonnull)->getTrailing()->getChildren(),
    $token->getLeading()->getChildren(),
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
  $ret['between'] =
    NodeList::createMaybeEmptyList(Vec\take($trivia, $take_cnt));

  // Special case for a single-line single-item list: If no other whitespace was
  // detected, we arbitrarily choose one space.
  if ($list->getCount() === 1 && $ret['between']->isEmpty()) {
    $ret['between'] = NodeList::createMaybeEmptyList(vec[new WhiteSpace(' ')]);
  }

  // Whitespace after the last item: We take any whitespace that immediately
  // preceeds the function call's closing paren. Note that this is NOT the same
  // as taking whitespace following the last item, because there might be
  // non-whitespace trivia (comments) inbetween.
  $token = C\lastx($list->getChildren())->getLastTokenx();
  $trivia = Vec\concat(
    $token->getTrailing()->getChildren(),
    ($root->getNextToken($token) as nonnull)->getLeading()->getChildren(),
  );
  for ($start_idx = C\count($trivia); $start_idx > 0; --$start_idx) {
    if (
      !$trivia[$start_idx - 1] is WhiteSpace &&
      !$trivia[$start_idx - 1] is EndOfLine
    ) {
      break;
    }
  }
  $ret['after_last'] =
    NodeList::createMaybeEmptyList(Vec\drop($trivia, $start_idx));

  return $ret;
}
