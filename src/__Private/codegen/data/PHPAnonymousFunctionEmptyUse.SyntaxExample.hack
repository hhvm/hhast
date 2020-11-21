/*
 *  Copyright (c) 2017-present, Facebook, Inc.
 *  All rights reserved.
 *
 *  This source code is licensed under the MIT license found in the
 *  LICENSE file in the root directory of this source tree.
 *
 */
namespace Facebook\HHAST\__Private\SyntaxExamples;

function php_anonymous_function_with_empty_use(): void {
  /* HH_IGNORE_ERROR[3084] HHAST bans using PHP anonymous functions, but we
   * still need to support parsing them for now */
  $_ = function() use () {
  };
}
