/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<751421887fed5e7178b6b08f205ba435>>
 */
namespace Facebook\HHAST;

final class TildeToken extends TokenWithFixedText {

  const string KIND = '~';
  const string TEXT = '~';

  public function __construct(
    ?NodeList<Trivia> $leading,
    ?NodeList<Trivia> $trailing,
    ?__Private\SourceRef $source_ref = null,
  ) {
    parent::__construct($leading, $trailing, $source_ref);
  }
}
