/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<3d3f27bada939c60691e161935a86ba3>>
 */
namespace Facebook\HHAST;

final class DoubleToken extends TokenWithVariableText {

  const string KIND = 'double';

  public function __construct(
    ?NodeList<Trivia> $leading,
    ?NodeList<Trivia> $trailing,
    string $token_text = 'double',
    ?__Private\SourceRef $source_ref = null,
  ) {
    parent::__construct($leading, $trailing, $token_text, $source_ref);
  }
}
