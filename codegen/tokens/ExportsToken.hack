/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<b809a97820c1205d9407ce42b6cb74f3>>
 */
namespace Facebook\HHAST;

final class ExportsToken extends TokenWithVariableText {

  const string KIND = 'exports';

  public function __construct(
    ?NodeList<Trivia> $leading,
    ?NodeList<Trivia> $trailing,
    string $token_text = 'exports',
    ?__Private\SourceRef $source_ref = null,
  ) {
    parent::__construct($leading, $trailing, $token_text, $source_ref);
  }
}
