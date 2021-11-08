/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<2262f4a872a1e1eae54b8dc715ece787>>
 */
namespace Facebook\HHAST;

final class EnumToken extends TokenWithVariableText {

  const string KIND = 'enum';

  public function __construct(
    ?NodeList<Trivia> $leading,
    ?NodeList<Trivia> $trailing,
    string $token_text = 'enum',
    ?__Private\SourceRef $source_ref = null,
  ) {
    parent::__construct($leading, $trailing, $token_text, $source_ref);
  }
}
