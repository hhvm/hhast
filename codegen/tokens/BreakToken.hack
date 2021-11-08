/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<29c5db3372605466181a216318288fc9>>
 */
namespace Facebook\HHAST;

final class BreakToken extends TokenWithVariableText {

  const string KIND = 'break';

  public function __construct(
    ?NodeList<Trivia> $leading,
    ?NodeList<Trivia> $trailing,
    string $token_text = 'break',
    ?__Private\SourceRef $source_ref = null,
  ) {
    parent::__construct($leading, $trailing, $token_text, $source_ref);
  }
}
