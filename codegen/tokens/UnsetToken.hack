/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<0549326cd9396df0002a6d00a72cc410>>
 */
namespace Facebook\HHAST;

final class UnsetToken extends TokenWithVariableText {

  const string KIND = 'unset';

  public function __construct(
    ?NodeList<Trivia> $leading,
    ?NodeList<Trivia> $trailing,
    string $token_text = 'unset',
    ?__Private\SourceRef $source_ref = null,
  ) {
    parent::__construct($leading, $trailing, $token_text, $source_ref);
  }
}
