/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<cfee78a109c0803e475311fa5304bd28>>
 */
namespace Facebook\HHAST;

final class HeredocStringLiteralHeadToken extends TokenWithVariableText {

  const string KIND = 'heredoc_string_literal_head';

  public function __construct(
    ?NodeList<Trivia> $leading,
    ?NodeList<Trivia> $trailing,
    string $text,
    ?__Private\SourceRef $source_ref = null,
  ) {
    parent::__construct($leading, $trailing, $text, $source_ref);
  }
}
