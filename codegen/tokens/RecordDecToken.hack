/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<ee31085012cd7de051993e59330beadd>>
 */
namespace Facebook\HHAST;

final class RecordDecToken extends TokenWithVariableText {

  const string KIND = 'record';

  public function __construct(
    ?NodeList<Trivia> $leading,
    ?NodeList<Trivia> $trailing,
    string $token_text = 'record',
    ?__Private\SourceRef $source_ref = null,
  ) {
    parent::__construct($leading, $trailing, $token_text, $source_ref);
  }
}
