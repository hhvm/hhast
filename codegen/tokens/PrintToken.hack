/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<d71130b23c1dce0bb52adb2ad7ca8666>>
 */
namespace Facebook\HHAST;

final class PrintToken extends TokenWithVariableText {

  const string KIND = 'print';

  public function __construct(
    ?NodeList<Trivia> $leading,
    ?NodeList<Trivia> $trailing,
    string $token_text = 'print',
    ?__Private\SourceRef $source_ref = null,
  ) {
    parent::__construct($leading, $trailing, $token_text, $source_ref);
  }
}
