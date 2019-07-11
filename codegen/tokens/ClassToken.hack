/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<f1cd7d9f6bd35aeebd4e1ff2b2ffee5b>>
 */
namespace Facebook\HHAST;

final class ClassToken extends TokenWithVariableText {

  const string KIND = 'class';

  public function __construct(
    ?NodeList<Trivia> $leading,
    ?NodeList<Trivia> $trailing,
    string $token_text = 'class',
    ?__Private\SourceRef $source_ref = null,
  ) {
    parent::__construct($leading, $trailing, $token_text, $source_ref);
  }
}
