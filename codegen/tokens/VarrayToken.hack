/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<9fb2b529e0cb74f676c958b6ef19e8e8>>
 */
namespace Facebook\HHAST;

final class VarrayToken extends TokenWithVariableText {

  const string KIND = 'varray';

  public function __construct(
    ?NodeList<Trivia> $leading,
    ?NodeList<Trivia> $trailing,
    string $token_text = 'varray',
    ?__Private\SourceRef $source_ref = null,
  ) {
    parent::__construct($leading, $trailing, $token_text, $source_ref);
  }
}
