/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<5ccfc65cbd475edbd2ac52a0477fa6d3>>
 */
namespace Facebook\HHAST;

final class ResourceToken extends TokenWithVariableText {

  const string KIND = 'resource';

  public function __construct(
    ?NodeList<Trivia> $leading,
    ?NodeList<Trivia> $trailing,
    string $token_text = 'resource',
    ?__Private\SourceRef $source_ref = null,
  ) {
    parent::__construct($leading, $trailing, $token_text, $source_ref);
  }
}
