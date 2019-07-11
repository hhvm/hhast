/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<b37928403ae81266dbb8c9849a15159c>>
 */
namespace Facebook\HHAST;

final class QuestionAsToken extends TokenWithVariableText {

  const string KIND = '?as';

  public function __construct(
    ?NodeList<Trivia> $leading,
    ?NodeList<Trivia> $trailing,
    string $token_text = '?as',
    ?__Private\SourceRef $source_ref = null,
  ) {
    parent::__construct($leading, $trailing, $token_text, $source_ref);
  }
}
