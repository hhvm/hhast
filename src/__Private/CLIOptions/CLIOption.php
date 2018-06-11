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

use namespace HH\Lib\Str;

enum CLIOptionType: int {
  LONG = 1;
  SHORT = 2;
  ARGUMENT = 3;
}

abstract class CLIOption {
  private string $long;
  private ?string $short = null;

  public function __construct(
    private string $helpText,
    string $long,
    ?string $short,
  ) {
    invariant(
      Str\starts_with($long, '--'),
      "long argument '%s' doesn't start with '--'",
      $long,
    );
    $this->long = Str\strip_prefix($long, '--');
    invariant(
      Str\length($this->long) > 0,
      'long argument length should be greater than zero',
    );

    if ($short === null) {
      return;
    }

    invariant(
      Str\starts_with($short, '-'),
      "short argument '%s' doesn't start with '-'",
      $short,
    );
    invariant(
      !Str\starts_with($short, '--'),
      "short argument '%s' shouldn't start with '--'",
      $short,
    );
    $this->short = Str\strip_prefix($short, '-');
    invariant(
      Str\length((string) $this->short) === 1,
      "short argument '%s' length should be equal to 1",
      $short,
    );
  }

  final public function getHelpText(): string {
    return $this->helpText;
  }

  final public function getLong(): string {
    return $this->long;
  }

  final public function getShort(): ?string {
    return $this->short;
  }

  final public static function getTypeAndValue($option): (CLIOptionType, string) {
    if (Str\starts_with($option, '--')) {
      return tuple(CLIOptionType::LONG, Str\strip_prefix($option, '--'));
    } else if (Str\starts_with($option, '-')) {
      return tuple(CLIOptionType::SHORT, Str\strip_prefix($option, '-'));
    }
    return tuple(CLIOptionType::ARGUMENT, $option);
  }

  /**
   * Process user input, return new argv.
   *
   * @param $as_given - the option as specified by the user. Usually matches
   *   `getShort()` or `getLong()`
   * @param $value - value specified by the users (e.g. `--long=value`). If
   *   null, it may be appropriate to take a value from $argv
   * @param $argv - remaining unprocessed $argv
   */
  abstract public function apply(
    string $as_given,
    ?string $value,
    vec<string> $argv,
  ): vec<string>;
}
