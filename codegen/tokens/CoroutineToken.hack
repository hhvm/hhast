/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<9011fc630960f7af829f90d5910ec041>>
 */
namespace Facebook\HHAST;

final class CoroutineToken extends TokenWithVariableText {

  const string KIND = 'coroutine';

  public function __construct(
    ?NodeList<Trivia> $leading,
    ?NodeList<Trivia> $trailing,
    string $token_text = 'coroutine',
    ?__Private\SourceRef $source_ref = null,
  ) {
    parent::__construct($leading, $trailing, $token_text, $source_ref);
  }
}
