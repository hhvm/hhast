/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<5ebc23b256c21603bdbf0ab95db268c8>>
 */
namespace Facebook\HHAST;

final class LeftBracketToken extends TokenWithFixedText {

  const string KIND = '[';
  const string TEXT = '[';

  public function __construct(
    ?NodeList<Trivia> $leading,
    ?NodeList<Trivia> $trailing,
    ?__Private\SourceRef $source_ref = null,
  ) {
    parent::__construct($leading, $trailing, $source_ref);
  }
}
