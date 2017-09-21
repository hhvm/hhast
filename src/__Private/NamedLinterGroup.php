<?hh // strict
/**
 * Copyright (c) 2017, Facebook, Inc.
 * All rights reserved.
 *
 * This source code is licensed under the BSD-style license found in the
 * LICENSE file in the "hack" directory of this source tree. An additional
 * grant of patent rights can be found in the PATENTS file in the same
 * directory.
 */

namespace Facebook\HHAST\__Private;

enum NamedLinterGroup: string {
  ALL_BUILTINS = 'all';
  DEFAULT_BUILTINS = 'default';
  NO_BUILTINS = 'none';
}
