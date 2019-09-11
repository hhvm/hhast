/*
 *  Copyright (c) 2017-present, Facebook, Inc.
 *  All rights reserved.
 *
 *  This source code is licensed under the MIT license found in the
 *  LICENSE file in the root directory of this source tree.
 *
 */

namespace Facebook\HHAST;

use namespace HH\Lib\C;
use function Facebook\HHAST\resolve_function;

/**
 * Migrates builtin functions that originally accepted one or more parameters by
 * reference to the equivalent functions with inout parameters. For example,
 * preg_match() and preg_match_all() to preg_match_with_matches() and
 * preg_match_all_with_matches().
 */
final class RefToInoutMigration extends BaseMigration {

  const dict<string, string> REPLACEMENTS = dict[
    'preg_match' => 'preg_match_with_matches',
    'preg_match_all' => 'preg_match_all_with_matches',
  ];

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

      if (!C\contains_key(self::REPLACEMENTS, $resolved_name)) {
        continue;
      }

      // We only need to migrate calls that have a by-ref/inout 3rd argument.
      $args = ($node->getArgumentList() as nonnull)->getChildren();
      if (C\count($args) < 3) {
        continue;
      }

      $arg3 = $args[2]->getItemx();
      if (
        $arg3 is DecoratedExpression && $arg3->getDecorator() is InoutToken ||
        $arg3 is PrefixUnaryExpression && $arg3->getOperator() is AmpersandToken
      ) {
        $leading = $receiver->getFirstTokenx()->getLeading();
        $trailing = $receiver->getLastTokenx()->getTrailing();
        $new_name = self::REPLACEMENTS[$resolved_name];

        $root = $root->replace(
          $receiver,
          new QualifiedName(
            NodeList::createMaybeEmptyList(vec[
              new ListItem(null, new BackslashToken($leading, null)),
              new ListItem(new NameToken(null, $trailing, $new_name), null),
            ]),
          ),
        );

        // If it's by-ref, migrate to inout.
        if ($arg3 is PrefixUnaryExpression) {
          // If there is nothing between "&" and the next token, insert a space.
          $trailing = $arg3->getOperator()->getTrailing();
          if (
            $trailing->isEmpty() &&
            $arg3->getOperand()->getFirstTokenx()->getLeading()->isEmpty()
          ) {
            $trailing =
              NodeList::createMaybeEmptyList(vec[new WhiteSpace(' ')]);
          }

          $root = $root->replace(
            $arg3->getOperator(),
            new InoutToken($arg3->getOperator()->getLeading(), $trailing),
          );
        }
      }
    }

    return $root;
  }
}
