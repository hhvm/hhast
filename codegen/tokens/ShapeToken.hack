/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<56febb341eb089d7bff237aea7c75743>>
 */
namespace Facebook\HHAST;

final class ShapeToken extends TokenWithVariableText {

  const string KIND = 'shape';

  public function __construct(
    ?NodeList<Trivia> $leading,
    ?NodeList<Trivia> $trailing,
    string $token_text = 'shape',
    ?__Private\SourceRef $source_ref = null,
  ) {
    parent::__construct($leading, $trailing, $token_text, $source_ref);
  }
}
