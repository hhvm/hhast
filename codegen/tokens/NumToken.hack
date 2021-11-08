/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<53811d5216c2a7d517add6b79b129d8a>>
 */
namespace Facebook\HHAST;

final class NumToken extends TokenWithVariableText {

  const string KIND = 'num';

  public function __construct(
    ?NodeList<Trivia> $leading,
    ?NodeList<Trivia> $trailing,
    string $token_text = 'num',
    ?__Private\SourceRef $source_ref = null,
  ) {
    parent::__construct($leading, $trailing, $token_text, $source_ref);
  }
}
