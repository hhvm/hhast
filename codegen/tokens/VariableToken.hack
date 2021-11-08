/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<dd98ce0f111830442598182b01baf2c4>>
 */
namespace Facebook\HHAST;

final class VariableToken
  extends TokenWithVariableText
  implements
    ILambdaBody,
    IExpression,
    __Private\IWrappableWithSimpleTypeSpecifier {

  const string KIND = 'variable';

  public function __construct(
    ?NodeList<Trivia> $leading,
    ?NodeList<Trivia> $trailing,
    string $text,
    ?__Private\SourceRef $source_ref = null,
  ) {
    parent::__construct($leading, $trailing, $text, $source_ref);
  }
}
