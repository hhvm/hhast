/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<22603dda78d06ea7b06337bea29a782d>>
 */
namespace Facebook\HHAST;

final class ForToken extends TokenWithVariableText {

  const string KIND = 'for';

  public function __construct(
    ?NodeList<Trivia> $leading,
    ?NodeList<Trivia> $trailing,
    string $token_text = 'for',
    ?__Private\SourceRef $source_ref = null,
  ) {
    parent::__construct($leading, $trailing, $token_text, $source_ref);
  }
}
