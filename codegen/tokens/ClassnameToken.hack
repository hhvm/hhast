/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<4e9e4ee68c83707bc5df0aae5b94d1e1>>
 */
namespace Facebook\HHAST;

final class ClassnameToken extends TokenWithVariableText {

  const string KIND = 'classname';

  public function __construct(
    ?NodeList<Trivia> $leading,
    ?NodeList<Trivia> $trailing,
    string $token_text = 'classname',
    ?__Private\SourceRef $source_ref = null,
  ) {
    parent::__construct($leading, $trailing, $token_text, $source_ref);
  }
}
