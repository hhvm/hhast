/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<fb7a51f9a4b6890eb2522782de914440>>
 */
namespace Facebook\HHAST;

final class IsToken extends TokenWithVariableText {

  const string KIND = 'is';

  public function __construct(
    ?NodeList<Trivia> $leading,
    ?NodeList<Trivia> $trailing,
    string $token_text = 'is',
    ?__Private\SourceRef $source_ref = null,
  ) {
    parent::__construct($leading, $trailing, $token_text, $source_ref);
  }
}
