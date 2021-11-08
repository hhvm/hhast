/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<3b3b37e9fa3c0a6fa88f920f0ae1f828>>
 */
namespace Facebook\HHAST;

final class TraitToken extends TokenWithVariableText {

  const string KIND = 'trait';

  public function __construct(
    ?NodeList<Trivia> $leading,
    ?NodeList<Trivia> $trailing,
    string $token_text = 'trait',
    ?__Private\SourceRef $source_ref = null,
  ) {
    parent::__construct($leading, $trailing, $token_text, $source_ref);
  }
}
