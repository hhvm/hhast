/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<d457cba54606b10be084808ade882e11>>
 */
namespace Facebook\HHAST;

final class CaseToken extends TokenWithVariableText {

  const string KIND = 'case';

  public function __construct(
    ?NodeList<Trivia> $leading,
    ?NodeList<Trivia> $trailing,
    string $token_text = 'case',
    ?__Private\SourceRef $source_ref = null,
  ) {
    parent::__construct($leading, $trailing, $token_text, $source_ref);
  }
}
