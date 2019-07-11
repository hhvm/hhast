/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<c8a8670af3463ab03d142957bccbfe8f>>
 */
namespace Facebook\HHAST;

final class AwaitToken extends TokenWithVariableText {

  const string KIND = 'await';

  public function __construct(
    ?NodeList<Trivia> $leading,
    ?NodeList<Trivia> $trailing,
    string $token_text = 'await',
    ?__Private\SourceRef $source_ref = null,
  ) {
    parent::__construct($leading, $trailing, $token_text, $source_ref);
  }
}
