/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<8671fa4d36514faae420a6a8ad9139a3>>
 */
namespace Facebook\HHAST;

final class ArrayToken extends TokenWithVariableText {

  const string KIND = 'array';

  public function __construct(
    ?NodeList<Trivia> $leading,
    ?NodeList<Trivia> $trailing,
    string $token_text = 'array',
    ?__Private\SourceRef $source_ref = null,
  ) {
    parent::__construct($leading, $trailing, $token_text, $source_ref);
  }
}
