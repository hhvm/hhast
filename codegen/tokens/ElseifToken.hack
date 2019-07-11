/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<4a7299bded6b3424d0f90a36e282f735>>
 */
namespace Facebook\HHAST;

final class ElseifToken extends TokenWithVariableText {

  const string KIND = 'elseif';

  public function __construct(
    ?NodeList<Trivia> $leading,
    ?NodeList<Trivia> $trailing,
    string $token_text = 'elseif',
    ?__Private\SourceRef $source_ref = null,
  ) {
    parent::__construct($leading, $trailing, $token_text, $source_ref);
  }
}
