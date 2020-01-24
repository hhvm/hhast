/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<fa63d31815b98f99c328f54f66909c69>>
 */
namespace Facebook\HHAST;

final class XHPToken extends TokenWithVariableText {

  const string KIND = 'xhp';

  public function __construct(
    ?NodeList<Trivia> $leading,
    ?NodeList<Trivia> $trailing,
    string $token_text = 'xhp',
    ?__Private\SourceRef $source_ref = null,
  ) {
    parent::__construct($leading, $trailing, $token_text, $source_ref);
  }
}
