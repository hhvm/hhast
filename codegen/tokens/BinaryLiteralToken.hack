/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<b0c7aabff17b65677f12f5ed926dbf74>>
 */
namespace Facebook\HHAST;

final class BinaryLiteralToken extends TokenWithVariableText {

  const string KIND = 'binary_literal';

  public function __construct(
    ?NodeList<Trivia> $leading,
    ?NodeList<Trivia> $trailing,
    string $text,
    ?__Private\SourceRef $source_ref = null,
  ) {
    parent::__construct($leading, $trailing, $text, $source_ref);
  }
}
