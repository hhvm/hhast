/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<52342d7f0e8b7f3341cfe1e6ba64bfb4>>
 */
namespace Facebook\HHAST;

final class MarkupToken extends TokenWithVariableText {

  const string KIND = 'markup';

  public function __construct(
    ?NodeList<Trivia> $leading,
    ?NodeList<Trivia> $trailing,
    string $text,
    ?__Private\SourceRef $source_ref = null,
  ) {
    parent::__construct($leading, $trailing, $text, $source_ref);
  }
}
