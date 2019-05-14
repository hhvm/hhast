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

async function from_file_async(
  File $file,
  vec<string> $args = vec[],
): Awaitable<EditableNode> {
  using $odf = new __Private\OnDiskFile($file);
  $file = $odf->getPath();

  $args = Vec\concat(
    vec['--php5-compat-mode', '--full-fidelity-json'],
    $args,
    vec[$file],
  );

  try {
    $results = await __Private\ParserQueue::get()->waitForAsync($args);
  } catch (__Private\SubprocessException $e) {
    throw new HHParseError(
      $file,
      'hh_parse failed - exit code: '.$e->getExitCode(),
    );
  }
  $json = $results[0];
  $data = \json_decode(
    $json,
    /* as array = */ true,
    /* depth = */ 512 /* == default */,
    \JSON_FB_HACK_ARRAYS,
  );
  $no_type_refinement_please = $data;
  if (!is_dict($no_type_refinement_please)) {
    // Perhaps we had invalid UTF8 - but JSON msut be UTF8
    //
    // While some can be converted to UTF-8,
    // this isn't guaranteed - JSON literally can't represent all the legal values
    // so the source it returns is useless.
    //
    // Given that, we don't even need to attempt to do the right conversion - we
    // can just do something cheap and throw away the result - so, we can just go
    // over the bytes, and throw them away if they're not 7-bit clean.

    $ascii = '';
    $len = Str\length($json);
    for ($i = 0; $i < $len; ++$i) {
      $byte = $json[$i];
      if ((\ord($byte) & (1 << 7)) === 0) {
        $ascii .= $byte;
      }
    }
    $data = \json_decode($ascii, true, 512, \JSON_FB_HACK_ARRAYS);
    $no_type_refinement_please = $data;
  }
  if (!is_dict($no_type_refinement_please)) {
    throw new HHParseError($file, 'hh_parse did not output valid JSON');
  }

  // Use the raw source rather than the re-encoded, as byte offsets may have
  // changed while re-encoding
  $data['program_text'] = \file_get_contents($file);
  return /* HH_FIXME[4110] */ __Private\from_decoded_json($data);
}
