/*
 *  Copyright (c) 2017-present, Facebook, Inc.
 *  All rights reserved.
 *
 *  This source code is licensed under the MIT license found in the
 *  LICENSE file in the root directory of this source tree.
 *
 */

namespace Facebook\HHAST\__Private;

use namespace HH\Lib\{C, Math, Str, Vec};

use type Facebook\HHAST\LinterException;
use type Facebook\CLILib\CLIWithArguments;
use namespace Facebook\CLILib\CLIOptions;

final class LinterCLI extends CLIWithArguments {
  private bool $xhprof = false;
  private ?string $xhprofDotFile = null;
  private LinterCLIMode $mode = LinterCLIMode::PLAIN;

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
          $this->xhprof = true;
        },
        'Enable XHProf profiling',
        '--xhprof',
      ),
      CLIOptions\with_required_string(
        $v ==> {
          $this->xhprof = true;
          $this->xhprofDotFile = $v;
        },
        'Enable XHProf profiling, and generate a GraphViz dot file',
        '--xhprof-dot',
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
      $dotfile = $this->xhprofDotFile;
      if ($dotfile is null) {
        XHProf::disableAndDump(\STDERR);
      } else {
        $dot = XHProf::disableAndGenerateDot();
        $file = \HH\Lib\File\open_write_only(
          $dotfile,
          \HH\Lib\File\WriteMode::TRUNCATE,
        );
        await $file->writeAllAsync($dot);
        $file->close();
        await $this->getStderr()
          ->writeAllAsync(Str\format("Wrote XHProf data to %s\n", $dotfile));
      }
    }

    return $result;
  }

  private async function mainImplAsync(): Awaitable<int> {
    $terminal = $this->getTerminal();
    if ($this->mode === LinterCLIMode::LSP) {
      return await (new LSPImpl\Server($terminal))->mainAsync();
    }

    $err = $this->getStderr();
    $roots = $this->getArguments();

    if (C\is_empty($roots)) {
      $config = LintRunConfig::getForPath(\getcwd());
      $roots = $config->getRoots();
      if (C\is_empty($roots)) {
        await $err->writeAllAsync(
          'You must either specify PATH arguments, or provide a configuration'.
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
            /* HHAST_IGNORE_ERROR[DontAwaitInALoop] */
            await $err->writeAllAsync(
              'Warning: PATH arguments contain a hhast-lint.json, '.
              'which modifies the linters used and customizes behavior. '.
              "Consider 'cd ".
              $root.
              "; vendor/bin/hhast-lint'\n\n",
            );
          }
        }
      }
      $config = null;
    }

    switch ($this->mode) {
      case LinterCLIMode::PLAIN:
        $error_handler = new LintRunCLIEventHandler($terminal);
        break;
      case LinterCLIMode::JSON:
        $error_handler = new LintRunJSONEventHandler($terminal);
        break;
      case LinterCLIMode::LSP:
        invariant_violation('should have returned earlier');
    }

    try {
      $result = await (
        new LintRun($config, $error_handler, $roots)
      )->runAsync();
    } catch (LinterException $e) {
      $orig = $e->getPrevious() ?? $e;
      $err = $terminal->getStderr();
      $pos = $e->getPosition();
      await $err->writeAllAsync(Str\format(
        "A linter threw an exception:\n  Linter: %s\n  File: %s%s\n",
        $e->getLinterClass(),
        \realpath($e->getFileBeingLinted()),
        $pos === null ? '' : Str\format(':%d:%d', $pos[0], $pos[1] + 1),
      ));
      if ($pos !== null && \is_readable($e->getFileBeingLinted())) {
        list($line, $column) = $pos;
        await (
          \file_get_contents($e->getFileBeingLinted())
          |> Str\split($$, "\n")
          |> Vec\take($$, $line)
          |> Vec\slice($$, Math\maxva($line - 3, 0))
          |> Vec\map($$, $line ==> '    > '.$line)
          |> Str\join($$, "\n")
          |> Str\format("%s\n      %s^ HERE\n", $$, Str\repeat(' ', $column))
          |> $err->writeAllAsync($$)
        );
      }
      await $err->writeAllAsync(Str\format(
        "  Exception: %s\n"."  Message: %s\n",
        \get_class($orig),
        $orig->getMessage(),
      ));
      await $err->writeAllAsync(
        $orig->getTraceAsString()
          |> Str\split($$, "\n")
          |> Vec\map($$, $line ==> '    '.$line)
          |> Str\join($$, "\n")
          |> "  Trace:\n".$$."\n\n",
      );
      return 2;
    }

    switch ($result) {
      case LintRunResult::NO_ERRORS:
      case LintRunResult::HAD_AUTOFIXED_ERRORS:
        return 0;
      case LintRunResult::HAVE_UNFIXED_ERRORS:
        return 1;
    }
  }
}
