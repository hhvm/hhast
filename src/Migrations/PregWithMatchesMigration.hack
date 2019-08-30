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

/**
 * Migrates preg_match() and preg_match_all() calls with a by-ref $matches
 * argument to preg_match_with_matches() and preg_match_all_with_matches().
 */
final class PregWithMatchesMigration extends BaseMigration {

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
      if (!$receiver is QualifiedName) {
        continue;
      }

      $parts = $receiver->getParts()->getChildren();
      if (
        C\count($parts) === 2 &&
        $parts[0]->getItem() is null &&
        $parts[0]->getSeparator() is BackslashToken &&
        $parts[1]->getItem() is NameToken &&
        $parts[1]->getSeparator() is null
      ) {
        $name_token = $parts[1]->getItem() as NameToken;
      } else {
        continue;
      }

      if (!C\contains_key(self::REPLACEMENTS, $name_token->getText())) {
        continue;
      }

      // We only need to migrate calls that have a by-ref/inout 3rd argument.
      $args = $node->getArgumentList() as nonnull->getChildren();
      if (C\count($args) < 3) {
        continue;
      }

      $arg3 = $args[2]->getItemx();
      if (
        $arg3 is DecoratedExpression && $arg3->getDecorator() is InoutToken ||
        $arg3 is PrefixUnaryExpression && $arg3->getOperator() is AmpersandToken
      ) {
        $root = $root->replace(
          $name_token,
          new NameToken(
            $name_token->getLeading(),
            $name_token->getTrailing(),
            self::REPLACEMENTS[$name_token->getText()],
          ),
        );

        // If it's by-ref, migrate to inout.
        if ($arg3 is PrefixUnaryExpression) {
          // If there is nothing between "&" and the next token, insert a space.
          $trailing = $arg3->getOperator()->getTrailing();
          if (
            $trailing->getCount() === 0 &&
            $arg3->getOperand()->getFirstTokenx()->getLeading()->getCount() ===
              0
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
