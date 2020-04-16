/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<857072e569604e357302b4b5f1f292fe>>
 */
namespace Facebook\HHAST;

final class NoreturnToken extends TokenWithVariableText
  implements
    __Private\IWrappableWithSimpleTypeSpecifier {

  const string KIND = 'noreturn';

  public function __construct(
    ?NodeList<Trivia> $leading,
    ?NodeList<Trivia> $trailing,
    string $token_text = 'noreturn',
    ?__Private\SourceRef $source_ref = null,
  ) {
    parent::__construct($leading, $trailing, $token_text, $source_ref);
  }
}
