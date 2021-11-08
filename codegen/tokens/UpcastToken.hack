/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<f63e8d8727c6ea4e031c2909514c5771>>
 */
namespace Facebook\HHAST;

final class UpcastToken extends TokenWithVariableText {

  const string KIND = 'upcast';

  public function __construct(
    ?NodeList<Trivia> $leading,
    ?NodeList<Trivia> $trailing,
    string $token_text = 'upcast',
    ?__Private\SourceRef $source_ref = null,
  ) {
    parent::__construct($leading, $trailing, $token_text, $source_ref);
  }
}
