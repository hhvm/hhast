/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<8f834d22f608bd7a8114bd197ff1c465>>
 */
namespace Facebook\HHAST;

final class InoutToken extends TokenWithVariableText {

  const string KIND = 'inout';

  public function __construct(
    ?NodeList<Trivia> $leading,
    ?NodeList<Trivia> $trailing,
    string $token_text = 'inout',
    ?__Private\SourceRef $source_ref = null,
  ) {
    parent::__construct($leading, $trailing, $token_text, $source_ref);
  }
}
