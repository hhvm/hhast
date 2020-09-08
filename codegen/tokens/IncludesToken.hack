/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<20de2eb939dce0777b1bde39b535056e>>
 */
namespace Facebook\HHAST;

final class IncludesToken extends TokenWithVariableText {

  const string KIND = 'includes';

  public function __construct(
    ?NodeList<Trivia> $leading,
    ?NodeList<Trivia> $trailing,
    string $token_text = 'includes',
    ?__Private\SourceRef $source_ref = null,
  ) {
    parent::__construct($leading, $trailing, $token_text, $source_ref);
  }
}
