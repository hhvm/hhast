/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<80ee651db4cb42eee34521f904f10476>>
 */
namespace Facebook\HHAST;

final class NameToken extends TokenWithVariableText
  implements
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
