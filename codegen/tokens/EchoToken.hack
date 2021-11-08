/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<52e5b49658f5be9ba8e23e18ca5133fb>>
 */
namespace Facebook\HHAST;

final class EchoToken extends TokenWithVariableText {

  const string KIND = 'echo';

  public function __construct(
    ?NodeList<Trivia> $leading,
    ?NodeList<Trivia> $trailing,
    string $token_text = 'echo',
    ?__Private\SourceRef $source_ref = null,
  ) {
    parent::__construct($leading, $trailing, $token_text, $source_ref);
  }
}
