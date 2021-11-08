/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<af072bff931cc1d6c4faf1f5cc67bf62>>
 */
namespace Facebook\HHAST;

final class CommaToken extends TokenWithFixedText {

  const string KIND = ',';
  const string TEXT = ',';

  public function __construct(
    ?NodeList<Trivia> $leading,
    ?NodeList<Trivia> $trailing,
    ?__Private\SourceRef $source_ref = null,
  ) {
    parent::__construct($leading, $trailing, $source_ref);
  }
}
