/*
 *  Copyright (c) 2017-present, Facebook, Inc.
 *  All rights reserved.
 *
 *  This source code is licensed under the MIT license found in the
 *  LICENSE file in the root directory of this source tree.
 *
 */

namespace Facebook\HHAST;

use namespace HH\Lib\{Str, Vec};
use function HH\ffp_parse_string;

async function from_file_async(
  File $file,
  vec<string> $user_args = vec[],
): Awaitable<Script> {
  $cache = __Private\ParserCache::get();
  $data = ($user_args === vec[]) ? $cache->fetch($file) : null;
  if ($data is nonnull) {
    return __Private\from_decoded_json($data, $file->getPath());
  }
  using $odf = new __Private\OnDiskFile($file);
  $path = $odf->getPath();
  $data = ffp_parse_string($file->getContents()) as dict<_, _>;

  // Use the raw source rather than the re-encoded, as byte offsets may have
  // changed while re-encoding
  $data['program_text'] = $file->getContents();
  if ($user_args === vec[]) {
    $cache->store($file, $data);
  }
  return __Private\from_decoded_json($data, $file->getPath());
}
