/*
 *  Copyright (c) 2017-present, Facebook, Inc.
 *  All rights reserved.
 *
 *  This source code is licensed under the MIT license found in the
 *  LICENSE file in the root directory of this source tree.
 *
 */

namespace Facebook\HHAST;

final class NoFinalMethodInFinalClassLinter extends AutoFixingASTLinter {
  const type TNode = MethodishDeclaration;
  const type TContext = ClassishDeclaration;

  <<__Override>>
  public function getLintErrorForNode(
    ClassishDeclaration $_class,
    MethodishDeclaration $_method,
  ): ?ASTLintError {
    throw new \RuntimeException('Not implemented');
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
}
