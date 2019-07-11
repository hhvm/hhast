/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<fd67773a75288ab700ee0afca887d04d>>
 */
namespace Facebook\HHAST;

final class QuestionToken extends TokenWithFixedText {

  const string KIND = '?';
  const string TEXT = '?';

  public function __construct(
    ?NodeList<Trivia> $leading,
    ?NodeList<Trivia> $trailing,
    ?__Private\SourceRef $source_ref = null,
  ) {
    parent::__construct($leading, $trailing, $source_ref);
  }
}
