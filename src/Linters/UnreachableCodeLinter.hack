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
        $stmt_idx = C\find_key($children, $c ==> $c === $stmt) ?? null;

        // if the statement is not a direct child of the CompoundStatement,
        // then it occurs in a position where it cannot cause unreachable code
        //
        // For example:
        // if ($cond) return;
        if ($stmt_idx is null) {
            return null;
        }

        if ($stmt_idx < C\count($children) - 1) {
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
