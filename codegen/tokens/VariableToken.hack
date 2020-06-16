/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<8a1cf56d13347a2c73e9d9bef86cf42c>>
 */
namespace Facebook\HHAST;

final class VariableToken
  extends TokenWithVariableText
  implements ILambdaBody, IExpression {

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
