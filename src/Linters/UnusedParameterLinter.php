<?hh // strict
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
  EditableNode,
  FunctionDeclaration,
  FunctionDeclarationHeader,
  IFunctionishDeclaration,
  MethodishDeclaration,
  ParameterDeclaration,
  VariableToken,
};
use function Facebook\HHAST\Missing;
use namespace HH\Lib\{C, Str};

final class UnusedParameterLinter
  extends AutoFixingASTLinter<ParameterDeclaration> {
  <<__Override>>
  protected static function getTargetType(
  ): classname<ParameterDeclaration> {
    return ParameterDeclaration::class;
  }

  <<__Override>>
  public function getLintErrorForNode(
    ParameterDeclaration $node,
    vec<EditableNode> $parents,
  ): ?FixableASTLintError<ParameterDeclaration> {
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

    $functionish =
      C\find($parents, $p ==> $p instanceof IFunctionishDeclaration);

    if ($functionish instanceof FunctionDeclaration) {
      $body = $functionish->getBody();
    } else if ($functionish instanceof MethodishDeclaration) {
      $body = $functionish->getFunctionBody();
    } else {
      invariant_violation("Couldn't find functionish for parameter declaration");
    }

    if ($body === null) {
      // Don't require `$_` for abstract or interface methods
      return null;
    }

    $statements = $body->getStatements();
    if ($statements !== null) {
      $match = $statements->getDescendantsOfType(VariableToken::class)
        |> C\find($$, $x ==> $x->getText() === $name->getText());
      if ($match !== null) {
        return null;
      }
    }

    return new FixableASTLintError(
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
    FixableASTLintError<ParameterDeclaration> $err,
  ): string {
    $name = $err->getBlameNode()->getName();
    invariant($name instanceof VariableToken, 'unhandled type');
    $new_name = '$_'.Str\strip_prefix($name->getText(), '$');
    return Str\format('Rename to `%s`', $new_name);
  }
}
