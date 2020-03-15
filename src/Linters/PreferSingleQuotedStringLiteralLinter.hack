/*
 *  Copyright (c) 2017-present, Facebook, Inc.
 *  All rights reserved.
 *
 *  This source code is licensed under the MIT license found in the
 *  LICENSE file in the root directory of this source tree.
 *
 */

namespace Facebook\HHAST;

final class PreferSingleQuotedStringLiteral extends AutoFixingASTLinter {
  const type TContext = Script;
  const type TNode = DoubleQuotedStringLiteralToken;

  <<__Override>>
  public function getLintErrorForNode(
    this::TContext $_context,
    this::TNode $_node,
  ): ?ASTLintError {

    return null;
  }
}
