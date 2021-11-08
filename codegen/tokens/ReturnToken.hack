/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<d7b4732c8b23309477c06e132b838c21>>
 */
namespace Facebook\HHAST;

final class ReturnToken extends TokenWithVariableText {

  const string KIND = 'return';

  public function __construct(
    ?NodeList<Trivia> $leading,
    ?NodeList<Trivia> $trailing,
    string $token_text = 'return',
    ?__Private\SourceRef $source_ref = null,
  ) {
    parent::__construct($leading, $trailing, $token_text, $source_ref);
  }
}
