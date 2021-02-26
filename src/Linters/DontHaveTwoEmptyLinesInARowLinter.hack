/*
 *  Copyright (c) 2017-present, Facebook, Inc.
 *  All rights reserved.
 *
 *  This source code is licensed under the MIT license found in the
 *  LICENSE file in the root directory of this source tree.
 *
 */

namespace Facebook\HHAST;

final class DontHaveTwoEmptyLinesInARowLinter extends AutoFixingASTLinter {
  const type TContext = Token;
  const type TNode = EndOfLine;

  <<__Override>>
  public function getLintErrorForNode(
    this::TContext $token,
    this::TNode $eol,
  ): ?ASTLintError {
    $eol_count = $this->getAST()
      ->getPreviousToken($token)
      ?->getTrailing()
      ?->getLast()
      |> $$ is EndOfLine ? 1 : 0;

    foreach ($token->getLeading()->toVec() as $trivia) {
      if ($trivia is EndOfLine) {
        $eol_count++;
        if ($eol_count >= 3 && $trivia === $eol) {
          return new ASTLintError(
            $this,
            "Don't have two empty lines in a row",
            $token,
            () ==> static::removeLeading($token, $trivia),
          );
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
        if ($eol_count >= 3 && $trivia === $eol) {
          return new ASTLintError(
            $this,
            "Don't have two empty lines in a row",
            $token,
            () ==> static::removeTrailing($token, $trivia),
          );
        }
      } else {
        $eol_count = 0;
      }
    }

    return null;
  }

  private static function removeLeading(
    this::TContext $token,
    Trivia $trivia,
  ): this::TContext {
    return $token->withLeading($token->getLeading()->withoutChild($trivia));
  }

  private static function removeTrailing(
    this::TContext $token,
    Trivia $trivia,
  ): this::TContext {
    return $token->withTrailing($token->getTrailing()->withoutChild($trivia));
  }
}
