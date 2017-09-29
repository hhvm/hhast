<?hh // strict
/**
 * Copyright (c) 2016, Facebook, Inc.
 * All rights reserved.
 *
 * This source code is licensed under the BSD-style license found in the
 * LICENSE file in the 'hack' directory of this source tree. An additional
 * grant of patent rights can be found in the PATENTS file in the same
 * directory.
 *
 */

namespace Facebook\HHAST;

function from_json(
  dict<string, mixed> $json,
  ?string $file = null,
): EditableNode {
  return EditableNode::fromJSON(
    /* HH_IGNORE_ERROR[4110] */ $json['parse_tree'],
    $file ?? '! no file !',
    0,
    /* HH_IGNORE_ERROR[4110] */ $json['program_text'],
  );
}

function json_from_file(string $file): dict<string, mixed> {
  try {
    $results = __Private\execute('hh_parse', '--full-fidelity-json', $file);
  } catch (__Private\SubprocessException $e) {
    throw new HHParseError(
      $file,
      'hh_parse failed - exit code: '.$e->getExitCode(),
    );
  }
  $json = json_decode(
    $results[0],
    /* as array = */ true,
    /* depth = */ 512 /* == default */,
    JSON_FB_HACK_ARRAYS,
  );
  if (!is_dict($no_type_refinment_please = $json)) {
    throw new HHParseError($file, 'hh_parse did not output valid JSON');
  }
  return $json;
}

function from_file(string $file): EditableNode {
  $json = json_from_file($file);
  return from_json($json, $file);
}

function json_from_text(string $text): dict<string, mixed> {
  $file = tempnam("/tmp", "");
  $handle = fopen($file, "w");
  fwrite($handle, $text);
  fclose($handle);
  $json = json_from_file($file);
  unlink($file);
  return $json;
}

function from_code(string $text): EditableNode {
  $json = json_from_text($text);
  return from_json($json);
}
