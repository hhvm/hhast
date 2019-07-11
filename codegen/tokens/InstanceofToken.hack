/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<7984fa5bc4ed5ae7b51acdc7d54cbbe9>>
 */
namespace Facebook\HHAST;

final class InstanceofToken extends TokenWithVariableText {

  const string KIND = 'instanceof';

  public function __construct(
    ?NodeList<Trivia> $leading,
    ?NodeList<Trivia> $trailing,
    string $token_text = 'instanceof',
    ?__Private\SourceRef $source_ref = null,
  ) {
    parent::__construct($leading, $trailing, $token_text, $source_ref);
  }
}
