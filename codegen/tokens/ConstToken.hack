/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<3a5987652e9c5967a925ef86aaf247cc>>
 */
namespace Facebook\HHAST;

final class ConstToken extends TokenWithVariableText {

  const string KIND = 'const';

  public function __construct(
    ?NodeList<Trivia> $leading,
    ?NodeList<Trivia> $trailing,
    string $token_text = 'const',
    ?__Private\SourceRef $source_ref = null,
  ) {
    parent::__construct($leading, $trailing, $token_text, $source_ref);
  }
}
