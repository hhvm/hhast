/*
 *  Copyright (c) 2017-present, Facebook, Inc.
 *  All rights reserved.
 *
 *  This source code is licensed under the MIT license found in the
 *  LICENSE file in the root directory of this source tree.
 *
 */

namespace Facebook\HHAST;

use namespace HH\Lib\{C, Dict, Keyset, Str, Vec};

final class DontShadowLocalVariablesInForeachLinter extends ASTLinter {
  const type TContext = IFunctionishDeclaration;
  const type TNode = ForeachStatement;

  <<__Override>>
  public function getLintErrorForNode(
    this::TContext $scope,
    this::TNode $foreach,
  ): ?ASTLintError {
    $pseudo_declarations = static::getPseudoDeclarations($foreach);
    if (C\is_empty($pseudo_declarations)) {
      return null;
    }
    $scope_decl = i_functionish_get_decl_header($scope);
    $params = $scope_decl->getParameterList()
      ?->getDescendantsOfType(VariableToken::class)
      |> Keyset\map($$ ?? vec[], $p ==> $p->getText());

    unset($params['$_']);

    $first_dup = Dict\select_keys($pseudo_declarations, $params) |> C\first($$);
    if ($first_dup is nonnull) {
      return $this->paramDup($scope_decl->getName()->getText(), $first_dup);
    }

    $lambda_params = $this->getParamsFromEnclosingLambdas($foreach);
    unset($lambda_params['$_']);

    $first_dup = Dict\select_keys($pseudo_declarations, $lambda_params)
      |> C\first($$);
    if ($first_dup is nonnull) {
      return $this->paramDup('an anonymous function in your scope', $first_dup);
    }

    $locals = static::getAssignedLocalsBeforeForeach(
      $scope->getBody(),
      $foreach->getKeyword(),
    );
    unset($locals['$_']);

    foreach ($locals as $var => $expr) {
      if (C\contains_key($pseudo_declarations, $var)) {
        return $this->localVariableDup($expr, $pseudo_declarations[$var]);
      }
    }

    return null;
  }

  /**
   * This method is a best effort.
   * `foreach(vec[] as $dict[$key]) {}` is valid Hack.
   * We count `$key` as a declaration, but that is incorrect.
   */
  private static function getPseudoDeclarations(
    this::TNode $foreach,
  ): dict<string, VariableToken> {
    $pseudo_declarations = dict[];

    $key = $foreach->getKey();
    if ($key is VariableExpression) {
      $pseudo_declarations = $key->getDescendantsOfType(VariableToken::class)
        |> Dict\from_values($$, $token ==> $token->getText());
    }

    $value = $foreach->getValue();
    $value_vars = $value->getDescendantsOfType(VariableToken::class)
      |> Dict\from_values($$, $token ==> $token->getText());

    if (C\is_empty($value_vars)) {
      return $pseudo_declarations;
    }
    return Dict\merge($value_vars, $pseudo_declarations);
  }

  private function getParamsFromEnclosingLambdas(
    ForeachStatement $foreach,
  ): keyset<string> {
    $lambdas = $this->getAST()
      ->getAncestorsOfDescendantOfType<LambdaExpression>($foreach);

    return Vec\map(
      $lambdas,
      $lambda ==>
        $lambda->getSignature()->getDescendantsOfType(VariableToken::class),
    )
      |> Vec\flatten($$)
      |> Keyset\map($$, $p ==> $p->getText());
  }

  private static function getAssignedLocalsBeforeForeach(
    ?Node $body,
    ForeachToken $stop_token,
  ): dict<string, BinaryExpression> {
    if ($body is null) {
      return dict[];
    }
    $out = dict[];
    foreach ($body->traverse() as $node) {
      if ($node is BinaryExpression && $node->getOperator() is EqualToken) {
        $vars = $node->getLeftOperand()
          ->getChildrenOfType(VariableToken::class);
        //  ^^^^^^^^^^^^^^^^^ getDescendantsOfType also finds `$key` in `$dict[$key]`.
        // Children doesn't find `list($one, two)` though...
        foreach ($vars as $var) {
          $out[$var->getText()] = $node;
        }
      } else if ($node === $stop_token) {
        return $out;
      }
    }

    invariant_violation(
      'Reached the end of the scope without finding the foreach',
    );
  }

  private function localVariableDup(
    BinaryExpression $assignment,
    VariableToken $dup_var,
  ): ASTLintError {
    return new ASTLintError(
      $this,
      Str\format(
        "%s was previously assigned here:\n".
        "%s\n".
        "Please pick a different name for this variable.\n",
        $dup_var->getText(),
        // Can I retrieve the line number here?
        Str\trim_right($assignment->getCode()) |> Str\trim_left($$, \PHP_EOL),
      ),
      $dup_var,
    );
  }

  private function paramDup(
    string $method_or_function,
    VariableToken $dup_var,
  ): ASTLintError {
    return new ASTLintError(
      $this,
      Str\format(
        "This variable is shadowing parameter %s from %s.\n".
        "Please pick a different name for this variable.\n",
        $dup_var->getText(),
        $method_or_function,
      ),
      $dup_var,
    );
  }
}
