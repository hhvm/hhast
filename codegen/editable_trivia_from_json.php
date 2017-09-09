<?hh
/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<09bd31f1559a8a553edcbc2a79e7c80d>>
 */
namespace Facebook\HHAST\__Private;
use namespace Facebook\HHAST;

function editable_trivia_from_json(
  array<string, mixed> $json,
  int $position,
  string $source,
): HHAST\EditableTrivia {
  $trivia_text = substr($source, $position, $json['width']);
  switch ((string)$json['kind']) {
    case 'whitespace':
      return new HHAST\WhiteSpace($trivia_text);
    case 'end_of_line':
      return new HHAST\EndOfLine($trivia_text);
    case 'delimited_comment':
      return new HHAST\DelimitedComment($trivia_text);
    case 'single_line_comment':
      return new HHAST\SingleLineComment($trivia_text);
    case 'unsafe':
      return new HHAST\Unsafe($trivia_text);
    case 'unsafe_expression':
      return new HHAST\UnsafeExpression($trivia_text);
    case 'fix_me':
      return new HHAST\FixMe($trivia_text);
    case 'ignore_error':
      return new HHAST\IgnoreError($trivia_text);
    case 'fall_through':
      return new HHAST\FallThrough($trivia_text);
    default:
      throw new \Exception('unexpected JSON kind: '.(string)$json['kind']);
  }
}
