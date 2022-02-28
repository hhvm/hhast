/*
 *  Copyright (c) 2017-present, Facebook, Inc.
 *  All rights reserved.
 *
 *  This source code is licensed under the MIT license found in the
 *  LICENSE file in the root directory of this source tree.
 *
 */

namespace Facebook\HHAST;

use namespace HH\Lib\C;

final class UnreachableCodeLinter extends ASTLinter {
    const type TConfig = shape();
    const type TNode = ReturnStatement;
    const type TContext = CompoundStatement;

    <<__Override>>
    public function getLintErrorForNode(
        CompoundStatement $parent,
        ReturnStatement $stmt,
    ): ?ASTLintError {
        $statements = $parent->getStatements();
        invariant($statements is nonnull, 'parent list of stmt cannot be null');
        $children = $statements->getChildren();
        $return_idx = C\find_key($children, $c ==> $c === $stmt) ?? null;
        invariant(
            $return_idx is nonnull,
            'stmt must be a child of parent list',
        );

        if ($return_idx < C\count($children) - 1) {
            return new ASTLintError(
                $this,
                'This return creates unreachable code',
                $stmt,
            );
        } else {
            return null;
        }
    }
}
