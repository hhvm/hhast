/*
 *  Copyright (c) 2017-present, Facebook, Inc.
 *  All rights reserved.
 *
 *  This source code is licensed under the MIT license found in the
 *  LICENSE file in the root directory of this source tree.
 *
 */

namespace Facebook\HHAST;

final class ShoutCaseEnumMembersLinter extends AutoFixingASTLinter {
  const type TContext = EnumDeclaration;
  const type TNode = EnumDeclaration;

  <<__Override>>
  public function getLintErrorForNode(
    self::TContext $_context,
    self::TNode $enum,
  ): ?ASTLintError {
    return null;
  }

  public function getFixedNode(self::TNode $node): ?Node {
    return null;
  }

  <<__Override>>
  protected function getTitleForFix(LintError $_): string {
    return 'Use shout case for enum members';
  }
}
