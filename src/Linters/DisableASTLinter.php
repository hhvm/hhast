<?hh // strict
/**
 * Copyright (c) 2016, Facebook, Inc.
 * All rights reserved.
 *
 * This source code is licensed under the BSD-style license found in the
 * LICENSE file in the root directory of this source tree. An additional
 * grant of patent rights can be found in the PATENTS file in the same
 * directory.
 *
 */

namespace Facebook\HHAST\Linters;

use type Facebook\HHAST\EditableNode;
use type Facebook\HHAST\EditableToken;
use type Facebook\HHAST\IControlFlowStatement;
use type Facebook\HHAST\BreakStatement;
use type Facebook\HHAST\ContinueStatement;
use type Facebook\HHAST\EchoStatement;
use type Facebook\HHAST\GotoStatement;
use type Facebook\HHAST\ReturnStatement;
use type Facebook\HHAST\ThrowStatement;
use type Facebook\HHAST\TryStatement;
use type Facebook\HHAST\UnsetStatement;
use namespace Facebook\HHAST;
use namespace HH\Lib\Str;
use namespace HH\Lib\Vec;
use namespace HH\Lib\C;

class DisableASTLinter {

  /**
   * Allow users to disable either all linter errors of this type in a file or
   * specific cases where a linter is used.
   **/
  public function isLinterDisabled(
    BaseLinter $linter,
    EditableNode $node,
    vec<EditableNode> $parents,
    LintError $error
  ): bool {
    $token = $node->getFirstToken();
    $fixme = $linter->markerFixMe();
    $ignore = $linter->markerIgnoreError();
    
    return $this->isDisabledInCurrentNode($token, $fixme, $ignore) || 
      $this->isDisabledInSiblingNode($parents, $fixme, $ignore) ||
      $this->isDisabledInUpToStatement($parents, $fixme, $ignore);
  }

  // Check the current token's leading trivia. For example a comment on the line before
  protected function isDisabledInCurrentNode(?EditableToken $token, string $fixme, string $ignore): bool {
    if ($token === null) {
      return false;
    }

    $leading = $token->getLeading()->getCode();
    return Str\contains($leading, $fixme) || Str\contains($leading, $ignore);
  }

  // Check sibling node as the comment might be attached there instead of on the current node
  protected function isDisabledInSiblingNode(vec<EditableNode> $parents, string $fixme, string $ignore): bool {
    $parent = C\last($parents);
    if ($parent == null) {
      return false;
    }

    $sibling = C\first($parent->getChildren());
    if ($sibling == null) {
      return false;
    }

    $token = $sibling->getLastToken();
    if ($token !== null) {
      $trailing = $token->getTrailing()->getCode();

      if (Str\contains($trailing, $fixme) || Str\contains($trailing, $ignore)){
        return true;
      }
    }

    return false;
  }

  // Walk up the parents and check the leading trivia until we hit a Statement type node.
  protected function isDisabledInUpToStatement(vec<EditableNode> $parents, string $fixme, string $ignore): bool {
    $parents = Vec\reverse($parents);

    foreach($parents as $parent){
      if ($parent instanceof IControlFlowStatement ||
        $parent instanceof BreakStatement ||
        $parent instanceof ContinueStatement ||
        $parent instanceof EchoStatement ||
        $parent instanceof GotoStatement ||
        $parent instanceof ReturnStatement ||
        $parent instanceof ThrowStatement ||
        $parent instanceof TryStatement ||
        $parent instanceof UnsetStatement
      ) {
        return false;
      }

      $token = $parent->getFirstToken();
      if ($token !== null) {
        $leading = $token->getCode();
        if (Str\contains($leading, $fixme) || Str\contains($leading, $ignore)){
          return true;
        }
      }
    }

    return false;
  }

}
