/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<99f8956f1be661ae300ffc440e45bb09>>
 */
namespace Facebook\HHAST;

final class EndOfFileToken extends TokenWithFixedText {

  const string KIND = 'EndOfFile';
  const string TEXT = '';

  public function __construct(
    ?NodeList<Trivia> $leading,
    ?NodeList<Trivia> $trailing,
    ?__Private\SourceRef $source_ref = null,
  ) {
    parent::__construct($leading, $trailing, $source_ref);
  }
}
