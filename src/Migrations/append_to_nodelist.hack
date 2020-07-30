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
 * Adds the provided arguments to the provided function call, preserving
 * whitespace before/after arguments as much as possible.
 */
function add_arguments(
  Script $root,
  FunctionCallExpression $call,
  vec<IExpression> $args_to_add,
): FunctionCallExpression {
  $arg_list = $call->getArgumentList();
  invariant(
    $arg_list is nonnull && $arg_list->getCount() > 0,
    '%s() requires a call node with at least one previously existing argument.',
    __FUNCTION__,
  );

  if (C\is_empty($args_to_add)) {
    return $call;
  }

  $arg_items = $arg_list->getChildren();
  $whitespace = whitespace_from_nodelist($root, $arg_list);

  // We want a trailing comma iff the last argument previously had one.
  $had_trailing_comma = C\lastx($arg_items)->getSeparator() is nonnull;

  // Add a comma after the last previously-existing argument, if missing.
  if (!$had_trailing_comma) {
    $last_token = C\lastx($arg_items)->getLastTokenx();
    $arg_items[C\count($arg_items) - 1] = C\lastx($arg_items)
      ->withSeparator(new CommaToken(null, $last_token->getTrailing()))
      ->replace($last_token, $last_token->withTrailing(null));
  }

  // Trim whitespace (but not other trivia) after the last argument. It will be
  // replaced by $whitespace['between'] later.
  $last_token = C\lastx($arg_items)->getLastTokenx();
  $trivia = Vec\concat(
    $last_token->getTrailing()->getChildren(),
    $call->getRightParen()->getLeading()->getChildren(),
  );
  for ($take_cnt = C\count($trivia); $take_cnt > 0; --$take_cnt) {
    if (
      !$trivia[$take_cnt - 1] is WhiteSpace &&
      !$trivia[$take_cnt - 1] is EndOfLine
    ) {
      break;
    }
  }
  $arg_items[C\count($arg_items) - 1] = C\lastx($arg_items)->replace(
    $last_token,
    $last_token->withTrailing(
      NodeList::createMaybeEmptyList(Vec\take($trivia, $take_cnt)),
    ),
  );

  // Finally, we're done with all the preprocessing and we can actually add the
  // specified arguments.
  foreach ($args_to_add as $arg) {
    $arg_items[] = new ListItem(
      $arg->replace(
        $arg->getFirstTokenx(),
        $arg->getFirstTokenx()->withLeading($whitespace['between']),
      ),
      new CommaToken(null, null),
    );
  }

  if (!$had_trailing_comma) {
    $arg_items[C\count($arg_items) - 1] =
      C\lastx($arg_items)->withSeparator(null);
  }

  return $call->replace($arg_list, NodeList::createMaybeEmptyList($arg_items))
    ->replace(
      $call->getRightParen(),
      $call->getRightParen()->withLeading($whitespace['after_last']),
    );
}
