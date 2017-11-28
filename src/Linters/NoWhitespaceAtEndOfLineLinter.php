<?hh // strict
/**
 * Copyright (c) 2017, Facebook, Inc.
 * All rights reserved.
 *
 * This source code is licensed under the BSD-style license found in the
 * LICENSE file in the root directory of this source tree. An additional
 * grant of patent rights can be found in the PATENTS file in the same
 * directory.
 *
 */

namespace Facebook\HHAST\Linters;

use type Facebook\HHAST\{
  EditableNode,
  EditableList,
  EditableToken,
  EndOfLine,
  WhiteSpace,
};

use namespace HH\Lib\{C, Str, Vec};

class NoWhitespaceAtEndOfLineLinter extends AutoFixingASTLinter<EditableToken> {

  const string ERR_MSG = 'trailing whitespace at end of line';

  <<__Override>>
  protected static function getTargetType(): classname<EditableToken> {
    return EditableToken::class;
  }

  <<__Override>>
  public function getLintErrorForNode(
    EditableToken $node,
    vec<EditableNode> $parents,
  ): ?FixableASTLintError<EditableToken> {

    $leading = $node->getLeading();
    if (!$leading->isMissing() && $leading instanceof EditableList) {

      $children = $leading->getChildren();
      $last = null;

      foreach ($children as $k => $child) {

        if ($child instanceof EndOfLine && $last instanceof WhiteSpace) {

          return new FixableASTLintError(
            $this,
            NoWhitespaceAtEndOfLineLinter::ERR_MSG,
            $node,
          );
        }

        $last = $child;
      }
    }

    $trailing = $node->getTrailing();
    if (!$trailing->isMissing() && $trailing instanceof EditableList) {

      $children = $trailing->getChildren();
      $last = null;

      foreach ($children as $k => $child) {

        if ($child instanceof EndOfLine && $last instanceof WhiteSpace) {

          return new FixableASTLintError(
            $this,
            NoWhitespaceAtEndOfLineLinter::ERR_MSG,
            $node,
          );
        }

        $last = $child;
      }
    }

    return null;
  }

  <<__Override>>
  public function getFixedNode(EditableToken $node): EditableToken {

    $leading = $node->getLeading();
    if (!$leading->isMissing() && $leading instanceof EditableList) {

      $children = $leading->getChildren();
      $last = null;
      $new_leading = vec[];

      foreach ($children as $k => $child) {

        if ($child instanceof EndOfLine && $last instanceof WhiteSpace) {
          $new_leading = Vec\take($new_leading, C\count($new_leading) - 1);
        }

        $last = $child;
        $new_leading[] = $child;
      }

      $node = $node->withLeading(new EditableList($new_leading));
    }

    $trailing = $node->getTrailing();
    if (!$trailing->isMissing() && $trailing instanceof EditableList) {

      $children = $trailing->getChildren();
      $last = null;
      $new_trailing = vec[];

      foreach ($children as $k => $child) {

        if ($child instanceof EndOfLine && $last instanceof WhiteSpace) {
          $new_trailing = Vec\take($new_trailing, C\count($new_trailing) - 1);
        }

        $last = $child;
        $new_trailing[] = $child;
      }

      $node = $node->withTrailing(new EditableList($new_trailing));
    }

    return $node;
  }
}
