/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<0478bc8e43340045f0e8102e020c6aab>>
 */
namespace Facebook\HHAST;

final class SingleQuotedStringLiteralToken extends TokenWithVariableText
  implements
    IStringLiteral {

  const string KIND = 'single_quoted_string_literal';

  public function __construct(
    ?NodeList<Trivia> $leading,
    ?NodeList<Trivia> $trailing,
    string $text,
    ?__Private\SourceRef $source_ref = null,
  ) {
    parent::__construct($leading, $trailing, $text, $source_ref);
  }
}
