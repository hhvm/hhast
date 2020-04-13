/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<4e170d243ff7c20f4bfe3d37ca955af1>>
 */
namespace Facebook\HHAST;

final class XHPCategoryNameToken extends TokenWithVariableText
  implements
    INameishNode {

  const string KIND = 'XHP_category_name';

  public function __construct(
    ?NodeList<Trivia> $leading,
    ?NodeList<Trivia> $trailing,
    string $text,
    ?__Private\SourceRef $source_ref = null,
  ) {
    parent::__construct($leading, $trailing, $text, $source_ref);
  }
}
