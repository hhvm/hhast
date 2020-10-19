/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<ba8d68169f0e8dd6341e64ec082c4570>>
 */
namespace Facebook\HHAST;

final class HashbangToken extends TokenWithVariableText {

  const string KIND = 'hashbang';

  public function __construct(
    ?NodeList<Trivia> $leading,
    ?NodeList<Trivia> $trailing,
    string $text,
    ?__Private\SourceRef $source_ref = null,
  ) {
    parent::__construct($leading, $trailing, $text, $source_ref);
  }
}
