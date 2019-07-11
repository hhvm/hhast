/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<38d38cb4fcbc48bf76a373e8441a1670>>
 */
namespace Facebook\HHAST;

final class TupleToken extends TokenWithVariableText {

  const string KIND = 'tuple';

  public function __construct(
    ?NodeList<Trivia> $leading,
    ?NodeList<Trivia> $trailing,
    string $token_text = 'tuple',
    ?__Private\SourceRef $source_ref = null,
  ) {
    parent::__construct($leading, $trailing, $token_text, $source_ref);
  }
}
