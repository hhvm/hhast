/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<ddbec94b48b66471ae28baba3353e82d>>
 */
namespace Facebook\HHAST;

final class StaticToken extends TokenWithVariableText
  implements
    __Private\IWrappableWithSimpleTypeSpecifier {

  const string KIND = 'static';

  public function __construct(
    ?NodeList<Trivia> $leading,
    ?NodeList<Trivia> $trailing,
    string $token_text = 'static',
    ?__Private\SourceRef $source_ref = null,
  ) {
    parent::__construct($leading, $trailing, $token_text, $source_ref);
  }
}
