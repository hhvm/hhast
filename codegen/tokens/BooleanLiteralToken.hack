/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<dd4f80063eb71366c69a968cf94609be>>
 */
namespace Facebook\HHAST;

final class BooleanLiteralToken extends TokenWithVariableText {

  const string KIND = 'boolean_literal';

  public function __construct(
    ?NodeList<Trivia> $leading,
    ?NodeList<Trivia> $trailing,
    string $text,
    ?__Private\SourceRef $source_ref = null,
  ) {
    parent::__construct($leading, $trailing, $text, $source_ref);
  }
}
