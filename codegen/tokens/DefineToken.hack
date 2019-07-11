/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<50446877c29ab548b5011e1a7368f036>>
 */
namespace Facebook\HHAST;

final class DefineToken extends TokenWithVariableText {

  const string KIND = 'define';

  public function __construct(
    ?NodeList<Trivia> $leading,
    ?NodeList<Trivia> $trailing,
    string $token_text = 'define',
    ?__Private\SourceRef $source_ref = null,
  ) {
    parent::__construct($leading, $trailing, $token_text, $source_ref);
  }
}
