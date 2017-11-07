<?hh // strict

namespace Facebook\HHAST\Linters;

use HH\Lib\Str;

final class NoWhitespaceAtEndOfLineLinter
  extends AutoFixingLineLinter<FixableLineLintError> {

  <<__Override>>
  public function getLintErrors(): Traversable<FixableLineLintError> {

    $lines = $this->getLinesFromFile();

    $errs = vec[];
    foreach ($lines as $ln => $line) {

      for ($i = strlen($line) - 1; $i >= 0; $i--) {

        $char = $line[$i];
        if ($char !== ' ') {
          break;
        }

        $errs[] = new FixableLineLintError(
          $this,
          'trailing whitespace at end of line',
          tuple($ln + 1, $i + 1),
        );
        break;

      }
    }

    return $errs;

  }

  <<__Override>>
  public function getFixedLine(string $line): string {
    return Str\trim_right($line, ' ');
  }

}
