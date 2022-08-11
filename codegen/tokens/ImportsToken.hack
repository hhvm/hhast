/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<04e5f0cbb9ffebdb04a84f7fb3b4128e>>
 */
namespace Facebook\HHAST;

final class ImportsToken extends TokenWithVariableText {

  const string KIND = 'imports';

  public function __construct(
    ?NodeList<Trivia> $leading,
    ?NodeList<Trivia> $trailing,
    string $token_text = 'imports',
    ?__Private\SourceRef $source_ref = null,
  ) {
    parent::__construct($leading, $trailing, $token_text, $source_ref);
  }
}
