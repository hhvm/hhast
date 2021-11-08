/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<61659b08844adbc21f5a2af05d451d96>>
 */
namespace Facebook\HHAST;

final class NamespaceToken extends TokenWithVariableText {

  const string KIND = 'namespace';

  public function __construct(
    ?NodeList<Trivia> $leading,
    ?NodeList<Trivia> $trailing,
    string $token_text = 'namespace',
    ?__Private\SourceRef $source_ref = null,
  ) {
    parent::__construct($leading, $trailing, $token_text, $source_ref);
  }
}
