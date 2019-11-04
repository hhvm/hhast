/*
 *  Copyright (c) 2017-present, Facebook, Inc.
 *  All rights reserved.
 *
 *  This source code is licensed under the MIT license found in the
 *  LICENSE file in the root directory of this source tree.
 *
 */

namespace Facebook\HHAST\__Private;

enum OSFamily: string {
  LINUX = 'Linux';
  MACOS = 'Darwin';
  WINDOWS = 'Windows';
}

/**
 * Emulates \PHP_OS_FAMILY
 * Will correctly answer for MacOS, Linux, and Windows.
 * Once we start supporting more OSes, extend this switch.
 */
const ?OSFamily OSFAMILY =
  //hackfmt-ignore
  \PHP_OS === 'Darwin' ? OSFamily::MACOS : (
  \PHP_OS === 'Linux'  ? OSFamily::LINUX : (
  \PHP_OS === 'WIN32' || \PHP_OS === 'WINNT' || \PHP_OS === 'Windows' ? OSFamily::WINDOWS
  : null
));
