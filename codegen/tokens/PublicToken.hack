/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<3489de5658e75fb2e5b5a8150b1936ba>>
 */
namespace Facebook\HHAST;

final class PublicToken extends TokenWithVariableText {

  const string KIND = 'public';

  public function __construct(
    ?NodeList<Trivia> $leading,
    ?NodeList<Trivia> $trailing,
    string $token_text = 'public',
    ?__Private\SourceRef $source_ref = null,
  ) {
    parent::__construct($leading, $trailing, $token_text, $source_ref);
  }
}
