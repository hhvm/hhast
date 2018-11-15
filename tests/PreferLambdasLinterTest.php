<?hh // strict

namespace Facebook\HHAST;

use type Facebook\HHAST\AnonymousFunction;

final class PreferLambdasLinterTest extends TestCase {
  use AutoFixingLinterTestTrait<Linters\ASTLintError<AnonymousFunction>>;

  protected function getLinter(string $file): Linters\PreferLambdasLinter {
    return Linters\PreferLambdasLinter::fromPath($file);
  }

  public function getCleanExamples(): array<array<string>> {
    return [
      ['<?hh $fn = () ==> 5; '],
      ['<?hh $fn = ($a, $b) ==> { return $a === $b; }'],
    ];
  }
}
