/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<3cb9138540246c5eff123f7bfae1765c>>
 */
namespace Facebook\HHAST;

final class EndwhileToken extends TokenWithVariableText {

  const string KIND = 'endwhile';

  public function __construct(
    ?NodeList<Trivia> $leading,
    ?NodeList<Trivia> $trailing,
    string $token_text = 'endwhile',
    ?__Private\SourceRef $source_ref = null,
  ) {
    parent::__construct($leading, $trailing, $token_text, $source_ref);
  }
}
