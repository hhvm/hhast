/*
 *  Copyright (c) 2017-present, Facebook, Inc.
 *  All rights reserved.
 *
 *  This source code is licensed under the MIT license found in the
 *  LICENSE file in the root directory of this source tree.
 *
 */

namespace Facebook\HHAST\__Private\LSPLib;

enum ServerStatus: int {
  PRE_INIT = 0;
  INITIALIZING = 1;
  INITIALIZED = 2;
  SHUTTING_DOWN = 3;
  EXITING = 4;
}
