/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<90264eb91014dad1400de0818a229765>>
 */
namespace Facebook\HHAST;

final class ReadonlyToken extends TokenWithVariableText {

  const string KIND = 'readonly';

  public function __construct(
    ?NodeList<Trivia> $leading,
    ?NodeList<Trivia> $trailing,
    string $token_text = 'readonly',
    ?__Private\SourceRef $source_ref = null,
  ) {
    parent::__construct($leading, $trailing, $token_text, $source_ref);
  }
}
