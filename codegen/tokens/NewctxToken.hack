/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<4f6c3d217f748925e2b1603c881dd0a5>>
 */
namespace Facebook\HHAST;

final class NewctxToken extends TokenWithVariableText {

  const string KIND = 'newctx';

  public function __construct(
    ?NodeList<Trivia> $leading,
    ?NodeList<Trivia> $trailing,
    string $token_text = 'newctx',
    ?__Private\SourceRef $source_ref = null,
  ) {
    parent::__construct($leading, $trailing, $token_text, $source_ref);
  }
}
