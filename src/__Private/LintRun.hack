/*
 *  Copyright (c) 2017-present, Facebook, Inc.
 *  All rights reserved.
 *
 *  This source code is licensed under the MIT license found in the
 *  LICENSE file in the root directory of this source tree.
 *
 */

namespace Facebook\HHAST\__Private;

use type Facebook\HHAST\{File, Linter, LinterException};
use type Facebook\CLILib\ExitException;
use namespace HH\Lib\{C, Str, Vec};

final class LintRun {
  private dict<string, File> $files = dict[];
  public function __construct(
    private ?LintRunConfig $config,
    private LintRunEventHandler $handler,
    private vec<string> $paths,
  ) {
  }

  public function withFile(File $file): this {
    $this->files[$file->getPath()] = $file;
    return $this;
  }

  private function getFileForPath(string $path): File {
    return $this->files[$path] ?? File::fromPath($path);
  }

  private static function worstResult(
    LintRunResult ...$results
  ): LintRunResult {
    if (C\is_empty($results)) {
      return LintRunResult::NO_ERRORS;
    }
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
    await $this->handler->finishedRunAsync($result);
    return $result;
  }

  private async function lintFileAsync(
    LintRunConfig $config,
    File $file,
  ): Awaitable<LintRunResult> {
    $file_config = $config->getConfigForFile($file->getPath());
    $result = new Ref(LintRunResult::NO_ERRORS);

    await Vec\map_async($file_config['linters'], async $class ==> {
      try {
        $this_result = await $this->runLinterOnFileImplAsync(
          $file_config,
          $class,
          $file,
          $config->getLinterConfigForLinter($class, $file->getPath()),
        );
        $result->v = self::worstResult($result->v, $this_result);
      } catch (LinterException $e) {
        throw $e;
      } catch (\Throwable $t) {
        throw new LinterException(
          $class,
          $file->getPath(),
          $t->getMessage(),
          null,
          $t,
        );
      }
    });
    await $this->handler->finishedFileAsync($file->getPath(), $result->v);
    return $result->v;
  }

  private async function runLinterOnFileImplAsync<
    TLinter as Linter,
    TLinterConfig,
  >(
    LintRunConfig::TFileConfig $config,
    classname<TLinter> $linter,
    File $file,
    ?TLinterConfig $linter_config,
  ): Awaitable<LintRunResult> where TLinterConfig = TLinter::TConfig {
    if (!$file->isHackFile() || !$linter::shouldLintFile($file)) {
      return LintRunResult::NO_ERRORS;
    }

    $linter = $linter::newInstance($file, $linter_config);

    if ($linter->isLinterSuppressedForFile()) {
      return LintRunResult::NO_ERRORS;
    }

    try {
      $errors = await $linter->getLintErrorsAsync();
    } catch (\Throwable $t) {
      throw $t;
    } catch (\Exception $e) {
      throw $e;
    }
    if (!$errors) {
      return LintRunResult::NO_ERRORS;
    }
    $result = await $this->handler
      ->linterRaisedErrorsAsync($linter, $config, $errors);
    return $result === LintAutoFixResult::ALL_FIXED
      ? LintRunResult::HAD_AUTOFIXED_ERRORS
      : LintRunResult::HAVE_UNFIXED_ERRORS;
  }

  private async function lintDirectoryAsync(
    LintRunConfig $config,
    string $path,
  ): Awaitable<LintRunResult> {
    $it = new \RecursiveIteratorIterator(
      new \RecursiveDirectoryIterator($path),
    );
    $files = vec[];
    foreach ($it as $info) {
      if (!$info->isFile()) {
        continue;
      }
      $ext = Str\lowercase($info->getExtension());
      if (
        $ext === 'hh' || $ext === 'php' || $ext === 'hack' || $ext === 'hck'
      ) {
        $files[] = $this->getFileForPath($info->getPathname());
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
      $file = $this->getFileForPath($path);
      return await $this->lintFileAsync($config, $file);
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
