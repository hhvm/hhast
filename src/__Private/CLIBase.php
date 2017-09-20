<?hh // strict

/**
 * Copyright (c) 2016, Facebook, Inc.
 * All rights reserved.
 *
 * This source code is licensed under the BSD-style license found in the
 * LICENSE file in the root directory of this source tree. An additional
 * grant of patent rights can be found in the PATENTS file in the same
 * directory.
 */


namespace Facebook\HHAST\__Private;

use namespace HH\Lib\{C, Dict, Str, Vec};

abstract class CLIBase {
  private vec<string> $arguments = vec[];

  abstract protected function getSupportedOptions(
  ): vec<CLIOptions\CLIOption>;

  abstract protected static function takesArguments(): bool;

  abstract public function mainAsync(): Awaitable<int>;

  final public function getArgv(): vec<string> {
    return $this->argv;
  }

  final protected function getArguments(): vec<string> {
    invariant(
      static::takesArguments(),
      "Calling getArguments(), but don't accept arguments",
    );
    return $this->arguments;
  }

  public function __construct(
    private vec<string> $argv,
  ) {
    // Ignore process name in $argv[0]
    $argv = Vec\drop($argv, 1);

    if (C\contains($argv, '--help') || C\contains($argv, '-h')) {
      $this->displayHelp(STDOUT);
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

    $arguments = vec[];

    while(!C\is_empty($argv)) {
      $arg = C\firstx($argv);
      $argv = Vec\drop($argv, 1);

      // standard 'stop parsing options here' marker
      if ($arg === '--') {
        break;
      }

      if (Str\starts_with($arg, '--')) {
        $opt = Str\strip_prefix($arg, '--');
        $opts = $long_options;
      } else if (Str\starts_with($arg, '-')) {
        $opt = Str\strip_prefix($arg, '-');
        $opts = $short_options;
      } else {
        $arguments[] = $arg;
        if ((bool) getenv('POSIXLY_CORRECT')) {
          break;
        }
        continue;
      }

      $value = null;
      if (Str\contains($opt, '=')) {
        $parts = explode('=', $opt);
        $opt = $parts[0];
        $value = implode('=', Vec\drop($parts, 1));
      }

      if (!C\contains_key($opts, $opt)) {
        fprintf(STDERR, "Unrecognized option: %s\n", $arg);
        $this->displayHelp(STDERR);
        exit(1);
      }
      $opt = $opts[$opt];

      if ($opt instanceof CLIOptions\CLIOptionFlag) {
        if ($value !== null) {
          fprintf(
            STDERR,
            "'%s' specifies a value, however values aren't supported for that ".
            "option.\n",
            $arg,
          );
          exit(1);
        }
        $opt->set();
        continue;
      }

      if ($opt instanceof CLIOptions\CLIOptionWithRequiredValue) {
        if ($value === null && C\is_empty($argv)) {
          fprintf(
            STDERR,
            "option '%s' requires a value\n",
            $arg,
          );
          exit(1);
        }
        if ($value === null) {
          $value = C\firstx($argv);
          $argv = Vec\drop($argv, 1);
        }
        $opt->set($value);
        continue;
      }

      invariant_violation(
        "Unsupported flag type: %s",
        get_class($opt),
      );
    }

    $arguments = Vec\concat($arguments, $argv);
    if (C\is_empty($arguments)) {
      return;
    }
    if (static::takesArguments()) {
      $this->arguments = $arguments;
      return;
    }
    fprintf(
      STDERR,
      "Non-option arguments are not supported; first argument is '%s'\n",
      C\firstx($arguments),
    );
    exit(1);
  }

  public function displayHelp(resource $file): void {
    $usage = 'Usage: '.C\firstx($this->argv);

    $opts = $this->getSupportedOptions();
    if (C\is_empty($opts)) {
      $usage .= ' [-h|--help]';
    } else {
      $usage .= ' [OPTION]...';
    }
    if (static::takesArguments()) {
      $usage .= ' [ARGUMENTS]';
    }
    fprintf($file, "%s\n", $usage);
    if (C\is_empty($opts)) {
      return;
    }
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
        fprintf($file, "  -%s, --%s\n", $short, $long);
      } else {
        fprintf($file, "  --%s\n", $long);
      }
      fwrite(
        $file,
        $opt->getHelpText()
        |> explode("\n", $$)
        |> Vec\map(
          $$,
          $line ==> "\t".$line."\n",
        )
        |> implode('', $$),
      );
    }
    fwrite($file, "  -h, --help\n");
    fwrite($file, "\tdisplay this text and exit\n");
  }
}
