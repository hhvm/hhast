/*
 *  Copyright (c) 2017-present, Facebook, Inc.
 *  All rights reserved.
 *
 *  This source code is licensed under the MIT license found in the
 *  LICENSE file in the root directory of this source tree.
 *
 */

namespace Facebook\HHAST;

use type Facebook\HHAST\File;
use namespace Facebook\HHAST\__Private\LSP;

interface AutoFixingLinter<Terror as LintError> {
  require extends BaseLinter;

  public function getLintErrorsAsync(): Awaitable<Traversable<Terror>>;

  public function getFixedFile(Traversable<Terror> $errors): File;

  protected function getTitleForFix(Terror $error): string;

  public function getCodeActionForError(Terror $error): ?LSP\CodeAction;
}
