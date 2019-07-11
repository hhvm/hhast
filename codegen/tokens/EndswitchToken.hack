/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<188dbb98a6c56a101757fe160f5b3d4a>>
 */
namespace Facebook\HHAST;

final class EndswitchToken extends TokenWithVariableText {

  const string KIND = 'endswitch';

  public function __construct(
    ?NodeList<Trivia> $leading,
    ?NodeList<Trivia> $trailing,
    string $token_text = 'endswitch',
    ?__Private\SourceRef $source_ref = null,
  ) {
    parent::__construct($leading, $trailing, $token_text, $source_ref);
  }
}
