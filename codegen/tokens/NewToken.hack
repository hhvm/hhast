/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<9e8d887ecfb7d55a6def2d24bfbbd6dc>>
 */
namespace Facebook\HHAST;

final class NewToken extends TokenWithVariableText {

  const string KIND = 'new';

  public function __construct(
    ?NodeList<Trivia> $leading,
    ?NodeList<Trivia> $trailing,
    string $token_text = 'new',
    ?__Private\SourceRef $source_ref = null,
  ) {
    parent::__construct($leading, $trailing, $token_text, $source_ref);
  }
}
