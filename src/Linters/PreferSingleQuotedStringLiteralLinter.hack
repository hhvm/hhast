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

  // hackfmt-ignore
  const keyset<string> SINGLE_LETTER_ESCS = keyset[
    '\\n', '\\r', '\\t', '\\v', '\\e', '\\f'
  ];

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
        'Prefer a string quoted string when possible',
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
   *
   * @license The inline definitions of the Regex patterns come from the PHP manual.
   *          They fall under the license of the php.net website.
   *          https://www.php.net/license/index.php
   *          As of the time of writing, this is the https://creativecommons.org/licenses/by/3.0/legalcode
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

    // the sequence of characters matching the regular expression is a character in octal notation,
    // which silently overflows to fit in a byte (e.g. "\400" === "\000")
    if (Regex\matches($contents, re"!\\\\[0-7]{1,3}!")) {
      return false;
    }

    // the sequence of characters matching the regular expression is a character in hexadecimal notation
    if (Regex\matches($contents, re"!\\\\x[0-9A-Fa-f]{1,2}!")) {
      return false;
    }

    // the sequence of characters matching the regular expression is a Unicode codepoint,
    // which will be output to the string as that codepoint's UTF-8 representation (added in PHP 7.0.0)
    if (Regex\matches($contents, re"!\\\\u{[0-9A-Fa-f]+}!")) {
      return false;
    }

    return true;
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
