/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<d934bd831a4a9a89939f9c00b44d7dc7>>
 */
namespace Facebook\HHAST;

final class UseToken extends TokenWithVariableText {

  const string KIND = 'use';

  public function __construct(
    ?NodeList<Trivia> $leading,
    ?NodeList<Trivia> $trailing,
    string $token_text = 'use',
    ?__Private\SourceRef $source_ref = null,
  ) {
    parent::__construct($leading, $trailing, $token_text, $source_ref);
  }
}
