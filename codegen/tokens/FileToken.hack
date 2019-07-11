/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<a9af26bac73bf291222b5228692a6c9e>>
 */
namespace Facebook\HHAST;

final class FileToken extends TokenWithVariableText {

  const string KIND = 'file';

  public function __construct(
    ?NodeList<Trivia> $leading,
    ?NodeList<Trivia> $trailing,
    string $token_text = 'file',
    ?__Private\SourceRef $source_ref = null,
  ) {
    parent::__construct($leading, $trailing, $token_text, $source_ref);
  }
}
