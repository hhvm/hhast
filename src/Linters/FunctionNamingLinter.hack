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
  ClassishDeclaration,
  EditableNode,
  EditableToken,
  FunctionDeclaration,
  FunctionDeclarationHeader,
  IFunctionishDeclaration,
  MethodishDeclaration,
  NameToken,
  StaticToken,
};
use namespace Facebook\HHAST;
use namespace HH\Lib\{C, Str};

abstract class FunctionNamingLinter extends AutoFixingASTLinter {
  const type TContext = IFunctionishDeclaration;
  const type TNode = FunctionDeclarationHeader;

  abstract public function getSuggestedNameForFunction(
    string $name,
    FunctionDeclaration $fun,
  ): string;

  abstract public function getSuggestedNameForInstanceMethod(
    string $name,
    MethodishDeclaration $meth,
  ): string;

  abstract public function getSuggestedNameForStaticMethod(
    string $name,
    MethodishDeclaration $meth,
  ): string;

  protected function getErrorDescription(
    string $what,
    ?string $class,
    string $name,
    string $suggestion,
  ): string {
    if ($class === null) {
      return Str\format(
        '%s "%s()" does not match conventions; consider renaming to "%s"',
        $what,
        $name,
        $suggestion,
      );
    }
    return Str\format(
      '%s "%s()" in class "%s" does not match conventions; consider renaming '.
      'to "%s"',
      $what,
      $name,
      $class,
      $suggestion,
    );
  }

  private function getCurrentNameNodeForFunctionOrMethod(
    EditableNode $node,
  ): ?EditableToken {
    if ($node instanceof FunctionDeclaration) {
      return $node->getDeclarationHeader()->getName();
    }

    if ($node instanceof MethodishDeclaration) {
      return $node->getFunctionDeclHeader()->getName();
    }

    return null;
  }

  <<__Override>>
  final public function getLintErrorForNode(
    this::TContext $func,
    this::TNode $header,
  ): ?FunctionNamingLintError {
    $token = $header->getName();
    if (!$token instanceof NameToken) {
      return null;
    }
    $old = $token->getText();
    if (Str\starts_with($old, '__')) {
      return null;
    }
    if ($func instanceof FunctionDeclaration) {
      $what = 'Function';
      $new = $this->getSuggestedNameForFunction($old, $func);
    } else if ($func instanceof MethodishDeclaration) {
      if (
          $header->getModifiers()
          ?->getDescendantsOfType(StaticToken::class)
        |> ($$ ?? vec[])
        |> C\is_empty(vec($$))
      ) {
        $what = 'Method';
        $new = $this->getSuggestedNameForInstanceMethod($old, $func);
      } else {
        $what = 'Static method';
        $new = $this->getSuggestedNameForStaticMethod($old, $func);
      }
    } else {
      invariant_violation("Can't handle type %s", \get_class($func));
    }
    if ($old === $new) {
      return null;
    }

    $root = $this->getAST();
    $ns = HHAST\__Private\Resolution\get_current_namespace($root, $func);
    if ($func instanceof FunctionDeclaration) {
      $class = null;
    } else {
      $class = (
        $root->getFirstAncestorOfDescendantWhere(
          $func,
          $c ==> $c instanceof ClassishDeclaration,
        ) as ClassishDeclaration
      )->getName()->getText();
    }

    return new FunctionNamingLintError(
      $this,
      $this->getErrorDescription($what, $class, $old, $new),
      $ns,
      $class,
      $old,
      $new,
      $header,
    );
  }
}
