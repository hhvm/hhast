/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<312d579936969a1039bad21503ff0240>>
 */
namespace Facebook\HHAST\__Private;
use namespace Facebook\HHAST;

function editable_trivia_from_json(
  dict<string, mixed> $json,
  string $file,
  int $offset,
  string $source,
): HHAST\EditableTrivia {
  $trivia_text = \substr($source, $offset, $json['width'] as int);
  switch ((string)$json['kind']) {
    case 'after_halt_compiler':
      return new HHAST\AfterHaltCompiler($trivia_text);
    case 'delimited_comment':
      return new HHAST\DelimitedComment($trivia_text);
    case 'end_of_line':
      return new HHAST\EndOfLine($trivia_text);
    case 'extra_token_error':
      return new HHAST\ExtraTokenError($trivia_text);
    case 'fall_through':
      return new HHAST\FallThrough($trivia_text);
    case 'fix_me':
      return new HHAST\FixMe($trivia_text);
    case 'ignore_error':
      return new HHAST\IgnoreError($trivia_text);
    case 'single_line_comment':
      return new HHAST\SingleLineComment($trivia_text);
    case 'unsafe':
      return new HHAST\Unsafe($trivia_text);
    case 'unsafe_expression':
      return new HHAST\UnsafeExpression($trivia_text);
    case 'whitespace':
      return new HHAST\WhiteSpace($trivia_text);
    default:
      throw new HHAST\UnsupportedASTNodeError(
        $file,
        $offset,
        (string)$json['kind'],
      );
  }
}
