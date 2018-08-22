<?hh // strict
/*
 *  Copyright (c) 2017-present, Facebook, Inc.
 *  All rights reserved.
 *
 *  This source code is licensed under the MIT license found in the
 *  LICENSE file in the root directory of this source tree.
 *
 */


namespace Facebook\HHAST\TestLib;

use namespace Facebook\CLILib;

/**
 * Emulation of `pipe(2)` with CLILib interfaces
 */
function cli_pipe(): (CLILib\InputInterface, CLILib\OutputInterface)  {
  // Bidirectional, but let's pretend they aren't
  list($a, $b) = \stream_socket_pair(\STREAM_PF_UNIX, \STREAM_SOCK_STREAM, 0);
  return tuple(new CLILib\FileHandleInput($a), new CLILib\FileHandleOutput($b));
}
