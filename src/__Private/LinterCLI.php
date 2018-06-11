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

final class LinterCLI extends CLIWithArguments {
  private bool $printPerfCounters = false;
  private bool $xhprof = false;
  private bool $json = false;

  use CLIWithVerbosityTrait;

  <<__Override>>
  public static function getHelpTextForOptionalArguments(): string {
    return 'PATH';
  }

  <<__Override>>
  protected function getSupportedOptions(): vec<CLIOptions\CLIOption> {
    return vec[
      CLIOptions\flag(
        () ==> { $this->printPerfCounters = true; },
        'Output performance counters when finished',
        '--perf',
      ),
      CLIOptions\flag(
        () ==> { $this->xhprof = true; },
        'Enable XHProf profiling',
        '--xhprof',
      ),
      CLIOptions\flag(
        () ==> { $this->json = true; },
        'Output JSON for machine consumption',
        '--json',
      ),
      $this->getVerbosityOption(),
    ];
  }

  private function lintFile(
    LinterCLIConfig $config,
    string $path,
    LinterCLIErrorHandler $error_handler,
  ): void {
    $this->verbosePrintf(1, "Linting %s...\n", $path);

    $all_errors = vec[];
    $config = $config->getConfigForFile($path);

    foreach ($config['linters'] as $class) {
      $this->verbosePrintf(2, " - %s\n", $class);

      if (!$class::shouldLintFile($path)) {
        continue;
      }

      using (new ScopedPerfCounter($class.'#construct')) {
        $linter = new $class($path);
      }

      if ($linter->isLinterSuppressedForFile()) {
        continue;
      }

      using (new ScopedPerfCounter($class.'#getLintErrors')) {
        $errors = $linter->getLintErrors();
      }

      using (new ScopedPerfCounter($class.'#processErrors')) {
        $error_handler->processErrors($linter, $config, $errors);
      }
    }
  }

  private function lintDirectory(
    LinterCLIConfig $config,
    string $path,
    LinterCLIErrorHandler $errorHandler,
  ): void {
    $it = new \RecursiveIteratorIterator(
      new \RecursiveDirectoryIterator($path),
    );
    foreach ($it as $info) {
      if (!$info->isFile()) {
        continue;
      }
      $ext = Str\lowercase($info->getExtension());
      if ($ext === 'hh' || $ext === 'php') {
        $file = $info->getPathname();
        $this->lintFile($config, $file, $errorHandler);
      }
    }
  }

  private function lintPath(
    LinterCLIConfig $config,
    string $path,
    LinterCLIErrorHandler $errorHandler,
  ): void {
    if (\is_file($path)) {
      $this->lintFile($config, $path, $errorHandler);
    } else if (\is_dir($path)) {
      $this->lintDirectory($config, $path, $errorHandler);
    } else {
      \printf(
        "'%s' doesn't appear to be a file or directory, bailing\n",
        $path,
      );
      exit(1);
    }
  }

  <<__Override>>
  public async function mainAsync(): Awaitable<int> {
    if ($this->xhprof) {
      XHProf::enable();
    }

    using (new ScopedPerfCounter(__CLASS__)) {
      $result = await $this->mainImplAsync();
    }

    if ($this->xhprof) {
      XHProf::disableAndDump(\STDERR);
    }

    if ($this->printPerfCounters) {
      $counters = PerfCounter::getCounters();
      foreach ($counters as $name => $seconds) {
        \printf("PERF %5.2fs %s\n", $seconds, $name);
      }
    }

    return $result;
  }

  private async function mainImplAsync(): Awaitable<int> {
    $roots = $this->getArguments();
    if (C\is_empty($roots)) {
      $config = LinterCLIConfig::getForPath(\getcwd());
      $roots = $config->getRoots();
      if (C\is_empty($roots)) {
        \fwrite(
          \STDERR,
          "You must either specify PATH arguments, or provide a configuration".
          "file.\n",
        );
        return 1;
      }
    } else {
      $config = null;
    }

    $errorHandler = $this->json
      ? new LinterCLIErrorHandlerJSON()
      : new LinterCLIErrorHandlerPlain(shape(
        'supports_colors' => self::supportsColors(),
        'is_interactive' => self::isInteractive(),
      ));

    foreach ($roots as $root) {
      $root_config = $config ?? LinterCLIConfig::getForPath($root);
      $this->lintPath($root_config, $root, $errorHandler);
    }

    $errorHandler->print();
    return $errorHandler->hadErrors() ? 2 : 0;
  }
}
