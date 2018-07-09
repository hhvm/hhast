<?hh // strict
/*
 *  Copyright (c) 2017-present, Facebook, Inc.
 *  All rights reserved.
 *
 *  This source code is licensed under the MIT license found in the
 *  LICENSE file in the root directory of this source tree.
 *
 */

namespace Facebook\HHAST\Linters;

use type Facebook\HHAST\EditableNode;
use namespace Facebook\HHAST;

interface LSPAutoFixingLinter<Terror as FixableLintError> extends AutoFixingLinter<Terror> {
  public function getCodeActionForError(
    Terror $err,
  ): ?\Facebook\HHAST\__Private\LSP\CodeAction;
}
