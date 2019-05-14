/*
 *  Copyright (c) 2017-present, Facebook, Inc.
 *  All rights reserved.
 *
 *  This source code is licensed under the MIT license found in the
 *  LICENSE file in the root directory of this source tree.
 *
 */

namespace Facebook\HHAST\Linters;

use type Facebook\HHAST\{
  CompoundStatement,
  FunctionDeclaration,
  IFunctionishDeclaration,
  MethodishDeclaration,
  ParameterDeclaration,
  SemicolonToken,
  VariableToken,
};
use namespace HH\Lib\{C, Str};

final class UnusedParameterLinter
  extends AutoFixingASTLinter<ParameterDeclaration> {
  <<__Override>>
  protected static function getTargetType(
  ): classname<ParameterDeclaration> {
    return ParameterDeclaration::class;
  }

  const type TContext = IFunctionishDeclaration;

  <<__Override>>
  public function getLintErrorForNode(
    IFunctionishDeclaration $functionish,
    ParameterDeclaration $node,
  ): ?ASTLintError<ParameterDeclaration> {
    if ($node->getVisibility() !== null) {
      // Constructor parameter promotion
      return null;
    }

    $name = $node->getName();
    if (!$name instanceof VariableToken) {
      return null;
    }
    if (Str\starts_with($name->getText(), '$_')) {
      return null;
    }

    if ($functionish instanceof FunctionDeclaration) {
      $body = $functionish->getBody();
    } else if ($functionish instanceof MethodishDeclaration) {
      $body = $functionish->getFunctionBody();
    } else {
      invariant_violation("Couldn't find functionish for parameter declaration");
    }

    if ($body === null || $body is SemicolonToken) {
      // Don't require `$_` for abstract or interface methods
      return null;
    }

    $statements = ($body as CompoundStatement)->getStatements();
    if ($statements !== null) {
      $match = $statements->getDescendantsOfType(VariableToken::class)
        |> C\find($$, $x ==> $x->getText() === $name->getText());
      if ($match !== null) {
        return null;
      }
    }

    return new ASTLintError(
      $this,
      "Parameter is unused",
      $node,
    );
  }

  <<__Override>>
  public function getFixedNode(
    ParameterDeclaration $node,
  ): ParameterDeclaration {
    $name = $node->getName();
    if (!$name instanceof VariableToken) {
      return $node;
    }
    return $node->withName(
      $name->withText('$_'.Str\strip_prefix($name->getText(), '$')),
    );
  }

  <<__Override>>
  public function getTitleForFix(
    ASTLintError<ParameterDeclaration> $err,
  ): string {
    $name = $err->getBlameNode()->getName();
    invariant($name instanceof VariableToken, 'unhandled type');
    $new_name = '$_'.Str\strip_prefix($name->getText(), '$');
    return Str\format('Rename to `%s`', $new_name);
  }
}
