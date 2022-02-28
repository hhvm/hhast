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

final class UnreachableCodeLinter extends ASTLinter {
    const type TConfig = shape();
    const type TNode = IStatement;
    const type TContext = CompoundStatement;

    <<__Override>>
    public function getLintErrorForNode(
        CompoundStatement $parent,
        IStatement $stmt,
    ): ?ASTLintError {
        // Evaluate all IStatement because we need to look for additional statements after return, throw, continue
        if (
            !(
                $stmt is ThrowStatement ||
                $stmt is ReturnStatement ||
                $stmt is ContinueStatement
            )
        ) {
            return null;
        }

        $statements = $parent->getStatements();
        invariant($statements is nonnull, 'parent list of stmt cannot be null');
        $children = $statements->getChildren();
        $return_idx = C\find_key($children, $c ==> $c === $stmt) ?? null;
        invariant(
            $return_idx is nonnull,
            'stmt must be a child of parent list',
        );

        if ($return_idx < C\count($children) - 1) {
            if ($stmt is ThrowStatement) {
                $op = 'throw';
            } else if ($stmt is ReturnStatement) {
                $op = 'return';
            } else {
                $op = 'continue';
            }

            return new ASTLintError(
                $this,
                Str\format('This %s statement creates unreachable code', $op),
                $stmt,
            );
        } else {
            return null;
        }
    }
}
