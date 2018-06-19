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

use type Facebook\CLILib\OutputInterface;
use namespace Facebook\HHAST\Linters;

/**
 * Interface for creating custom handlers for lint errors that are found during
 * a hhast-lint run. Some examples of hander actions are generating human
 * readable output and diffs, interactive autofixing, JSON-formatted output for
 * IDEs etc.
 */
interface LintRunEventHandler {
  /**
   * Process a set of errors returned by running an individual linter on a
   * single file
   */
  public function linterRaisedErrors(
    Linters\BaseLinter $linter,
    LintRunConfig::TFileConfig $config,
    Traversable<Linters\LintError> $errors,
  ): LintAutoFixResult;

  public function finishedFile(string $path, LintRunResult $result): void;

  public function finishedRun(LintRunResult $result): void;
}
