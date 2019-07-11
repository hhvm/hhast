/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<a943cbb18fdcd387b6745d51808add3f>>
 */
namespace Facebook\HHAST;

final class NowdocStringLiteralToken
  extends TokenWithVariableText
  implements IStringLiteral {

  const string KIND = 'nowdoc_string_literal';

  public function __construct(
    ?NodeList<Trivia> $leading,
    ?NodeList<Trivia> $trailing,
    string $text,
    ?__Private\SourceRef $source_ref = null,
  ) {
    parent::__construct($leading, $trailing, $text, $source_ref);
  }
}
