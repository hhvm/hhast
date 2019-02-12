/*
 *  Copyright (c) 2017-present, Facebook, Inc.
 *  All rights reserved.
 *
 *  This source code is licensed under the MIT license found in the
 *  LICENSE file in the root directory of this source tree.
 *
 */

namespace Facebook\HHAST\__Private\LSP;

enum CompletionTriggerKind: int {
  INVOKED = 1;
  TRIGGER_CHARACTER = 2;
  TRIGGER_FOR_INCOMPLETE_COMPLETIONS = 3;
}
