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
use namespace HH\Lib\{C, Str, Vec};

/**
 * The test suite ensures that no lint error is found by `HHClientLinter` in
 * the examples for `SingleRuleLinter`s.
 *
 * If an example triggers hh_client lint errors that indicate problems other
 * than the `SingleRuleLinter` supposes to detect, add HHAST_IGNORE_ALL markers
 * to suppress them. If an example triggers hh_client lint errors that
 * indicate problems that are essentially the same as the `SingleRuleLinter`
 * supposes to detect, it means the `SingleRuleLinter` is a duplicate of the
 * hh_client lint error, and we should either disable the hh_client lint error
 * code or remove the `SingleRuleLinter`.
 */
final class HHClientDuplicatedLintErrorTest extends TestCase {
  use HHClientLinterTestTrait;
  const HHClientLinter::TConfig CONFIG = shape();

  public function getDirtyFixturesFromOtherLinters(): vec<(string)> {
    return \glob(__DIR__.'/examples/*/*.in')
      |> Vec\filter($$, $path ==> !Str\contains($path, 'HHClientLinter'))
      |> Vec\map($$, $path ==> tuple($path));
  }

  <<DataProvider('getDirtyFixturesFromOtherLinters')>>
  public async function testDuplicatedLintError(string $path): Awaitable<void> {
    $linter = $this->getLinter($path);
    $errors = await $linter->getLintErrorsAsync();
    if (C\is_empty($errors)) {
      return;
    }
    Vec\map(
      $errors,
      $error ==> Str\format(
        "- %s: %s at line %s:%d:\n%s",
        $error->getLintRule()->getName(),
        $error->getDescription(),
        $path,
        $error->getRange()[0][1] ?? -1,
        $error->getPrettyBlame() ?? '',
      ),
    )
      |> Str\join($$, "\n")
      |> self::fail("Expected no errors, got:\n".$$);
  }
}
