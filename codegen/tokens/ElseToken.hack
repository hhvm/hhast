/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<93e12602ac4ba01ceeb700774b4605c8>>
 */
namespace Facebook\HHAST;

final class ElseToken extends TokenWithVariableText {

  const string KIND = 'else';

  public function __construct(
    ?NodeList<Trivia> $leading,
    ?NodeList<Trivia> $trailing,
    string $token_text = 'else',
    ?__Private\SourceRef $source_ref = null,
  ) {
    parent::__construct($leading, $trailing, $token_text, $source_ref);
  }
}
