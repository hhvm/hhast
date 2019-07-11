/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<4dbac2d7f16a6a85b6b115c3536c3da5>>
 */
namespace Facebook\HHAST;

final class ProtectedToken extends TokenWithVariableText {

  const string KIND = 'protected';

  public function __construct(
    ?NodeList<Trivia> $leading,
    ?NodeList<Trivia> $trailing,
    string $token_text = 'protected',
    ?__Private\SourceRef $source_ref = null,
  ) {
    parent::__construct($leading, $trailing, $token_text, $source_ref);
  }
}
