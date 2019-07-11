/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<c6286e5b3e23079ecd5e99d213d1047e>>
 */
namespace Facebook\HHAST;

final class WhereToken extends TokenWithVariableText {

  const string KIND = 'where';

  public function __construct(
    ?NodeList<Trivia> $leading,
    ?NodeList<Trivia> $trailing,
    string $token_text = 'where',
    ?__Private\SourceRef $source_ref = null,
  ) {
    parent::__construct($leading, $trailing, $token_text, $source_ref);
  }
}
