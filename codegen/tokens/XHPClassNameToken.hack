/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<11034ac617ad47c19676b34318d64edb>>
 */
namespace Facebook\HHAST;

final class XHPClassNameToken
  extends TokenWithVariableText
  implements INameishNode, __Private\IWrappableWithSimpleTypeSpecifier {

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
