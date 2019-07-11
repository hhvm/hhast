/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<c8bba14bb488569f782c63777bad8718>>
 */
namespace Facebook\HHAST;

final class AttributeToken extends TokenWithVariableText {

  const string KIND = 'attribute';

  public function __construct(
    ?NodeList<Trivia> $leading,
    ?NodeList<Trivia> $trailing,
    string $token_text = 'attribute',
    ?__Private\SourceRef $source_ref = null,
  ) {
    parent::__construct($leading, $trailing, $token_text, $source_ref);
  }
}
