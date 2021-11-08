/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<57d5dab1aeac0ed98fd831363ea34dfc>>
 */
namespace Facebook\HHAST;

final class BooleanToken extends TokenWithVariableText {

  const string KIND = 'boolean';

  public function __construct(
    ?NodeList<Trivia> $leading,
    ?NodeList<Trivia> $trailing,
    string $token_text = 'boolean',
    ?__Private\SourceRef $source_ref = null,
  ) {
    parent::__construct($leading, $trailing, $token_text, $source_ref);
  }
}
