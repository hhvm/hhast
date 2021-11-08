/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<a9a0ad9dfcf6661ac555b006596c771c>>
 */
namespace Facebook\HHAST;

final class DoubleQuotedStringLiteralHeadToken extends TokenWithVariableText {

  const string KIND = 'double_quoted_string_literal_head';

  public function __construct(
    ?NodeList<Trivia> $leading,
    ?NodeList<Trivia> $trailing,
    string $text,
    ?__Private\SourceRef $source_ref = null,
  ) {
    parent::__construct($leading, $trailing, $text, $source_ref);
  }
}
