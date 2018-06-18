<?hh // strict
/*
 *  Copyright (c) 2017-present, Facebook, Inc.
 *  All rights reserved.
 *
 *  This source code is licensed under the MIT license found in the
 *  LICENSE file in the root directory of this source tree.
 *
 */


namespace Facebook\HHAST;

use type Facebook\CLILib\TestLib\{StringInput, StringOutput};
use type Facebook\CLILib\Terminal;
use function Facebook\FBExpect\expect;
use namespace Facebook\TypeAssert;
use namespace HH\Lib\{C, Keyset, Vec};

final class JSONOutputTest extends TestCase {
  use LinterCLITestTrait;

  public function testWithNoErrors(): void {
    list($cli, $_, $stdout, $stderr) =
      $this->getCLI('--mode', 'json', __FILE__);
    $exit_code = \HH\Asio\join($cli->mainAsync());
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
      type_structure(__Private\LintRunJSONErrorHandler::class, 'TOutput'),
      $data,
    );
    expect($data['passed'])->toBeTrue();
    expect($data['errors'])->toBeSame(vec[]);
  }

  public function testWithErrors(): void {
    list($cli, $_, $stdout, $stderr) = $this->getCLI(
      '--mode',
      'json',
      __DIR__.'/fixtures/NoPHPEqualityLinter/double_equals.php.in',
    );
    $exit_code = \HH\Asio\join($cli->mainAsync());
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
      type_structure(__Private\LintRunJSONErrorHandler::class, 'TOutput'),
      $data,
    );
    expect($data['passed'])->toBeFalse();
    expect(C\count($data['errors']))->toBeSame(3);
    $linters = Keyset\map($data['errors'], $e ==> $e['linter']);
    expect($linters)->toBeSame(keyset['NoPHPEquality']);

    $lines =
      Vec\map($data['errors'], $e ==> $e['range']['start']['line'] ?? null);
    expect($lines)->toBeSame(vec[12, 13, 14]);

    $this->markTestIncomplete("range ends are not currently set");
  }
}
