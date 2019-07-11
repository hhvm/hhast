/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<9fc300d0fe0d15f55eb28ef249364781>>
 */
namespace Facebook\HHAST;

final class SuspendToken extends TokenWithVariableText {

  const string KIND = 'suspend';

  public function __construct(
    ?NodeList<Trivia> $leading,
    ?NodeList<Trivia> $trailing,
    string $token_text = 'suspend',
    ?__Private\SourceRef $source_ref = null,
  ) {
    parent::__construct($leading, $trailing, $token_text, $source_ref);
  }
}
