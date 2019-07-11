/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<194e07006ac78d984b32c9ffc66ac7b4>>
 */
namespace Facebook\HHAST;

final class DollarToken extends TokenWithFixedText {

  const string KIND = '$';
  const string TEXT = '$';

  public function __construct(
    ?NodeList<Trivia> $leading,
    ?NodeList<Trivia> $trailing,
    ?__Private\SourceRef $source_ref = null,
  ) {
    parent::__construct($leading, $trailing, $source_ref);
  }
}
