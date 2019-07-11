/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<1e78bb4d0c70b53293862e314fab39e7>>
 */
namespace Facebook\HHAST;

final class RealToken extends TokenWithVariableText {

  const string KIND = 'real';

  public function __construct(
    ?NodeList<Trivia> $leading,
    ?NodeList<Trivia> $trailing,
    string $token_text = 'real',
    ?__Private\SourceRef $source_ref = null,
  ) {
    parent::__construct($leading, $trailing, $token_text, $source_ref);
  }
}
