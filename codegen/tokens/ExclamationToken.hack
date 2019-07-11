/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<078cc5da3dc2884ec367d3adeea268f4>>
 */
namespace Facebook\HHAST;

final class ExclamationToken extends TokenWithFixedText {

  const string KIND = '!';
  const string TEXT = '!';

  public function __construct(
    ?NodeList<Trivia> $leading,
    ?NodeList<Trivia> $trailing,
    ?__Private\SourceRef $source_ref = null,
  ) {
    parent::__construct($leading, $trailing, $source_ref);
  }
}
