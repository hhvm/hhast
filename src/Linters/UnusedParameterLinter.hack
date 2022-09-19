/*
 *  Copyright (c) 2017-present, Facebook, Inc.
 *  All rights reserved.
 *
 *  This source code is licensed under the MIT license found in the
 *  LICENSE file in the root directory of this source tree.
 *
 */

namespace Facebook\HHAST;

use namespace HH\Lib\Str;

/**
 * This linter should really be called UnusedFunctionAndMethodParameterLinter,
 * but renaming this is a useless BC break.
 */
final class UnusedParameterLinter extends AutoFixingASTLinter {
  const type TConfig = shape();
  const type TContext = IFunctionishDeclaration;
  const type TNode = ParameterDeclaration;

  use __Private\SharedCodeForUnusedParameterLinters;

  /**
   * Unlike UnusedLambdaParameterLinter, this autofix is safe.
   * This method was added and returns true (the default)
   * to show that it was not forgotten and carefully considered.
   * Changing `$v` to `$_v` in a parameter is always safe.
   * If `$_v` was already used in the body, it must have been
   * unconditionally assigned before every use, else it would
   * have been invalid Hack.
   * This means that the parameter value can not be observed,
   * nor change the meaning of existing code.
   */
  use SafeBulkAutoFixesTrait;

  <<__Override>>
  public function getLintErrorForNode(
    this::TContext $functionish,
    this::TNode $node,
  ): ?ASTLintError {
    $name_node = static::extractVariableFromParam($node);
    $body = static::extractBodyFromFunctionish($functionish);

    if (
      $name_node is null ||
      $body is null ||
      static::startsWithUnder($name_node) ||
      static::belongsToALambda($functionish, $name_node) ||
      static::isUsedInBody($body, $name_node)
    ) {
      return null;
    }

    return new ASTLintError(
      $this,
      'Parameter is unused',
      $node,
      () ==> $this->getFixedNode($node),
    );
  }

  public function getFixedNode(
    ParameterDeclaration $node,
  ): ParameterDeclaration {
    $fixed_var = static::fixParameterName($node);

    $maybe_decorated = $node->getName();
    if ($maybe_decorated is DecoratedExpression) {
      $fixed_var = $maybe_decorated->withExpression($fixed_var);
    }

    return $node->withName($fixed_var);
  }

  <<__Override>>
  public function getTitleForFix(ASTLintError $err): string {
    $name = static::fixParameterName(($err->getBlameNode() as this::TNode));
    return Str\format('Rename to `%s`', $name->getText());
  }

  private static function fixParameterName(
    ParameterDeclaration $p,
  ): VariableToken {
    $v = static::extractVariableFromParam($p);
    invariant($v is nonnull, 'Must be nonnull, since we are requesting a fix');
    return static::prefixWithUnderscore($v);
  }

  /**
   * If this is a parameter of a lambda function, we stop linting.
   * UnusedLambdaParameterLinter takes care of this.
   * We can't handle it here, since the `$x ==> $x + 1` notation for
   * lambda expressions don't have a ParameterDeclaration.
   * This linter targets ParameterDeclaration.
   * So if we handled it here, we would only process `($x) ==> $x + 1` notation.
   */
  private static function belongsToALambda(
    this::TContext $f,
    VariableToken $v,
  ): bool {
    return $f->getClosestAncestorOfDescendantOfType<LambdaExpression>($v)
      is nonnull;
  }

  private static function extractBodyFromFunctionish(
    this::TContext $functionish,
  ): ?CompoundStatement {
    if ($functionish is FunctionDeclaration) {
      $body = $functionish->getBody();
    } else if ($functionish is MethodishDeclaration) {
      $body = $functionish->getFunctionBody();
    } else {
      invariant_violation(
        'Unhandled functionish type: %s',
        \get_class($functionish),
      );
    }

    // If not a CompoundStatement, it is a `;`, which is an abstract
    // or interface method. We don't require those parameters to have
    // an underscore prefix.
    return $body ?as CompoundStatement;
  }
}
