/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<80a039bd23e4ccd9fe8b3116e6dbfa09>>
 */
namespace Facebook\HHAST;

final class CategoryToken extends TokenWithVariableText {

  const string KIND = 'category';

  public function __construct(
    ?NodeList<Trivia> $leading,
    ?NodeList<Trivia> $trailing,
    string $token_text = 'category',
    ?__Private\SourceRef $source_ref = null,
  ) {
    parent::__construct($leading, $trailing, $token_text, $source_ref);
  }
}
