<?hh //strict
/*
 *  Copyright (c) 2017-present, Facebook, Inc.
 *  All rights reserved.
 *
 *  This source code is licensed under the MIT license found in the
 *  LICENSE file in the root directory of this source tree.
 *
 */

namespace Facebook\HHAST\Migrations;

use function Facebook\HHAST\{Missing, from_file_args};
use type Facebook\HHAST\{
    EditableList,
    EditableNode,
    LeftParenToken,
    ParenthesizedExpression,
    PrefixUnaryExpression,
    RightParenToken,
};
use namespace HH\Lib\{Str, Vec, C};

final class AwaitPrecedenceMigration extends BaseMigration {
    <<__Override>>
    public function migrateFile(string $path, EditableNode $ast): EditableNode {
        // Find our targets - await calls.
        $nodes = $ast->getDescendantsOfType(PrefixUnaryExpression::class);
        $nodes =
            Vec\filter($nodes, $n ==> $n->getOperator()->getCode() === 'await');
        if (C\is_empty($nodes)) {
            return $ast;
        }

        // Figure out how this parses with stronger await precedence.
        //  If this throws a parse error, just let the caller deal with it.
        $stronger_await_ast =
            from_file_args($path, vec['--stronger-await-binding']);
        $stronger_nodes = $stronger_await_ast->getDescendantsOfType(
            PrefixUnaryExpression::class,
        );
        $stronger_nodes =
            Vec\filter($nodes, $n ==> $n->getOperator()->getCode() === 'await');

        // Now, we should have two parses of the same code.
        // Specifically, we have all of the await expressions using different precedences
        //  from the same code file.
        // They should have the same start, since the _await_ isn't changing. If they
        //  have different operands, then the precedence change effects that await. 
        //  Migrate it.
        for ($i = 0; $i < C\count($nodes); $i++) {
            if (
                $nodes[$i]->getOperand()->getCode() !==
                    $stronger_nodes[$i]->getOperand()->getCode()
            ) {

                // We've found something!
                $target = $nodes[$i]->getOperand();
                $targetStart = $target->getFirstTokenx();
                $targetEnd = $target->getLastTokenx();

                // Do some trickery so that any whitespace/comments are left outside of
                //  the parenthesized operand.
                $ast = $ast->replace($target, new ParenthesizedExpression(
                    new LeftParenToken($targetStart->getLeading(), Missing()),
                    $target
                        ->replace(
                            $targetStart,
                            $targetStart->withLeading(Missing()),
                        )
                        ->replace(
                            $targetEnd,
                            $targetEnd->withTrailing(Missing()),
                        ),
                    new RightParenToken(
                        Missing(),
                        $target->getLastTokenx()->getTrailing(),
                    ),
                ));
            }
        }

        return $ast;
    }
}
