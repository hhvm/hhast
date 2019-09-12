/*
 *  Copyright (c) 2017-present, Facebook, Inc.
 *  All rights reserved.
 *
 *  This source code is licensed under the MIT license found in the
 *  LICENSE file in the root directory of this source tree.
 *
 */

namespace Facebook\HHAST;

/**
 * Migrates builtin functions that originally accepted one or more parameters by
 * reference to the equivalent functions with inout parameters. For example,
 * preg_match() and preg_match_all() to preg_match_with_matches() and
 * preg_match_all_with_matches().
 */
final class RefToInoutMigration extends BaseMigration {

  const type TNodes = shape(
    'root' => Script,
    'call' => FunctionCallExpression,
    'name' => Node,
    'args' => vec<IExpression>,
  );

  <<__Memoize>>
  private static function getRules(
  ): dict<string, (function(this::TNodes): Script)> {
    return dict[
      'current' => $n ==>
        self::renameIfHasRefOrInout($n, 'current_ref', 0),
      'key' => $n ==>
        self::renameIfHasRefOrInout($n, 'key_ref', 0),
      'preg_match' => $n ==>
        self::renameIfHasRefOrInout($n, 'preg_match_with_matches', 2),
      'preg_match_all' => $n ==>
        self::renameIfHasRefOrInout($n, 'preg_match_all_with_matches', 2),
      'reset' => $n ==>
        self::refToInout($n, 0),
      'preg_replace_callback' => $n ==>
        self::optionalToRequired($n, 4, vec['-1']),
    ];
  }

  /**
   * Changes the name of the called function, but only if the specified argument
   * is by-ref or inout (not by-value). If the argument is by-ref, also changes
   * it to inout.
   *
   * Ex: preg_match('/([a-z])/', $str, &$matches)
   * To: preg_match_with_matches('/([a-z])/', $str, inout $matches)
   */
  private static function renameIfHasRefOrInout(
    this::TNodes $n,
    string $new_name,
    int $arg_idx,
  ): Script {
    $arg = $n['args'][$arg_idx] ?? null;
    if ($arg is null || !self::isRefOrInout($arg)) {
      return $n['root'];
    }

    $leading = $n['name']->getFirstTokenx()->getLeading();
    $trailing = $n['name']->getLastTokenx()->getTrailing();

    $n['root'] = $n['root']->replace(
      $n['name'],
      new QualifiedName(
        NodeList::createMaybeEmptyList(vec[
          new ListItem(null, new BackslashToken($leading, null)),
          new ListItem(new NameToken(null, $trailing, $new_name), null),
        ]),
      ),
    );

    return self::refToInout($n, $arg_idx);
  }

  /**
   * Convert by-ref argument to inout. Do nothing if already inout. Throw if
   * neither by-ref nor inout (this should have been a Hack error).
   *
   * Ex: reset(&$arr)
   * To: reset(inout $arr)
   */
  private static function refToInout(this::TNodes $n, int $arg_idx): Script {
    $arg = $n['args'][$arg_idx] ?? null;

    invariant(
      $arg is nonnull && self::isRefOrInout($arg),
      '%s expects by-ref or inout argument node, got "%s" (%s).',
      __METHOD__,
      $arg?->getCode(),
      \get_class($arg),
    );

    if (
      !$arg is PrefixUnaryExpression || !$arg->getOperator() is AmpersandToken
    ) {
      return $n['root'];  // already inout
    }

    // If there is nothing between "&" and the next token, insert a space.
    $trailing = $arg->getOperator()->getTrailing();
    if (
      $trailing->isEmpty() &&
      $arg->getOperand()->getFirstTokenx()->getLeading()->isEmpty()
    ) {
      $trailing = NodeList::createMaybeEmptyList(vec[new WhiteSpace(' ')]);
    }

    return $n['root']->replace(
      $arg->getOperator(),
      new InoutToken($arg->getOperator()->getLeading(), $trailing),
    );
  }

  /**
   * Adds an inout argument at the specified position, if missing. If the
   * argument exists, converts it from by-ref to inout. Optionally also adds the
   * specified by-value arguments before the inout argument, if they are missing
   * (this is needed because when converting an optional argument to required,
   * all previous arguments also need to be changed to required).
   *
   * Ex: preg_replace_callback('/([a-z])/', fun('Str\\uppercase'), $str)
   * To: $__unused_inout = null;
   *     preg_replace_callback('/([a-z])/', fun('Str\\uppercase'), $str,
   *                           -1, inout $__unused_inout)
   */
  private static function optionalToRequired(
    this::TNodes $nodes,
    int $_arg_idx,
    vec<string> $_previous_defaults = vec[],
  ): Script {
    return $nodes['root'];  // TODO
  }

  private static function isRefOrInout(IExpression $arg): bool {
    return self::isRef($arg) ||
      $arg is DecoratedExpression && $arg->getDecorator() is InoutToken ||
      $arg is PrefixUnaryExpression && $arg->getOperator() is InoutToken;
  }

  private static function isRef(IExpression $arg): bool {
    return $arg is PrefixUnaryExpression &&
      $arg->getOperator() is AmpersandToken;
  }

  <<__Override>>
  public function migrateFile(string $_path, Script $root): Script {
    foreach (
      $root->getDescendantsOfType(FunctionCallExpression::class) as $node
    ) {
      // Only replace calls to functions from the root namespace.
      $receiver = $node->getReceiver();
      if ($receiver is NameToken) {
        $fn_name = $receiver->getText();
      } else if ($receiver is QualifiedName) {
        $fn_name = '';
        foreach ($receiver->getParts()->getChildren() as $part) {
          invariant(
            $part->getSeparator() is null ||
              $part->getSeparator() is BackslashToken,
            'Unexpected separator inside qualified function name: "%s"',
            ($part->getSeparator() as nonnull)->getText(),
          );
          $fn_name .= $part->getItem()?->getText() ?? '';
          $fn_name .= $part->getSeparator()?->getText() ?? '';
        }
      } else {  // probably a method call
        continue;
      }

      $resolved_name = resolve_function($fn_name, $root, $node);

      $rule = self::getRules()[$resolved_name] ?? null;

      if ($rule is nonnull) {
        $root = $rule(shape(
          'root' => $root,
          'call' => $node,
          'name' => $receiver,
          'args' => ($node->getArgumentList() as nonnull)->getChildrenOfItems(),
        ));
      }
    }

    return $root;
  }
}
