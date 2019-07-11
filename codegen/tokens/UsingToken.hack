/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<d2d4a70a3c3027a9710c37bdabdafe26>>
 */
namespace Facebook\HHAST;

final class UsingToken extends TokenWithVariableText {

  const string KIND = 'using';

  public function __construct(
    ?NodeList<Trivia> $leading,
    ?NodeList<Trivia> $trailing,
    string $token_text = 'using',
    ?__Private\SourceRef $source_ref = null,
  ) {
    parent::__construct($leading, $trailing, $token_text, $source_ref);
  }
}
