/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<b784e52120b46d2474c2d37f5cc421c9>>
 */
namespace Facebook\HHAST;

final class SwitchToken extends TokenWithVariableText {

  const string KIND = 'switch';

  public function __construct(
    ?NodeList<Trivia> $leading,
    ?NodeList<Trivia> $trailing,
    string $token_text = 'switch',
    ?__Private\SourceRef $source_ref = null,
  ) {
    parent::__construct($leading, $trailing, $token_text, $source_ref);
  }
}
