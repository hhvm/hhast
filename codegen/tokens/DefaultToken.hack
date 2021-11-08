/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<8de99707312f17437df4abfa659f9c28>>
 */
namespace Facebook\HHAST;

final class DefaultToken extends TokenWithVariableText {

  const string KIND = 'default';

  public function __construct(
    ?NodeList<Trivia> $leading,
    ?NodeList<Trivia> $trailing,
    string $token_text = 'default',
    ?__Private\SourceRef $source_ref = null,
  ) {
    parent::__construct($leading, $trailing, $token_text, $source_ref);
  }
}
