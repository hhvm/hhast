<?hh // strict

namespace Facebook\HHAST\Linters;

use type Facebook\HHAST\EditableNode;
use namespace Facebook\HHAST;

abstract class AutoFixingLineLinter<Terr as FixableLineLintError>
  extends LineLinter implements AutoFixingLinter<Terr> {

  abstract public function getFixedLine(string $line): string;

  final public function fixLintErrors(Traversable<Terr> $errors): void {

    $lines = $this->getLinesFromFile();

    foreach ($errors as $err) {

      $i = $err->getPosition()[0] - 1;
      invariant($i >= 0, 'line number should never be negative');
      $original = $lines[$i];
      $lines[$i] = $this->getFixedLine($original);
    }

    file_put_contents($this->getFile(), implode("\n", $lines));
  }
}
