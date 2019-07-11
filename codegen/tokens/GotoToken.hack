/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<4082062d550028c03eff5aaf9f063a20>>
 */
namespace Facebook\HHAST;

final class GotoToken extends TokenWithVariableText {

  const string KIND = 'goto';

  public function __construct(
    ?NodeList<Trivia> $leading,
    ?NodeList<Trivia> $trailing,
    string $token_text = 'goto',
    ?__Private\SourceRef $source_ref = null,
  ) {
    parent::__construct($leading, $trailing, $token_text, $source_ref);
  }
}
