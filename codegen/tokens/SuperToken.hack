/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<351aae0ac2af5d441960dc09b1509b4f>>
 */
namespace Facebook\HHAST;

final class SuperToken extends TokenWithVariableText {

  const string KIND = 'super';

  public function __construct(
    ?NodeList<Trivia> $leading,
    ?NodeList<Trivia> $trailing,
    string $token_text = 'super',
    ?__Private\SourceRef $source_ref = null,
  ) {
    parent::__construct($leading, $trailing, $token_text, $source_ref);
  }
}
