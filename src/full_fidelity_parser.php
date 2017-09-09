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

function from_json(array<string, mixed> $json): EditableSyntax {
  return EditableSyntax::from_json(
    /* HH_IGNORE_ERROR[4110] */ $json['parse_tree'],
    0,
    /* HH_IGNORE_ERROR[4110] */ $json['program_text'],
  );
}

function parse_file_to_json(string $file): array<string, mixed> {
  $results = __Private\execute('hh_parse', '--full-fidelity-json', $file);
  $json = json_decode($results[0], /* as array = */ true);
  return $json;
}

function parse_file_to_editable(string $file): EditableSyntax {
  $json = parse_file_to_json($file);
  return from_json($json);
}

function parse_text_to_json(string $text): array<string, mixed> {
  $file = tempnam("/tmp", "");
  $handle = fopen($file, "w");
  fwrite($handle, $text);
  fclose($handle);
  $json = parse_file_to_json($file);
  unlink($file);
  return $json;
}

function parse_text_to_editable(string $text): EditableSyntax {
  $json = parse_text_to_json($text);
  return from_json($json);
}
