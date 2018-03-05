<?hh
/**
 * Copyright (c) 2017, Facebook, Inc.
 * All rights reserved.
 *
 * This source code is licensed under the BSD-style license found in the
 * LICENSE file in the "hack" directory of this source tree. An additional
 * grant of patent rights can be found in the PATENTS file in the same
 * directory.
 */

namespace Facebook\HHAST\__Private\CLIOptions;

use namespace HH\Lib\{C, Vec};

final class CLIOptionWithRequiredValue extends CLIOption {
  const type TSetter = (function(string):void);
  public function __construct(
    private self::TSetter $setter,
    string $help_text,
    string $long,
    ?string $short,
  ) {
    parent::__construct($help_text, $long, $short);
  }

  public function set(string $value): void {
    $setter = $this->setter;
    $setter($value);
  }

  public function apply(
    string $as_given,
    ?string $value,
    vec<string> $argv,
  ): vec<string> {
    if ($value === null) {
      if (C\is_empty($argv)) {
        \fprintf(
          \STDERR,
          "option '%s' requires a value\n",
          $as_given,
        );
        exit(1);
      }
      $value = C\firstx($argv);
      $argv = Vec\drop($argv, 1);
    }
    $this->set($value);
    return $argv;
  }
}
