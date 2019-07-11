/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<4a02d3ec91185e4963141e911b83d0fb>>
 */
namespace Facebook\HHAST;

final class ColonToken extends TokenWithFixedText {

  const string KIND = ':';
  const string TEXT = ':';

  public function __construct(
    ?NodeList<Trivia> $leading,
    ?NodeList<Trivia> $trailing,
    ?__Private\SourceRef $source_ref = null,
  ) {
    parent::__construct($leading, $trailing, $source_ref);
  }
}
