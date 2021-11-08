/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<8f9d90fd89595ae691a0cf3452150823>>
 */
namespace Facebook\HHAST;

final class ImplementsToken extends TokenWithVariableText {

  const string KIND = 'implements';

  public function __construct(
    ?NodeList<Trivia> $leading,
    ?NodeList<Trivia> $trailing,
    string $token_text = 'implements',
    ?__Private\SourceRef $source_ref = null,
  ) {
    parent::__construct($leading, $trailing, $token_text, $source_ref);
  }
}
