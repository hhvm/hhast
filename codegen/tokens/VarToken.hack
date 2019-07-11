/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<e3f04859b0c214800b8c33162b8f3056>>
 */
namespace Facebook\HHAST;

final class VarToken extends TokenWithVariableText {

  const string KIND = 'var';

  public function __construct(
    ?NodeList<Trivia> $leading,
    ?NodeList<Trivia> $trailing,
    string $token_text = 'var',
    ?__Private\SourceRef $source_ref = null,
  ) {
    parent::__construct($leading, $trailing, $token_text, $source_ref);
  }
}
