/*
 *  Copyright (c) 2017-present, Facebook, Inc.
 *  All rights reserved.
 *
 *  This source code is licensed under the MIT license found in the
 *  LICENSE file in the root directory of this source tree.
 *
 */

namespace Facebook\HHAST\__Private;

enum LintRunResult: int {
  NO_ERRORS = 0;
  HAD_AUTOFIXED_ERRORS = 1;
  HAVE_UNFIXED_ERRORS = 2;
}
