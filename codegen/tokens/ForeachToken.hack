/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<2d98694c3c08c8fcad0af88e98ee61be>>
 */
namespace Facebook\HHAST;

final class ForeachToken extends TokenWithVariableText {

  const string KIND = 'foreach';

  public function __construct(
    ?NodeList<Trivia> $leading,
    ?NodeList<Trivia> $trailing,
    string $token_text = 'foreach',
    ?__Private\SourceRef $source_ref = null,
  ) {
    parent::__construct($leading, $trailing, $token_text, $source_ref);
  }
}
