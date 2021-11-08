/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<427e8faf1fb85506c9c1ae09e809628b>>
 */
namespace Facebook\HHAST;

final class StringLiteralBodyToken extends TokenWithVariableText {

  const string KIND = 'string_literal_body';

  public function __construct(
    ?NodeList<Trivia> $leading,
    ?NodeList<Trivia> $trailing,
    string $text,
    ?__Private\SourceRef $source_ref = null,
  ) {
    parent::__construct($leading, $trailing, $text, $source_ref);
  }
}
