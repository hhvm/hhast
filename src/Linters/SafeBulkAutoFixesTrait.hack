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
 * This trait doesn't "do" anything when overriding
 * `AutoFixingLinterTrait::areBulkAutoFixesSafe()`, since both
 * implementations return true.
 *
 * This trait communicates to your readers (and future self).
 * Yes, I have considered if this autofix is safe.
 * It didn't "forget" to add UnsafeBulkAutoFixesTrait.
 */
trait SafeBulkAutoFixesTrait {
  require implements AutoFixable;

  <<__Override>>
  final public function areBulkAutoFixesSafe(): bool {
    return true;
  }
}
