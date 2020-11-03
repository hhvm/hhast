/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<c1caf959d46c79bc1cfae862264f2d04>>
 */
namespace Facebook\HHAST;

final class HashToken extends TokenWithFixedText {

  const string KIND = '#';
  const string TEXT = '#';

  public function __construct(
    ?NodeList<Trivia> $leading,
    ?NodeList<Trivia> $trailing,
    ?__Private\SourceRef $source_ref = null,
  ) {
    parent::__construct($leading, $trailing, $source_ref);
  }
}
