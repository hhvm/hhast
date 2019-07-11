/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<e92c8f1555cd8c2f5b569d1622767767>>
 */
namespace Facebook\HHAST;

final class EmptyToken extends TokenWithVariableText {

  const string KIND = 'empty';

  public function __construct(
    ?NodeList<Trivia> $leading,
    ?NodeList<Trivia> $trailing,
    string $token_text = 'empty',
    ?__Private\SourceRef $source_ref = null,
  ) {
    parent::__construct($leading, $trailing, $token_text, $source_ref);
  }
}
