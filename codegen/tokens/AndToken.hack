/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<3d010e1f883b021d537cbfb58e0a07d5>>
 */
namespace Facebook\HHAST;

final class AndToken extends TokenWithVariableText {

  const string KIND = 'and';

  public function __construct(
    ?NodeList<Trivia> $leading,
    ?NodeList<Trivia> $trailing,
    string $token_text = 'and',
    ?__Private\SourceRef $source_ref = null,
  ) {
    parent::__construct($leading, $trailing, $token_text, $source_ref);
  }
}
