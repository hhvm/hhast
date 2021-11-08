/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<9393662147a461e489a34faa9ea583ed>>
 */
namespace Facebook\HHAST;

final class HexadecimalLiteralToken extends TokenWithVariableText {

  const string KIND = 'hexadecimal_literal';

  public function __construct(
    ?NodeList<Trivia> $leading,
    ?NodeList<Trivia> $trailing,
    string $text,
    ?__Private\SourceRef $source_ref = null,
  ) {
    parent::__construct($leading, $trailing, $text, $source_ref);
  }
}
