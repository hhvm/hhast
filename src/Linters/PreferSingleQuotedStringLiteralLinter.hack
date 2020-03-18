/*
 *  Copyright (c) 2017-present, Facebook, Inc.
 *  All rights reserved.
 *
 *  This source code is licensed under the MIT license found in the
 *  LICENSE file in the root directory of this source tree.
 *
 */

namespace Facebook\HHAST;

use namespace HH\Lib\{C, Regex, Str};

final class PreferSingleQuotedStringLiteralLinter extends AutoFixingASTLinter {
  const type TContext = Script;
  const type TNode = DoubleQuotedStringLiteralToken;

  const keyset<string> SINGLE_LETTER_ESCS =
    keyset['\\n', '\\r', '\\t', '\\v', '\\e', '\\f'];

  <<__Override>>
  public function getLintErrorForNode(
    this::TContext $_context,
    this::TNode $node,
  ): ?ASTLintError {
    if ($this->isREString($node)) {
      return null;
    }
    $string_contents = $node->getText() |> Str\slice($$, 1, Str\length($$) - 2);
    if ($this->couldHaveBeenASingleQuotedString($string_contents)) {
      return new ASTLintError(
        $this,
        'Prefer a single-quoted string when possible',
        $node,
        () ==> $this->toSingleQuotedString($node),
      );
    }

    return null;
  }

  private function isREString(this::TNode $node): bool {
    $ast = $this->getAST();
    return $ast->getParentOfDescendant($node)
      |> $ast->getParentOfDescendant($$) is PrefixedStringExpression;
  }

  /**
   * @see https://www.php.net/manual/en/language.types.string.php#language.types.string.syntax.double
   */
  private function couldHaveBeenASingleQuotedString(string $contents): bool {
    if (Str\contains($contents, '\'') || Str\contains($contents, '"')) {
      return false;
    }

    $contains_escape_sequence = C\find(
      static::SINGLE_LETTER_ESCS,
      $esc ==> Str\contains($contents, $esc),
    ) is nonnull;

    if ($contains_escape_sequence) {
      return false;
    }

    if (Str\contains($contents, '$')) {
      // This could technically still be save in cases like $4.20
      return false;
    }

    // "\<hexdigit>" "\x" and "\u{<digit>" are valid escape sequences.
    // The regex overfits slightly.
    return !Regex\matches($contents, re"!\\\\(u{)?[0-9a-fA-Fx]!");
  }

  private function toSingleQuotedString(
    this::TNode $double_quoted_string,
  ): SingleQuotedStringLiteralToken {
    $text = $double_quoted_string->getText();
    $text[0] = "'";
    $text[Str\length($text) - 1] = "'";
    return new SingleQuotedStringLiteralToken(
      $double_quoted_string->getLeading(),
      $double_quoted_string->getTrailing(),
      $text,
    );
  }
}
