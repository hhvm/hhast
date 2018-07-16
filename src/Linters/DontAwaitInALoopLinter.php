<?hh // strict
/*
 *  Copyright (c) 2017-present, Facebook, Inc.
 *  All rights reserved.
 *
 *  This source code is licensed under the MIT license found in the
 *  LICENSE file in the root directory of this source tree.
 *
 */

namespace Facebook\HHAST\Linters;

use type Facebook\HHAST\{
  AnonymousFunction,
  AwaitableCreationExpression,
  AwaitToken,
  EditableList,
  EditableNode,
  ILoopStatement,
  LambdaExpression,
  PrefixUnaryExpression,
};
use function Facebook\HHAST\find_position;
use namespace Facebook\TypeAssert;
use namespace HH\Lib\{C, Vec};

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
      new EditableList($loops),
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
    ?EditableNode $loops,
  ): string {
    invariant(
      $loops instanceof EditableList,
      'Expected a loop context',
    );
    $loops = $loops->toVec()
      |> Vec\map(
        $$,
        $item ==> TypeAssert\instance_of(
          ILoopStatement::class,
          $item,
        ),
      );

    $lines = \file_get_contents($this->getFile()) |> \explode("\n", $$);

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
    foreach (Vec\reverse($loops) as $loop) {
      list(
        $line,
        $_col,
      ) = find_position($this->getAST(), $loop);
      $output[] = 'Line '.$line.': '.$lines[$line - 1];
    }
    $output[] = 'Line '.$blame_line.': '.$lines[$blame_line - 1];

    return \implode("\n", $output);
  }
}
