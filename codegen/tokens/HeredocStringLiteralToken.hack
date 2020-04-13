/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<7bdabec5b17017c4539bf6d812bb59e6>>
 */
namespace Facebook\HHAST;

final class HeredocStringLiteralToken extends TokenWithVariableText
  implements
    IStringLiteral {

  const string KIND = 'heredoc_string_literal';

  public function __construct(
    ?NodeList<Trivia> $leading,
    ?NodeList<Trivia> $trailing,
    string $text,
    ?__Private\SourceRef $source_ref = null,
  ) {
    parent::__construct($leading, $trailing, $text, $source_ref);
  }
}
