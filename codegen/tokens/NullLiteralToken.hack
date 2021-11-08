/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<13ebe764e9c41dff819d4f4f773a45fa>>
 */
namespace Facebook\HHAST;

final class NullLiteralToken extends TokenWithVariableText {

  const string KIND = 'null';

  public function __construct(
    ?NodeList<Trivia> $leading,
    ?NodeList<Trivia> $trailing,
    string $token_text = 'null',
    ?__Private\SourceRef $source_ref = null,
  ) {
    parent::__construct($leading, $trailing, $token_text, $source_ref);
  }
}
