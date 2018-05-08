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

final class CLIOptionFlag extends CLIOption {
  const type TSetter = (function():void);

  public function __construct(
    private self::TSetter $setter,
    string $help_text,
    string $long,
    ?string $short,
  ) {
    parent::__construct($help_text, $long, $short);
  }

  public function set(): void {
    $setter = $this->setter;
    $setter();
  }

  <<__Override>>
  public function apply(
    string $as_given,
    ?string $value,
    vec<string> $argv,
  ): vec<string> {
    if ($value !== null) {
      \fprintf(
        \STDERR,
        "'%s' specifies a value, however values aren't supported for that ".
        "option.\n",
        $as_given,
      );
      exit(1);
    }
    $this->set();
    return $argv;
  }
}
