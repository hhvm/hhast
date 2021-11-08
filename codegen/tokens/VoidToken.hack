/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<d87a058bfdb0198e2ff20aaf8fc25e4e>>
 */
namespace Facebook\HHAST;

final class VoidToken extends TokenWithVariableText {

  const string KIND = 'void';

  public function __construct(
    ?NodeList<Trivia> $leading,
    ?NodeList<Trivia> $trailing,
    string $token_text = 'void',
    ?__Private\SourceRef $source_ref = null,
  ) {
    parent::__construct($leading, $trailing, $token_text, $source_ref);
  }
}
