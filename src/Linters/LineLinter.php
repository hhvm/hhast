<?hh // strict

namespace Facebook\HHAST\Linters;

use Facebook\HHAST\Linters\{BaseLinter};

abstract class LineLinter extends BaseLinter {

  public function getLinesFromFile(): vec<string> {

    $code = file_get_contents($this->getFile());
    $lines = explode("\n", $code);
    return vec($lines);
  }

  public function getLine(int $l): ?string {

    return idx($this->getLinesFromFile(), $l);
  }
}
