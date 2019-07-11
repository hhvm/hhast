/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<352eb48ed47621571832dbe60a09911e>>
 */
namespace Facebook\HHAST;

final class ExtendsToken extends TokenWithVariableText {

  const string KIND = 'extends';

  public function __construct(
    ?NodeList<Trivia> $leading,
    ?NodeList<Trivia> $trailing,
    string $token_text = 'extends',
    ?__Private\SourceRef $source_ref = null,
  ) {
    parent::__construct($leading, $trailing, $token_text, $source_ref);
  }
}
