/*
 *  Copyright (c) 2017-present, Facebook, Inc.
 *  All rights reserved.
 *
 *  This source code is licensed under the MIT license found in the
 *  LICENSE file in the root directory of this source tree.
 *
 */

namespace Facebook\HHAST;

use type Facebook\CLILib\Terminal;
use namespace HH\Lib\{IO, Vec};

trait LinterCLITestTrait {
  require extends TestCase;

  protected function getCLI(
    string ...$argv
  ): (__Private\LinterCLI, IO\MemoryHandle, IO\MemoryHandle, IO\MemoryHandle) {
    $argv = Vec\concat(vec[__FILE__], $argv);
    $stdin = new IO\MemoryHandle();
    $stdout = new IO\MemoryHandle();
    $stderr = new IO\MemoryHandle();
    $term = new Terminal($stdin, $stdout, $stderr);
    return tuple(
      new __Private\LinterCLI($argv, $term),
      $stdin,
      $stdout,
      $stderr,
    );
  }
}
