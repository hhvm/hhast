/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<e7f1aa3c109b424db6697b948a51c88c>>
 */
namespace Facebook\HHAST;

final class XorToken extends TokenWithVariableText {

  const string KIND = 'xor';

  public function __construct(
    ?NodeList<Trivia> $leading,
    ?NodeList<Trivia> $trailing,
    string $token_text = 'xor',
    ?__Private\SourceRef $source_ref = null,
  ) {
    parent::__construct($leading, $trailing, $token_text, $source_ref);
  }
}
