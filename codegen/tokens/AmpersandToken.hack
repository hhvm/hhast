/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<a7ca0102b59bc563a2e1b6ec6e156095>>
 */
namespace Facebook\HHAST;

final class AmpersandToken extends TokenWithFixedText {

  const string KIND = '&';
  const string TEXT = '&';

  public function __construct(
    ?NodeList<Trivia> $leading,
    ?NodeList<Trivia> $trailing,
    ?__Private\SourceRef $source_ref = null,
  ) {
    parent::__construct($leading, $trailing, $source_ref);
  }
}
