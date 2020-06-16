/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<e9450f4ede1ead827cc2a3b53aa1729b>>
 */
namespace Facebook\HHAST;

final class NoreturnToken
  extends TokenWithVariableText
  implements __Private\IWrappableWithSimpleTypeSpecifier {

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
