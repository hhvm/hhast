/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<64ce97170d6edf4d99e65bad6a5317cc>>
 */
namespace Facebook\HHAST;

final class StringToken extends TokenWithVariableText {

  const string KIND = 'string';

  public function __construct(
    ?NodeList<Trivia> $leading,
    ?NodeList<Trivia> $trailing,
    string $token_text = 'string',
    ?__Private\SourceRef $source_ref = null,
  ) {
    parent::__construct($leading, $trailing, $token_text, $source_ref);
  }
}
