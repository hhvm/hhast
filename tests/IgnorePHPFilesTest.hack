/*
 *  Copyright (c) 2017-present, Facebook, Inc.
 *  All rights reserved.
 *
 *  This source code is licensed under the MIT license found in the
 *  LICENSE file in the root directory of this source tree.
 *
 */

namespace Facebook\HHAST;

use type Facebook\HackTest\HackTest;

final class IgnorePHPFilesTest extends HackTest {
  public async function testUnparsablePHPFileAsync(): Awaitable<void> {
    $lint_run = new __Private\LintRun(
      null,
      new DoNotSendMeEventsHandler(),
      vec[__DIR__.'/../test-data/unparsable_php_file.php'],
    );
    await $lint_run->runAsync();
  }
}

final class DoNotSendMeEventsHandler implements __Private\LintRunEventHandler {
  public function linterRaisedErrorsAsync(
    Linter $_linter,
    __Private\LintRunConfig::TFileConfig $_config,
    Traversable<LintError> $_errors,
  ): Awaitable<nothing> {
    invariant_violation('You may not raise an error on a PHP file');
  }
  public async function finishedFileAsync(
    string $_path,
    __Private\LintRunResult $_result,
  ): Awaitable<void> {}
  public async function finishedRunAsync(
    __Private\LintRunResult $_result,
  ): Awaitable<void> {}
}
