/*
 *  Copyright (c) 2017-present, Facebook, Inc.
 *  All rights reserved.
 *
 *  This source code is licensed under the MIT license found in the
 *  LICENSE file in the root directory of this source tree.
 *
 */

namespace Facebook\HHAST\__Private;

use namespace HH\Lib\Str;

<<__Memoize>>
function get_host_os(): ?OperatingSystem {
  $os = \PHP_OS;
  if (Str\starts_with_ci($os, 'linux')) {
    return OperatingSystem::LINUX;
  } else if (Str\starts_with_ci($os, 'darwin')) {
    return OperatingSystem::MACOS;
  } else if (Str\starts_with_ci($os, 'win')) {
    return OperatingSystem::WINDOWS;
  } else {
    return null;
  }
}
