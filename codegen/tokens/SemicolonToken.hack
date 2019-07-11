/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<e702dc9d4834c9d5bc15536c14e49587>>
 */
namespace Facebook\HHAST;

final class SemicolonToken extends TokenWithFixedText {

  const string KIND = ';';
  const string TEXT = ';';

  public function __construct(
    ?NodeList<Trivia> $leading,
    ?NodeList<Trivia> $trailing,
    ?__Private\SourceRef $source_ref = null,
  ) {
    parent::__construct($leading, $trailing, $source_ref);
  }
}
