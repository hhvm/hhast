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
  DictToken,
  EditableList,
  EditableNode,
  ElementInitializer,
  LeftBracketToken,
  LeftParenToken,
  ListItem,
  RightBracketToken,
  RightParenToken,
  VecToken,
};
use namespace HH\Lib\{C, Vec};
use function Facebook\HHAST\Missing;

final class NoPHPArrayLiteralsLinter extends AutoFixingASTLinter<EditableNode> {
  <<__Override>>
  protected static function getTargetType(): classname<EditableNode> {
    return EditableNode::class;
  }

  <<__Override>>
  public function getLintErrorForNode(
    EditableNode $expr,
    vec<EditableNode> $_parents,
  ): ?ASTLintError<EditableNode> {
    if ($expr is ArrayCreationExpression || $expr is ArrayIntrinsicExpression) {
      return new ASTLintError(
        $this,
        'Do not use PHP array literals, use Hack arrays instead.',
        $expr,
      );
    }

    return null;
  }

  <<__Override>>
  public function getFixedNode(EditableNode $expr): EditableNode {
    /**
     * Cannot use getDescendantsOfType(ElementInitializer::class) because an
     * associative array inside a list array would return a false positive.
     */
    $is_assoc = false;
    foreach ($expr->getChildren() as $child) {
      if ($child is EditableList<_>) {
        foreach ($child->getChildren() as $item) {
          if ($item is ListItem) {
            foreach ($item->getChildren() as $initializer) {
              if ($initializer is ElementInitializer) {
                $is_assoc = true;
                break;
              }
            }
          }

          if ($is_assoc) {
            break;
          }
        }
      }

      if ($is_assoc) {
        break;
      }
    }

    $children = vec($expr->getChildren());

    if (
      $expr is ArrayCreationExpression &&
      C\count($children) === 3 &&
      $children[0] is LeftBracketToken &&
      $children[1] is EditableList<_> &&
      $children[2] is RightBracketToken
    ) {
      $left = $children[0] as LeftBracketToken;
      $list = $children[1] as EditableList<_>;
      $right = $children[2] as RightBracketToken;

      if ($is_assoc) {
        return new DictToken(
          $left->getLeading(),
          new EditableList(Vec\concat(
            vec[new LeftBracketToken(Missing(), $left->getTrailing())],
            $list->getChildren(),
            vec[new RightBracketToken(
              $right->getLeading(),
              $right->getTrailing(),
            )],
          )),
        );
      } else {
        return new VecToken(
          $left->getLeading(),
          new EditableList(Vec\concat(
            vec[new LeftBracketToken(Missing(), $left->getTrailing())],
            $list->getChildren(),
            vec[new RightBracketToken(
              $right->getLeading(),
              $right->getTrailing(),
            )],
          )),
        );
      }
    }

    if (
      $expr is ArrayIntrinsicExpression &&
      C\count($children) === 4 &&
      $children[0] is ArrayToken &&
      $children[1] is LeftParenToken &&
      $children[2] is EditableList<_> &&
      $children[3] is RightParenToken
    ) {
      return $expr->rewriteChildren(
        ($node, $_parents) ==> {
          if ($node is ArrayToken) {
            if ($is_assoc) {
              return new DictToken($node->getLeading(), $node->getTrailing());
            } else {
              return new VecToken($node->getLeading(), $node->getTrailing());
            }
          }
          if ($node is LeftParenToken) {
            return new LeftBracketToken(
              $node->getLeading(),
              $node->getTrailing(),
            );
          }
          if ($node is RightParenToken) {
            return new RightBracketToken(
              $node->getLeading(),
              $node->getTrailing(),
            );
          }
          return $node;
        },
        vec[],
      );
    }

    return $expr;
  }
}
