/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<86ab3afa11b130a91aa38a468720c4b6>>
 */
namespace Facebook\HHAST;

final class RecordToken extends TokenWithVariableText {

  const string KIND = 'recordname';

  public function __construct(
    ?NodeList<Trivia> $leading,
    ?NodeList<Trivia> $trailing,
    string $token_text = 'recordname',
    ?__Private\SourceRef $source_ref = null,
  ) {
    parent::__construct($leading, $trailing, $token_text, $source_ref);
  }
}
