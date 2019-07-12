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

  private function getCurrentNameNodeForFunctionOrMethod(Node $node): ?Token {
    if ($node is FunctionDeclaration) {
      return $node->getDeclarationHeader()->getName();
    }

    if ($node is MethodishDeclaration) {
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
    if (!$token is NameToken) {
      return null;
    }
    $old = $token->getText();
    if (Str\starts_with($old, '__')) {
      return null;
    }
    if ($func is FunctionDeclaration) {
      $what = 'Function';
      $new = $this->getSuggestedNameForFunction($old, $func);
    } else if ($func is MethodishDeclaration) {
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
    $ns = __Private\Resolution\get_current_namespace($root, $func);
    if ($func is FunctionDeclaration) {
      $class = null;
    } else {
      $class = (
        $root->getFirstAncestorOfDescendantWhere(
          $func,
          $c ==> $c is ClassishDeclaration,
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
