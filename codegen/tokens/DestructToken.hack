/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<a80fdb492d1711fde1073f47c634aaac>>
 */
namespace Facebook\HHAST;

final class DestructToken extends TokenWithVariableText {

  const string KIND = '__destruct';

  public function __construct(
    ?NodeList<Trivia> $leading,
    ?NodeList<Trivia> $trailing,
    string $token_text = '__destruct',
    ?__Private\SourceRef $source_ref = null,
  ) {
    parent::__construct($leading, $trailing, $token_text, $source_ref);
  }
}
