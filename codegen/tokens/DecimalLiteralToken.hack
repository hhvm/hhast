/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<eac7e1a09177396cb9b1d8c2ec633865>>
 */
namespace Facebook\HHAST;

final class DecimalLiteralToken extends TokenWithVariableText {

  const string KIND = 'decimal_literal';

  public function __construct(
    ?NodeList<Trivia> $leading,
    ?NodeList<Trivia> $trailing,
    string $text,
    ?__Private\SourceRef $source_ref = null,
  ) {
    parent::__construct($leading, $trailing, $text, $source_ref);
  }
}
