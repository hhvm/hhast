/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<3968e67b625304a52ae1cfa71b826e80>>
 */
namespace Facebook\HHAST;

final class FloatingLiteralToken extends TokenWithVariableText {

  const string KIND = 'floating_literal';

  public function __construct(
    ?NodeList<Trivia> $leading,
    ?NodeList<Trivia> $trailing,
    string $text,
    ?__Private\SourceRef $source_ref = null,
  ) {
    parent::__construct($leading, $trailing, $text, $source_ref);
  }
}
