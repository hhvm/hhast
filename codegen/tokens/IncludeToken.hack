/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<063ac54adb359901cdbbcfc7cd7b3cf6>>
 */
namespace Facebook\HHAST;

final class IncludeToken extends TokenWithVariableText {

  const string KIND = 'include';

  public function __construct(
    ?NodeList<Trivia> $leading,
    ?NodeList<Trivia> $trailing,
    string $token_text = 'include',
    ?__Private\SourceRef $source_ref = null,
  ) {
    parent::__construct($leading, $trailing, $token_text, $source_ref);
  }
}
