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

final class DontHaveTwoEmptyLinesInARowLinter extends AutoFixingASTLinter {
  const type TConfig = shape();
  const type TContext = Script;
  const type TNode = Token;

  /**
   * Unlike NoWhitespaceAtEndOfLineLinter and ConsistentLineEndingLinter
   * this linter operates on the AST.
   * It will therefore not change the contents of string literals.
   * This method was added and returns true (the default)
   * to show that it was not forgotten and carefully considered.
   */
  <<__Override>>
  public function allowYesToAll(): bool {
    return true;
  }

  <<__Override>>
  public function getLintErrorForNode(
    this::TContext $context,
    this::TNode $token,
  ): ?ASTLintError {
    if ($this->entireScriptIsClean($context)) {
      return null;
    }

    if (!Str\contains($token->getCode(), \PHP_EOL.\PHP_EOL)) {
      // We check for 2 eols, because the previous token may have the first.
      return null;
    }

    $eol_count = $this->getAST()
      ->getPreviousToken($token)
      ?->getTrailing()
      ?->getLast()
      |> $$ is EndOfLine ? 1 : 0;

    $remove_leading = vec[];
    $remove_trailing = vec[];

    foreach ($token->getLeading()->toVec() as $trivia) {
      if ($trivia is EndOfLine) {
        $eol_count++;
        if ($eol_count >= 3) {
          $remove_leading[] = $trivia;
        }
      } else {
        $eol_count = 0;
      }
    }

    // We don't check the boundary with the next token.
    // This will be checked by the loop above when linting
    // that token instead.
    $eol_count = 0;
    foreach ($token->getTrailing()->toVec() as $trivia) {
      if ($trivia is EndOfLine) {
        $eol_count++;
        if ($eol_count >= 3) {
          $remove_trailing[] = $trivia;
        }
      } else {
        $eol_count = 0;
      }
    }

    if (C\is_empty($remove_leading) && C\is_empty($remove_trailing)) {
      return null;
    }

    return new ASTLintError(
      $this,
      "Don't have two empty lines in a row",
      $token,
      () ==> static::removeTrivia($token, $remove_leading, $remove_trailing),
    );
  }

  <<__Memoize>>
  private function entireScriptIsClean(Script $script): bool {
    return !Str\contains($script->getCode(), \PHP_EOL.\PHP_EOL.\PHP_EOL);
  }

  private static function removeTrivia(
    this::TNode $token,
    vec<Trivia> $leading_trivia,
    vec<Trivia> $trailing_trivia,
  ): this::TNode {
    $leading = $token->getLeading();
    foreach ($leading_trivia as $t) {
      $leading = $leading->withoutChild($t);
    }
    $trailing = $token->getTrailing();
    foreach ($trailing_trivia as $t) {
      $trailing = $trailing->withoutChild($t);
    }
    return $token->withLeading($leading)->withTrailing($trailing);
  }
}
