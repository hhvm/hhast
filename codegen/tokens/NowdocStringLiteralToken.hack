/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<d98cf628197de06aaad90a2826d7a129>>
 */
namespace Facebook\HHAST;

final class NowdocStringLiteralToken extends TokenWithVariableText
  implements
    IStringLiteral {

  const string KIND = 'nowdoc_string_literal';

  public function __construct(
    ?NodeList<Trivia> $leading,
    ?NodeList<Trivia> $trailing,
    string $text,
    ?__Private\SourceRef $source_ref = null,
  ) {
    parent::__construct($leading, $trailing, $text, $source_ref);
  }
}
