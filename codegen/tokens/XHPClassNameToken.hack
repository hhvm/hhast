/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<b7ce439e253e9ba4c67683f00ee08f2d>>
 */
namespace Facebook\HHAST;

final class XHPClassNameToken extends TokenWithVariableText
  implements
    INameishNode,
    __Private\IWrappableWithSimpleTypeSpecifier {

  const string KIND = 'XHP_class_name';

  public function __construct(
    ?NodeList<Trivia> $leading,
    ?NodeList<Trivia> $trailing,
    string $text,
    ?__Private\SourceRef $source_ref = null,
  ) {
    parent::__construct($leading, $trailing, $text, $source_ref);
  }
}
