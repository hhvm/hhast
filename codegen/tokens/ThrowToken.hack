/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<c001edb1571f83883f3be793284c406a>>
 */
namespace Facebook\HHAST;

final class ThrowToken extends TokenWithVariableText {

  const string KIND = 'throw';

  public function __construct(
    ?NodeList<Trivia> $leading,
    ?NodeList<Trivia> $trailing,
    string $token_text = 'throw',
    ?__Private\SourceRef $source_ref = null,
  ) {
    parent::__construct($leading, $trailing, $token_text, $source_ref);
  }
}
