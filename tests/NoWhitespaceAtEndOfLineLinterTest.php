<?hh // strict

namespace Facebook\HHAST;

use function Facebook\FBExpect\expect;
use namespace HH\Lib\{C, Str, Vec};
use namespace Facebook\HHAST;

final class NoWhitespaceAtEndOfLineLinterTest extends TestCase {
  use AutoFixingLinterTestTrait<Linters\FixableLineLintError>;

  protected function getLinter(
    string $file,
  ): Linters\NoWhitespaceAtEndOfLineLinter {
    return new Linters\NoWhitespaceAtEndOfLineLinter($file);
  }

  public function getCleanExamples(): array<array<string>> {
    return [
      ["<?hh print('foo');"],
      ["<?hh\n"."class Foo {\n"."public function trogdor(){}\n"."}\n"],
    ];
  }
}
