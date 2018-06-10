<?hh // strict
/*
 *  Copyright (c) 2017-present, Facebook, Inc.
 *  All rights reserved.
 *
 *  This source code is licensed under the MIT license found in the
 *  LICENSE file in the root directory of this source tree.
 *
 */

namespace Facebook\HHAST\__Private;

use namespace Facebook\TypeAssert;
use namespace HH\Lib\{C, Dict, Str, Vec};

abstract class CLIBase {
  private vec<string> $arguments = vec[];

  abstract protected function getSupportedOptions(
  ): vec<CLIOptions\CLIOption>;

  abstract public function mainAsync(): Awaitable<int>;

  final public function getArgv(): vec<string> {
    return $this->argv;
  }

  final protected function getArguments(): vec<string> {
    invariant(
      ($_ = $this) instanceof CLIWithArguments,
      "Calling getArguments(), but don't accept arguments",
    );
    return $this->arguments;
  }

  protected static function supportsColors(): bool {
    static $cache;

    if ($cache !== null) {
      return $cache;
    }

    $colors = \getenv('CLICOLORS');
    if (
      $colors === '1'
      || $colors === 'yes'
      || $colors === 'true'
      || $colors === 'on'
    ) {
      $cache = true;
      return true;
    }
    if (
      $colors === '0'
      || $colors === 'no'
      || $colors === 'false'
      || $colors === 'off'
    ) {
      $cache = false;
      return false;
    }

    if (\getenv('TRAVIS') === 'true') {
      $cache = true;
      return true;
    }

    if (\getenv('CIRCLECI') === 'true') {
      $cache = true;
      return true;
    }

    if (static::isInteractive()) {
      $cache = Str\contains((string) \getenv('TERM'), 'color');
      return $cache;
    }

    $cache = false;
    return false;
  }

  protected static function isInteractive(): bool {
    static $cache = null;
    if ($cache !== null) {
      return $cache;
    }

    // Explicit override
    $noninteractive = \getenv('NONINTERACTIVE');
    if ($noninteractive !== false) {
      if ($noninteractive === '1' || $noninteractive === 'true') {
        $cache = false;
        return false;
      }
      if ($noninteractive === '0' || $noninteractive === 'false') {
        $cache = true;
        return true;
      }
      \fwrite(
        \STDERR,
        "NONINTERACTIVE env var must be 0/1/yes/no/true/false, or unset.\n",
      );
    }

    // Detects TravisCI and CircleCI; Travis gives you a TTY for STDIN
    $ci = \getenv('CI');
    if ($ci === '1' || $ci === 'true') {
      $cache = false;
      return false;
    }

    // Generic
    if (\posix_isatty(\STDIN) && \posix_isatty(\STDOUT)) {
      $cache = true;
      return true;
    }

    // Fail-safe
    $cache = false;
    return false;
  }

  public function __construct(
    private vec<string> $argv,
  ) {
    // Ignore process name in $argv[0]
    $argv = Vec\drop($argv, 1);

    if (C\contains($argv, '--help') || C\contains($argv, '-h')) {
      $this->displayHelp(\STDOUT);
      exit(0);
    }

    $not_options = vec[];

    $options = $this->getSupportedOptions();

    $long_options = Dict\pull(
      $options,
      $opt ==> $opt,
      $opt ==> $opt->getLong(),
    );

    $short_options = Vec\filter(
      $options,
      $opt ==> $opt->getShort() !== null,
    ) |> Dict\pull(
      $$,
      $opt ==> $opt,
      $opt ==> (string) $opt->getShort(),
    );

    $all_options = dict[
      CLIOptions\CLIOptionType::LONG  => $long_options,
      CLIOptions\CLIOptionType::SHORT => $short_options,
    ];

    $arguments = vec[];

    while(!C\is_empty($argv)) {
      $arg = C\firstx($argv);
      $argv = Vec\drop($argv, 1);

      // standard 'stop parsing options here' marker
      if ($arg === '--') {
        break;
      }

      list($option_type, $option_value) = CLIOptions\CLIOption::getTypeAndValue($arg);

      if ($option_type === CLIOptions\CLIOptionType::ARGUMENT) {
        $arguments[] = $arg;
        if ((bool) \getenv('POSIXLY_CORRECT')) {
          break;
        }
        continue;
      }

      $options = self::extractOptions($option_value, $option_type);
      $available_options = $all_options[$option_type];

      foreach ($options as $option => $value) {
        if (!C\contains_key($available_options, $option)) {
          \fprintf(\STDERR, "Unrecognized option: %s\n", $arg);
          $this->displayHelp(\STDERR);
          exit(1);
        }
      }

      foreach ($options as $option => $value) {
        $argv = $available_options[$option]->apply($option, $value, $argv);
      }
    }

    $arguments = Vec\concat($arguments, $argv);
    if (C\is_empty($arguments)) {
      return;
    }
    if (($_ = $this) instanceof CLIWithArguments) {
      $this->arguments = $arguments;
      return;
    }
    \fprintf(
      \STDERR,
      "Non-option arguments are not supported; first argument is '%s'\n",
      C\firstx($arguments),
    );
    exit(1);
  }

  final private static function extractOptions(string $arg, CLIOptions\CLIOptionType $type): dict<string, ?string> {
    $options = vec[];

    switch ($type) {
      case CLIOptions\CLIOptionType::LONG:
        $options[] = $arg;
        break;

      case CLIOptions\CLIOptionType::SHORT:
        $arg_length = Str\length($arg);
        for ($index = 0; $index < $arg_length; $index++) {
          $options[] = $arg[$index];
        }
        break;

      default:
        break;
    }

    $is_single_option = C\count($options) === 1;
    if ($is_single_option) {
      $value = null;
      $option = C\firstx($options);
      if (Str\contains($option, '=')) {
        $parts = \explode('=', $option);
        $opt = $parts[0];
        $value = \implode('=', Vec\drop($parts, 1));
      }
      $result = dict[
        $option => $value,
      ];
    } else {
      $result = Dict\pull(
        $options,
        $_ ==> null,
        $option ==> $option
      );
    }

    return $result;
  }

  public function displayHelp(resource $file): void {
    $usage = 'Usage: '.C\firstx($this->argv);

    $opts = $this->getSupportedOptions();
    if (C\is_empty($opts)) {
      $usage .= ' [-h|--help]';
    } else {
      $usage .= ' [OPTIONS]';
    }
    if ($this instanceof CLIWithRequiredArguments) {
      $class = TypeAssert\classname_of(
        CLIWithRequiredArguments::class,
        static::class,
      );
      $usage .= ' '.\implode(' ', $class::getHelpTextForRequiredArguments()).
        ' ['.$class::getHelpTextForOptionalArguments().' ...]';
    } else if ($this instanceof CLIWithArguments) {
      $class = TypeAssert\classname_of(CLIWithArguments::class, static::class);
      $usage .= ' ['.$class::getHelpTextForOptionalArguments().' ...]';
    }
    \fprintf($file, "%s\n", $usage);
    if (C\is_empty($opts)) {
      return;
    }

    \fprintf($file, "\nOptions:\n");
    foreach ($opts as $opt) {
      $short = $opt->getShort();
      $long = $opt->getLong();
      if ($opt instanceof CLIOptions\CLIOptionWithRequiredValue) {
        $long .= '=VALUE';
        if ($short !== null) {
          $short .= ' VALUE';
        }
      }

      if ($short !== null) {
        \fprintf($file, "  -%s, --%s\n", $short, $long);
      } else {
        \fprintf($file, "  --%s\n", $long);
      }
      \fwrite(
        $file,
        $opt->getHelpText()
        |> \explode("\n", $$)
        |> Vec\map(
          $$,
          $line ==> "\t".$line."\n",
        )
        |> \implode('', $$),
      );
    }
    \fwrite($file, "  -h, --help\n");
    \fwrite($file, "\tdisplay this text and exit\n");
  }
}
