/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<eb9f8e6db79d13bd30df360bbe822ffa>>
 */
namespace Facebook\HHAST;

final class ArraykeyToken extends TokenWithVariableText {

  const string KIND = 'arraykey';

  public function __construct(
    ?NodeList<Trivia> $leading,
    ?NodeList<Trivia> $trailing,
    string $token_text = 'arraykey',
    ?__Private\SourceRef $source_ref = null,
  ) {
    parent::__construct($leading, $trailing, $token_text, $source_ref);
  }
}
