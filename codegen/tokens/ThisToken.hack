/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<8fd534b7a9345c484c5302179aac5a1d>>
 */
namespace Facebook\HHAST;

final class ThisToken
  extends TokenWithVariableText
  implements __Private\IWrappableWithSimpleTypeSpecifier {

  const string KIND = 'this';

  public function __construct(
    ?NodeList<Trivia> $leading,
    ?NodeList<Trivia> $trailing,
    string $token_text = 'this',
    ?__Private\SourceRef $source_ref = null,
  ) {
    parent::__construct($leading, $trailing, $token_text, $source_ref);
  }
}
