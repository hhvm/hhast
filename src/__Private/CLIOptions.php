<?hh
/*
 *  Copyright (c) 2017-present, Facebook, Inc.
 *  All rights reserved.
 *
 *  This source code is licensed under the MIT license found in the
 *  LICENSE file in the root directory of this source tree.
 *
 */

namespace Facebook\HHAST\__Private\CLIOptions;

function flag(
  (function():void) $setter,
  string $help_text,
  string $long,
  ?string $short = null,
): CLIOption {
  return new CLIOptionFlag($setter, $help_text, $long, $short);
}

function with_required_value<Tignored>(
  (function(string):void) $setter,
  string $help_text,
  string $long,
  ?string $short = null,
): CLIOption {
  return new CLIOptionWithRequiredValue($setter, $help_text, $long, $short);
}
