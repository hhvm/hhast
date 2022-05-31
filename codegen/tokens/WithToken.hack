/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<f477f46c5cd02a8c978d4ede2f50c97f>>
 */
namespace Facebook\HHAST;

final class WithToken extends TokenWithVariableText {

  const string KIND = 'with';

  public function __construct(
    ?NodeList<Trivia> $leading,
    ?NodeList<Trivia> $trailing,
    string $token_text = 'with',
    ?__Private\SourceRef $source_ref = null,
  ) {
    parent::__construct($leading, $trailing, $token_text, $source_ref);
  }
}
