/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<465c124dd0db7f73f5b04b88ad84fa13>>
 */
namespace Facebook\HHAST;

final class BinaryToken extends TokenWithVariableText {

  const string KIND = 'binary';

  public function __construct(
    ?NodeList<Trivia> $leading,
    ?NodeList<Trivia> $trailing,
    string $token_text = 'binary',
    ?__Private\SourceRef $source_ref = null,
  ) {
    parent::__construct($leading, $trailing, $token_text, $source_ref);
  }
}
