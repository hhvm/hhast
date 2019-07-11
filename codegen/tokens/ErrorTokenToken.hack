/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<043bf655dc81b975d35c7fddc9d5c308>>
 */
namespace Facebook\HHAST;

final class ErrorTokenToken extends TokenWithVariableText {

  const string KIND = 'error_token';

  public function __construct(
    ?NodeList<Trivia> $leading,
    ?NodeList<Trivia> $trailing,
    string $text,
    ?__Private\SourceRef $source_ref = null,
  ) {
    parent::__construct($leading, $trailing, $text, $source_ref);
  }
}
