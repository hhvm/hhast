/*
 *  Copyright (c) 2017-present, Facebook, Inc.
 *  All rights reserved.
 *
 *  This source code is licensed under the MIT license found in the
 *  LICENSE file in the root directory of this source tree.
 *
 */


namespace Facebook\HHAST;

use type Facebook\HackTest\DataProvider;
use function Facebook\HHAST\TestLib\expect;
use namespace HH\Lib\{C, Str, Vec};

trait LinterTestTrait {
  require extends TestCase;

  abstract protected function getLinter(string $file): Linters\BaseLinter ;

  abstract public function getCleanExamples(): array<array<string>>;
  final public function getDirtyFixtures(): vec<array<string>> {
    return static::class
      |> \explode('\\', $$)
      |> C\lastx($$)
      |> Str\strip_suffix($$, 'Test')
      |> \glob(__DIR__.'/fixtures/'.$$.'/*.in')
      |> Vec\map($$, $path ==> \basename($path, '.in'))
      |> Vec\map($$, $path ==> Str\strip_suffix($path, '.php'))
      |> Vec\map($$, $path ==> Str\strip_suffix($path, '.hack'))
      |> Vec\map($$, $arg ==> [$arg]);
  }

  final protected function getFullFixtureName(string $name): string {
    $base = static::class
      |> \explode('\\', $$)
      |> C\lastx($$)
      |> Str\strip_suffix($$, 'Test')
      |> $$.'/'.$name;
    if (\file_exists(__DIR__.'/fixtures/'.$base.'.php.in')) {
      return $base.'.php';
    }
    return $base.'.hack';
  }

  <<DataProvider('getCleanExamples')>>
  final public async function testCleanExample(string $code): Awaitable<void> {
    $file = \sys_get_temp_dir().'/hhast-tmp-'.\bin2hex(\random_bytes(16));
    if (
      Str\starts_with($code, '<?') ||
      Str\starts_with(Str\split($code, "\n")[1] ?? '', '<?') // #! lines
    ) {
      $file .= '.php';
    } else {
      $file .= '.hack';
    }
    \file_put_contents($file, $code);
    try {
      $linter = $this->getLinter($file);
      $errors = await $linter->getLintErrorsAsync();
      if (C\is_empty($errors)) {
        return;
      }
      Vec\map($errors, $error ==> Str\format(
        "- %s: %s at line %d:\n%s",
        \get_class($error->getLinter()),
        $error->getDescription(),
        $error->getPosition()[1] ?? -1,
        $error->getPrettyBlame() ?? ''
      ))
        |> Str\join($$, "\n")
        |> self::fail("Expected no errors, got:\n".$$);
    } finally {
      \unlink($file);
    }
  }

  <<DataProvider('getDirtyFixtures')>>
  final public function testDirtyFixtures(string $fixture): void {
    $fixture = $this->getFullFixtureName($fixture);

    $linter = $this->getLinter(__DIR__.'/fixtures/'.$fixture.'.in');

    $out = \HH\Asio\join($linter->getLintErrorsAsync())
      |> Vec\map(
        $$,
        $error ==> self::getErrorAsShape($error),
      )
      |> \json_encode($$, \JSON_PRETTY_PRINT)."\n";
    expect($out)->toMatchExpectFile($fixture.'.expect');
  }

  final protected static function getErrorAsShape(
    Linters\LintError $e,
   ): shape(...) {
    return shape(
      'blame' => $e->getBlameCode(),
      'blame_pretty' => $e->getPrettyBlame(),
      'description' => $e->getDescription(),
    );
  }
}
