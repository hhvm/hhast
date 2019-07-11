/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<e37ee71585dd9ec25dc133c1fdce7731>>
 */
namespace Facebook\HHAST;

final class AsyncToken extends TokenWithVariableText {

  const string KIND = 'async';

  public function __construct(
    ?NodeList<Trivia> $leading,
    ?NodeList<Trivia> $trailing,
    string $token_text = 'async',
    ?__Private\SourceRef $source_ref = null,
  ) {
    parent::__construct($leading, $trailing, $token_text, $source_ref);
  }
}
