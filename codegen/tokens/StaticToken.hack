/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<d78d3fea8932dc259406ea103943a964>>
 */
namespace Facebook\HHAST;

final class StaticToken
  extends TokenWithVariableText
  implements __Private\IWrappableWithSimpleTypeSpecifier {

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
