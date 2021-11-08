/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<8f20386f2ca2432e9eaffc0aaacb79aa>>
 */
namespace Facebook\HHAST;

final class VecToken extends TokenWithVariableText {

  const string KIND = 'vec';

  public function __construct(
    ?NodeList<Trivia> $leading,
    ?NodeList<Trivia> $trailing,
    string $token_text = 'vec',
    ?__Private\SourceRef $source_ref = null,
  ) {
    parent::__construct($leading, $trailing, $token_text, $source_ref);
  }
}
