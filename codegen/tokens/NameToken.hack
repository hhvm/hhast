/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<5f91cc9b0eb7b319df6d8118854d35af>>
 */
namespace Facebook\HHAST;

final class NameToken
  extends TokenWithVariableText
  implements INameishNode, __Private\IWrappableWithSimpleTypeSpecifier {

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
