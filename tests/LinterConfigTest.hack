/*
 *  Copyright (c) 2017-present, Facebook, Inc.
 *  All rights reserved.
 *
 *  This source code is licensed under the MIT license found in the
 *  LICENSE file in the root directory of this source tree.
 *
 */

namespace Facebook\HHAST\Tests;

use function Facebook\FBExpect\expect;
use type Facebook\HHAST\{
  LinterCLITestTrait,
  PreferRequireOnceLinter,
  SingleRuleLintError,
  SingleRuleLinter,
  TestCase,
};
use type Facebook\HHAST\__Private\LintRunConfig;

abstract class EmptyBaseLinter extends SingleRuleLinter {
  <<__Override>>
  final public async function getLintErrorsAsync(
  ): Awaitable<vec<SingleRuleLintError>> {
    return vec[];
  }
  final public function getConfigPublic(): ?this::TConfig {
    return $this->getConfig();
  }
}

final class ValidConfigForLinter extends EmptyBaseLinter {
  const type TConfig = shape(
    'the answer' => int,
    'a structure' => shape('with keys' => vec<vec<string>>),
  );
}

final class InvalidConfigForLinter extends EmptyBaseLinter {
  const type TConfig = shape(
    'i should have only one key' => null,
  );
}

final class ConfigNotSuppliedLinter extends EmptyBaseLinter {
  const type TConfig = shape(
    'configs are optional' => null,
  );
}

final class ConfigTypeIsNotSupportedByTypeAssertLinter extends EmptyBaseLinter {
  // TypeAssert doesn't support vec<nothing>
  // If it does in the future, please update this test to a different
  // type that TypeAssert does not support.
  const type TConfig = shape('impossible' => vec<nothing>);
}

final class LinterConfigTest extends TestCase {
  use LinterCLITestTrait;

  const string TEST_DIRECTORY = __DIR__.'/../test-data';

  private static function getLintRunConfig(): LintRunConfig {
    return LintRunConfig::getForPath(self::TEST_DIRECTORY);
  }

  public function testValidConfigForLinter(): void {
    $lrc = static::getLintRunConfig();
    $config = $lrc->getLinterConfigForLinter<ValidConfigForLinter, _>(
      ValidConfigForLinter::class,
    );

    expect($config)->toNotBeNull('Config could not be fetched');
    expect($config)->toEqual(shape(
      'the answer' => 42,
      'a structure' => shape(
        'with keys' => vec[
          vec[
            'and lists of lists',
          ],
        ],
      ),
    ));
  }

  public function testInvalidConfigForLinter(): void {
    $lrc = static::getLintRunConfig();
    expect(
      () ==> $lrc->getLinterConfigForLinter<InvalidConfigForLinter, _>(
        InvalidConfigForLinter::class,
      ),
    )->toThrow(\Exception::class, 'is not of the correct type');
  }

  public async function testInvalidConfigForCLI(): Awaitable<void> {
    list($cli, $_, $stdout, $stderr) =
      $this->getCLI('--config-file', self::TEST_DIRECTORY.'/hhast-lint.json', self::TEST_DIRECTORY);
    $exit_code = await $cli->mainAsync();
    expect($stderr->getBuffer())->toContainSubstring(
      'A linter threw an exception:',
    );
    expect($stderr->getBuffer())->toContainSubstring(
      'Linter: Facebook\HHAST\Tests\InvalidConfigForLinter',
    );
    expect($stderr->getBuffer())->toMatchRegExp(
      re'#File\\: .*/test-data/unparsable_php_file\\.php#',
    );
    expect($stderr->getBuffer())->toContainSubstring(
      'Message: Configuration for Facebook\HHAST\Tests\InvalidConfigForLinter is not of the correct type. See previous exception:',
    );
    expect($exit_code)->toBeSame(2);
    expect($stdout->getBuffer())->toBeEmpty();
  }

  public function testLinterWithoutATConfigAndNoConfigSupplied(): void {
    $lrc = static::getLintRunConfig();

    $config = $lrc->getLinterConfigForLinter<PreferRequireOnceLinter, _>(
      PreferRequireOnceLinter::class,
    );

    expect($config)->toBeNull('No config supplied');
  }

  public function testConfigNotSuppliedLinter(): void {
    $lrc = static::getLintRunConfig();

    $config = $lrc->getLinterConfigForLinter<ConfigNotSuppliedLinter, _>(
      ConfigNotSuppliedLinter::class,
    );

    expect($config)->toBeNull('No config supplied');
  }

  public function testConfigTypeIsNotSupportedByTypeAssertLinter(): void {
    $lrc = static::getLintRunConfig();

    expect(
      () ==> $lrc->getLinterConfigForLinter<
        ConfigTypeIsNotSupportedByTypeAssertLinter,
        _,
      >(ConfigTypeIsNotSupportedByTypeAssertLinter::class),
    )->toThrow(
      \InvalidOperationException::class,
      'specified an unsupported config type',
    );
  }

  public function testSingleOverride(): void {
    $lrc = static::getLintRunConfig();
    $config = $lrc->getConfigForFile('single_override/test.hack');

    expect($config)->toNotBeNull('Config could not be fetched');
    expect($config)->toEqual(shape(
      'linters' => keyset [
        'Facebook\\HHAST\\FinalOrAbstractClassLinter',
        'Facebook\\HHAST\\Tests\\ConfigTypeIsNotSupportedByTypeAssertLinter',
        'Facebook\\HHAST\\NoEmptyStatementsLinter',
        'Facebook\\HHAST\\UseStatementWIthoutKindLinter',
      ],
      'autoFixBlacklist' => keyset [],
    ));
  }

  public function testMultipleOverrides(): void {
    $lrc = static::getLintRunConfig();
    $config = $lrc->getConfigForFile('multiple_overrides/test.hack');

    expect($config)->toNotBeNull('Config could not be fetched');
    expect($config)->toEqual(shape(
      'linters' => keyset [
        'Facebook\\HHAST\\NoEmptyStatementsLinter',
        'Facebook\\HHAST\\UseStatementWIthoutKindLinter',
        'Facebook\\HHAST\\NoFinalMethodInFinalClassLinter',
      ],
      'autoFixBlacklist' => keyset [],
    ));
  }
}
