/*
 *  Copyright (c) 2017-present, Facebook, Inc.
 *  All rights reserved.
 *
 *  This source code is licensed under the MIT license found in the
 *  LICENSE file in the root directory of this source tree.
 *
 */

namespace Facebook\HHAST;

/**
 * This linter is dead and may be removed in the next breaking release.
 */
final class MethodCallOnConstructorLinter extends AutoFixingASTLinter {
  const type TNode = Script;
  const type TContext = Script;

  <<__Override>>
  public function getLintErrorForNode(
    this::TContext $_context,
    this::TNode $_node,
  ): ?ASTLintError {
    return null;
  }

  <<__Override>>
  public static function shouldLintFile(mixed ...$_): bool {
    return false;
  }
}
