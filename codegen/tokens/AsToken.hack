/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<c3eb6f0e3e2dd4afe478a23eefcc430e>>
 */
namespace Facebook\HHAST;

final class AsToken extends TokenWithVariableText {

  const string KIND = 'as';

  public function __construct(
    ?NodeList<Trivia> $leading,
    ?NodeList<Trivia> $trailing,
    string $token_text = 'as',
    ?__Private\SourceRef $source_ref = null,
  ) {
    parent::__construct($leading, $trailing, $token_text, $source_ref);
  }
}
