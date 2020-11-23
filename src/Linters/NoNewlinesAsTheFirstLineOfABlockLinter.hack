/*
 *  Copyright (c) 2017-present, Facebook, Inc.
 *  All rights reserved.
 *
 *  This source code is licensed under the MIT license found in the
 *  LICENSE file in the root directory of this source tree.
 *
 */

namespace Facebook\HHAST;

use namespace HH\Lib\{C, Str, Vec};

final class NoNewlineAsTheFirstLineOfABlockLinter extends AutoFixingASTLinter {
  <<__Reifiable>>
  const type TConfig = shape(
    'permit_newlines_after' => vec<string>,
  );

  const type TNode = LeftBraceToken;
  // Using IStatement here to get the ifs and whiles easier
  // would not work for class, interface, etc..
  // We therefore walk backwards through the tokens instead.
  const type TContext = Script;

  <<__Override>>
  public function getLintErrorForNode(
    this::TContext $_context,
    this::TNode $left_brace,
  ): ?ASTLintError {
    $ast = $this->getAST();
    $next_leading = $ast->getNextToken($left_brace);
    if ($next_leading is null) {
      return null;
    }

    $text = static::travialistToString($left_brace->getTrailing());
    $text .= static::travialistToString($next_leading->getLeading());

    if (!Str\starts_with($text, \PHP_EOL.\PHP_EOL)) {
      return null;
    }

    $previous_blockish_token = $ast->getPreviousTokenWhere(
      $left_brace,
      $token ==> $token is CatchToken ||
        $token is ClassToken ||
        $token is ConcurrentToken ||
        $token is ElseifToken ||
        $token is ElseToken ||
        $token is EnumToken ||
        // `==>` is for statement bodied lambda's.
        // This can create some false results for syntax like this.
        // `if ((() ==> 1)()) {\n\n}`, since we find the `==>` before the `if`.
        $token is EqualEqualGreaterThanToken ||
        $token is FinallyToken ||
        $token is ForeachToken ||
        $token is ForToken ||
        $token is FunctionToken ||
        $token is IfToken ||
        $token is LeftBraceToken ||
        $token is NamespaceToken ||
        $token is SemicolonToken ||
        $token is SwitchToken ||
        $token is TryToken ||
        $token is UsingToken ||
        $token is WhileToken,
    );

    if (
      $previous_blockish_token is null ||
      $previous_blockish_token is LeftBraceToken ||
      $previous_blockish_token is SemicolonToken
    ) {
      // If null, we reached the start of the file before finding a token.
      // If we found a `;` or a `{`, chances are great that an unknown block type
      // was introduced or that we were inside a "useless" statement list f.e.
      // $b = 0;
      // {
      //   $a = 0;
      // }
      return null;
    }

    if (
      C\contains_key(
        $this->getPermittedBlockTypes(),
        $previous_blockish_token->getTokenKind(),
      )
    ) {
      return null;
    }

    return new ASTLintError(
      $this,
      'Do not start a codeblock with a blank line.',
      $next_leading,
      () ==> $this->getFixedNode($next_leading),
    );
  }

  <<__Memoize>>
  private function getPermittedBlockTypes(): keyset<string> {
    return $this->getConfig()
      |> $$ is null ? keyset[] : keyset($$['permit_newlines_after']);
  }

  public function getFixedNode(Token $next_token_over): Token {
    $new_leading = $next_token_over->getLeading()->toVec()
      |> new Vector($$)
      |> $$->skipWhile($t ==> $t is EndOfLine)
      |> new NodeList(vec($$));

    return $next_token_over->withLeading($new_leading);
  }

  private static function travialistToString(NodeList<Trivia> $trivia): string {
    return Vec\map($trivia->toVec(), $t ==> $t->getText()) |> Str\join($$, '');
  }
}
