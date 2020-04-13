/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<2eba4accbbc4124c00d9e6bdc3ef1348>>
 */
namespace Facebook\HHAST;

final class SelfToken extends TokenWithVariableText
  implements
    __Private\IWrappableWithSimpleTypeSpecifier {

  const string KIND = 'self';

  public function __construct(
    ?NodeList<Trivia> $leading,
    ?NodeList<Trivia> $trailing,
    string $token_text = 'self',
    ?__Private\SourceRef $source_ref = null,
  ) {
    parent::__construct($leading, $trailing, $token_text, $source_ref);
  }
}
