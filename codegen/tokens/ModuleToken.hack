/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<90986f2d419b8b7aa12235d6dd241078>>
 */
namespace Facebook\HHAST;

final class ModuleToken extends TokenWithVariableText {

  const string KIND = 'module';

  public function __construct(
    ?NodeList<Trivia> $leading,
    ?NodeList<Trivia> $trailing,
    string $token_text = 'module',
    ?__Private\SourceRef $source_ref = null,
  ) {
    parent::__construct($leading, $trailing, $token_text, $source_ref);
  }
}
