/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<89f4a9564e5f5344043f865259e73bb5>>
 */
namespace Facebook\HHAST;

final class AtToken extends TokenWithFixedText {

  const string KIND = '@';
  const string TEXT = '@';

  public function __construct(
    ?NodeList<Trivia> $leading,
    ?NodeList<Trivia> $trailing,
    ?__Private\SourceRef $source_ref = null,
  ) {
    parent::__construct($leading, $trailing, $source_ref);
  }
}
