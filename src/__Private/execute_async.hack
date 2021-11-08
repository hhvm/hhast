/*
 *  Copyright (c) 2017-present, Facebook, Inc.
 *  All rights reserved.
 *
 *  This source code is licensed under the MIT license found in the
 *  LICENSE file in the root directory of this source tree.
 *
 */

namespace Facebook\HHAST\__Private;

use namespace HH\Lib\{Str, Vec};

// A wrapper around the built-in exec with a nicer signature.
// * returns a result rather than filling an out-parameter
// * throws on error
async function execute_async(string ...$args): Awaitable<vec<string>> {
  $command = $args
    |> Vec\map($$, $arg ==> \escapeshellarg($arg))
    |> Str\join($$, ' ');

  $spec = darray[0 => varray['pipe', 'r'], 1 => varray['pipe', 'w'], 2 => varray['pipe', 'w']];
  $pipes = varray[];

  $proc = \proc_open($command, $spec, inout $pipes);
  invariant($proc, 'Failed to execute: %s', $command);

  list($stdin, $stdout, $stderr) = $pipes;
  \fclose($stdin);
  \stream_set_blocking($stdout, false);

  $exit_code = -2;
  $output = '';
  while (true) {
    $chunk = \stream_get_contents($stdout);
    $output .= $chunk;
    $status = \proc_get_status($proc);
    if ($status['pid'] && !$status['running']) {
      $exit_code = $status['exitcode'];
      break;
    }
    /* HHAST_IGNORE_ERROR[DontAwaitInALoop] */
    await \stream_await($stdout, \STREAM_AWAIT_READ);
  }
  $output .= \stream_get_contents($stdout);
  \fclose($stdout);
  \fclose($stderr);

  // Always returns -1 if we called `proc_get_status` first
  \proc_close($proc);

  if ($exit_code !== 0) {
    throw new SubprocessException(vec($args), $exit_code);
  }
  return Str\split($output, "\n");
}
