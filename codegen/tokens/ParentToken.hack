/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<3e08c8ed3c80b3becc870dab6d82dcf5>>
 */
namespace Facebook\HHAST;

final class ParentToken
  extends TokenWithVariableText
  implements __Private\IWrappableWithSimpleTypeSpecifier {

  const string KIND = 'parent';

  public function __construct(
    ?NodeList<Trivia> $leading,
    ?NodeList<Trivia> $trailing,
    string $token_text = 'parent',
    ?__Private\SourceRef $source_ref = null,
  ) {
    parent::__construct($leading, $trailing, $token_text, $source_ref);
  }
}
