/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<69e54ae78c68fbded1ebb524ac6284c4>>
 */
namespace Facebook\HHAST;

final class NameToken
  extends TokenWithVariableText
  implements
    ILambdaBody,
    INameishNode,
    __Private\IWrappableWithSimpleTypeSpecifier {

  const string KIND = 'name';

  public function __construct(
    ?NodeList<Trivia> $leading,
    ?NodeList<Trivia> $trailing,
    string $text,
    ?__Private\SourceRef $source_ref = null,
  ) {
    parent::__construct($leading, $trailing, $text, $source_ref);
  }
}
