/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<f775f7094e955894ae8d507097308c3c>>
 */
namespace Facebook\HHAST;

final class SelfToken
  extends TokenWithVariableText
  implements __Private\IWrappableWithSimpleTypeSpecifier {

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
