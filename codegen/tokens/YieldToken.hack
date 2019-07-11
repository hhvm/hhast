/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<4cd3e2c897db57026383fa673be385a5>>
 */
namespace Facebook\HHAST;

final class YieldToken extends TokenWithVariableText {

  const string KIND = 'yield';

  public function __construct(
    ?NodeList<Trivia> $leading,
    ?NodeList<Trivia> $trailing,
    string $token_text = 'yield',
    ?__Private\SourceRef $source_ref = null,
  ) {
    parent::__construct($leading, $trailing, $token_text, $source_ref);
  }
}
