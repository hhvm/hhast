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

final class UnusedParameterLinter extends AutoFixingASTLinter {
  const type TNode = ParameterDeclaration;
  const type TContext = IFunctionishDeclaration;

  <<__Override>>
  public function getLintErrorForNode(
    IFunctionishDeclaration $functionish,
    ParameterDeclaration $node,
  ): ?ASTLintError {
    if ($node->getVisibility() !== null) {
      // Constructor parameter promotion
      return null;
    }

    $name = $node->getName();
    if (!$name is VariableToken) {
      return null;
    }
    if (Str\starts_with($name->getText(), '$_')) {
      return null;
    }

    if ($functionish is FunctionDeclaration) {
      $body = $functionish->getBody();
    } else if ($functionish is MethodishDeclaration) {
      $body = $functionish->getFunctionBody();
    } else {
      invariant_violation(
        "Couldn't find functionish for parameter declaration",
      );
    }

    if ($body === null || $body is SemicolonToken) {
      // Don't require `$_` for abstract or interface methods
      return null;
    }

    $statements = ($body as CompoundStatement)->getStatements();
    if ($statements !== null) {
      $name = $name->getText();
      foreach ($statements->traverse() as $var) {
        if (!$var is VariableToken) {
          continue;
        }
        if ($var->getText() === $name) {
          return null;
        }
      }
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
    $name = $node->getName();
    if (!$name is VariableToken) {
      return $node;
    }
    return $node->withName(
      $name->withText('$_'.Str\strip_prefix($name->getText(), '$')),
    );
  }

  <<__Override>>
  public function getTitleForFix(ASTLintError $err): string {
    $name = ($err->getBlameNode() as this::TNode)->getName();
    invariant($name is VariableToken, 'unhandled type');
    $new_name = '$_'.Str\strip_prefix($name->getText(), '$');
    return Str\format('Rename to `%s`', $new_name);
  }
}
