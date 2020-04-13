/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<62ad751baa1611dc9fa30e9f4f3277b7>>
 */
namespace Facebook\HHAST;

final class ParentToken extends TokenWithVariableText
  implements
    __Private\IWrappableWithSimpleTypeSpecifier {

  const string KIND = 'parent';

  public function __construct(
    ?NodeList<Trivia> $leading,
    ?NodeList<Trivia> $trailing,
    string $token_text = 'parent',
    ?__Private\SourceRef $source_ref = null,
  ) {
    parent::__construct($leading, $trailing, $token_text, $source_ref);
  }
}
