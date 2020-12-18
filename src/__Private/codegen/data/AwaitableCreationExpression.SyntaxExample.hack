/*
 *  Copyright (c) 2017-present, Facebook, Inc.
 *  All rights reserved.
 *
 *  This source code is licensed under the MIT license found in the
 *  LICENSE file in the root directory of this source tree.
 *
 */
namespace Facebook\HHAST\__Private\SyntaxExamples;

function awaitable_creation_expression_with_attr(): void {
  /* HH_IGNORE_ERROR[2049] */
  /* HH_IGNORE_ERROR[3084] */
  $_ = <<Foo>> async { };
}
