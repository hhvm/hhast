/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<d74c41cd0be01df8d2bcc7a54b505bfc>>
 */
namespace Facebook\HHAST;

final class HeredocStringLiteralTailToken extends TokenWithVariableText {

  const string KIND = 'heredoc_string_literal_tail';

  public function __construct(
    ?NodeList<Trivia> $leading,
    ?NodeList<Trivia> $trailing,
    string $text,
    ?__Private\SourceRef $source_ref = null,
  ) {
    parent::__construct($leading, $trailing, $text, $source_ref);
  }
}
