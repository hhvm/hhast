/*
 *  Copyright (c) 2017-present, Facebook, Inc.
 *  All rights reserved.
 *
 *  This source code is licensed under the MIT license found in the
 *  LICENSE file in the root directory of this source tree.
 *
 */


namespace Facebook\HHAST;

use function Facebook\HHAST\TestLib\expect;
use namespace Facebook\TypeAssert;
use namespace HH\Lib\{C, Keyset, Str, Vec};

final class JSONOutputTest extends TestCase {
  use LinterCLITestTrait;

  public async function testWithNoErrors(): Awaitable<void> {
    list($cli, $_, $stdout, $stderr) = $this->getCLI(
      '--mode',
      'json',
      __FILE__,
    );
    $exit_code = await $cli->mainAsync();
    expect($exit_code)->toBeSame(0);
    expect($stderr->getBuffer())->toBeSame('');
    $json = $stdout->getBuffer();
    $data = \json_decode(
      $json, /* assoc = */
      true, /* depth = */
      512,
      \JSON_FB_HACK_ARRAYS,
    );
    $data = TypeAssert\matches_type_structure(
      type_structure(__Private\LintRunJSONEventHandler::class, 'TOutput'),
      $data,
    );
    expect($data['passed'])->toBeTrue();
    expect($data['errors'])->toBeSame(vec[]);
  }

  public async function testWithErrors(): Awaitable<void> {
    $fname = __DIR__.'/examples/NoPHPEqualityLinter/double_equals.php.in';
    list($cli, $_, $stdout, $stderr) = $this->getCLI('--mode', 'json', $fname);
    $exit_code = await $cli->mainAsync();
    expect($exit_code)->toNotBeSame(0);
    expect($stderr->getBuffer())->toBeSame('');
    $json = $stdout->getBuffer();
    $data = \json_decode(
      $json, /* assoc = */
      true, /* depth = */
      512,
      \JSON_FB_HACK_ARRAYS,
    );
    $data = TypeAssert\matches_type_structure(
      type_structure(__Private\LintRunJSONEventHandler::class, 'TOutput'),
      $data,
    );
    expect($data['passed'])->toBeFalse();
    expect(C\count($data['errors']))->toBeSame(2);
    $linters = Keyset\map($data['errors'], $e ==> $e['linter']);
    expect($linters)->toBeSame(keyset['NoPHPEquality']);

    $lines = Vec\map(
      $data['errors'],
      $e ==> $e['range']['start']['line'] ?? null,
    );
    expect($lines)->toBeSame(vec[12, 13]);
    expect(
      \json_encode($data, \JSON_PRETTY_PRINT | \JSON_UNESCAPED_SLASHES)."\n"
        |> Str\replace($$, __DIR__, '__DIR__'),
    )
      ->toMatchExpectFileWithInputFile(
        Str\strip_suffix($fname, '.in').'.json-cli.expect',
        $fname,
      );
  }
}
