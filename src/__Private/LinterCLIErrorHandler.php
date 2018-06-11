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

use namespace Facebook\HHAST\Linters;

/**
 * Interface for creating custom handlers for lint errors that are found during
 * a hhast-lint CLI run. Some examples of hander actions are generating human 
 * readable output and diffs, interactive autofixing, JSON-formatted output for
 * IDEs etc.
 */
interface LinterCLIErrorHandler {

  /**
   * Process a set of errors returned by running an individual linter on a
   * single file
   *
   * @param $linter The linter instance
   * @param $config Linter configuration for this file's scope
   * @param $errors Traversable list of errors
   */
  public function processErrors(
    Linters\BaseLinter $linter,
    LinterCLIConfig::TFileConfig $config,
    Traversable<Linters\LintError> $errors
  ): void;

  /**
   * Check whether this handler has seen any (unfixed) lint errors
   */
  public function hadErrors(): bool;

  /**
   * Print the final output of the linter after all errors have been processed
   */
  public function print(): void;
}