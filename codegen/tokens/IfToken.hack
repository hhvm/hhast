/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<17b2ef09e712b6191e22ead1fd8173fc>>
 */
namespace Facebook\HHAST;

final class IfToken extends TokenWithVariableText {

  const string KIND = 'if';

  public function __construct(
    ?NodeList<Trivia> $leading,
    ?NodeList<Trivia> $trailing,
    string $token_text = 'if',
    ?__Private\SourceRef $source_ref = null,
  ) {
    parent::__construct($leading, $trailing, $token_text, $source_ref);
  }
}
