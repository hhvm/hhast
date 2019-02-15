/*
 *  Copyright (c) 2017-present, Facebook, Inc.
 *  All rights reserved.
 *
 *  This source code is licensed under the MIT license found in the
 *  LICENSE file in the root directory of this source tree.
 *
 */

namespace Facebook\HHAST\__Private\LSP;

enum CodeActionKind: string {
  QUICK_FIX = 'quickfix';
  REFACTOR = 'refactor';
  REFACTOR_EXTRACT = 'refactor.extract';
  REFACTOR_INLINE = 'refactor.inline';
  REFACTOR_REWRITE = 'refactor.rewrite';
  SOURCE = 'source';
  SOURCE_ORGANIZE_IMPORTS = 'source.organizeImports';
}
