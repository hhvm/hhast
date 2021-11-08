/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<ad9f21396ca9240a51ff9c968dc9a5ab>>
 */
namespace Facebook\HHAST;

final class RequiredToken extends TokenWithVariableText {

  const string KIND = 'required';

  public function __construct(
    ?NodeList<Trivia> $leading,
    ?NodeList<Trivia> $trailing,
    string $token_text = 'required',
    ?__Private\SourceRef $source_ref = null,
  ) {
    parent::__construct($leading, $trailing, $token_text, $source_ref);
  }
}
