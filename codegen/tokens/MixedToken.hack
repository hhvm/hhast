/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<e9279adee898a768a3daa6f31ca0b7c0>>
 */
namespace Facebook\HHAST;

final class MixedToken extends TokenWithVariableText {

  const string KIND = 'mixed';

  public function __construct(
    ?NodeList<Trivia> $leading,
    ?NodeList<Trivia> $trailing,
    string $token_text = 'mixed',
    ?__Private\SourceRef $source_ref = null,
  ) {
    parent::__construct($leading, $trailing, $token_text, $source_ref);
  }
}
