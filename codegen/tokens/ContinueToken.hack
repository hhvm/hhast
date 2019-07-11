/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<deb2e4bb309d53538abb5c865fee1827>>
 */
namespace Facebook\HHAST;

final class ContinueToken extends TokenWithVariableText {

  const string KIND = 'continue';

  public function __construct(
    ?NodeList<Trivia> $leading,
    ?NodeList<Trivia> $trailing,
    string $token_text = 'continue',
    ?__Private\SourceRef $source_ref = null,
  ) {
    parent::__construct($leading, $trailing, $token_text, $source_ref);
  }
}
