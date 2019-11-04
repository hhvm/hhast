/*
 *  Copyright (c) 2017-present, Facebook, Inc.
 *  All rights reserved.
 *
 *  This source code is licensed under the MIT license found in the
 *  LICENSE file in the root directory of this source tree.
 *
 */

namespace Facebook\HHAST;

use namespace HH\Lib\{C, Vec};

final class NoFinalMethodInFinalClassLinter extends AutoFixingASTLinter {
  const type TNode = MethodishDeclaration;
  const type TContext = ClassishDeclaration;

  <<__Override>>
  public function getLintErrorForNode(
    ClassishDeclaration $class,
    MethodishDeclaration $method,
  ): ?ASTLintError {
    $class_modifiers = $class->getModifiers() ?? new NodeList();
    if (!self::hasFinalModifier($class_modifiers)) {
      return null;
    }
    $function_modifiers = $method->getFunctionDeclHeader()->getModifiers() ??
      new NodeList();
    if (!self::hasFinalModifier($function_modifiers)) {
      return null;
    }

    echo $class->getName()->getCode().
      ' is final and has the final method '.
      $method->getFunctionDeclHeader()->getName()->getCode().
      \PHP_EOL;
  }

  <<__Override>>
  public function getTitleForFix(LintError $_): string {
    return 'Remove final from methods in final classes';
  }

  public function getFixedNode(
    MethodishDeclaration $_method,
  ): MemberSelectionExpression {
    throw new \RuntimeException('Not implemented');
  }

  private static function hasFinalModifier(NodeList<Token> $modifiers): bool {
    return C\any($modifiers->toVec(), $token ==> $token is FinalToken);
  }
}
