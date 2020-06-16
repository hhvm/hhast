/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<2e80adcca259d0135dc42e50a07fecbc>>
 */
namespace Facebook\HHAST\__Private;
use namespace Facebook\HHAST;

function trivia_from_json(
  dict<string, mixed> $json,
  SourceRef $source_ref,
): HHAST\Trivia {
  $trivia_text = \substr(
    $source_ref['source'],
    $source_ref['offset'],
    $source_ref['width'],
  );
  switch ((string)$json['kind']) {
    case 'delimited_comment':
      return new HHAST\DelimitedComment($trivia_text, $source_ref);
    case 'end_of_line':
      return new HHAST\EndOfLine($trivia_text, $source_ref);
    case 'extra_token_error':
      return new HHAST\ExtraTokenError($trivia_text, $source_ref);
    case 'fall_through':
      return new HHAST\FallThrough($trivia_text, $source_ref);
    case 'fix_me':
      return new HHAST\FixMe($trivia_text, $source_ref);
    case 'ignore_error':
      return new HHAST\IgnoreError($trivia_text, $source_ref);
    case 'single_line_comment':
      return new HHAST\SingleLineComment($trivia_text, $source_ref);
    case 'whitespace':
      return new HHAST\WhiteSpace($trivia_text, $source_ref);
    default:
      throw new HHAST\UnsupportedASTNodeError(
        $source_ref['file'],
        $source_ref['offset'],
        $json['kind'] as string,
      );
  }
}
