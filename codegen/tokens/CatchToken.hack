/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<44a328ca1d56846c7066abaaa73a49c4>>
 */
namespace Facebook\HHAST;

final class CatchToken extends TokenWithVariableText {

  const string KIND = 'catch';

  public function __construct(
    ?NodeList<Trivia> $leading,
    ?NodeList<Trivia> $trailing,
    string $token_text = 'catch',
    ?__Private\SourceRef $source_ref = null,
  ) {
    parent::__construct($leading, $trailing, $token_text, $source_ref);
  }
}
