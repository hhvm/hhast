/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<90e22e44ed77a61f775b939aa4ebe2c0>>
 */
namespace Facebook\HHAST;

final class ObjectToken extends TokenWithVariableText {

  const string KIND = 'object';

  public function __construct(
    ?NodeList<Trivia> $leading,
    ?NodeList<Trivia> $trailing,
    string $token_text = 'object',
    ?__Private\SourceRef $source_ref = null,
  ) {
    parent::__construct($leading, $trailing, $token_text, $source_ref);
  }
}
