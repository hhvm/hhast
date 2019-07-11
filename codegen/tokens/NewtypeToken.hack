/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<bc60ae957f65ed05aff76f1ef9f9b1c4>>
 */
namespace Facebook\HHAST;

final class NewtypeToken extends TokenWithVariableText {

  const string KIND = 'newtype';

  public function __construct(
    ?NodeList<Trivia> $leading,
    ?NodeList<Trivia> $trailing,
    string $token_text = 'newtype',
    ?__Private\SourceRef $source_ref = null,
  ) {
    parent::__construct($leading, $trailing, $token_text, $source_ref);
  }
}
