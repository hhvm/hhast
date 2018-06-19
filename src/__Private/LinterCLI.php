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

use type Facebook\TypeAssert\TypeAssert;
use namespace Facebook\HHAST\Linters;
use namespace HH\Lib\{C, Dict, Str, Vec};

use type Facebook\CLILib\{CLIWithArguments, ExitException, Terminal};
use namespace Facebook\CLILib\CLIOptions;

final class LinterCLI extends CLIWithArguments {
  private bool $xhprof = false;
  private LinterCLIMode $mode = LinterCLIMode::PLAIN;
  private ?string $ioLogPrefix = null;

  use CLIWithVerbosityTrait;

  <<__Override>>
  public static function getHelpTextForOptionalArguments(): string {
    return 'PATH';
  }

  <<__Override>>
  protected function getSupportedOptions(): vec<CLIOptions\CLIOption> {
    return vec[
      CLIOptions\flag(
        () ==> {
          throw new ExitException(
            1,
            "--perf is no longer supported; consider --xhprof",
          );
        },
        '[unsupported]',
        '--perf',
      ),
      CLIOptions\flag(
        () ==> {
          $this->xhprof = true;
        },
        'Enable XHProf profiling',
        '--xhprof',
      ),
      CLIOptions\with_required_enum(
        LinterCLIMode::class,
        $m ==> {
          $this->mode = $m;
        },
        'Set the output mode; supported values are '.
        Str\join(LinterCLIMode::getValues(), ' | '),
        '--mode',
        '-m',
      ),
      CLIOptions\with_required_string(
        $s ==> {
          $this->ioLogPrefix = $s;
        },
        'Log STDIN, STDERR, and STDOUT to files with the specified prefixes',
        '--io-log-prefix',
      ),
      CLIOptions\with_required_string(
        $_ ==> {},
        'Name of the caller; intended for use with `--mode json` or `--mode lsp`',
        '--from',
      ),
      $this->getVerbosityOption(),
    ];
  }

  <<__Override>>
  public async function mainAsync(): Awaitable<int> {
    if ($this->xhprof) {
      XHProf::enable();
    }

    $result = await $this->mainImplAsync();

    if ($this->xhprof) {
      XHProf::disableAndDump(\STDERR);
    }

    return $result;
  }

  private async function mainImplAsync(): Awaitable<int> {
    $err = $this->getStderr();
    $roots = $this->getArguments();

    if (C\is_empty($roots)) {
      $config = LintRunConfig::getForPath(\getcwd());
      $roots = $config->getRoots();
      if (C\is_empty($roots)) {
        $err->write(
          "You must either specify PATH arguments, or provide a configuration".
          "file.\n",
        );
        return 1;
      }
    } else {
      foreach ($roots as $root) {
        $path = \realpath($root);
        if (\is_dir($path)) {
          $config_file = $path.'/hhast-lint.json';
          if (\file_exists($config_file)) {
            $err->write(
              "Warning: PATH arguments contain a hhast-lint.json, ".
              "which modifies the linters used and customizes behavior. ".
              "Consider 'cd ".
              $root.
              "; vendor/bin/hhast-lint'\n\n",
            );
          }
        }
      }
      $config = null;
    }

    $terminal = $this->getTerminal();
    $log_prefix = $this->ioLogPrefix;
    if ($log_prefix !== null) {
      $terminal = new Terminal(
        new LoggingInputTap(
          $terminal->getStdin(),
          \fopen($log_prefix.'in', 'w+'),
        ),
        new LoggingOutputTap(
          $terminal->getStdout(),
          \fopen($log_prefix.'out', 'w+'),
        ),
        new LoggingOutputTap(
          $terminal->getStderr(),
          \fopen($log_prefix.'err', 'w+'),
        ),
      );
    }

    switch ($this->mode) {
      case LinterCLIMode::PLAIN:
        $error_handler = new LintRunCLIErrorHandler($terminal);
        break;
      case LinterCLIMode::JSON:
        $error_handler = new LintRunJSONErrorHandler($terminal);
        break;
      case LinterCLIMode::LSP:
        return await (new LSPImpl\Server($terminal, $config, $roots))
          ->mainAsync();
    }

    await (new LintRun($config, $error_handler, $roots))->runAsync();

    $error_handler->printFinalOutput();
    return $error_handler->hadErrors() ? 2 : 0;
  }
}
