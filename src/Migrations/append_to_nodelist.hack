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
 * Returns a copy of the provided NodeList with the provided items added at the
 * end, preserving whitespace before/after items as much as possible.
 */
function append_to_nodelist<T as Node>(
  NodeList<ListItem<T>> $list,
  vec<T> $items_to_add,
  ?classname<TokenWithFixedText> $separator,
): NodeList<ListItem<T>> {
  if (C\is_empty($items_to_add)) {
    return $list;
  }

  $items = $list->getChildren();
  $whitespace_between = whitespace_from_nodelist($list);

  if (C\is_empty($items)) {
    $had_trailing_separator = false;
    $trailing_whitespace = vec[];
  } else {
    // We want a trailing separator iff the last item previously had one.
    $had_trailing_separator = C\lastx($items)->getSeparator() is nonnull;

    // Add a separator after the last previously-existing item, if missing.
    if ($separator is nonnull && !$had_trailing_separator) {
      $last_token = C\lastx($items)->getLastTokenx();
      $items[C\count($items) - 1] = C\lastx($items)
        ->withSeparator(new $separator(null, $last_token->getTrailing(), null))
        ->replace($last_token, $last_token->withTrailing(null));
    }

    // Trim whitespace (but not other trivia) after the last item and save it
    // for later (to put after the new last item).
    $last_token = C\lastx($items)->getLastTokenx();
    $trivia = $last_token->getTrailing()->getChildren();
    for ($take_cnt = C\count($trivia); $take_cnt > 0; --$take_cnt) {
      if (
        !$trivia[$take_cnt - 1] is WhiteSpace &&
        !$trivia[$take_cnt - 1] is EndOfLine
      ) {
        break;
      }
    }
    $items[C\count($items) - 1] = C\lastx($items)->replace(
      $last_token,
      $last_token->withTrailing(
        NodeList::createMaybeEmptyList(Vec\take($trivia, $take_cnt)),
      ),
    );
    $trailing_whitespace = Vec\drop($trivia, $take_cnt);
  }

  // Finally, we're done with all the preprocessing and we can actually add the
  // specified items.
  foreach ($items_to_add as $item) {
    if (!C\is_empty($items)) {
      $item = $item->replace(
        $item->getFirstTokenx(),
        $item->getFirstTokenx()->withLeading($whitespace_between),
      );
    }
    $items[] = new ListItem(
      $item,
      $separator is nonnull ? new $separator(null, null, null) : null,
    );
  }

  if (!$had_trailing_separator) {
    $items[C\count($items) - 1] = C\lastx($items)->withSeparator(null);
  }

  $new_list = NodeList::createMaybeEmptyList($items);
  return $new_list->replace(
    $new_list->getLastTokenx(),
    $new_list->getLastTokenx()
      ->withTrailing(NodeList::createMaybeEmptyList($trailing_whitespace)),
  );
}
