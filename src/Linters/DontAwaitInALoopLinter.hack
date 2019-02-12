/*
 *  Copyright (c) 2017-present, Facebook, Inc.
 *  All rights reserved.
 *
 *  This source code is licensed under the MIT license found in the
 *  LICENSE file in the root directory of this source tree.
 *
 */

namespace Facebook\HHAST\Linters;

use namespace HH\Lib\{C, Vec, Str};
use type Facebook\HHAST\{
  AnonymousFunction,
  AwaitableCreationExpression,
  AwaitToken,
  EditableNode,
  ILoopStatement,
  LambdaExpression,
  PrefixUnaryExpression,
};
use function Facebook\HHAST\find_position;

final class DontAwaitInALoopLinter
  extends ASTLinter<PrefixUnaryExpression> {
  <<__Override>>
  protected static function getTargetType(): classname<PrefixUnaryExpression> {
    return PrefixUnaryExpression::class;
  }

  <<__Override>>
  public function getLintErrorForNode(
    PrefixUnaryExpression $node,
    vec<EditableNode> $parents,
  ): ?ASTLintError<PrefixUnaryExpression> {
    if (!$node->getOperator() instanceof AwaitToken) {
      return null;
    }
    $parents = Vec\reverse($parents);
    $loops = vec[];
    foreach ($parents as $parent) {
      if (self::isAsyncBoundary($parent)) {
        return null;
      }
      if ($parent instanceof ILoopStatement) {
        $loops[] = $parent;
      }
    }
    if (C\is_empty($loops)) {
      return null;
    }

    return new ASTLintError(
      $this,
      "Don't use await in a loop",
      $node,
    );
  }

  private static function isAsyncBoundary(EditableNode $node): bool {
    return
      $node instanceof AnonymousFunction
      || $node instanceof AwaitableCreationExpression
      || $node instanceof LambdaExpression;
  }

  <<__Override>>
  public function getPrettyTextForNode(
    PrefixUnaryExpression $blame,
  ): string {
    $loops = $this->getAST()->findWithParents($node ==> $node === $blame)
      |> Vec\map($$, $x ==> $x instanceof ILoopStatement ? $x : null)
      |> Vec\filter_nulls($$);

    $lines = $this->getFile()->getContents() |> Str\split($$, "\n");

    list(
      $blame_line,
      $_col,
    ) = find_position($this->getAST(), $blame);

    if (C\count($loops) === 1) {
      list(
        $line,
        $_col,
      ) = find_position($this->getAST(), C\onlyx($loops));
      if ($line === $blame_line) {
        return $lines[$line - 1];
      }
    }

    $output = vec[];
    foreach ($loops as $loop) {
      list(
        $line,
        $_col,
      ) = find_position($this->getAST(), $loop);
      $output[] = 'Line '.$line.': '.$lines[$line - 1];
    }
    $output[] = 'Line '.$blame_line.': '.$lines[$blame_line - 1];

    return Str\join($output, "\n");
  }
}
