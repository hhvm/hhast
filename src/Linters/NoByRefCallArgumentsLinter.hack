/*
 *  Copyright (c) 2017-present, Facebook, Inc.
 *  All rights reserved.
 *
 *  This source code is licensed under the MIT license found in the
 *  LICENSE file in the root directory of this source tree.
 *
 */

namespace Facebook\HHAST;

use namespace HH\Lib\{C, Str, Vec};

/**
 * Warns people to stop passing function arguments by &$reference. Auto-fixes to
 * `inout` unless it's one of the built-in functions that need special
 * migration.
 */
final class NoByRefCallArgumentsLinter extends AutoFixingASTLinter {
  const type TNode = PrefixUnaryExpression;
  const type TContext = Script;

  const keyset<string> SPECIAL_FUNCTIONS = keyset[
    'array_multisort',
    'current',
    'headers_sent',
    'icu_match',
    'is_callable',
    'key',
    'openssl_encrypt',
    'pos',
    'preg_match',
    'preg_match_all',
    'preg_replace',
    'str_ireplace',
    'str_replace',
    'xml_set_object',
  ];

  <<__Override>>
  public function getLintErrorForNode(
    Script $root,
    PrefixUnaryExpression $ref_node,
  ): ?ASTLintError {
    $ampersand_token = $ref_node->getOperator();
    $var_name_token = $ref_node->getOperand()->getFirstToken();

    if (
      !$ampersand_token is AmpersandToken || !$var_name_token is VariableToken
    ) {
      // not a &$reference
      return null;
    }

    $call_node = $root
      ->getClosestAncestorOfDescendantOfType<FunctionCallExpression>($ref_node);

    if (
      $call_node is null ||
      !C\contains(
        $call_node->getArgumentList()?->getChildrenOfItems() ?? vec[],
        $ref_node,
      )
    ) {
      // This &$reference is not a call argument. References in any other
      // position are a Hack error, no need to return a redundant Lint error.
      return null;
    }

    $function_name = $call_node->getReceiver()
      // not using ->getCode() because there might be Trivia inside
      ->getDescendantsOfType(Token::class)
      |> Vec\map($$, $token ==> $token->getText())
      |> Str\join($$, '')
      // get full function name including namespace
      |> resolve_function($$, $root, $call_node);

    if (C\contains_key(self::SPECIAL_FUNCTIONS, $function_name)) {
      // Needs special handling, no auto-fix here.
      return new ASTLintError(
        $this,
        'References are deprecated and will be disallowed soon. Use '.
        '`hhast-migrate --ref-to-inout` to migrate this function call.',
        $ref_node,
      );
    }

    $trailing = $ampersand_token->getTrailing();
    if ($trailing->isEmpty() && $var_name_token->getLeading()->isEmpty()) {
      $trailing = NodeList::createMaybeEmptyList(vec[new WhiteSpace(' ')]);
    }

    return new ASTLintError(
      $this,
      'References are deprecated and will be disallowed soon. Note that it '.
      'is OK to update this function call separately from the function '.
      'declaration, because & and inout are compatible during the reference '.
      'deprecation period.',
      $ref_node,
      () ==> $ref_node->withOperator(
        new InoutToken($ampersand_token->getLeading(), $trailing),
      ),
    );
  }

  <<__Override>>
  public function getTitleForFix(LintError $_): string {
    return 'Replace with inout';
  }
}
