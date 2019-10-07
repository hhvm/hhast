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
 * Warns people to stop declaring functions with &$reference parameters.
 * Auto-fixes to `inout` if there is no default value.
 */
final class NoByRefParameterDeclarationsLinter extends AutoFixingASTLinter {
  const type TNode = ParameterDeclaration;
  const type TContext = Script;

  <<__Override>>
  public function getLintErrorForNode(
    Script $_root,
    ParameterDeclaration $param_node,
  ): ?ASTLintError {
    // Check if this is a by-ref parameter.
    $name_node = $param_node->getName();
    if (!$name_node is DecoratedExpression) {
      return null;
    }

    $ampersand_token = $name_node->getDecorator();
    $var_name_token = $name_node->getExpression()->getFirstToken();
    if (
      !$ampersand_token is AmpersandToken || !$var_name_token is VariableToken
    ) {
      return null;
    }

    // Can't auto-fix if it has a default value.
    if ($param_node->hasDefaultValue()) {
      return new ASTLintError(
        $this,
        'References are deprecated and will be disallowed soon. Use inout '.
        'instead (this will require removing the default value).',
        $param_node,
      );
    }

    $first_token = $param_node->getFirstTokenx();

    // We need different whitespace/Trivia handling based on whether there is a
    // typehint or not.
    if ($first_token === $ampersand_token) {
      // Missing typehint.
      $trailing = $ampersand_token->getTrailing();
      if ($trailing->isEmpty() && $var_name_token->getLeading()->isEmpty()) {
        $trailing = NodeList::createMaybeEmptyList(vec[new WhiteSpace(' ')]);
      }
      $autofix = () ==> $param_node
        ->withCallConvention(
          new InoutToken($first_token->getLeading(), $trailing),
        )
        ->withName($name_node->getExpression());
    } else {
      $autofix = () ==> $param_node
        ->withCallConvention(
          new InoutToken(
            $first_token->getLeading(),
            NodeList::createMaybeEmptyList(vec[new WhiteSpace(' ')]),
          ),
        )
        ->withName($name_node->getExpression())
        // the declaration's leading trivia was moved before the inout token
        ->replace($first_token, $first_token->withLeading(null))
        // add the removed & token's trivia to the $name token so we don't lose
        // comments etc.
        ->replace(
          $var_name_token,
          $var_name_token->withLeading(
            NodeList::concat(
              NodeList::concat(
                $ampersand_token->getLeading(),
                $ampersand_token->getTrailing(),
              ),
              $var_name_token->getLeading(),
            ),
          ),
        );
    }

    return new ASTLintError(
      $this,
      'References are deprecated and will be disallowed soon. Note that it '.
      'is OK to update this function declaration separately from all its '.
      'calls, because & and inout are compatible during the reference '.
      'deprecation period.',
      $param_node,
      $autofix,
    );
  }

  <<__Override>>
  public function getTitleForFix(LintError $_): string {
    return 'Replace with inout';
  }
}
