/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<d05c101310b179c0e8e8ff7d1544aabb>>
 */
namespace Facebook\HHAST;

final class InterfaceToken extends TokenWithVariableText {

  const string KIND = 'interface';

  public function __construct(
    ?NodeList<Trivia> $leading,
    ?NodeList<Trivia> $trailing,
    string $token_text = 'interface',
    ?__Private\SourceRef $source_ref = null,
  ) {
    parent::__construct($leading, $trailing, $token_text, $source_ref);
  }
}
