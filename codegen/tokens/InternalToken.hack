/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<b24d1dfbd581615867080e95c9e51dd7>>
 */
namespace Facebook\HHAST;

final class InternalToken extends TokenWithVariableText {

  const string KIND = 'internal';

  public function __construct(
    ?NodeList<Trivia> $leading,
    ?NodeList<Trivia> $trailing,
    string $token_text = 'internal',
    ?__Private\SourceRef $source_ref = null,
  ) {
    parent::__construct($leading, $trailing, $token_text, $source_ref);
  }
}
