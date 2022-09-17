/*
 *  Copyright (c) 2017-present, Facebook, Inc.
 *  All rights reserved.
 *
 *  This source code is licensed under the MIT license found in the
 *  LICENSE file in the root directory of this source tree.
 *
 */

namespace Facebook\HHAST;

use namespace HH\Lib\{C, Str};

final class UnusedLambdaParameterLinter extends AutoFixingASTLinter {
  const type TConfig = shape();
  const type TContext = LambdaExpression;
  const type TNode = VariableToken;

  use __Private\SharedCodeForUnusedParameterLinters;

  /**
   * This linter changes the parameter `$v` to `$_v`.
   * This change is unsafe when `$_a` was previously auto captured.
   * ```
   * $_v = 'capture me';
   * return Vec\filter_with_key($dict, ($k, $v) ==> $k === $_v);
   * ```
   * If the autofix rewrites the `$v` parameter, this will compare
   * the keys of `$dict` to the values, not to the string 'capture me'.
   */
  <<__Override>>
  public function allowYesToAll(): bool {
    return false;
  }

  <<__Override>>
  public function getLintErrorForNode(
    this::TContext $lambda,
    this::TNode $name_node,
  ): ?ASTLintError {
    if (
      static::startsWithUnder($name_node) ||
      !static::isAParameter($lambda, $name_node) ||
      static::isUsedInBody($lambda->getBody(), $name_node)
    ) {
      return null;
    }

    return new ASTLintError(
      $this,
      'Parameter is unused',
      $name_node,
      () ==> static::prefixWithUnderscore($name_node),
    );
  }

  <<__Override>>
  public function getTitleForFix(ASTLintError $err): string {
    $name = static::prefixWithUnderscore($err->getBlameNode() as this::TNode);
    return Str\format('Rename to `%s`', $name->getText());
  }

  /**
   * This linter targets VariableToken, so we get a lot of false requests.
   * `$x ==> C\count($x)` calls us twice.
   * Once for the parameter $x and once for `C\count($x)`s $x.
   * We can't simply target ParameterDeclaration, since `$x ==> 0`
   * does not introduce a paramter declaration.
   */
  private static function isAParameter(
    this::TContext $lambda,
    this::TNode $name_node,
  ): bool {
    $signature = $lambda->getSignature();
    return ($signature is VariableToken && $signature === $name_node) ||
      (
        $signature is LambdaSignature &&
        C\any(
          $signature->getParameters()?->getChildrenOfItems() ?? vec[],
          $p ==> static::extractVariableFromParam($p) === $name_node,
        )
      );
  }
}
