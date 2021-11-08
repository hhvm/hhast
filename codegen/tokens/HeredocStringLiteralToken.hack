/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<34e681c9f89c4c5fe92f4c780b791d89>>
 */
namespace Facebook\HHAST;

final class HeredocStringLiteralToken
  extends TokenWithVariableText
  implements IStringLiteral {

  const string KIND = 'heredoc_string_literal';

  public function __construct(
    ?NodeList<Trivia> $leading,
    ?NodeList<Trivia> $trailing,
    string $text,
    ?__Private\SourceRef $source_ref = null,
  ) {
    parent::__construct($leading, $trailing, $text, $source_ref);
  }
}
