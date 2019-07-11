/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<c4b17ba925b306c66eaa33fd8bd4f5b5>>
 */
namespace Facebook\HHAST;

final class InsteadofToken extends TokenWithVariableText {

  const string KIND = 'insteadof';

  public function __construct(
    ?NodeList<Trivia> $leading,
    ?NodeList<Trivia> $trailing,
    string $token_text = 'insteadof',
    ?__Private\SourceRef $source_ref = null,
  ) {
    parent::__construct($leading, $trailing, $token_text, $source_ref);
  }
}
