/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<c8101ff88a5d9ab91bc9159120ff1b6a>>
 */
namespace Facebook\HHAST;

final class KeysetToken extends TokenWithVariableText {

  const string KIND = 'keyset';

  public function __construct(
    ?NodeList<Trivia> $leading,
    ?NodeList<Trivia> $trailing,
    string $token_text = 'keyset',
    ?__Private\SourceRef $source_ref = null,
  ) {
    parent::__construct($leading, $trailing, $token_text, $source_ref);
  }
}
