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

use type Facebook\CLILib\ExitException;
use namespace HH\Lib\{Str, Vec};

final class LintRun {
  public function __construct(
    private ?LintRunConfig $config,
    private LintRunErrorHandler $handler,
    private vec<string> $paths,
  ) {
  }

  public async function runAsync(): Awaitable<void> {
    await Vec\map_async(
      $this->paths,
      async $path ==> {
        $config = $this->config ?? LintRunConfig::getForPath($path);
        await $this->lintPathAsync($config, $path);
      },
    );
  }

  private async function lintFileAsync(
    LintRunConfig $config,
    string $path,
  ): Awaitable<void> {
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

      /* HHAST_IGNORE_ERROR[DontAwaitInALoop] */
      $errors = await $linter->getLintErrorsAsync();
      $this->handler->processErrors($linter, $config, $errors);
    }
  }

  private async function lintDirectoryAsync(
    LintRunConfig $config,
    string $path,
  ): Awaitable<void> {
    $it =
      new \RecursiveIteratorIterator(new \RecursiveDirectoryIterator($path));
    $files = vec[];
    foreach ($it as $info) {
      if (!$info->isFile()) {
        continue;
      }
      $ext = Str\lowercase($info->getExtension());
      if ($ext === 'hh' || $ext === 'php') {
        $files[] = $info->getPathname();
      }
    }
    await Vec\map_async(
      $files,
      async $file ==> await $this->lintFileAsync($config, $file),
    );
  }

  private async function lintPathAsync(
    LintRunConfig $config,
    string $path,
  ): Awaitable<void> {
    if (\is_file($path)) {
      await $this->lintFileAsync($config, $path);
    } else if (\is_dir($path)) {
      await $this->lintDirectoryAsync($config, $path);
    } else {
      throw new ExitException(
        1,
        Str\format(
          "'%s' doesn't appear to be a file or directory, bailing",
          $path,
        ),
      );
    }
  }
}
