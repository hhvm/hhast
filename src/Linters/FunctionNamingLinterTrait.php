<?hh // strict
/**
 * Copyright (c) 2016, Facebook, Inc.
 * All rights reserved.
 *
 * This source code is licensed under the BSD-style license found in the
 * LICENSE file in the root directory of this source tree. An additional
 * grant of patent rights can be found in the PATENTS file in the same
 * directory.
 *
 */

namespace Facebook\HHAST\Linters;

use type Facebook\HHAST\{
  ConstructToken,
  DestructToken,
  EditableSyntax,
  EditableToken,
  FunctionDeclaration,
  MethodishDeclaration,
  NameToken,
  StaticToken
};
use namespace Facebook\HHAST;
use namespace HH\Lib\C;

trait FunctionNamingLinterTrait {
  require extends ASTLinter<EditableSyntax>;

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
    string $name,
    string $suggestion,
  ): string {
    return sprintf(
      '%s "%s" does not match conventions; consider renaming to "%s"',
      $what,
      $name,
      $suggestion,
    );
  }

  <<__Override>>
  final protected static function getTargetType(): classname<EditableSyntax> {
    return EditableSyntax::class;
  }

  private function getCurrentNameNodeForFunctionOrMethod(
    EditableSyntax $node,
  ): ?EditableToken {
    if ($node instanceof FunctionDeclaration) {
      return $node->getDeclarationHeader()->getName();
    }

    if($node instanceof MethodishDeclaration) {
      return $node->getFunctionDeclHeader()->getName();
    }

    return null;
  }

  <<__Override>>
  final public function getLintErrorForNode(
    EditableSyntax $node,
    vec<EditableSyntax> $_parents,
  ): ?ASTLintError<EditableSyntax, this> {
    $token = $this->getCurrentNameNodeForFunctionOrMethod($node);
    if ($token === null) {
      return null;
    }
    if ($token instanceof ConstructToken || $token instanceof DestructToken) {
      return null;
    }
    $old = $token->getText();
    $what = null;
    if ($node instanceof FunctionDeclaration) {
      $what = 'Function';
      $new = $this->getSuggestedNameForFunction($old, $node);
    } else if ($node instanceof MethodishDeclaration) {
      if (
        $node->getModifiersUNTYPED()->getDescendantsOfType(
          StaticToken::class,
        ) |> C\is_empty(vec($$))
      ) {
        $what = 'Method';
        $new = $this->getSuggestedNameForInstanceMethod($old, $node);
      } else {
        $what = 'Static method';
        $new = $this->getSuggestedNameForStaticMethod($old, $node);
      }
    } else {
      invariant_violation(
        "Can't handle type %s",
        get_class($node),
      );
    }
    if ($old === $new) {
      return null;
    }
    return new ASTLintError(
      $this,
      $this->getErrorDescription($what, $old, $new),
      $node,
    );
  }

  public function getPrettyNode(
    EditableSyntax $node,
  ): EditableSyntax {
    if ($node instanceof FunctionDeclaration) {
      return $node->withBody(HHAST\Missing());
    }
    if ($node instanceof MethodishDeclaration) {
      return $node->withFunctionBody(HHAST\Missing());
    }
    invariant_violation(
      'unhandled type: %s',
      get_class($node),
    );
  }
}
