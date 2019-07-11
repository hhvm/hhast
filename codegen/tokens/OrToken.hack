/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<cc064cc46c598dd24ba768cb104a5e7e>>
 */
namespace Facebook\HHAST;

final class OrToken extends TokenWithVariableText {

  const string KIND = 'or';

  public function __construct(
    ?NodeList<Trivia> $leading,
    ?NodeList<Trivia> $trailing,
    string $token_text = 'or',
    ?__Private\SourceRef $source_ref = null,
  ) {
    parent::__construct($leading, $trailing, $token_text, $source_ref);
  }
}
