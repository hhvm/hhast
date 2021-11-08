/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<acdca449ea00281328a130d32ea8350b>>
 */
namespace Facebook\HHAST;

final class CloneToken extends TokenWithVariableText {

  const string KIND = 'clone';

  public function __construct(
    ?NodeList<Trivia> $leading,
    ?NodeList<Trivia> $trailing,
    string $token_text = 'clone',
    ?__Private\SourceRef $source_ref = null,
  ) {
    parent::__construct($leading, $trailing, $token_text, $source_ref);
  }
}
