/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<2d9b3eb2dbe67b67d445d3a57bb953d6>>
 */
namespace Facebook\HHAST;

final class IntToken extends TokenWithVariableText {

  const string KIND = 'int';

  public function __construct(
    ?NodeList<Trivia> $leading,
    ?NodeList<Trivia> $trailing,
    string $token_text = 'int',
    ?__Private\SourceRef $source_ref = null,
  ) {
    parent::__construct($leading, $trailing, $token_text, $source_ref);
  }
}
