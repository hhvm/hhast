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
use namespace HH\Lib\{C, Str, Vec};

final class LintRun {
  public function __construct(
    private ?LintRunConfig $config,
    private LintRunEventHandler $handler,
    private vec<string> $paths,
  ) {
  }

  private static function worstResult(
    LintRunResult ...$results
  ): LintRunResult {
    $results = keyset($results);
    if (C\contains($results, LintRunResult::HAVE_UNFIXED_ERRORS)) {
      return LintRunResult::HAVE_UNFIXED_ERRORS;
    }
    if (C\contains($results, LintRunResult::HAD_AUTOFIXED_ERRORS)) {
      return LintRunResult::HAD_AUTOFIXED_ERRORS;
    }
    invariant(
      $results === keyset[LintRunResult::NO_ERRORS],
      'Got unexpected results',
    );
    return LintRunResult::NO_ERRORS;
  }

  public async function runAsync(): Awaitable<LintRunResult> {
    $results = await Vec\map_async(
      $this->paths,
      async $path ==> {
        $config = $this->config ?? LintRunConfig::getForPath($path);
        return await $this->lintPathAsync($config, $path);
      },
    );
    $result = self::worstResult(...$results);
    $this->handler->finishedRun($result);
    return $result;
  }

  private async function lintFileAsync(
    LintRunConfig $config,
    string $path,
  ): Awaitable<LintRunResult> {
    $config = $config->getConfigForFile($path);
    $result = LintRunResult::NO_ERRORS;

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
      if ($errors) {
        $result = (
          $this->handler->linterRaisedErrors($linter, $config, $errors) ===
            LintAutoFixResult::ALL_FIXED
            ? LintRunResult::HAD_AUTOFIXED_ERRORS
            : LintRunResult::HAVE_UNFIXED_ERRORS
        )
          |> self::worstResult($result, $$);
      }
    }
    $this->handler->finishedFile($path, $result);
    return $result;
  }

  private async function lintDirectoryAsync(
    LintRunConfig $config,
    string $path,
  ): Awaitable<LintRunResult> {
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
    $results = await Vec\map_async(
      $files,
      async $file ==> await $this->lintFileAsync($config, $file),
    );

    return self::worstResult(...$results);
  }

  private async function lintPathAsync(
    LintRunConfig $config,
    string $path,
  ): Awaitable<LintRunResult> {
    if (\is_file($path)) {
      return await $this->lintFileAsync($config, $path);
    } else if (\is_dir($path)) {
      return await $this->lintDirectoryAsync($config, $path);
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
