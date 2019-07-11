/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<3342c7cb6d5f2539cf2cec83b9db5175>>
 */
namespace Facebook\HHAST;

final class RequireToken extends TokenWithVariableText {

  const string KIND = 'require';

  public function __construct(
    ?NodeList<Trivia> $leading,
    ?NodeList<Trivia> $trailing,
    string $token_text = 'require',
    ?__Private\SourceRef $source_ref = null,
  ) {
    parent::__construct($leading, $trailing, $token_text, $source_ref);
  }
}
