/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<87fce02349f6d90b674948b899e7e18f>>
 */
namespace Facebook\HHAST;

final class EndifToken extends TokenWithVariableText {

  const string KIND = 'endif';

  public function __construct(
    ?NodeList<Trivia> $leading,
    ?NodeList<Trivia> $trailing,
    string $token_text = 'endif',
    ?__Private\SourceRef $source_ref = null,
  ) {
    parent::__construct($leading, $trailing, $token_text, $source_ref);
  }
}
