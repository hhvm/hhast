/*
 *  Copyright (c) 2017-present, Facebook, Inc.
 *  All rights reserved.
 *
 *  This source code is licensed under the MIT license found in the
 *  LICENSE file in the root directory of this source tree.
 *
 */

namespace Facebook\HHAST;
enum HHClientLintSeverity: string as string {
  ADVICE = 'advice';
  AUTOFIX = 'autofix';
  WARNING = 'warning';
  ERROR = 'error';
  DISABLED = 'disabled';
}
