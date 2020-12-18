/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<d98e953954a805cb9fdf4581bd6ffc80>>
 */
namespace Facebook\HHAST;

final class CtxToken extends TokenWithVariableText {

  const string KIND = 'ctx';

  public function __construct(
    ?NodeList<Trivia> $leading,
    ?NodeList<Trivia> $trailing,
    string $token_text = 'ctx',
    ?__Private\SourceRef $source_ref = null,
  ) {
    parent::__construct($leading, $trailing, $token_text, $source_ref);
  }
}
