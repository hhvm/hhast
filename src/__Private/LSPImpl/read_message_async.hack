/*
 *  Copyright (c) 2017-present, Facebook, Inc.
 *  All rights reserved.
 *
 *  This source code is licensed under the MIT license found in the
 *  LICENSE file in the root directory of this source tree.
 *
 */

namespace Facebook\HHAST\__Private\LSPImpl;

use namespace HH\Lib\Str;
use type Facebook\HHAST\__Private\BufferedReader;

async function read_message_async(BufferedReader $in): Awaitable<string> {
  $length = null;
  $line = '';

  // read headers
  while (true) {
    /* HHAST_IGNORE_ERROR[DontAwaitInALoop] */
    $line = await $in->readLineAsync();
    $line = Str\trim($line);
    if ($line === '') {
      break;
    }
    if (!Str\starts_with($line, 'Content-Length')) {
      continue;
    }
    $length = $line
      |> Str\strip_prefix($$, 'Content-Length:')
      |> Str\trim($$)
      |> Str\to_int($$);
  }
  invariant($length !== null, 'Expected a content-length header');

  return await $in->readFixedSizeAsync($length);
}
