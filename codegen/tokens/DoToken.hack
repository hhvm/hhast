/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<9e86114327a8c75642ce5086ca613aa6>>
 */
namespace Facebook\HHAST;

final class DoToken extends TokenWithVariableText {

  const string KIND = 'do';

  public function __construct(
    ?NodeList<Trivia> $leading,
    ?NodeList<Trivia> $trailing,
    string $token_text = 'do',
    ?__Private\SourceRef $source_ref = null,
  ) {
    parent::__construct($leading, $trailing, $token_text, $source_ref);
  }
}
