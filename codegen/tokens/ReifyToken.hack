/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<c62550ec4bbd2ed5e580f8849459ae46>>
 */
namespace Facebook\HHAST;

final class ReifyToken extends TokenWithVariableText {

  const string KIND = 'reify';

  public function __construct(
    ?NodeList<Trivia> $leading,
    ?NodeList<Trivia> $trailing,
    string $token_text = 'reify',
    ?__Private\SourceRef $source_ref = null,
  ) {
    parent::__construct($leading, $trailing, $token_text, $source_ref);
  }
}
