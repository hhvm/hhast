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
  ConstructToken,
  DestructToken,
  EditableList,
  EditableNode,
  EditableToken,
  EndOfLine,
  FunctionDeclaration,
  IFunctionishDeclaration,
  MethodishDeclaration,
  Script,
  StaticToken,
};
use namespace Facebook\HHAST;
use namespace HH\Lib\{C, Str, Vec};

abstract class FunctionNamingLinter extends ASTLinter<IFunctionishDeclaration> {
  const type TContext = Script;
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

  <<__Override>>
  final protected static function getTargetType(
  ): classname<IFunctionishDeclaration> {
    return IFunctionishDeclaration::class;
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
    Script $root,
    IFunctionishDeclaration $node,
  ): ?FunctionNamingLintError {
    $token = $this->getCurrentNameNodeForFunctionOrMethod($node);
    if ($token === null) {
      return null;
    }
    if ($token instanceof ConstructToken || $token instanceof DestructToken) {
      return null;
    }
    $old = $token->getText();
    if (Str\starts_with($old, '__')) {
      return null;
    }
    if ($node instanceof FunctionDeclaration) {
      $what = 'Function';
      $new = $this->getSuggestedNameForFunction($old, $node);
    } else if ($node instanceof MethodishDeclaration) {
      if (
        $node->getFunctionDeclHeader()
          ->getModifiers()
          ?->getDescendantsOfType(StaticToken::class)
        |> ($$ ?? vec[])
        |> C\is_empty(vec($$))
      ) {
        $what = 'Method';
        $new = $this->getSuggestedNameForInstanceMethod($old, $node);
      } else {
        $what = 'Static method';
        $new = $this->getSuggestedNameForStaticMethod($old, $node);
      }
    } else {
      invariant_violation("Can't handle type %s", \get_class($node));
    }
    if ($old === $new) {
      return null;
    }

    $ns = HHAST\__Private\Resolution\get_current_namespace($root, $node);
    if ($node instanceof FunctionDeclaration) {
      $class = null;
    } else {
      $class = (
        $root->getFirstAncestorOfDescendantWhere(
          $node,
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
      $node,
    );
  }

  <<__Override>>
  public function getPrettyTextForNode(IFunctionishDeclaration $node): string {
    if ($node instanceof FunctionDeclaration) {
      $node = $node->withBody(HHAST\Missing());
    } else if ($node instanceof MethodishDeclaration) {
      $node = $node->withFunctionBody(HHAST\Missing());
    } else {
      invariant_violation('unhandled type: %s', \get_class($node));
    }
    $leading = $node->getFirstTokenx()->getLeading();
    if ($leading instanceof EditableList) {
      $new = vec[];
      foreach (Vec\reverse($leading->toVec()) as $child) {
        $new[] = $child;
        if ($child instanceof EndOfLine) {
          break;
        }
      }
      $leading = EditableList::createNonEmptyListOrMissing(Vec\reverse($new));
    }
    return $node->replace(
      $node->getFirstTokenx(),
      $node->getFirstTokenx()->withLeading($leading),
    )
      ->getCode();
  }
}
