/*
 *  Copyright (c) 2017-present, Facebook, Inc.
 *  All rights reserved.
 *
 *  This source code is licensed under the MIT license found in the
 *  LICENSE file in the root directory of this source tree.
 *
 */

namespace Facebook\HHAST;

/**
 * The process to find problems against a single source file.
 *
 * Problems found by a Linter could associated with different LintRules,
 * especially when the Linter is a proxy calling other linting tools.
 */
<<__Sealed(SingleRuleLinter::class, HHClientLinter::class)>>
interface Linter {
  <<__Reifiable>>
  abstract const type TConfig;

  public function getLintErrorsAsync(): Awaitable<vec<LintError>>;

  public static function shouldLintFile(File $_): bool;

  public static function newInstance(File $file, ?this::TConfig $config): this;

  public function isLinterSuppressedForFile(): bool;

  public function getFile(): File;

}
