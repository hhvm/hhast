/*
 *  Copyright (c) 2017-present, Facebook, Inc.
 *  All rights reserved.
 *
 *  This source code is licensed under the MIT license found in the
 *  LICENSE file in the root directory of this source tree.
 *
 */

namespace Facebook\HHAST;

enum LintMarkerName: string as string {
  HHAST_IGNORE_ALL = 'HHAST_IGNORE_ALL';
  HHAST_IGNORE_ERROR = 'HHAST_IGNORE_ERROR';
  HHAST_FIXME = 'HHAST_FIXME';
}
