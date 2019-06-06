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
  ArrayCreationExpression,
  ArrayIntrinsicExpression,
  ArrayToken,
  DictionaryIntrinsicExpression,
  DictToken,
  Node,
  ElementInitializer,
  IPHPArray,
  LeftBracketToken,
  LeftParenToken,
  ListItem,
  RightBracketToken,
  RightParenToken,
  Script,
  VecToken,
  VectorIntrinsicExpression,
};
use namespace HH\Lib\C;
use function Facebook\HHAST\Missing;

final class NoPHPArrayLiteralsLinter extends AutoFixingASTLinter {
  const type TNode = IPHPArray;
  const type TContext = Script;

  <<__Override>>
  public function getLintErrorForNode(
    Script $_context,
    IPHPArray $expr,
  ): ?ASTLintError {
    return new ASTLintError(
      $this,
      'Do not use PHP array literals, use Hack arrays instead.',
      $expr,
      () ==> $this->getFixedNode($expr),
    );
  }

  public function getFixedNode(IPHPArray $expr): Node {
    // Cannot use getDescendantsOfType(ElementInitializer::class) because an
    // associative array inside a list array would return a false positive.
    $is_assoc = false;
    foreach ($expr->getChildren() as $child) {
      if ($child->isList()) {
        foreach ($child->getChildren() as $item) {
          if (
            $item instanceof ListItem &&
            C\any(
              $item->getChildren(),
              $child ==> $child instanceof ElementInitializer,
            )
          ) {
            $is_assoc = true;
            break;
          }
        }
      }

      if ($is_assoc) {
        break;
      }
    }

    $children = vec($expr->getChildren());

    if ($expr instanceof ArrayCreationExpression && C\count($children) === 3) {
      list($left, $list, $right) = $children;
      if (
        $left instanceof LeftBracketToken &&
        $list->isList() &&
        $right instanceof RightBracketToken
      ) {
        if ($is_assoc) {
          return new DictionaryIntrinsicExpression(
            new DictToken($left->getLeading(), Missing()),
            Missing(),
            $left->without($left->getLeading()),
            $list,
            $right,
          );
        } else {
          return new VectorIntrinsicExpression(
            new VecToken($left->getLeading(), Missing()),
            Missing(),
            $left->without($left->getLeading()),
            $list,
            $right,
          );
        }
      }
    }

    if ($expr instanceof ArrayIntrinsicExpression && C\count($children) === 4) {
      list($array, $left, $list, $right) = $children;
      if (
        $array instanceof ArrayToken &&
        $left instanceof LeftParenToken &&
        $list->isList() &&
        $right instanceof RightParenToken
      ) {
        if ($is_assoc) {
          return new DictionaryIntrinsicExpression(
            new DictToken($array->getLeading(), $array->getTrailing()),
            Missing(),
            new LeftBracketToken($left->getLeading(), $left->getTrailing()),
            $list,
            new RightBracketToken($right->getLeading(), $right->getTrailing()),
          );
        } else {
          return new VectorIntrinsicExpression(
            new VecToken($array->getLeading(), $array->getTrailing()),
            Missing(),
            new LeftBracketToken($left->getLeading(), $left->getTrailing()),
            $list,
            new RightBracketToken($right->getLeading(), $right->getTrailing()),
          );
        }
      }
    }

    return $expr;
  }
}
