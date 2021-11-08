/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<0e3438da122e84e68490e2a995a51346>>
 */
namespace Facebook\HHAST;

final class FromToken extends TokenWithVariableText {

  const string KIND = 'from';

  public function __construct(
    ?NodeList<Trivia> $leading,
    ?NodeList<Trivia> $trailing,
    string $token_text = 'from',
    ?__Private\SourceRef $source_ref = null,
  ) {
    parent::__construct($leading, $trailing, $token_text, $source_ref);
  }
}
