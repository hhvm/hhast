/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<7e31701a4e655d83836d868940d5b6cf>>
 */
namespace Facebook\HHAST;

final class PrivateToken extends TokenWithVariableText {

  const string KIND = 'private';

  public function __construct(
    ?NodeList<Trivia> $leading,
    ?NodeList<Trivia> $trailing,
    string $token_text = 'private',
    ?__Private\SourceRef $source_ref = null,
  ) {
    parent::__construct($leading, $trailing, $token_text, $source_ref);
  }
}
