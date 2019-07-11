/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<525044494ed12af54a79e7d080d8ce77>>
 */
namespace Facebook\HHAST;

final class HaltCompilerToken extends TokenWithVariableText {

  const string KIND = '__halt_compiler';

  public function __construct(
    ?NodeList<Trivia> $leading,
    ?NodeList<Trivia> $trailing,
    string $token_text = '__halt_compiler',
    ?__Private\SourceRef $source_ref = null,
  ) {
    parent::__construct($leading, $trailing, $token_text, $source_ref);
  }
}
