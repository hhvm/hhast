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
            $item is ListItem<_> &&
            C\any($item->getChildren(), $child ==> $child is ElementInitializer)
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

    if ($expr is ArrayCreationExpression && C\count($children) === 3) {
      list($left, $list, $right) = $children;
      if (
        $left is LeftBracketToken &&
        $list->isList() &&
        $right is RightBracketToken
      ) {
        if ($is_assoc) {
          return new DictionaryIntrinsicExpression(
            new DictToken($left->getLeading(), null),
            null,
            $left->withLeading(null),
            /* HH_FIXME[4110] */ $list,
            $right,
          );
        } else {
          return new VectorIntrinsicExpression(
            new VecToken($left->getLeading(), null),
            null,
            $left->withLeading(null),
            /* HH_FIXME[4110] */ $list,
            $right,
          );
        }
      }
    }

    if ($expr is ArrayIntrinsicExpression && C\count($children) === 4) {
      list($array, $left, $list, $right) = $children;
      if (
        $array is ArrayToken &&
        $left is LeftParenToken &&
        $list->isList() &&
        $right is RightParenToken
      ) {
        if ($is_assoc) {
          return new DictionaryIntrinsicExpression(
            new DictToken($array->getLeading(), $array->getTrailing()),
            null,
            new LeftBracketToken($left->getLeading(), $left->getTrailing()),
            /* HH_FIXME[4110] */ $list,
            new RightBracketToken($right->getLeading(), $right->getTrailing()),
          );
        } else {
          return new VectorIntrinsicExpression(
            new VecToken($array->getLeading(), $array->getTrailing()),
            null,
            new LeftBracketToken($left->getLeading(), $left->getTrailing()),
            /* HH_FIXME[4110] */ $list,
            new RightBracketToken($right->getLeading(), $right->getTrailing()),
          );
        }
      }
    }

    return $expr;
  }
}
