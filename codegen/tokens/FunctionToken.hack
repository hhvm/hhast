/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<f0578ca87bb31ae40dd5afa19b0fc689>>
 */
namespace Facebook\HHAST;

final class FunctionToken extends TokenWithVariableText {

  const string KIND = 'function';

  public function __construct(
    ?NodeList<Trivia> $leading,
    ?NodeList<Trivia> $trailing,
    string $token_text = 'function',
    ?__Private\SourceRef $source_ref = null,
  ) {
    parent::__construct($leading, $trailing, $token_text, $source_ref);
  }
}
