<?hh //strict
/*
 *  Copyright (c) 2017-present, Facebook, Inc.
 *  All rights reserved.
 *
 *  This source code is licensed under the MIT license found in the
 *  LICENSE file in the root directory of this source tree.
 *
 */

namespace Facebook\HHAST\__Private;

use type Facebook\CLILib\ExitException;
use namespace HH\Lib\Str;

final class LintRun {
  public function __construct(
    private ?LintRunConfig $config,
    private LintRunErrorHandler $handler,
    private vec<string> $paths,
  ) {
  }

  public function run(): void {
    foreach ($this->paths as $path) {
      $config = $this->config ?? LintRunConfig::getForPath($path);
      $this->lintPath($config, $path);
    }
  }

  private function lintFile(
    LintRunConfig $config,
    string $path,
  ): void {
    $all_errors = vec[];
    $config = $config->getConfigForFile($path);

    foreach ($config['linters'] as $class) {
      if (!$class::shouldLintFile($path)) {

        continue;
      }

      $linter = new $class($path);

      if ($linter->isLinterSuppressedForFile()) {
        continue;
      }

      $errors = $linter->getLintErrors();
      $this->handler->processErrors($linter, $config, $errors);
    }
  }

  private function lintDirectory(
    LintRunConfig $config,
    string $path,
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
        $this->lintFile($config, $file);
      }
    }
  }

  private function lintPath(
    LintRunConfig $config,
    string $path,
  ): void {
    if (\is_file($path)) {
      $this->lintFile($config, $path);
    } else if (\is_dir($path)) {
      $this->lintDirectory($config, $path);
    } else {
      throw new ExitException(
        1,
        Str\format("'%s' doesn't appear to be a file or directory, bailing", $path),
      );
    }
  }
}
