/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<461e0affe78487ad7810599ffad9421b>>
 */
namespace Facebook\HHAST;

final class OctalLiteralToken extends TokenWithVariableText {

  const string KIND = 'octal_literal';

  public function __construct(
    ?NodeList<Trivia> $leading,
    ?NodeList<Trivia> $trailing,
    string $text,
    ?__Private\SourceRef $source_ref = null,
  ) {
    parent::__construct($leading, $trailing, $text, $source_ref);
  }
}
