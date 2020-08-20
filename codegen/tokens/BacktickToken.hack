/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<d55f2c8301e23f1cd3328dc9e28acdaa>>
 */
namespace Facebook\HHAST;

final class BacktickToken extends TokenWithFixedText {

  const string KIND = '`';
  const string TEXT = '`';

  public function __construct(
    ?NodeList<Trivia> $leading,
    ?NodeList<Trivia> $trailing,
    ?__Private\SourceRef $source_ref = null,
  ) {
    parent::__construct($leading, $trailing, $source_ref);
  }
}
