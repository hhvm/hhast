/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<1775917bc424d4b76101f941eba3effe>>
 */
namespace Facebook\HHAST;

final class DarrayToken extends TokenWithVariableText {

  const string KIND = 'darray';

  public function __construct(
    ?NodeList<Trivia> $leading,
    ?NodeList<Trivia> $trailing,
    string $token_text = 'darray',
    ?__Private\SourceRef $source_ref = null,
  ) {
    parent::__construct($leading, $trailing, $token_text, $source_ref);
  }
}
