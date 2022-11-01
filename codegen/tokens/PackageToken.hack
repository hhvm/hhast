/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<ae30c735e288af7b15e244d581f5c39a>>
 */
namespace Facebook\HHAST;

final class PackageToken extends TokenWithVariableText {

  const string KIND = 'package';

  public function __construct(
    ?NodeList<Trivia> $leading,
    ?NodeList<Trivia> $trailing,
    string $token_text = 'package',
    ?__Private\SourceRef $source_ref = null,
  ) {
    parent::__construct($leading, $trailing, $token_text, $source_ref);
  }
}
