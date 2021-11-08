/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<92f8bc1ce6382b4a8cf6fd3c1570293f>>
 */
namespace Facebook\HHAST;

final class FinallyToken extends TokenWithVariableText {

  const string KIND = 'finally';

  public function __construct(
    ?NodeList<Trivia> $leading,
    ?NodeList<Trivia> $trailing,
    string $token_text = 'finally',
    ?__Private\SourceRef $source_ref = null,
  ) {
    parent::__construct($leading, $trailing, $token_text, $source_ref);
  }
}
