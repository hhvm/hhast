/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<e9b89b594ab284d8a60b204cf6db25e6>>
 */
namespace Facebook\HHAST;

final class PercentToken extends TokenWithFixedText {

  const string KIND = '%';
  const string TEXT = '%';

  public function __construct(
    ?NodeList<Trivia> $leading,
    ?NodeList<Trivia> $trailing,
    ?__Private\SourceRef $source_ref = null,
  ) {
    parent::__construct($leading, $trailing, $source_ref);
  }
}
